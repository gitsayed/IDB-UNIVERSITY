package org.idb.repository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.idb.model.Admin;
import org.idb.model.Payment;
import org.idb.model.Students;
import org.idb.model.Users;
import org.idb.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AdminDao implements AdminService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public Admin getAdminDataById(Integer i) {
        String sql = "from Admin a where a.id=" + i;
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        List<Admin> admList = query.list();
        Admin adm = admList.get(0);
        return adm;
    }

    @Override
    public boolean addAdminToUserTable(Users reg_data) {
        int id = reg_data.getRole_id();
        String email = reg_data.getEmail();
        Admin adm = getAdminDataById(id);
        reg_data.setUsername(adm.getName());
        adm.setEmail(email);
        Object merge = sessionFactory.getCurrentSession().merge(adm);
        System.out.println(merge.toString());
        int i = (int) sessionFactory.getCurrentSession().save(reg_data);

        return (i > 0);
    }

    @Override
    public void updateUsers(Users user) {
        boolean b = true;
        Object merge = sessionFactory.getCurrentSession().merge(user);
        System.out.println(merge.toString());

    }

    @Override
    public void updateAdmin(Admin admin) {

        sessionFactory.getCurrentSession().merge(admin);
    }

    @Override
    public List<Admin> getAdminList() {

        String sql = "from Admin a";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);

        return query.list();

    }

    @Override
    public List<Users> getUsersList() {
        String sql = "from Users u";
        Query query = sessionFactory.getCurrentSession().createQuery(sql);

        return query.list();

    }

    @Override
    public Admin addAdminToDB(Admin admin1) {

        Admin admin = (Admin) sessionFactory.getCurrentSession().merge(admin1);
        return admin;
    }

    @Override
    public void deleteUserById(int delete_id) {

        String sql = "delete from Users u where u.id=" + delete_id;

        int i = sessionFactory.getCurrentSession().createQuery(sql).executeUpdate();

    }

    @Override
    public void deleteAdminById(int delete_id) {
        String sql = "delete from Admin a where a.id=" + delete_id;

        int i = sessionFactory.getCurrentSession().createQuery(sql).executeUpdate();

    }

    @Override
    public List<Payment> getPaymentsHistory() {
        String sql = "from Payment p";
        return sessionFactory.getCurrentSession().createQuery(sql).list();
    }

    @Override
    public List<Payment> getDueAmountListById(int id) {

        String sql = "Select pm from Payment pm where  pm.due_amount>0 and pm.student_id=" + id;

        return sessionFactory.getCurrentSession().createQuery(sql).list();
    }

    @Override
    public Payment getPaymentDueRecordBySerialId(int serial_id) {

        String sql;
        sql = "Select pm from Payment pm where pm.serial_id=" + serial_id;
        return (Payment) sessionFactory.getCurrentSession().createQuery(sql).list().get(0);

    }

    @Override
    public boolean updateDuePayment(Payment pmt) {

        String a = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        double b = pmt.getPayable_amount();
        double due = pmt.getDue_amount() - pmt.getPaying_amount();

        double paid = pmt.getPayable_amount() - due;

        pmt.setDue_amount(due);
        pmt.setPaying_amount(paid);
        pmt.setP_date(a);

        Payment pm = (Payment) sessionFactory.getCurrentSession().merge(pmt);

        return (pm.getSerial_id() > 0);

    }

    @Override
    public boolean addPaymentToDB(Payment payment) {

        int i;

        String a = new SimpleDateFormat("dd-MM-yyyy ").format(new Date());
        payment.setP_date(a);
        payment.setDue_amount(
                payment.getPayable_amount()
                - payment.getPaying_amount());
        try {
            i = (int) sessionFactory.getCurrentSession().save(payment);
        } catch (HibernateException e) {

            return false;

        }

        return (i > 0);
    }

}
