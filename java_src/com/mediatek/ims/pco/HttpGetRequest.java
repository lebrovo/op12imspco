package com.mediatek.ims.pco;

import android.os.AsyncTask;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpGetRequest extends AsyncTask<String, Void, String> {
    public static final int CONNECTION_TIMEOUT = 15000;
    public static final int READ_TIMEOUT = 15000;
    public static final String REQUEST_METHOD = "POST";

    /* access modifiers changed from: protected */
    public String doInBackground(String... params) {
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL(params[0]).openConnection();
            connection.setRequestMethod(REQUEST_METHOD);
            connection.setReadTimeout(15000);
            connection.setConnectTimeout(15000);
            connection.connect();
            InputStreamReader streamReader = new InputStreamReader(connection.getInputStream());
            BufferedReader reader = new BufferedReader(streamReader);
            StringBuilder stringBuilder = new StringBuilder();
            while (true) {
                String inputLine = reader.readLine();
                if (inputLine != null) {
                    stringBuilder.append(inputLine);
                } else {
                    reader.close();
                    streamReader.close();
                    return stringBuilder.toString();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(String result) {
        super.onPostExecute((Object) result);
    }
}
