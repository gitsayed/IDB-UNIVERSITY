
package org.idb.service;

import java.util.ArrayList;
import java.util.List;
import org.idb.model.Application;
import org.idb.model.Payment;
import org.idb.model.Students;
import org.idb.model.Users;


import org.springframework.stereotype.Service;

@Service
public interface StudentService {

 

  public List<Students> getMyprofile();
    
  public boolean getPayment(Payment payment) ;

  public boolean submitApplication(Application application);

  public List<Application> getApplictionList();

  public void removeAppliction(int id);

  public List<Payment> getDuePaymentList(int id);

  public List<Payment> getStudentPaymentHistory(int id);

  public List<Payment> getStudentPaymentDueRecord(int id);

    public boolean updateStudentDuePayment(Payment payment);

    public List<Students> getStudentDataById(Integer i);

    public boolean addStudentToUserTable(Users reg_data);

   


}