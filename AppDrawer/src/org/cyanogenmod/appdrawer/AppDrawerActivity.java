package org.cyanogenmod.appdrawer;

import java.util.ArrayList;
import java.util.List;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.Toast;

public class AppDrawerActivity extends Activity {
	private PackageManager packageManager = null;
	private List<ApplicationInfo> applist = null;
	private ApplicationAdapter listadaptor = null;
	private GridView grid;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		packageManager = getPackageManager();

		new LoadApplications().execute();

        grid = (GridView)findViewById(R.id.grid);
        grid.setAdapter(listadaptor);
        grid.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
				ApplicationInfo app = applist.get(position);
				try {
					Intent intent = packageManager
							.getLaunchIntentForPackage(app.packageName);

					if (null != intent) {
						startActivity(intent);
					}
				} catch (ActivityNotFoundException e) {
					Toast.makeText(AppDrawerActivity.this, e.getMessage(),
							Toast.LENGTH_LONG).show();
				} catch (Exception e) {
					Toast.makeText(AppDrawerActivity.this, e.getMessage(),
							Toast.LENGTH_LONG).show();
				}
            }
        });
	}

	private List<ApplicationInfo> checkForLaunchIntent(List<ApplicationInfo> list) {
		ArrayList<ApplicationInfo> applist = new ArrayList<ApplicationInfo>();
		for (ApplicationInfo info : list) {
			try {
				if (null != packageManager.getLaunchIntentForPackage(info.packageName)) {
					applist.add(info);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return applist;
	}

	private class LoadApplications extends AsyncTask<Void, Void, Void> {
		private ProgressDialog progress = null;

		@Override
		protected Void doInBackground(Void... params) {
			applist = checkForLaunchIntent(packageManager.getInstalledApplications(PackageManager.GET_META_DATA));
			listadaptor = new ApplicationAdapter(AppDrawerActivity.this,
					R.layout.snippet_list_row, applist);

			return null;
		}
	}
}
