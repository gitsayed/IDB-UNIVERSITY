
package org.idb.repository;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.idb.model.Application;
import org.idb.model.Payment;
import org.idb.model.Students;
import org.idb.model.Users;
import org.idb.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;





@Repository
@Transactional
public class StudentDao implements StudentService{

 @Autowired
 SessionFactory sessionFactory;
    
    

    
    @Override
    public List<Students> getMyprofile() {
        String sql;
        sql = "select s from Students s";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
          
        return query.list();

                                           }

    @Override
    public boolean getPayment(Payment payment) { 
    int i;       
     
    String a = new SimpleDateFormat("dd-MM-yyyy ").format(new Date());
     payment.setP_date(a);
     payment.setDue_amount(
             payment.getPayable_amount()
                     -payment.getPaying_amount());
        try{
            i = (int) sessionFactory.getCurrentSession().save(payment);
               }
     catch(HibernateException e){
      
         return false;
            
     }
               
               
    return (i > 0);
    }

    
    
    
    @Override
    public boolean submitApplication(Application application) { 
     String a = new SimpleDateFormat("dd-MM-yyyy ").format(new Date());
       application.setA_date(a);
        int i;
        try {
        i = (int) sessionFactory.getCurrentSession().save(application);
        
        } catch (HibernateException e) { 
            return false;
        }
        return (i>0);
    }

    @Override
    public List<Application> getApplictionList() { 
        String sql;
               sql="Select ap from Application ap";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
//        ArrayList<Application> list =  (ArrayList<Application>) query.list();
        
    return query.list();
    }


    
    @Override
    public void removeAppliction(int id) {
        String sql;
               sql="Delete from Application ap where ap.a_id="+id;
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        int   i     = query.executeUpdate();
    
    
    
    }

    @Override
    public List<Payment> getDuePaymentList(int id) {
    String sql;
               sql="Select pm from Payment pm where  pm.due_amount>0";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
         List<Payment> list = query.list(); 
        
      
    
    return list;
    }

    @Override
    public List<Payment> getStudentPaymentHistory(int id) {
      String sql;
        sql="Select pm from Payment pm ";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Payment> list = query.list(); 
        
    return list;
    
    }

    
    
    @Override
    public List<Payment> getStudentPaymentDueRecord(int id) {
      String sql;
        sql="Select pm from Payment pm where pm.serial_id="+id;
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Payment> list = query.list(); 
        
    return list;
    
    
    } 

    
    
    @Override
    public boolean updateStudentDuePayment(Payment pmt) {
    String a = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
    double b = pmt.getPayable_amount();
    double due = pmt.getDue_amount() - pmt.getPaying_amount();
    
    double paid = pmt.getPayable_amount()- due;
    
    pmt.setDue_amount(due);
    pmt.setPaying_amount(paid);
    pmt.setP_date(a);
    
    sessionFactory.getCurrentSession().merge(pmt);
        
        
        return true;
    }
    
    
   
  
    @Override
    public List<Students> getStudentDataById(Integer i) {
    String  sql= "from Students s where s.id="+i;
        
    Query query = sessionFactory.getCurrentSession().createQuery(sql);
        
    return  query.list();
    }

    @Override
    public boolean addStudentToUserTable(Users reg_data) {
    int id = reg_data.getRole_id();
    String email = reg_data.getEmail();
    List<Students> slist = getStudentDataById( id);
    Students s1 = slist.get(0);
    reg_data.setUsername(s1.getName());
    s1.setEmail(email);
    Object merge = sessionFactory.getCurrentSession().merge(s1);
        System.out.println(merge.toString());
    int i =(int) sessionFactory.getCurrentSession().save(reg_data);
    
    return (i>0);
    }
    
    
    
}
