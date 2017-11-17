package Entity;

public class Episode {
	
	//name of episode
	private String epname;
	
	//season of episode
	private String slabel;
	
	//length of episode
	private String elength;
	
	//picture of episode
	private String epthumb;
	
	//location of episode
	private String showfile;
	
	//tvshow that episode belongs to
	private int snumber;
	
	public Episode(String epname, String slabel, String elength, String epthumb, String showfile, int snumber) {
		this.epname = epname;
		this.slabel = slabel;
		this.elength = elength;
		this.epthumb = epthumb;
		this.showfile = showfile;
		this.snumber = snumber;
	}

	public Episode() {
	}

	public String getEpname() {
		return epname;
	}
	public void setEpname(String epname) {
		this.epname = epname;
	}
	public String getSlabel() {
		return slabel;
	}
	public void setSlabel(String slabel) {
		this.slabel = slabel;
	}
	public String getElength() {
		return elength;
	}
	public void setElength(String elength) {
		this.elength = elength;
	}
	public String getEpthumb() {
		return epthumb;
	}
	public void setEpthumb(String epthumb) {
		this.epthumb = epthumb;
	}
	public String getShowfile() {
		return showfile;
	}
	public void setShowfile(String showfile) {
		this.showfile = showfile;
	}

	public int getSnumber() {
		return snumber;
	}
	public void setSnumber(int snumber) {
		this.snumber = snumber;
	}
	
}

 