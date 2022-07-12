package com.mediatek.ims.pco;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemProperties;
import android.util.Log;
import com.mediatek.ims.pco.ui.PCOStartUPWizardMainActivity;

public class PCOBootCompletedReceiver extends BroadcastReceiver {
    private static final String ACTION_CARRIER_SIGNAL_PCO_VALUE = "com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE";
    private static final String EXTRA_APN_PROTO_KEY = "apnProto";
    private static final String EXTRA_APN_TYPE_KEY = "apnType";
    private static final String EXTRA_PCO_ID_KEY = "pcoId";
    private static final String EXTRA_PCO_VALUE_KEY = "pcoValue";
    private static final String OP12_BRANDED_DEVICE = "0";
    private static final String PCO_SERVICE = "pco";
    private static final String PROPERTY_OP12_DEVICE_MODEL = "persist.op12.model";
    private static final String TAG = "PCOBootCompletedReceiver";
    private static Context mContext;

    private static boolean isOp12BrandedDevice() {
        return OP12_BRANDED_DEVICE.equalsIgnoreCase(SystemProperties.get(PROPERTY_OP12_DEVICE_MODEL));
    }

    public void onReceive(Context context, Intent intent) {
        mContext = context;
        PCONwUtils.setAppContext(context);
        boolean mIsBrandedDevice = isOp12BrandedDevice();
        log("onReceive: mIsBrandedDevice = " + mIsBrandedDevice);
        if (mIsBrandedDevice && intent != null && ACTION_CARRIER_SIGNAL_PCO_VALUE.equals(intent.getAction())) {
            Log.i(TAG, "onReceive ACTION_CARRIER_SIGNAL_PCO_VALUE");
            handlePCOcase(context, intent);
        }
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
        if (!z && pcoValInt == 5) {
            handlePCO5case();
        }
    }

    private void handlePCO5case() {
        log("Handling IMS PCO error case = 5");
        sendMessagetoUI(Constants.ACTION_SIGN_UP, Constants.NOT_ACTIVATED, Constants.USE_MOBILE_NW_ONLY, Constants.SCREEN_SHOW_URL_DIALOGUE);
    }

    private void sendMessagetoUI(String mAction, String mActStatus, String mNWToUse, String mScreentype) {
        log("[==>]sendMessagetoUI, Action=" + mAction + ", mNWToUse =" + mNWToUse + ", Screentype=" + mScreentype);
        Intent i = new Intent(mContext, PCOStartUPWizardMainActivity.class);
        i.setAction(mAction);
        i.setFlags(268468224);
        i.putExtra(Constants.EXTRA_ACTIVATION_STATUS, mActStatus);
        i.putExtra(Constants.EXTRA_NETWORK_TYPE_TO_USE, mNWToUse);
        i.putExtra("screen-type", mScreentype);
        mContext.startActivity(i);
    }

    private static void log(String s) {
        Log.d(TAG, s);
    }
}
