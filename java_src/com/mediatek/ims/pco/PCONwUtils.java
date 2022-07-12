package com.mediatek.ims.pco;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.provider.Settings;
import android.telephony.SubscriptionManager;
import android.util.Log;
import android.widget.Toast;
import com.mediatek.internal.telephony.IMtkTelephonyEx;

public final class PCONwUtils {
    private static final String TAG = "PCONwUtils";
    private static Context sContext;

    public static void setAppContext(Context mContext) {
        sContext = mContext;
    }

    private static Context getAppContext() {
        return sContext;
    }

    public static void turnOnCellularRadio() {
        Log.d(TAG, "turnOnCellularRadio");
        IMtkTelephonyEx iMtkTelephonyEx = IMtkTelephonyEx.Stub.asInterface(ServiceManager.getService("phoneEx"));
        if (iMtkTelephonyEx == null) {
            Log.d(TAG, "Can not access iMtkTelephonyEx");
            return;
        }
        try {
            int subId = SubscriptionManager.getDefaultDataSubscriptionId();
            if (iMtkTelephonyEx.getSelfActivateState(subId) != 1) {
                Toast.makeText(getAppContext(), "Turning On Radio", 0).show();
                Bundle extra = new Bundle();
                extra.putInt("key_add_data_operation", 1);
                iMtkTelephonyEx.selfActivationAction(0, extra, subId);
            }
        } catch (RemoteException e) {
            log("iMtkTelephonyEx RemoteException");
        }
    }

    public static void turnOffCellularRadio() {
        log("turnOffCellularRadio");
        IMtkTelephonyEx iMtkTelephonyEx = IMtkTelephonyEx.Stub.asInterface(ServiceManager.getService("phoneEx"));
        if (iMtkTelephonyEx == null) {
            log("Can not access iMtkTelephonyEx");
            return;
        }
        try {
            int subId = SubscriptionManager.getDefaultDataSubscriptionId();
            iMtkTelephonyEx.getSelfActivateState(subId);
            Toast.makeText(getAppContext(), "Turning Off Radio", 0).show();
            Bundle extra = new Bundle();
            extra.putInt("key_add_data_operation", 0);
            iMtkTelephonyEx.selfActivationAction(0, extra, subId);
        } catch (RemoteException e) {
            log("iMtkTelephonyEx RemoteException");
        }
    }

    public static void turnOFFBackGroundData() {
        log("turnOffBackGroundData");
        IMtkTelephonyEx iMtkTelephonyEx = IMtkTelephonyEx.Stub.asInterface(ServiceManager.getService("phoneEx"));
        if (iMtkTelephonyEx == null) {
            log("Can not access iMtkTelephonyEx");
            return;
        }
        Toast.makeText(getAppContext(), "Turning Off Radio", 0).show();
        try {
            int subId = SubscriptionManager.getDefaultDataSubscriptionId();
            if (iMtkTelephonyEx.getSelfActivateState(subId) != 0) {
                Bundle extra = new Bundle();
                extra.putInt("key_add_data_operation", 0);
                iMtkTelephonyEx.selfActivationAction(0, extra, subId);
            }
        } catch (RemoteException e) {
            log("iMtkTelephonyEx RemoteException");
        }
    }

    public static boolean getRadioStateFromInt(int stateInt) {
        if (stateInt == 0) {
            return false;
        }
        if (stateInt == 1) {
            return false;
        }
        if (stateInt == 10) {
            return true;
        }
        throw new RuntimeException("Unrecognized RadioState: " + stateInt);
    }

    public static void launchBrowserURL(String url, String mIMEI, String mICCID) {
        Context mContext = getAppContext();
        Toast.makeText(mContext, "Opening Portal", 0).show();
        log("url=" + url + ", imei=" + mIMEI + "ICCID=" + mICCID);
        StringBuilder sb = new StringBuilder();
        sb.append(url);
        sb.append("HTTPS POST parameters: iccid=");
        sb.append(mICCID);
        sb.append("&IMEI=");
        sb.append(mIMEI);
        String mfinalURL = sb.toString();
        Intent browserIntent = new Intent("android.intent.action.VIEW", Uri.parse(mfinalURL));
        log("mfinalURL=" + mfinalURL);
        browserIntent.addFlags(268435456);
        mContext.startActivity(browserIntent);
    }

    public static boolean isInternetConnected() {
        ConnectivityManager connectivityMgr = (ConnectivityManager) getAppContext().getSystemService("connectivity");
        NetworkInfo wifi = connectivityMgr.getNetworkInfo(1);
        NetworkInfo mobile = connectivityMgr.getNetworkInfo(0);
        if (wifi != null && wifi.isConnected()) {
            log("isInternetConnected: Wifi is connected");
            return true;
        } else if (mobile == null || !mobile.isConnected()) {
            log("isInternetConnected: Internet not Connected");
            return false;
        } else {
            log("isInternetConnected: Mobile data is connected");
            return true;
        }
    }

    public static boolean isOnline() {
        NetworkInfo networkInfo = ((ConnectivityManager) getAppContext().getSystemService("connectivity")).getActiveNetworkInfo();
        return networkInfo != null && networkInfo.isConnected();
    }

    public static boolean isMobileDataConnected() {
        boolean onlineStatus = false;
        NetworkInfo mobile = ((ConnectivityManager) getAppContext().getSystemService("connectivity")).getNetworkInfo(0);
        if (mobile != null && mobile.isConnected()) {
            onlineStatus = true;
        }
        log("isMobileDataConnected():" + onlineStatus);
        return onlineStatus;
    }

    public static boolean isWIFIConnected() {
        boolean onlineStatus = true;
        NetworkInfo wifi = ((ConnectivityManager) getAppContext().getSystemService("connectivity")).getNetworkInfo(1);
        if (wifi == null || !wifi.isConnected()) {
            onlineStatus = false;
        }
        log("isWIFIConnected():" + onlineStatus);
        return onlineStatus;
    }

    public static boolean isAirplaneModeOn() {
        return Settings.System.getInt(getAppContext().getContentResolver(), "airplane_mode_on", 0) != 0;
    }

    public static void call911() {
        Context mContext = getAppContext();
        Toast.makeText(mContext, "Calling 911", 0).show();
        Intent callIntent = new Intent("android.intent.action.CALL", Uri.parse("tel://911"));
        callIntent.setFlags(268697600);
        mContext.startActivity(callIntent);
    }

    public static void enableWirelessConnectivity() {
        Context mContext = getAppContext();
        Intent intent = new Intent("android.settings.WIRELESS_SETTINGS");
        intent.setFlags(805339136);
        mContext.startActivity(intent);
    }

    public static void enableWifi() {
        Context mContext = getAppContext();
        Intent intent = new Intent("android.settings.WIFI_SETTINGS");
        intent.setFlags(805339136);
        mContext.startActivity(intent);
    }

    private static void log(String s) {
        Log.d(TAG, s);
    }
}
