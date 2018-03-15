package com.bdqn.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/3/12.
 */
public class Answers {
    private int id;
    private String ansContent;
    private Date ansDate;
    private Questions questions;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAnsContent() {
        return ansContent;
    }

    public void setAnsContent(String ansContent) {
        this.ansContent = ansContent;
    }

    public Date getAnsDate() {
        return ansDate;
    }

    public void setAnsDate(Date ansDate) {
        this.ansDate = ansDate;
    }

    public Questions getQuestions() {
        return questions;
    }

    public void setQuestions(Questions questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "Answers{" +
                "id=" + id +
                ", ansContent='" + ansContent + '\'' +
                ", ansDate=" + ansDate +
                ", questions=" + questions +
                '}';
    }

    public Answers(int id, String ansContent, Date ansDate, Questions questions) {
        this.id = id;
        this.ansContent = ansContent;
        this.ansDate = ansDate;
        this.questions = questions;
    }

    public Answers() {

    }
}
