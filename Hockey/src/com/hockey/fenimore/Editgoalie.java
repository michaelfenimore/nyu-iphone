package com.hockey.fenimore;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

public class Editgoalie extends Activity {
    /** Called when the activity is first created. */
	
	//Declare our Views, so we can access them and save to Database
    private EditText firstName;
    private EditText lastName;
    private Spinner ageSpinner;
    private Spinner goalieSpinner;
    private Spinner gloveSpinner;
    private ArrayAdapter<CharSequence> ageAdapter;
    private ArrayAdapter<CharSequence> goalieAdapter;
    private int goalieSelected;
    private int[] goalieIDs;
    private final Database db = new Database(this); 
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_editgoalie);
        
        firstName = (EditText)findViewById(R.id.firstName);
		lastName = (EditText)findViewById(R.id.lastName);
		
		//This prepares the Goalie Spinner
		goalieSpinner = (Spinner)findViewById(R.id.spinner_SelectGoalie);
		goalieAdapter = new ArrayAdapter<CharSequence>(this, android.R.layout.simple_spinner_item);
		goalieAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		goalieSpinner.setAdapter(goalieAdapter);
		
		//Retrieve all basic Goalie info from the DB
		db.open();
		final Cursor myGoaliesCursor = db.getAllGoalies();
		goalieIDs = new int[myGoaliesCursor.getCount()]; //Creates and Defines the size of the array to hold database "_id" column
		
		//Move to the first item in the Cursor and loops through the list of goalies. Builds this Spinner.
		if(myGoaliesCursor.moveToFirst()) {
			do {
				goalieIDs[myGoaliesCursor.getPosition()] = myGoaliesCursor.getInt(0);
				goalieAdapter.add(myGoaliesCursor.getString(1) + " " + myGoaliesCursor.getString(2));
			} while (myGoaliesCursor.moveToNext());
		}
		myGoaliesCursor.close();
		db.close();
		
		//Once a goalie is selected update the fields on the page
		goalieSpinner.setOnItemSelectedListener(new OnItemSelectedListener() {

			@Override
			public void onItemSelected(AdapterView<?> parent, View v, int pos, long id) {
				goalieSelected = goalieIDs[(int) parent.getItemIdAtPosition(pos)];
				Log.d("Fenimore", "Dataabse ID: " + goalieSelected);
				//Retrieve a single goalies information
				db.open();
					Cursor mySingleGoalie = db.getOneGoalie(goalieSelected);
					firstName.setText(mySingleGoalie.getString(1));
					lastName.setText(mySingleGoalie.getString(2));
					ageSpinner.setSelection(mySingleGoalie.getInt(3));
					gloveSpinner.setSelection(mySingleGoalie.getInt(4));
					mySingleGoalie.close();
				db.close();
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
				// Auto-generated method stub
			}
		});
		
		//This populates the Age Spinner Programmatically
        ageSpinner = (Spinner)findViewById(R.id.ageSpinner);
        ageAdapter = new ArrayAdapter<CharSequence>(this, android.R.layout.simple_spinner_item);
        ageAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        ageSpinner.setAdapter(ageAdapter);
        
        String[] userAge = new String[61];
        
        for (int  i=5; i < userAge.length; i++) {
			userAge[i] = Integer.toString(i);
        	ageAdapter.add(userAge[i]);
        }
        
        //Glove Selection
        ArrayAdapter<CharSequence> gloveAdapter = ArrayAdapter.createFromResource(
        		this, R.array.catch_array, android.R.layout.simple_spinner_item);
        gloveAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
        
        gloveSpinner = (Spinner)findViewById(R.id.gloveSpinner);
        gloveSpinner.setAdapter(gloveAdapter);
        
        //Button To Save New Goalie Data into SQLite
        Button saveUser = (Button)findViewById(R.id.btn_save);
        saveUser.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				String fname = firstName.getText().toString();
				String lname = lastName.getText().toString();
				int Age = (int) ageSpinner.getSelectedItemId();
				int Glove = (int) gloveSpinner.getSelectedItemId();
				
				if (fname.length() >= 1 && lname.length() > 1) {
					db.open();
					db.updateGoalie(goalieSelected, fname, lname, Age, Glove);
					db.close();
					showGoodAlertBox("Goalie Updated", "Click to Continue");
				} else {
					showBadAlertBox("Dunlop, you suck ...", "Enter a valid First Name and Last Name");
				}
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
    
    protected void showBadAlertBox(String myTitle, String myMessage) {
        new AlertDialog.Builder(this)
        .setTitle(myTitle)
        .setMessage(myMessage)
        .setCancelable(true)
        .setNeutralButton(android.R.string.ok,
        		new DialogInterface.OnClickListener() {
        			public void onClick(DialogInterface dialog, int whichButton){}
        		})
        .show();
        }
    
    protected void showGoodAlertBox(String myTitle, String myMessage) {
        new AlertDialog.Builder(this)
        .setTitle(myTitle)
        .setMessage(myMessage)
        .setCancelable(true)
        .setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
			   public void onClick(DialogInterface dialog, int whichButton) {
				   Intent okIntent = new Intent();
				   setResult(RESULT_OK, okIntent);
				   finish();
			   }
			})
		.show();
        }
}