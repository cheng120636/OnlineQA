package com.bdqn.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * Created by Administrator on 2018/3/12.
 */
public class Questions {
    private int id;
    private String title,detailDesc;
    private int answerCount;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date lastModified;
    private User user;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public int getAnswerCount() {
        return answerCount;
    }

    public void setAnswerCount(int answerCount) {
        this.answerCount = answerCount;
    }

    public Date getLastModified() {
        return lastModified;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Questions{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", detailDesc='" + detailDesc + '\'' +
                ", answerCount=" + answerCount +
                ", lastModified=" + lastModified +
                ", user=" + user +
                '}';
    }

    public Questions(int id, String title, String detailDesc, int answerCount, Date lastModified, User user) {
        this.id = id;
        this.title = title;
        this.detailDesc = detailDesc;
        this.answerCount = answerCount;
        this.lastModified = lastModified;
        this.user = user;
    }

    public Questions() {
    }
}
