package Entity;

public class Album {

	//name of album
	private String aname;
	
	//genre of album
	private String genre;
	
	//singer of this album
	private String singer;
	
	//description of album
	private String adesc;
	
	//picture of album
	private String athumb;
	
	public Album(String aname, String genre, String singer, String adesc, String athumb) {
		super();
		this.aname = aname;
		this.genre = genre;
		this.singer = singer;
		this.adesc = adesc;
		this.athumb = athumb;
	}
	
	public Album() {
	}
	
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getAdesc() {
		return adesc;
	}
	public void setAdesc(String adesc) {
		this.adesc = adesc;
	}
	public String getAthumb() {
		return athumb;
	}
	public void setAthumb(String athumb) {
		this.athumb = athumb;
	}
}
