package com.mediatek.ims.pco;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.SystemProperties;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.mediatek.ims.pco.ui.PCOStartUPWizardMainActivity;

public class PCOService extends Service {
    private static final String ACTION_CARRIER_SIGNAL_PCO_VALUE = "com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE";
    private static final String ACTION_CARRIER_SIGNAL_PCO_VALUE_DEBUG = "com.mediatek.ims.pco.ACTION_CARRIER_SIGNAL_PCO_VALUE_DEBUG";
    private static final String ACTION_NETWORK_REJECT_CAUSE_DEBUG = "com.mediatek.ims.pco.ACTION_NETWORK_REJECT_CAUSE_DEBUG";
    static final String ACTION_PCO_CHECK = "pco-check";
    private static final String EXTRA_APN_PROTO_KEY = "apnProto";
    private static final String EXTRA_APN_TYPE_KEY = "apnType";
    private static final String EXTRA_PCO_ID_KEY = "pcoId";
    private static final String EXTRA_PCO_VALUE_KEY = "pcoValue";
    private static final int OPSUB_BROWSER_DISABLE_CHECKSTATUS_UNTIL_REBOOT = 13;
    private static final int OPSUB_BROWSER_NOT_STARTED = 11;
    private static final int OPSUB_BROWSER_OPENNING = 12;
    private static final int OPSUB_CALL_DISABLE_CHECKSTATUS_UNTIL_REBOOT = 16;
    private static final int OPSUB_CALL_NOT_STARTED = 14;
    private static final int OPSUB_CALL_OPENNING = 15;
    private static final int STATE_PCO_ACTIVATED = 5;
    private static final int STATE_PCO_ACTIVATING_NW_REJECT_EMM_8 = 4;
    private static final int STATE_PCO_ACTIVATING_PCO_VALUE_3 = 2;
    private static final int STATE_PCO_ACTIVATING_PCO_VALUE_5 = 3;
    private static final int STATE_PCO_NOT_ACTIVATED = 1;
    private static final int STATE_PCO_UNKNOWN = -1;
    private static final String TAG = "PCOService";
    private static Context sContext;
    private static Handler sHandler;
    private static PCOSharedPreference sPCOInfoPref;
    private static Looper sServiceLooper;
    private static int sStateImsPCO = 1;
    private static int sSubOPBrowser = 14;
    private static int sSubOPCall = 11;
    private final BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {
        /* class com.mediatek.ims.pco.PCOService.AnonymousClass1 */

        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            PCOService.log("[<==]Received Broadcast with action = " + action);
        }
    };
    private String mImei;
    final Messenger mMessenger = new Messenger(new IncomingHandler());
    private boolean mSimLoaded;
    private SubscriptionManager mSubscriptionManager;
    private TelephonyManager mTelephonyManager;

    public void onCreate() {
        log("[v]onCreate.........");
        super.onCreate();
        Context applicationContext = getApplicationContext();
        sContext = applicationContext;
        if (applicationContext == null) {
            log("sContext == null");
            return;
        }
        PCONwUtils.setAppContext(getApplicationContext());
        this.mSubscriptionManager = SubscriptionManager.from(sContext);
        this.mTelephonyManager = (TelephonyManager) sContext.getSystemService("phone");
        registerForIntents();
        restorePCOState();
    }

    private void restorePCOState() {
        PCOSharedPreference instance = PCOSharedPreference.getInstance(getApplicationContext());
        sPCOInfoPref = instance;
        if (instance != null) {
            int mHasPCOState = instance.getSavedPCOState();
            log("restorePCOState(), Saved IMSPCO value =" + mHasPCOState);
            if (mHasPCOState < 0) {
                sPCOInfoPref.savePCOState(-1);
                return;
            }
            updateImsPcoState(mHasPCOState);
            checkPCOActivationStatus();
        }
    }

    private synchronized void resetImsPcoState() {
        updateImsPcoState(1);
        sPCOInfoPref.saveFirstBoot(true);
        sPCOInfoPref.saveActivated(false);
    }

    private int getImsPcoState() {
        log("[?]getImsPcoState() = " + stateToString(sStateImsPCO));
        return sStateImsPCO;
    }

    private void registerForIntents() {
        log("[+]Register- NW Broadcast receivers intents");
        IntentFilter mIntentFilter = new IntentFilter();
        mIntentFilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        mIntentFilter.addAction("com.mediatek.intent.action.RADIO_STATE_CHANGED");
        mIntentFilter.addAction(ACTION_CARRIER_SIGNAL_PCO_VALUE);
        mIntentFilter.addAction("com.mediatek.intent.action.ACTION_NETWORK_REJECT_CAUSE");
        mIntentFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        mIntentFilter.addAction(Constants.ACTION_QUERY_IMS_PCO_STATUS_FRM_NOTIFICATION);
        mIntentFilter.addAction(Constants.ACTION_QUERY_IMS_PCO_STATUS_FRM_BROWSER);
        mIntentFilter.addAction(Constants.ACTION_QUERY_IMS_PCO_STATUS_FRM_CALL);
        mIntentFilter.addAction("android.net.wifi.supplicant.CONNECTION_CHANGE");
        mIntentFilter.addAction(ACTION_CARRIER_SIGNAL_PCO_VALUE_DEBUG);
        mIntentFilter.addAction(ACTION_NETWORK_REJECT_CAUSE_DEBUG);
        HandlerThread thread = new HandlerThread("PCOServiceBRThread", 10);
        thread.start();
        sServiceLooper = thread.getLooper();
        Handler handler = new Handler(sServiceLooper);
        sHandler = handler;
        sContext.registerReceiver(this.mBroadcastReceiver, mIntentFilter, null, handler);
        createNotification();
    }

    public int onStartCommand(Intent intent, int flags, int startId) {
        log("[v]onStartCommand: " + intent + " " + startId);
        handlePCOcase(sContext, intent);
        return 3;
    }

    private void createNotification() {
        log("[+]adding the notification ");
        NotificationChannel chPCONotification = new NotificationChannel("pco", "pco.service", 0);
        chPCONotification.setDescription("PCO check");
        chPCONotification.enableLights(false);
        chPCONotification.enableVibration(false);
        ((NotificationManager) sContext.getSystemService("notification")).createNotificationChannel(chPCONotification);
        startForeground(1, new Notification.Builder(this).setSmallIcon(17301659).setContentTitle("PCO").setContentText("Checking PCO status.").setChannelId("pco").setAutoCancel(true).build());
        stopForeground(1);
    }

    private void unregisterIntents() {
        log("[-]unregister: NW Broadcast receivers");
        BroadcastReceiver broadcastReceiver = this.mBroadcastReceiver;
        if (broadcastReceiver != null) {
            sContext.unregisterReceiver(broadcastReceiver);
        }
        Looper looper = sServiceLooper;
        if (looper != null) {
            looper.quit();
        }
    }

    public void onDestroy() {
        log("[x]onDestroy");
        unregisterIntents();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void checkPCOActivationStatus() {
        int imsPcoState = getImsPcoState();
        if (imsPcoState == 2) {
            handlePCO3case();
        } else if (imsPcoState == 3) {
            handlePCO5case();
        } else if (imsPcoState == 4) {
            handlePCOEMM8case();
        } else if (imsPcoState == 5) {
            handleActivatedcase();
        }
    }

    private synchronized void updateImsPcoState(int mUpdatePCOState) {
        if (sStateImsPCO != mUpdatePCOState) {
            log("updateState: from " + stateToString(sStateImsPCO) + " to " + stateToString(mUpdatePCOState));
            sStateImsPCO = mUpdatePCOState;
            sPCOInfoPref.savePCOState(mUpdatePCOState);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x0042  */
    /* JADX WARNING: Removed duplicated region for block: B:17:? A[RETURN, SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void handleSimStateChange(android.content.Context r6, android.content.Intent r7) {
        /*
        // Method dump skipped, instructions count: 133
        */
        throw new UnsupportedOperationException("Method not decompiled: com.mediatek.ims.pco.PCOService.handleSimStateChange(android.content.Context, android.content.Intent):void");
    }

    public String getImei() {
        String str = this.mImei;
        if (str != null) {
            return str;
        }
        return this.mTelephonyManager.getImei();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private String getIccId() {
        if (this.mSubscriptionManager == null) {
            log("getIccId(), mSubscriptionManager is null");
            return null;
        }
        SubscriptionInfo subInfo = this.mSubscriptionManager.getActiveSubscriptionInfoForSimSlotIndex(getMainCapabilityPhoneId());
        if (subInfo != null) {
            log("ICCID = " + subInfo.getIccId());
            return subInfo.getIccId();
        }
        log("getIccId(), subInfo is null");
        return null;
    }

    private int getMainCapabilityPhoneId() {
        int phoneId = SystemProperties.getInt("persist.vendor.radio.simswitch", 1) - 1;
        if (phoneId < 0 || phoneId >= TelephonyManager.getDefault().getPhoneCount()) {
            phoneId = -1;
        }
        log("getMainCapabilityPhoneId = " + phoneId);
        return phoneId;
    }

    private void handlePCOEMMcase(Context context, Intent intent) {
        int mNwErrorEMMValue = intent.getIntExtra("emmCause", 0);
        log("Network rejected, emmCause,ErrorValue =" + mNwErrorEMMValue);
        if (mNwErrorEMMValue == 8) {
            updateImsPcoState(4);
            handlePCOEMM8case();
        }
    }

    private void handlePCOEMM8case() {
        log("Handling NW rejected, CauseEMM = 8");
        sPCOInfoPref.saveActivated(false);
        PCONwUtils.turnOffCellularRadio();
        sendMessagetoUI(Constants.ACTION_SIGN_UP, Constants.NOT_ACTIVATED, Constants.USE_WIFI_NW_ONLY, Constants.SCREEN_SHOW_WIFI_DIALOGUE);
    }

    public void handlePCOcase(Context context, Intent intent) {
        Log.i(TAG, "handlePCOcase start");
        String apnType = intent.getStringExtra(EXTRA_APN_TYPE_KEY);
        String protoKeyAPN = intent.getStringExtra(EXTRA_APN_PROTO_KEY);
        boolean z = false;
        intent.getIntExtra(EXTRA_PCO_ID_KEY, 0);
        byte[] pcoContent = intent.getByteArrayExtra(EXTRA_PCO_VALUE_KEY);
        if (pcoContent == null || apnType == null) {
            Log.i(TAG, "handlePCOcase pcoContent == null || apnType == null");
            return;
        }
        byte pcoVal = pcoContent[0];
        int pcoValInt = pcoVal - 48;
        log("apn=" + apnType + "protoKeyAPN=" + protoKeyAPN + "pcoVal =" + ((int) pcoVal) + " pcoValInt = " + pcoValInt);
        if (apnType.hashCode() != 104399 || !apnType.equals("ims")) {
            z = true;
        }
        if (!z) {
            if (pcoValInt == 5) {
                updateImsPcoState(3);
                handlePCO5case();
            } else if (pcoValInt == 0) {
                handlePCO3case();
            }
        }
    }

    private void handlePCO3case() {
        log("Handling IMS PCO error case = 3");
        if (!sPCOInfoPref.isFirstBoot()) {
            handleActivatedcase();
        } else if (getImsPcoState() == -1 || getImsPcoState() == 1) {
            updateImsPcoState(2);
        } else {
            handleActivatedcase();
        }
    }

    private void handlePCO5case() {
        log("Handling IMS PCO error case = 5");
        sPCOInfoPref.saveActivated(false);
        sendMessagetoUI(Constants.ACTION_SIGN_UP, Constants.NOT_ACTIVATED, Constants.USE_MOBILE_NW_ONLY, Constants.SCREEN_SHOW_URL_DIALOGUE);
    }

    private void handleActivatedcase() {
        log("[V]IMS PCO is activated");
        updateImsPcoState(5);
        sPCOInfoPref.saveFirstBoot(false);
        sPCOInfoPref.saveActivated(true);
        sendMessagetoUI(Constants.ACTION_SIGN_UP_EXIT, Constants.ACTIVATED, "", "");
    }

    private void sendMessagetoUI(String mAction, String mActStatus, String mNWToUse, String mScreentype) {
        log("[==>]sendMessagetoUI, Action=" + mAction + ", mNWToUse =" + mNWToUse + ", Screentype=" + mScreentype);
        Intent i = new Intent(sContext, PCOStartUPWizardMainActivity.class);
        i.setAction(mAction);
        i.setFlags(268468224);
        i.putExtra(Constants.EXTRA_ACTIVATION_STATUS, mActStatus);
        i.putExtra(Constants.EXTRA_NETWORK_TYPE_TO_USE, mNWToUse);
        i.putExtra("screen-type", mScreentype);
        startActivity(i);
    }

    class IncomingHandler extends Handler {
        IncomingHandler() {
        }

        public void handleMessage(Message msg) {
            PCOService.log("Request from UI, msgid = " + msg.what);
            int i = msg.what;
            if (i == 11) {
                PCONwUtils.enableWifi();
            } else if (i != 13) {
                if (i == 15) {
                    PCONwUtils.turnOnCellularRadio();
                    PCONwUtils.enableWirelessConnectivity();
                } else if (i == 17) {
                    PCONwUtils.turnOffCellularRadio();
                } else if (i == 21) {
                    int unused = PCOService.sSubOPBrowser = 12;
                    PCONwUtils.launchBrowserURL(PCOConfig.getServerPostPaidUrl(), PCOService.this.getImei(), PCOService.this.getIccId());
                } else if (i == 23) {
                    PCONwUtils.turnOffCellularRadio();
                } else if (i == 25) {
                    int unused2 = PCOService.sSubOPCall = 15;
                    PCONwUtils.call911();
                } else if (i == 27) {
                    PCOService.this.checkPCOActivationStatus();
                } else if (i != 33) {
                    throw new IllegalStateException("Unknow msg ID from activity");
                }
            }
            super.handleMessage(msg);
        }
    }

    public IBinder onBind(Intent intent) {
        return this.mMessenger.getBinder();
    }

    /* access modifiers changed from: private */
    public static void log(String s) {
        Log.d(TAG, s);
    }

    private static String stateToString(int state) {
        if (state == -1) {
            return "STATE_UNKNOWN_PCO_VALUE";
        }
        if (state == 1) {
            return "STATE_PCO_NOT_ACTIVATED";
        }
        if (state == 2) {
            return "STATE_PCO_ACTIVATING_PCO_VALUE_3";
        }
        if (state == 3) {
            return "STATE_PCO_ACTIVATING_PCO_VALUE_5";
        }
        if (state == 4) {
            return "STATE_PCO_ACTIVATING_NW_REJECT_EMM_8";
        }
        if (state != 5) {
            return "UNKNOWN state";
        }
        return "STATE_PCO_ACTIVATED";
    }
}
