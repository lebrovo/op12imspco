package com.mediatek.ims.pco.ui;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.AsyncTask;
import com.mediatek.ims.pco.Constants;

public class PCOWaitForWifiTask extends AsyncTask<String, Void, String> {
    private static final String REQUEST_METHOD = "POST";
    private static final int REQUEST_TIMEOUT = 15000;
    private static final int RETRY = 5;
    private static final int WAIT_TIME = 5000;
    private NetworkInfo mActiveNetwork;
    private ConnectivityManager mConnectionManager;
    private Context mContext;
    private PCOWaitForWifiTask mWifiStatusCheckingTask;

    public PCOWaitForWifiTask(Context context) {
        this.mContext = context;
    }

    public String doInBackground(String... params) {
        WifiManager wifiManager = (WifiManager) this.mContext.getSystemService("wifi");
        while (!wifiManager.isWifiEnabled()) {
            try {
                Thread.currentThread();
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        return Constants.CONNECTED;
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(String result) {
        super.onPostExecute((Object) result);
        Intent i = new Intent(this.mContext, PCOStartUPWizardMainActivity.class);
        i.setAction("android.intent.action.MAIN");
        i.addCategory("android.intent.category.LAUNCHER");
        i.setFlags(131072);
        this.mContext.startActivity(i);
        this.mContext = null;
    }
}
