
package org.idb.service;

import java.util.List;
import org.idb.model.Admin;
import org.idb.model.Payment;
import org.idb.model.Users;
import org.springframework.stereotype.Service;

@Service
public interface AdminService { 

    public Admin getAdminDataById(Integer i);

    public boolean addAdminToUserTable(Users reg_data);

    public void updateUsers(Users user);

    public void updateAdmin(Admin admin);

    public List<Admin> getAdminList();

    public List<Users> getUsersList();

    public Admin addAdminToDB(Admin admin1);

    public void deleteUserById(int delete_id);

    public void deleteAdminById(int delete_id);

    public List<Payment> getPaymentsHistory();

    public List<Payment> getDueAmountListById(int id);

    public Payment getPaymentDueRecordBySerialId(int serial_id);

    public boolean updateDuePayment(Payment dupmt);

    public boolean addPaymentToDB(Payment pmt);
    
}
