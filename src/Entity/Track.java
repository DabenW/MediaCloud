package Entity;

public class Track {

	//name of track
	private String ttitle;
	
	//id number of track
	private String tnumber;
	
	//duration of track
	private String tduration;
	
	private String tthumb;
	
	//location of track
	private String musicfile;
	
	//album that track belongs to
	private int anumber;
	
	public Track(String ttitle, String tnumber, String tduration,String tthumb, String musicfile, int anumber) {
		this.ttitle = ttitle;
		this.tnumber = tnumber;
		this.tduration = tduration;
		this.tthumb=tthumb;
		this.musicfile = musicfile;
		this.anumber = anumber;
	}

	public Track() {
	}
	
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public String getTnumber() {
		return tnumber;
	}
	public void setTnumber(String tnumber) {
		this.tnumber = tnumber;
	}
	public String getTduration() {
		return tduration;
	}
	public void setTduration(String tduration) {
		this.tduration = tduration;
	}
	public String getTthumb() {
		return tthumb;
	}
	public void setTthumb(String tthumb) {
		this.tthumb = tthumb;
	}
	public String getMusicfile() {
		return musicfile;
	}
	public void setMusicfile(String musicfile) {
		this.musicfile = musicfile;
	}
	public int getAnumber() {
		return anumber;
	}
	public void setAnumber(int anumber) {
		this.anumber = anumber;
	}
}