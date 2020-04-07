

package org.idb.service;

import org.idb.model.Users;
import org.springframework.stereotype.Service;

@Service
public interface HomeService {
    
    public Users getUserByEmail(String email);

    public Users getUserById(int user_id);

    public Users getUserByRoleId(Integer id);
    
}
