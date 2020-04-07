
package org.idb.service;

import java.util.List;
import org.idb.model.Students;
import org.idb.model.Teacher;
import org.idb.model.Users;
import org.springframework.stereotype.Service;

@Service
public interface TeacherService {

    public Teacher getTeacherDataById(Integer i);

    public boolean addTeacherToUserTable(Users reg_data);
    
}
