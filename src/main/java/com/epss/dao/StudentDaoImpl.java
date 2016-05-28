package com.epss.dao;

import com.epss.model.Student;
import com.epss.model.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("studentDao")
public class StudentDaoImpl extends AbstractDao<Integer,Student> implements StudentDao{

    static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    @Override
    public void saveStudent(Student student) {
        persist(student);
    }

    @Override
    public Student getStudentByRecordBook(int number) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("recordBookNumber", number));
        Student student = (Student) crit.uniqueResult();
        return student;
    }
}
