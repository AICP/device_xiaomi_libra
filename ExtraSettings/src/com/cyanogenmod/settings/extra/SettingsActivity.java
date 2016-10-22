package com.cyanogenmod.settings.extra;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.util.Log;
import android.os.SystemProperties;

public class SettingsActivity extends PreferenceActivity implements SharedPreferences.OnSharedPreferenceChangeListener {

		private static final String TAG = "SettingsActivity";

		public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key)
		{
			Log.d(TAG, key);

			if (key.endsWith("_b")) // Boolean settings ends with "_b"
			{
				saveSettingToProp(key, sharedPreferences.getBoolean(key, false) ? "1" : "0");
			}
			else
			{
				saveSettingToProp(key, sharedPreferences.getString(key, ""));
			}

			if (key.equals("etap_en_b"))
			{
				Utils.setActiveEdgeMode(sharedPreferences.getBoolean(key, false));
			}
		}

		@Override
		protected void onResume() {
			super.onResume();
			getPreferenceScreen().getSharedPreferences()
			.registerOnSharedPreferenceChangeListener(this);
		}

		@Override
		protected void onPause() {
			super.onPause();
			getPreferenceScreen().getSharedPreferences()
			.unregisterOnSharedPreferenceChangeListener(this);
		}

		@Override
		public void onCreate(Bundle savedInstanceState) {
			super.onCreate(savedInstanceState);
		}

		@Override
		protected void onPostCreate(Bundle savedInstanceState)
		{
			super.onPostCreate(savedInstanceState);

			getPreferenceManager().setSharedPreferencesName("Extra_preferences");

			SharedPreferences.Editor editor = getSharedPreferences("Extra_preferences", 0).edit();

			loadBoolSettingFromProp(editor, "etap_en_b");

			// we use the older PreferenceActivity APIs.
			addPreferencesFromResource(R.xml.pref_allsettings);
		}

		void loadBoolSettingFromProp(SharedPreferences.Editor editor, String setting)
		{
			Log.d(TAG, "Load " + setting);
			String val = SystemProperties.get("persist.sys." + setting);
			Log.d(TAG, setting + " = " + val);
			editor.putBoolean(setting, "1".equals(val) ? true : false);
		}

		void loadSettingFromProp(SharedPreferences.Editor editor, String setting)
		{
			Log.d(TAG, "Load " + setting);
			String val = SystemProperties.get("persist.sys." + setting);
			Log.d(TAG, setting + " = " + val);
			editor.putString(setting, val);
		}

		void saveSettingToProp(String setting, String val)
		{
			Log.d(TAG, setting + " => " + val);
			SystemProperties.set("persist.sys." + setting, val);
		}

		/**
		 * {@inheritDoc}
		 */
		@Override
		public boolean onIsMultiPane() {
			return false;
		}
}
