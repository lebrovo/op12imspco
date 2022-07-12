package com.mediatek.ims.pco;

public final class PCOConfig {
    public static final boolean DEBUG = true;
    private static final String SERVER_POST_PAID_URL = "https://quickaccess.verizonwireless.com/bbportal/phone/start.do?";
    private static final String SERVER_PRE_PAID_URL = "https://quickaccess.verizonwireless.com/bbportal/phone/start.do?HTTPS POST parameters: iccid=1";
    public static final String TAG = "PCOConfig";
    public static final boolean VERBOSE = true;

    public static String getServerPostPaidUrl() {
        return SERVER_POST_PAID_URL;
    }

    public static String getServerPrePaidUrl() {
        return SERVER_PRE_PAID_URL;
    }
}
