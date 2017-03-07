package sun.lab.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
public class Page<T> implements Serializable {

    private static final long serialVersionUID = -8275962264922278954L;

    private Integer pageIndex;

    private Integer pageSize;//每页多少条

    private Integer totalRecord;

    private Integer totalPage;

    private List<T> list;

    private String category;

    private Integer start;//起始页

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {
        this.totalRecord = totalRecord;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getStart() {
        this.start=(pageIndex-1)*pageSize;
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageIndex=" + pageIndex +
                ", pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", totalPage=" + totalPage +
                ", list=" + list +
                ", category='" + category + '\'' +
                ", start=" + start +
                '}';
    }
}
