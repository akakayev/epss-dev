package com.epss.service;

import com.epss.dao.GroupDao;
import com.epss.dao.StudentDao;
import com.epss.dao.UserDao;
import com.epss.dto.StudentRegistrationDto;
import com.epss.model.Group;
import com.epss.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService{

    @Autowired
    private StudentDao studentDao;
    @Autowired
    private GroupDao groupDao;

    @Autowired
    private UserService userService;

    @Override
    public void saveStudent(StudentRegistrationDto studentDto) {
        int recordBookNumber=studentDto.getRecordBookNumber();
        String login=studentDto.getUser().getLogin();
        System.out.println(login);
        if(canAddStudent(login,recordBookNumber)){
            userService.saveUser(studentDto.getUser());
            int userId=userService.findByLogin(login).getId();
            System.out.println(userId);
            Student stusent= new Student(studentDto);
            stusent.setUserId(userId);
            studentDao.saveStudent(stusent);
        }
    }

    @Override
    public List<Group> getGroupList() {
        return groupDao.getGroupList();
    }

    private boolean canAddStudent(String login, int recordBookNumber) {
        return userService.isLoginExists(login)&&studentDao.getStudentByRecordBook(recordBookNumber)==null;
    }
}
