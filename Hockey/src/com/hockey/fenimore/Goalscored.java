package com.hockey.fenimore;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;

public class Goalscored extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_goalscored);
        
        //Location Selection
        ArrayAdapter<CharSequence> locationAdapter = ArrayAdapter.createFromResource(
        		this, R.array.location_array, android.R.layout.simple_spinner_item);
        locationAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
        
        Spinner periodSpinner = (Spinner)findViewById(R.id.spinner_Location);
        periodSpinner.setAdapter(locationAdapter);
        
        //Position Selection
        ArrayAdapter<CharSequence> positionAdapter = ArrayAdapter.createFromResource(
        		this, R.array.position_array, android.R.layout.simple_spinner_item);
        positionAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
        
        Spinner positionSpinner = (Spinner)findViewById(R.id.spinner_Position);
        positionSpinner.setAdapter(positionAdapter);
        
        //Team Strength Selection
        ArrayAdapter<CharSequence> teamStrengthAdapter = ArrayAdapter.createFromResource(
        		this, R.array.team_array, android.R.layout.simple_spinner_item);
        teamStrengthAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
        
        Spinner teamStrengthSpinner = (Spinner)findViewById(R.id.spinner_TeamStrength);
        teamStrengthSpinner.setAdapter(teamStrengthAdapter);
        
        //Kind of Goal Selection
        ArrayAdapter<CharSequence> goalKindAdapter = ArrayAdapter.createFromResource(
        		this, R.array.goalkind_array, android.R.layout.simple_spinner_item);
        goalKindAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
        
        Spinner goalKindSpinner = (Spinner)findViewById(R.id.spinner_KindofGoal);
        goalKindSpinner.setAdapter(goalKindAdapter);
        
        //Button To Save Data into SQLite
        Button saveUser = (Button)findViewById(R.id.btn_save);
        saveUser.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				//TODO SQLite: Save Basic Stats (period/shots)
			}
		});
        
        //Button To Cancel and return to main Screen
        Button cancel = (Button)findViewById(R.id.btn_cancel);
        cancel.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent cancelIntent = new Intent();
				setResult(RESULT_CANCELED, cancelIntent);
				finish();
			}
		});
    }
}