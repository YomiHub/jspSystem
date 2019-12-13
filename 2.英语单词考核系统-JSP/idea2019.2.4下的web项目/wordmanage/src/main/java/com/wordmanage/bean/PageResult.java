package com.wordmanage.bean;
import java.util.List;

public class PageResult {
    private List<?> list;
    private Long totalRecord;
    private Integer pageSize;
    private Integer currentPage;

    private Integer totalPages;
    /**
     *
     */
    private Integer beginIndex;
    /**
     *
     */
    private Integer endIndex;

    private Integer infoType;


    public Integer getInfoType() {
        return infoType;
    }

    public void setInfoType(Integer infoType) {
        this.infoType = infoType;
    }

    public PageResult(List<?> list, Long totalRecord, Integer pageSize, Integer currentPage) {
        this.list = list;
        this.totalRecord = totalRecord;
        this.pageSize = pageSize;
        this.currentPage = currentPage;

        //
        if(totalRecord.intValue() % pageSize==0) {
            this.totalPages = totalRecord.intValue() / pageSize;
        }else {
            this.totalPages = totalRecord.intValue() / pageSize +1;
        }

        //
        if(totalPages<=3) {
            this.beginIndex=1;
            this.endIndex = totalPages;
        }else {
            this.beginIndex = currentPage-1;
            this.endIndex = currentPage + 1;
            if(this.beginIndex<1) {
                this.beginIndex=1;
                this.endIndex = 3;
            }
            if(this.endIndex>totalPages) {
                this.endIndex=totalPages;
                this.beginIndex= totalPages-3;
            }
        }
    }

    public PageResult(List<?> list, Long totalRecord, Integer pageSize, Integer currentPage, Integer infoType) {
        this.list = list;
        this.totalRecord = totalRecord;
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.infoType = infoType;

        if(totalRecord.intValue() % pageSize==0) {
            this.totalPages = totalRecord.intValue() / pageSize;
        }else {
            this.totalPages = totalRecord.intValue() / pageSize +1;
        }

        if(totalPages<=3) {
            this.beginIndex=1;
            this.endIndex = totalPages;
        }else {
            this.beginIndex = currentPage-1;
            this.endIndex = currentPage + 1;
            if(this.beginIndex<1) {
                this.beginIndex=1;
                this.endIndex = 3;
            }
            if(this.endIndex>totalPages) {
                this.endIndex=totalPages;
                this.beginIndex= totalPages-3;
            }
        }
    }


    public List<?> getList() {
        return list;
    }


    public void setList(List<?> list) {
        this.list = list;
    }


    public Long getTotalRecord() {
        return totalRecord;
    }


    public void setTotalRecord(Long totalRecord) {
        this.totalRecord = totalRecord;
    }


    public Integer getPageSize() {
        return pageSize;
    }


    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }


    public Integer getCurrentPage() {
        return currentPage;
    }


    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }


    public Integer getTotalPages() {
        return totalPages;
    }


    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }


    public Integer getBeginIndex() {
        return beginIndex;
    }


    public void setBeginIndex(Integer beginIndex) {
        this.beginIndex = beginIndex;
    }


    public Integer getEndIndex() {
        return endIndex;
    }


    public void setEndIndex(Integer endIndex) {
        this.endIndex = endIndex;
    }

}



