package com.hockey.fenimore;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.DialogInterface;
import android.database.sqlite.SQLiteException;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

public class Newgoalie extends Activity {
    /** Called when the activity is first created. */
	
	//Declare our Views, so we can access them and save to Database
    private EditText firstName;
    private EditText lastName;
	private Spinner ageSpinner;
    private ArrayAdapter<CharSequence> ageAdapter;
    private final Database db = new Database(this);    
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_newgoalie);
        
        firstName = (EditText)findViewById(R.id.firstName);
		lastName = (EditText)findViewById(R.id.lastName);
		
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
        
        final Spinner gloveSpinner = (Spinner)findViewById(R.id.gloveSpinner);
        gloveSpinner.setAdapter(gloveAdapter);
        
        //Button To Save New Goalie Data into SQLite
        Button saveUser = (Button)findViewById(R.id.btn_save);
        saveUser.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				String fname = firstName.getText().toString();
				String lname = lastName.getText().toString();
				long age = ageSpinner.getSelectedItemId();
				long glove = gloveSpinner.getSelectedItemId();
				
				db.open();
				try {
					db.insertNewGoalie(fname, lname, age, glove);
				} catch(SQLiteException e){
					
				} finally {
					db.close();
					showAlertDialog("New Goalie Added", "Click to Continue");
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

	protected void showAlertDialog(String myTitle, String myMessage) {
		AlertDialog.Builder alertDialog = new AlertDialog.Builder(this);
		alertDialog.setTitle(myTitle);
		alertDialog.setMessage(myMessage);
		alertDialog.setPositiveButton("OK", new DialogInterface.OnClickListener() {
			   public void onClick(DialogInterface dialog, int which) {
				   Intent okIntent = new Intent();
				   setResult(RESULT_OK, okIntent);
				   finish();
			   }
			});
		alertDialog.show();
	}
}
