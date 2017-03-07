package sun.lab.entity;

public class Publications {
    private Integer id;

    private String title;

    private String year;

    private String file;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "Publications{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", year=" + year +
                ", file='" + file + '\'' +
                '}';
    }
}