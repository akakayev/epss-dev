package com.epss.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "STUDENTS")
public class Student implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @Column(name = "RECORD_BOOK_NUMBER", nullable = false)
    private Integer recordBookNumber;

    @NotNull
    @Column(name = "SEMESTER", nullable = false)
    private Byte semester;

    //    @NotNull
//    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//    @JoinTable(name = "USERS",
//            joinColumns = { @JoinColumn(name = "USER_ID",referencedColumnName = "ID") })
//    private User user;
    //join
    @NotNull
    @Column(name = "GROUP_ID", nullable = false)
    private Integer group;
    @NotNull
    @Column(name = "USER_ID", nullable = false)
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGroup() {
        return group;
    }

    public void setGroup(Integer group) {
        this.group = group;
    }

    public Integer getRecordBookNumber() {
        return recordBookNumber;
    }

    public void setRecordBookNumber(Integer recordBookNumber) {
        this.recordBookNumber = recordBookNumber;
    }

    public Byte getSemester() {
        return semester;
    }

    public void setSemester(Byte semester) {
        this.semester = semester;
    }

//    public User getUser() {
//        return user;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }

//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (!(o instanceof Student)) return false;
//
//        Student student = (Student) o;
//
//        if (id != null ? !id.equals(student.id) : student.id != null) return false;
//        if (recordBookNumber != null ? !recordBookNumber.equals(student.recordBookNumber) : student.recordBookNumber != null)
//            return false;
//        if (semester != null ? !semester.equals(student.semester) : student.semester != null) return false;
//        if (user != null ? !user.equals(student.user) : student.user != null) return false;
//        return group != null ? group.equals(student.group) : student.group == null;
//
//    }

//    @Override
//    public int hashCode() {
//        int result = id != null ? id.hashCode() : 0;
//        result = 31 * result + (recordBookNumber != null ? recordBookNumber.hashCode() : 0);
//        result = 31 * result + (semester != null ? semester.hashCode() : 0);
//        result = 31 * result + (user != null ? user.hashCode() : 0);
//        result = 31 * result + (group != null ? group.hashCode() : 0);
//        return result;
//    }
//
//    @Override
//    public String toString() {
//        return "Student{" +
//                "id=" + id +
//                ", recordBookNumber=" + recordBookNumber +
//                ", semester=" + semester +
//                ", user=" + user +
//                ", group=" + group +
//                '}';
//    }
}
