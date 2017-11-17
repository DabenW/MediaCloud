package dbutil;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import Entity.Album;
import Entity.Episode;
import Entity.TVshow;
import Entity.Track;

/**
 * The embedded database creator is used to create
 * TV show table, album table, episode table, track
 * table and insert several initial data to display
 * our function.
 */
public class EmbeddedDbCreator {
	public void createDatabase(){
		createShowTable();
		createEpisodeTable();
		createAlbumTable();
		createTrackTable();
	}
	
	/**
	 * Create tvshow table and insert several original data
	 */
	private void createShowTable(){
		TVshow[] TVShows = {
				new TVshow("Butterfly","comedy", "HAOLIU", "ZhiWei", "Created by a very famous company", "tvshow\\Butterfly\\folder.jpg"),
				new TVshow("Cloudy","drama", "Ric", "Nick", "Good TV show , don't miss it .", "tvshow\\Cloudy\\folder.jpg"),
				new TVshow("Flash","fantasy","Richard","MM wu","this flash is very cool.","tvshow\\Flash\\folder.jpg")
		};
		
		//Get connection to database;
		Connection connection = new Dbutil().getConnection();
		try {
			  String tableName = "tvshow";
		      String format = "VARCHAR(100)";
		      //Create statement
			  Statement statement = connection.createStatement();
			  
			  //Create tvshow table
		      String tableDescription = String.format("CREATE TABLE %s" +"(id int not null generated always as identity (start with 1,increment by 1)," +
		      											"sname %s,genre %s, orig %s, prod %s, sdesc %s, sthumb %s)",
		    		  									tableName, format,format, format, format, format, format);
		      statement.execute(tableDescription);
		      
		      //Insert several data as original display
		      String template = String.format("INSERT INTO %s (sname,genre, orig, prod, sdesc, sthumb) VALUES(?, ?,?, ?, ?, ?)", tableName);
		      PreparedStatement inserter = connection.prepareStatement(template);
		      for(TVshow show: TVShows) {
		        inserter.setString(1, show.getSname());
		        inserter.setString(2, show.getGenre());
		        inserter.setString(3, show.getOrig());
		        inserter.setString(4, show.getProd());
		        inserter.setString(5, show.getSdesc());
		        inserter.setString(6, show.getSthumb());
		        inserter.executeUpdate();
		        System.out.printf("Inserted %s %s.%n", show.getSname(), show.getOrig());
		      }
		      
		      inserter.close();
		      connection.close();
		} catch (SQLException e) {
		}
	}
	
	/**
	 * Create episode table and insert several original data
	 */
	private void createEpisodeTable(){
		Episode[] episodes = {
				new Episode("Bird", "S3004", "00:02", "tvshow\\Butterfly\\Bird\\folder.jpg", "tvshow\\Butterfly\\Bird\\S3004-Bird.mp4", 1),
				new Episode("Bug", "S5001", "00:02", "tvshow\\Butterfly\\Bug\\folder.jpg", "tvshow\\Butterfly\\Bug\\S5001-Bug.mp4", 1),	
				new Episode("Happy", "S1004", "00:02", "tvshow\\Cloudy\\Happy\\folder.jpg", "tvshow\\Cloudy\\Happy\\S1004-Happy.mp4", 2)
		};
		
		//Get connection to database;
		Connection connection = new Dbutil().getConnection();
		try {
			  String tableName = "episode";
		      String format = "VARCHAR(100)";
		      //Create statement
			  Statement statement = connection.createStatement();
			  
			  //Create episode table
		      String tableDescription = String.format("CREATE TABLE %s" +"(id int not null generated always as identity (start with 1,increment by 1)," +
		      											" epname %s, slabel %s, elength %s, epthumb %s, showfile %s, snumber %s)",
		    		  									tableName, format, format, format, format, format, "int");
		      statement.execute(tableDescription);
		      
		      //Insert several data as original display
		      String template = String.format("INSERT INTO %s (epname, slabel, elength, epthumb, showfile, snumber) VALUES(?, ?, ?, ?, ?, ?)", tableName);
		      PreparedStatement inserter = connection.prepareStatement(template);
		      for(Episode episode: episodes) {
		        inserter.setString(1, episode.getEpname());
		        inserter.setString(2, episode.getSlabel());
		        inserter.setString(3, episode.getElength());
		        inserter.setString(4, episode.getEpthumb());
		        inserter.setString(5, episode.getShowfile());
		        inserter.setInt(6, episode.getSnumber());
		        inserter.executeUpdate();
		        System.out.printf("Inserted %s %s.%n", episode.getEpname(), episode.getSlabel());
		      }
		      
		      inserter.close();
		      connection.close();
		} catch (SQLException e) {
		}
	}
	
	/**
	 * Create album table and insert several original data
	 */
	private void createAlbumTable(){
		Album[] albums = {
				new Album("Flower", "Rap", "Lin", "The album is very powerful, which will stimulate us", "music\\Flower\\folder.jpg"),
				new Album("Love", "Pop", "Mike", "The song looks very good. It represents the singer's characteristics.", "music\\Love\\folder.jpg")
				
		};
		
		//Get connection to database;
		Connection connection = new Dbutil().getConnection();
		try {
			  String tableName = "album";
		      String format = "VARCHAR(100)";
		      //Create statement
			  Statement statement = connection.createStatement();
			  
			  //Create album table
		      String tableDescription = String.format("CREATE TABLE %s" +"(id int not null generated always as identity (start with 1,increment by 1)," +
		      											" aname %s, genre %s, singer %s, adesc %s, athumb %s)",
		    		  									tableName, format, format, format, format, format);
		      statement.execute(tableDescription);
		      
		      //Insert several data as original display
		      String template = String.format("INSERT INTO %s (aname, genre, singer, adesc, athumb) VALUES(?, ?, ?, ?, ?)", tableName);
		      PreparedStatement inserter = connection.prepareStatement(template);
		      for(Album album: albums) {
		        inserter.setString(1, album.getAname());
		        inserter.setString(2, album.getGenre());
		        inserter.setString(3, album.getSinger());
		        inserter.setString(4, album.getAdesc());
		        inserter.setString(5, album.getAthumb());
		        inserter.executeUpdate();
		        System.out.printf("Inserted %s %s.%n", album.getAname(), album.getGenre());
		      }
		      
		      inserter.close();
		      connection.close();
		} catch (SQLException e) {
		}
	}
	
	/**
	 * Create track table and insert several original data
	 */
	private void createTrackTable(){
		Track[] tracks = {
				new Track("One", "01", "00:04","music\\Flower\\One\\folder.jpg", "music\\Flower\\One\\01-One.mp3", 1),
				new Track("Two", "02", "00:04","music\\Flower\\Two\\folder.jpg", "music\\Flower\\Two\\02-Two.mp3", 1),
				new Track("Me", "02", "00:04","music\\Love\\Me\\folder.jpg", "music\\Love\\Me\\02-Me.mp3", 2),
		};
		
		//Get connection to database;
		Connection connection = new Dbutil().getConnection();
		try {
			  String tableName = "track";
		      String format = "VARCHAR(100)";
		      //Create statement
			  Statement statement = connection.createStatement();
			  
			  //Create track table
		      String tableDescription = String.format("CREATE TABLE %s" +"(id int not null generated always as identity (start with 1,increment by 1)," +
		      											" ttitle %s, tnumber %s, tduration %s,tthumb %s, musicfile %s, anumber %s)",
		    		  									tableName, format, format, format,format, format, "int");
		      statement.execute(tableDescription);
		      
		      //Insert several data as original display
		      String template = String.format("INSERT INTO %s (ttitle, tnumber, tduration,tthumb, musicfile, anumber) VALUES(?, ?, ?, ?,?, ?)", tableName);
		      PreparedStatement inserter = connection.prepareStatement(template);
		      for(Track track: tracks) {
		        inserter.setString(1, track.getTtitle());
		        inserter.setString(2, track.getTnumber());
		        inserter.setString(3, track.getTduration());
		        inserter.setString(4, track.getTthumb());
		        inserter.setString(5, track.getMusicfile());
		        inserter.setInt(6, track.getAnumber());
		        inserter.executeUpdate();
		        System.out.printf("Inserted %s %s.%n", track.getTtitle(), track.getTnumber());
		      }
		      
		      inserter.close();
		      connection.close();
		} catch (SQLException e) {
		}
	}
}
