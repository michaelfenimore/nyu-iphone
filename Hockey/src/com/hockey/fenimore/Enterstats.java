package com.hockey.fenimore;

import java.util.Calendar;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class Enterstats extends Activity {
    /** Called when the activity is first created. */
	private TextView textDate;
	private int mYear;
	private int mMonth;
	private int mDay;
	static final int DATE_DIALOG_ID = 0;
	private final int MINIMUM = 0;
	private final int MAXIMUM = 99;
	public EditText txt_Shots;
	public Integer myCounter = 0;
	
    @Override
    public void onCreate(Bundle savedInstanceState) {    	
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_enterstats);
        
        //Period Selection
        ArrayAdapter<CharSequence> periodAdapter = ArrayAdapter.createFromResource(
        		this, R.array.period_array, android.R.layout.simple_spinner_item);
        periodAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
        
        Spinner periodSpinner = (Spinner)findViewById(R.id.periodSpinner);
        periodSpinner.setAdapter(periodAdapter);
        
        textDate = (TextView)findViewById(R.id.textDate);
        txt_Shots = (EditText)findViewById(R.id.txt_Shots);
        
        Button changeDate = (Button)findViewById(R.id.btn_dateChange);
        changeDate.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				showDialog(DATE_DIALOG_ID);
			}        	
        });
        
        //Get the current date and display when the page loads 
        final Calendar c = Calendar.getInstance();
        mYear = c.get(Calendar.YEAR);
        mMonth = c.get(Calendar.MONTH);
        mDay = c.get(Calendar.DAY_OF_MONTH);
	    updateDisplay();
	    
	    //Button for Goal Scored. Move to next screen for data
	    Button goalScored = (Button)findViewById(R.id.btn_goalScored);
	    goalScored.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent goalIntent = new Intent(v.getContext(), Goalscored.class);
				startActivityForResult(goalIntent, 0);
			}
	    });
	    
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
        
        //Button to ADD a Shot
        Button addShot = (Button)findViewById(R.id.btn_addShot);
        addShot.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				addTheShot();
			}
		});
        
        //Button to REMOVE a Shot
        Button minusShot = (Button)findViewById(R.id.btn_minusShot);
        minusShot.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				btn_minusShot();
			}
		});
    }
    
    //Updates the date in the TextView
	private void updateDisplay() {
		textDate.setText(new StringBuilder()
		// Month is 0 based so add 1
		.append(mMonth + 1).append("/")
		.append(mDay).append("/")
		.append(mYear)
		);
	}
	
	//The callback received when the user "sets" the date in the pop-up dialog box
	private DatePickerDialog.OnDateSetListener mDateSetListener = new DatePickerDialog.OnDateSetListener() {
		@Override
		public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
			mYear = year;
			mMonth = monthOfYear;
			mDay = dayOfMonth;
			updateDisplay();
		}
	};
	
	protected Dialog onCreateDialog(int id) {
		switch(id) {
		case DATE_DIALOG_ID:
			return new DatePickerDialog(this, mDateSetListener, mYear, mMonth, mDay);
		}
		return null;
	}
	
	public void addTheShot(){
		if( myCounter < MAXIMUM ) {
			myCounter = myCounter + 1;
			txt_Shots.setText(String.valueOf(myCounter));
		}
	}

	public void btn_minusShot() {
		if( myCounter > MINIMUM ) {
			myCounter = myCounter - 1;
			txt_Shots.setText(String.valueOf(myCounter));
		}
	}
}