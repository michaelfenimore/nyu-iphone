package com.hockey.fenimore;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class HockeyActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        Button newGoalie = (Button)findViewById(R.id.newGoalie);
        newGoalie.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View arg0) {
				Intent myIntent = new Intent(arg0.getContext(), Newgoalie.class);
				startActivityForResult(myIntent, 0);
			}
        	
        });
        
        Button editGoalie = (Button)findViewById(R.id.editGoalie);
        editGoalie.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View arg1) {
				Intent myIntent = new Intent(arg1.getContext(), Editgoalie.class);
				startActivityForResult(myIntent, 0);
			}
        	
        });
        
        Button enterStats = (Button)findViewById(R.id.enterStats);
        enterStats.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View arg2) {
				Intent myIntent = new Intent(arg2.getContext(), Enterstats.class);
				startActivityForResult(myIntent, 0);
			}
        	
        });
    }
}