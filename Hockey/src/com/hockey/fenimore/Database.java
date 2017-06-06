package com.hockey.fenimore;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class Database {
	public static final String KEY_ROWID = "_id";
	public static final String KEY_FNAME = "fname";
	public static final String KEY_LNAME = "lname";
	public static final String KEY_AGE = "age";
	public static final String KEY_GLOVE = "catches";
	
	private static final String DATABASE_NAME = "GoalieStats";
	private static final String DATABASE_TABLE = "Goalies";
	private static final int DATABASE_VERSION = 3;
	
	private static final String DATABASE_CREATEGOALIE = 
		"Create table Goalies(_id integer primary key autoincrement," +
		"fname text not null," +
		"lname text not null," +
		"age long not null," +
		"catches long not null);";
	
	private static final String DATABASE_CREATESTATS = 
		"Create table GoalieStats(_id integer primary key autoincrement," +
		"stats_id REFERENCES Goalies(_id)," +
		"kindofGoal text," +
		"teamStrength text" +
		"goalLocation text" +
		"goaliePosition text" +
		"timeStamp text);";
	
	private static final String DATABASE_CREATEGAME = 
		"Create table GameStats(_id integer primary key autoincrement," + 
		"game_id REFERENCES Goalies(_id)," +
		"period text," +
		"shot text" +
		"timeStamp text);";
	
	private final Context context;
	
	private DatabaseHelper DBHelper;
	private SQLiteDatabase db;
	
	public Database(Context ctx) {
		this.context = ctx;
		DBHelper = new DatabaseHelper(context);
	}
	
	private static class DatabaseHelper extends SQLiteOpenHelper {
		DatabaseHelper(Context context) {
			super(context, DATABASE_NAME, null, DATABASE_VERSION);
		}
		
		@Override
		public void onCreate(SQLiteDatabase db) {
			db.execSQL(DATABASE_CREATEGOALIE);
			db.execSQL(DATABASE_CREATESTATS);
			db.execSQL(DATABASE_CREATEGAME);
		}
		
		@Override
		public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
			//Log.w(TAG, "Upgrading database from version " + oldVersion + " to " + newVersion + ", destroying all data");
			//db.execSQL("DROP table if exists Goalies");
			onCreate(db);
		}
	}
	
	// Opens the Database
	public Database open() throws SQLException {
		db = DBHelper.getWritableDatabase();
		return this;
	}
	
	// Closes the Database
	public void close() {
		DBHelper.close();
	}
	
	// Inserts New Goalie into the Database
	public long insertNewGoalie(String fname, String lname, long age, long catches) {
		ContentValues initialValues = new ContentValues();
		initialValues.put(KEY_FNAME, fname);
		initialValues.put(KEY_LNAME, lname);
		initialValues.put(KEY_AGE, age);
		initialValues.put(KEY_GLOVE, catches);
		return db.insert(DATABASE_TABLE, null, initialValues);
	}
	
	// Delete a Goalie form the Database
	public boolean deleteGoalie(long rowID) {
		return db.delete(DATABASE_TABLE, KEY_ROWID + "=" + rowID, null) > 0;
	}
	
	// Gets all Goalies in the Database ordered by Last Name
	public Cursor getAllGoalies() {
		return db.query(DATABASE_TABLE, new String[] {
				KEY_ROWID,
				KEY_FNAME,
				KEY_LNAME}, null, null, null, null, KEY_LNAME);
	}
	
	//Get a Specific Goalie
	public Cursor getOneGoalie(int rowID) throws SQLException {
		Cursor myCursor = db.query(true, DATABASE_TABLE, new String[] {
				KEY_ROWID,
				KEY_FNAME,
				KEY_LNAME,
				KEY_AGE,
				KEY_GLOVE}, KEY_ROWID + "=" + rowID, null, null, null, null, null);
		if (myCursor != null) {
			myCursor.moveToFirst();
		}
		return myCursor;
	}

	//Updates a Goalie
	public boolean updateGoalie(long rowID, String fname, String lname, int Age, int Glove) {
		ContentValues args = new ContentValues();
		args.put(KEY_FNAME, fname);
		args.put(KEY_LNAME, lname);
		args.put(KEY_AGE, Age);
		args.put(KEY_GLOVE, Glove);
		return db.update(DATABASE_TABLE, args, KEY_ROWID + "=" + rowID, null) > 0;
	}
}
