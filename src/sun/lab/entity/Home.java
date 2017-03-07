package sun.lab.entity;

public class Home {
    private Integer id;

    private String keywords;

    private String description;

    private String banner;

    private String copyright;

    private String interests;

    private String album;

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    public String getInterests() {
        return interests;
    }

    public void setInterests(String interests) {
        this.interests = interests;
    }

    @Override
    public String toString() {
        return "Home{" +
                "id=" + id +
                ", keywords='" + keywords + '\'' +
                ", description='" + description + '\'' +
                ", banner='" + banner + '\'' +
                ", copyright='" + copyright + '\'' +
                ", interests='" + interests + '\'' +
                ", album='" + album + '\'' +
                '}';
    }
}