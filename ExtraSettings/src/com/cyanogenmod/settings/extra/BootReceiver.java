package com.cyanogenmod.settings.extra;

import android.util.Log;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemProperties;

public class BootReceiver extends BroadcastReceiver 
{
	private static final String TAG = "BootReceiver";    

    @Override
    public void onReceive(Context context, Intent intent) 
    {
        String action = intent.getAction();
        Log.i(TAG, "onReceive " + action);       

		// Restore edge mode
		if (SystemProperties.get("persist.sys.etap_en_b").equals("1"))
		{
			Log.i(TAG, "activate edgemode");
			Utils.setActiveEdgeMode(true);
		}
    }

}
