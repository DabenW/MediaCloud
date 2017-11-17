package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dbutil.Dbutil;

/**
 * The class has several functions that provide query
 * service for different kinds of query statement.
 */
public class QueryService {
	private static Dbutil util = new Dbutil();
	
	/**
	 * Retrieve id and sname fields of all TV shows from tvshow table
	 * @return
	 */
	public static Map<Integer, String> queryShowList(){
		String query = String.format("SELECT id,sname FROM %s", "tvshow");
		
		ResultSet shows = util.query(query);
		Map<Integer, String> results = new HashMap<Integer, String>();
		try {
			while(shows.next()) {
			    results.put(shows.getInt("id"), shows.getString("sname"));
			}
			shows.close();
			util.releaseConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return results;
	}
	
	/**
	 * Retrieve id and aname of all albums from album table
	 * @return
	 */
	public static Map<Integer, String> queryAlbumList(){
		String query = String.format("SELECT id,aname FROM %s", "album");

		ResultSet albums = util.query(query);
		Map<Integer, String> results = new HashMap<Integer, String>();
		try {
			while(albums.next()) {
			    results.put(albums.getInt("id"), albums.getString("aname"));
			}
			albums.close();
			util.releaseConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return results;
	}
	
	/**
	 * Retrieve all TV shows' information from tvshow table
	 * @return
	 */
	public static List<String[]> queryShow(){
		String query = String.format("SELECT * FROM %s", "tvshow");
		
		ResultSet shows = util.query(query);
		List<String[]> results = new ArrayList<String[]>();
		try {
			while(shows.next()) {
			    String[] show = new String[7];
			    show[0] = shows.getString("sname");
			    show[1]=shows.getString("genre");
			    show[2] = shows.getString("orig");
			    show[3] = shows.getString("prod");
			    show[4] = shows.getString("sdesc");
			    show[5] = shows.getString("sthumb");
			    show[6] = shows.getString("id");
			    
			    results.add(show);
			}
			shows.close();
			util.releaseConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return results;
	}
	
	/**
	 * Retrieve all albums' information from album table
	 * @return
	 */
	public static List<String[]> queryAlbum(){
		String query = String.format("SELECT * FROM %s", "album");
		
		ResultSet albums = util.query(query);
		List<String[]> results = new ArrayList<String[]>();
		try {
			while(albums.next()) {
			    String[] show = new String[6];
			    
			    show[0] = albums.getString("aname");
			    show[1] = albums.getString("genre");
			    show[2] = albums.getString("singer");
			    show[3] = albums.getString("adesc");
			    show[4] = albums.getString("athumb");
			    show[5] = albums.getString("id");
			    results.add(show);
			}
			albums.close();
			util.releaseConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return results;
	}
	
	/**
	 * Retrieve specific TV show information, query by show's id
	 * @param id
	 * @return
	 */
	public static String[] queryShowByID(int id){
		String query = String.format("SELECT * FROM %s where id="+id, "tvshow");
		
		ResultSet show = util.query(query);
		String[] result = new String[7];
		try {
			while(show.next()) {
				result[0] = show.getString("sname");
				result[1] = show.getString("genre");
				result[2] = show.getString("orig");
				result[3] = show.getString("prod");
				result[4] = show.getString("sdesc");
				result[5] = show.getString("sthumb");
				result[6] = show.getString("id");
			}
			show.close();
			util.releaseConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * Retrieve all episodes' information of specific TV show's id
	 * @param snumber
	 * @return
	 */
	public static List<String[]> queryEpisode(int snumber){
		String query = String.format("SELECT * FROM %s where snumber="+snumber, "episode");
		
		ResultSet episodes = util.query(query);
		List<String[]> results = new ArrayList<String[]>();
		try {
			while(episodes.next()) {
				String[] show = new String[5];
			    show[0] = episodes.getString("epname");
			    show[1] = episodes.getString("slabel");
			    show[2] = episodes.getString("elength");
			    show[3] = episodes.getString("epthumb");
			    show[4] = episodes.getString("showfile");
			    
			    results.add(show);
			}
			episodes.close();
			util.releaseConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return results;
	}
	
	/**
	 * Retrieve specific album information, query by album's id
	 * @param id
	 * @return
	 */
	public static String[] queryAlbumByID(int id){
		String query = String.format("SELECT * FROM %s where id="+id, "album");
		
		ResultSet album = util.query(query);
		String[] result = new String[6];
		try {
			while(album.next()) {
				result[0] = album.getString("aname");
				result[1] = album.getString("genre");
				result[2] = album.getString("singer");
				result[3] = album.getString("adesc");
				result[4] = album.getString("athumb");
				result[5] = album.getString("id");
			}
			album.close();
			util.releaseConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * Retrieve all tracks' information of specific album's id
	 * @param anumber
	 * @return
	 */
	public static List<String[]> queryTrack(int anumber){
		String query = String.format("SELECT * FROM %s where anumber="+anumber, "track");
		
		ResultSet tracks = util.query(query);
		List<String[]> results = new ArrayList<String[]>();
		try {
			while(tracks.next()) {
				String[] show = new String[5];
			    show[0] = tracks.getString("ttitle");
			    show[1] = tracks.getString("tnumber");
			    show[2] = tracks.getString("tduration");
			    show[3] = tracks.getString("tthumb");
			    show[4] = tracks.getString("musicfile");
			    
			    results.add(show);
			}
			tracks.close();
			util.releaseConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return results;
	}
}