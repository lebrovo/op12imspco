package com.mediatek.ims.pco.ui;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.mediatek.ims.pco.Constants;
import com.mediatek.ims.pco.PCONwUtils;
import com.mediatek.ims.pco.PCOService;
import com.mediatek.ims.pco.R;

public class PCOStartUPWizardMainActivity extends Activity {
    private static final String ACTIVATED = "Activated";
    private static final String NOT_ACTIVATED = "notActivated";
    private static final String TAG = "PCOStartUPWizardMainActivity";
    private static final String USE_MOBILE_NW_ONLY = "useMobileNW";
    private static final String USE_WIFI_NW_ONLY = "useWifiNWOnly";
    private TextView mActInfo;
    private View.OnClickListener mActivatedOnClickListener = new View.OnClickListener() {
        /* class com.mediatek.ims.pco.ui.PCOStartUPWizardMainActivity.AnonymousClass4 */

        public void onClick(View v) {
            if (v.getId() == R.id.ok_btn) {
                PCOStartUPWizardMainActivity.this.finish();
            }
        }
    };
    private String mActivationStatus = "unknown";
    private boolean mBound;
    private Button mCancelButton;
    private Context mContext;
    private Intent mIntent;
    private String mNWToUse = "unknown";
    private TextView mNwRejectedInfo;
    private Button mOKButton;
    private View.OnClickListener mOnClickListenerMobileData = new View.OnClickListener() {
        /* class com.mediatek.ims.pco.ui.PCOStartUPWizardMainActivity.AnonymousClass3 */

        public void onClick(View v) {
            int id = v.getId();
            if (id == R.id.cancel_btn) {
                PCOStartUPWizardMainActivity.this.log("mOnClickListenerMobileDataturnOffCellularRadio");
                PCONwUtils.turnOffCellularRadio();
            } else if (id == R.id.ok_btn) {
                PCOStartUPWizardMainActivity.this.log("mOnClickListenerMobileDataturnOnCellularRadio");
                PCONwUtils.turnOnCellularRadio();
            }
        }
    };
    private Messenger mService = null;
    private ServiceConnection mServiceConnection;
    private View.OnClickListener mSignUpOnClickListener = new View.OnClickListener() {
        /* class com.mediatek.ims.pco.ui.PCOStartUPWizardMainActivity.AnonymousClass1 */

        public void onClick(View v) {
            int id = v.getId();
            if (id == R.id.cancel_btn) {
                PCOStartUPWizardMainActivity.this.sendMessageToService(23);
                PCOStartUPWizardMainActivity.this.finish();
            } else if (id == R.id.ok_btn) {
                PCOStartUPWizardMainActivity.this.sendMessageToService(21);
            }
        }
    };
    private String mUIScreen = null;
    private TextView mUserInfo;
    private View.OnClickListener mWifiOnClickListener = new View.OnClickListener() {
        /* class com.mediatek.ims.pco.ui.PCOStartUPWizardMainActivity.AnonymousClass2 */

        public void onClick(View v) {
            int id = v.getId();
            if (id == R.id.cancel_btn) {
                PCOStartUPWizardMainActivity.this.sendMessageToService(25);
            } else if (id == R.id.ok_btn) {
                PCOStartUPWizardMainActivity.this.sendMessageToService(11);
            }
        }
    };

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mContext = this;
        setContentView(R.layout.pco_startup_wizard_activity);
        this.mOKButton = (Button) findViewById(R.id.ok_btn);
        this.mCancelButton = (Button) findViewById(R.id.cancel_btn);
        this.mUserInfo = (TextView) findViewById(R.id.user_notification_info_id);
        this.mActInfo = (TextView) findViewById(R.id.setup_status_id);
        this.mNwRejectedInfo = (TextView) findViewById(R.id.setup_nw_err_info_id);
        this.mOKButton.setAllCaps(false);
        this.mCancelButton.setAllCaps(false);
        setRequestedOrientation(14);
        Intent intent = getIntent();
        this.mIntent = intent;
        if (intent == null || intent.getAction() != null) {
            if (this.mIntent.getAction() == Constants.ACTION_SIGN_UP) {
                this.mActivationStatus = this.mIntent.getStringExtra(Constants.EXTRA_ACTIVATION_STATUS);
                String stringExtra = this.mIntent.getStringExtra(Constants.EXTRA_NETWORK_TYPE_TO_USE);
                this.mNWToUse = stringExtra;
                if (stringExtra == null) {
                    this.mNWToUse = "unknown";
                }
            }
            log("[<==]onCreate:mActivationStatus=" + this.mActivationStatus + ", mNWToUse ==" + this.mNWToUse);
            uiController();
        }
    }

    public void onResume() {
        super.onResume();
        log("onResume:mActivationStatus=" + this.mActivationStatus + ", mNWToUse=" + this.mNWToUse);
        uiController();
    }

    /* JADX INFO: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00ce, code lost:
        if (r2.equals(com.mediatek.ims.pco.Constants.SCREEN_SHOW_WELCOME) != false) goto L_0x00f0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void uiController() {
        /*
        // Method dump skipped, instructions count: 328
        */
        throw new UnsupportedOperationException("Method not decompiled: com.mediatek.ims.pco.ui.PCOStartUPWizardMainActivity.uiController():void");
    }

    private void setViewForWifiActivation() {
        this.mNwRejectedInfo.setText(this.mContext.getResources().getString(R.string.nw_rejected_err_details_to_user));
        this.mUserInfo.setText(this.mContext.getResources().getString(R.string.setup_on_wifi_nw_only));
        this.mOKButton.setText(this.mContext.getResources().getString(R.string.use_wifi));
        this.mCancelButton.setText(getString(R.string.call_911));
        this.mOKButton.setOnClickListener(this.mWifiOnClickListener);
        this.mCancelButton.setOnClickListener(this.mWifiOnClickListener);
        updateNotification();
    }

    private void setViewForMobileActivation() {
        this.mOKButton.setText(this.mContext.getResources().getString(R.string.use_mobile_data));
        this.mNwRejectedInfo.setText(getString(R.string.nw_rejected_signup_via_mobile_data));
        this.mCancelButton.setText(getString(R.string.turnoff_mobile_data));
        this.mOKButton.setOnClickListener(this.mOnClickListenerMobileData);
        this.mCancelButton.setOnClickListener(this.mOnClickListenerMobileData);
        this.mUserInfo.setText(this.mContext.getResources().getString(R.string.setup_on_mobile_data_nw_only));
        updateNotification();
    }

    private void setViewForOnlineSignup() {
        this.mNwRejectedInfo.setText(this.mContext.getResources().getString(R.string.nw_rejected_err_details_to_user));
        this.mActInfo.setText(this.mContext.getResources().getString(R.string.setup_nw_status_not_reg));
        this.mOKButton.setText(this.mContext.getResources().getString(R.string.signup_now));
        this.mOKButton.setOnClickListener(this.mSignUpOnClickListener);
        this.mCancelButton.setText(this.mContext.getResources().getString(R.string.later_not_now));
        this.mCancelButton.setOnClickListener(this.mSignUpOnClickListener);
        this.mUserInfo.setText(this.mContext.getResources().getString(R.string.signup_user_info));
        updateNotification();
    }

    private void setViewForActivated() {
        this.mUserInfo.setText(this.mContext.getResources().getString(R.string.user_nw_info_activated));
        this.mOKButton.setText(this.mContext.getResources().getString(17039370));
        this.mCancelButton.setVisibility(8);
        this.mOKButton.setOnClickListener(this.mActivatedOnClickListener);
        this.mActInfo.setText(this.mContext.getResources().getString(R.string.setup_nw_status_registered));
        cancelNotifications();
    }

    public void onDestroy() {
        super.onDestroy();
        unbindFromService();
    }

    private void updateNotification() {
        log("adding the notification ");
        Notification.Builder mBuilder = new Notification.Builder(this.mContext.getApplicationContext(), Constants.SIGNUP_USER_NOTIFICATION_ID);
        mBuilder.setContentIntent(PendingIntent.getBroadcast(this.mContext, 0, new Intent(Constants.ACTION_QUERY_IMS_PCO_STATUS_FRM_NOTIFICATION), 0));
        mBuilder.setContentText(getString(R.string.notification_sigup_user_info));
        mBuilder.setSmallIcon(R.mipmap.ic_launcher_round);
        mBuilder.setAutoCancel(true);
        NotificationManager mNotificationManager = getNotificationManager(this.mContext);
        mNotificationManager.createNotificationChannel(new NotificationChannel(Constants.SIGNUP_USER_NOTIFICATION_ID, this.mContext.getResources().getString(R.string.notification_sigup_title), 3));
        mNotificationManager.notify(0, mBuilder.build());
    }

    public void cancelNotifications() {
        log("[-]canceling notification");
        getNotificationManager(this.mContext).cancel(0);
    }

    private NotificationManager getNotificationManager(Context context) {
        return (NotificationManager) context.getSystemService("notification");
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void sendMessageToService(int mReqID) {
        log("[==>]Request to service, MSG ID" + mReqID);
        if (this.mService != null) {
            Message message = new Message();
            message.what = mReqID;
            try {
                this.mService.send(message);
            } catch (RemoteException e) {
                Log.d(TAG, e.toString());
            }
        }
    }

    private void unbindFromService() {
        if (this.mServiceConnection != null) {
            log("unbind service");
            if (this.mBound) {
                unbindService(this.mServiceConnection);
                this.mBound = false;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void bindToService() {
        if (this.mServiceConnection == null) {
            this.mServiceConnection = new ServiceConnection() {
                /* class com.mediatek.ims.pco.ui.PCOStartUPWizardMainActivity.AnonymousClass5 */

                public void onServiceConnected(ComponentName name, IBinder iBinder) {
                    PCOStartUPWizardMainActivity.this.log("Activity connected to service");
                    PCOStartUPWizardMainActivity.this.mService = new Messenger(iBinder);
                    PCOStartUPWizardMainActivity.this.mBound = true;
                }

                public void onServiceDisconnected(ComponentName name) {
                    PCOStartUPWizardMainActivity.this.log("Activity disconnected from service");
                    PCOStartUPWizardMainActivity.this.mService = null;
                    PCOStartUPWizardMainActivity.this.mBound = false;
                }
            };
        }
        log("start requested & bind service");
        bindService(new Intent(this, PCOService.class), this.mServiceConnection, 1);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void log(String s) {
        Log.d(TAG, s);
    }
}
