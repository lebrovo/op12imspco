package com.mediatek.ims.pco;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.UserManager;
import android.util.Log;

public class PCOSharedPreference {
    private static final String ACTIVATED_VIRTUAL_LINES = "ActivatedVirtualLines";
    private static final String DEVICE_NAME = "DeviceName";
    private static final String IAM_USER_REFRESH_TOKEN = "IAMUserRefreshToken";
    private static final String ICCID = "Iccid";
    private static final String IS_ACTIVATED = "IsActivated";
    private static final String IS_FIRST_BOOT = "IsFirstBoot";
    private static final String PCO_ACTIVATION_STATUS = "PCOActivationStatusToken";
    private static final String SHARED_PREFERENCES_NAME = "ims_pco_information";
    protected static final String TAG = "PCOSharedPreference";
    private static Context sContext;
    private static volatile PCOSharedPreference sPCOPref;
    private SharedPreferences mPref;

    private PCOSharedPreference(Context mContext) {
        sContext = mContext;
        this.mPref = mContext.getSharedPreferences(SHARED_PREFERENCES_NAME, 0);
    }

    public static PCOSharedPreference getInstance(Context context) {
        if (sPCOPref != null) {
            return sPCOPref;
        }
        sPCOPref = new PCOSharedPreference(context);
        return sPCOPref;
    }

    private SharedPreferences getSharedPreferences() {
        return this.mPref;
    }

    private boolean getSharePrefBoolenValue(String key) {
        return getSharedPreferences().getBoolean(key, false);
    }

    private void setSharePrefBoolenValue(String key, boolean value) {
        SharedPreferences.Editor editor = getSharedPreferences().edit();
        editor.putBoolean(key, value);
        editor.commit();
    }

    private int getSharePrefIntValue(String key) {
        return getSharedPreferences().getInt(key, -1);
    }

    private void setSharePrefIntValue(String key, int value) {
        SharedPreferences.Editor editor = getSharedPreferences().edit();
        editor.putInt(key, value);
        editor.apply();
    }

    private String getSharePrefStringValue(String key) {
        return getSharedPreferences().getString(key, "DEFAULT");
    }

    private void setSharePrefStringValue(String key, String value) {
        SharedPreferences.Editor editor = getSharedPreferences().edit();
        editor.putString(key, value);
        editor.apply();
    }

    public void saveDeviceName(String name) {
        log("saveDeviceName(), name:" + name);
        SharedPreferences.Editor editor = this.mPref.edit();
        editor.putString(DEVICE_NAME, name);
        editor.apply();
    }

    public String getDeviceName() {
        String deviceName = this.mPref.getString(DEVICE_NAME, "");
        if (deviceName.length() == 0) {
            String userName = UserManager.get(sContext).getUserName();
            Log.d(TAG, "UserManager.getUserName() is " + userName);
            if (userName == null || userName.length() == 0) {
                deviceName = "My phone";
            } else {
                deviceName = userName + "'s phone";
            }
            SharedPreferences.Editor editor = this.mPref.edit();
            editor.putString(DEVICE_NAME, deviceName);
            editor.apply();
        }
        return deviceName;
    }

    public void saveIccid(String iccid) {
        log("saveIccid(), iccid:" + iccid);
        setSharePrefStringValue(ICCID, iccid);
    }

    public String getIccid() {
        return getSharePrefStringValue(ICCID);
    }

    public void savePCOState(int mPCOState) {
        log("savePCOState(), PCOState:" + mPCOState);
        setSharePrefIntValue(PCO_ACTIVATION_STATUS, mPCOState);
    }

    public int getSavedPCOState() {
        int mState = getSharePrefIntValue(PCO_ACTIVATION_STATUS);
        log("getSavedPCOState(), PCOState:" + mState);
        return mState;
    }

    public void saveFirstBoot(boolean status) {
        log("saveFirstBoot() " + status);
        setSharePrefBoolenValue(IS_FIRST_BOOT, status);
    }

    public boolean isFirstBoot() {
        boolean isFirstBoot = getSharedPreferences().getBoolean(IS_FIRST_BOOT, true);
        log("isFirstBoot(), " + isFirstBoot);
        return isFirstBoot;
    }

    public void saveActivated(boolean status) {
        log("saveActivated" + status);
        setSharePrefBoolenValue(IS_ACTIVATED, status);
    }

    public boolean isActivated() {
        boolean isActivated = getSharedPreferences().getBoolean(IS_ACTIVATED, false);
        log("isActivated(), " + isActivated);
        return isActivated;
    }

    private static void log(String s) {
        Log.d(TAG, s);
    }
}
