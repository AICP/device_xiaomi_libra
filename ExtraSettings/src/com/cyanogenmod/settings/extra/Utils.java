package com.cyanogenmod.settings.extra;

import android.util.Log;
import java.io.FileOutputStream;

class Utils
{
	private static final String TAG = "Utils";    

	public static boolean writeLine(String fileName, String value) {
        try {
            FileOutputStream fos = new FileOutputStream(fileName);
            fos.write(value.getBytes());
            fos.flush();
            fos.close();
        } catch (Exception e) {
            Log.e(TAG, "Could not write to file " + fileName, e);
            return false;
        }

        return true;
    }

	static public String getInputControlPath(String extra) 
	{
		return "/proc/touchscreen/" + extra;
	}

	public static boolean setActiveEdgeMode(boolean state) {
		String path = getInputControlPath("edge_touch_mode");
		if (path.equals(""))
			return false;
    	return writeLine(path, (state ? "2" : "0"));
	}

}

