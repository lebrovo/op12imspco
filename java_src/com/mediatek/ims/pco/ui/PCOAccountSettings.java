package com.mediatek.ims.pco.ui;

import android.app.Activity;
import android.content.ComponentName;
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
import android.widget.LinearLayout;
import com.mediatek.ims.pco.PCOService;
import com.mediatek.ims.pco.PCOSharedPreference;
import com.mediatek.ims.pco.R;

public class PCOAccountSettings extends Activity {
    private static final String TAG = "PCOAccountSettings";
    private static PCOSharedPreference sPCOInfoPref;
    private View.OnClickListener mAccountViewOnClickListener = new View.OnClickListener() {
        /* class com.mediatek.ims.pco.ui.PCOAccountSettings.AnonymousClass1 */

        public void onClick(View v) {
            if (v.getId() == R.id.activate_now_btn) {
                PCOAccountSettings.this.log("[==>]IMS PCO Status Check");
                PCOAccountSettings.this.sendMessageToService(27);
                PCOAccountSettings.this.finish();
            }
        }
    };
    private Button mActivateNowButton;
    private boolean mBound;
    private Messenger mService = null;
    private ServiceConnection mServiceConnection;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        sPCOInfoPref = PCOSharedPreference.getInstance(getApplicationContext());
        setContentView(R.layout.pco_operator_account_settings);
        Button button = (Button) findViewById(R.id.activate_now_btn);
        this.mActivateNowButton = button;
        button.setOnClickListener(this.mAccountViewOnClickListener);
        this.mActivateNowButton.setAllCaps(false);
        LinearLayout mBtnArea = (LinearLayout) findViewById(R.id.btn_area);
        View mView = findViewById(R.id.divider);
        setRequestedOrientation(14);
        if (sPCOInfoPref.isActivated()) {
            this.mActivateNowButton.setVisibility(8);
            mBtnArea.setVisibility(8);
            mView.setVisibility(8);
            return;
        }
        bindToService();
    }

    public void onResume() {
        super.onResume();
    }

    public void onDestroy() {
        super.onDestroy();
        unbindFromService();
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

    private void bindToService() {
        if (this.mServiceConnection == null) {
            this.mServiceConnection = new ServiceConnection() {
                /* class com.mediatek.ims.pco.ui.PCOAccountSettings.AnonymousClass2 */

                public void onServiceConnected(ComponentName name, IBinder iBinder) {
                    PCOAccountSettings.this.log("Activity connected to service");
                    PCOAccountSettings.this.mService = new Messenger(iBinder);
                    PCOAccountSettings.this.mBound = true;
                }

                public void onServiceDisconnected(ComponentName name) {
                    PCOAccountSettings.this.log("Activity disconnected from service");
                    PCOAccountSettings.this.mService = null;
                    PCOAccountSettings.this.mBound = false;
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
