package org.idb.controller;

import java.util.Arrays;
import java.util.List;
import org.idb.model.Admin;
import org.idb.model.Payment;
import org.idb.model.Users;
import org.idb.service.AdminService;
import org.idb.service.HomeService;
import org.idb.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/adm")
public class AdminController {

    @Autowired
    AdminService admService;
    @Autowired
    HomeService homeService;
    @Autowired
    StudentService stuService;

    @RequestMapping("/viewprofile/{user_id}/{role_id}")
    public ModelAndView admProfile(
            @PathVariable("user_id") int user_id,
            @PathVariable("role_id") int role_id
    //   @ModelAttribute("user") Users u2
    ) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
//   if(u2 != null){
//   
//       System.out.println(" Model Attribute found !");
//       System.out.println("Model Attribute username = "+u2.getUsername());
//   }
        Users user = homeService.getUserById(user_id);
        Admin admProfile = admService.getAdminDataById(role_id);
        System.out.println("Admin user_id=" + user_id);
        System.out.println("Admin role_id=" + role_id);

        System.out.println("");
//      List<Users> usList = homeService
        mv.addObject("user", user);
        mv.addObject("admp", admProfile);
        mv.addObject("userClickAdminProfile", true);
//        System.out.println(Arrays.asList(user));

        return mv;
    }

    @RequestMapping("/gotoupdateuser/{user_id}")
    public ModelAndView admProfile(@PathVariable int user_id) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
        mv.addObject("gotoupdateuser", true);
        Users user = homeService.getUserById(user_id);
        mv.addObject("user", user);
        mv.addObject("users", new Users());

        return mv;
    }

    @RequestMapping(value = "/updateuser", method = RequestMethod.POST)
    public ModelAndView updateUser(@ModelAttribute("users") Users user) {
        admService.updateUsers(user);
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
        Admin admin = admService.getAdminDataById(user.getRole_id());

        mv.addObject("user", user);
        mv.addObject("admp", admin);
        mv.addObject("userClickAdminProfile", true);

        return mv;
    }

    @RequestMapping("/gotoupdateadmin/{user_id}")
    public ModelAndView admProfile3(
            @PathVariable int user_id) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
        mv.addObject("gotoupdateadmin", true);
        Users user = homeService.getUserById(user_id);
        Admin admin = admService.getAdminDataById(user.getRole_id());
        mv.addObject("user", user);
        mv.addObject("admp", admin);
        mv.addObject("users", new Users());
        mv.addObject("admin", new Admin());

        return mv;
    }

    @RequestMapping(value = "/updateadmin/{user_id}", method = RequestMethod.POST)
    public ModelAndView upadteAdmin(
            @ModelAttribute("admin") Admin admin,
            @PathVariable("user_id") int id
    ) {

//         admin.setBirth_date(admin.getBirth_date().toLowerCase());
        admService.updateAdmin(admin);
        Users user1 = homeService.getUserById(id);
        user1.setEmail(admin.getEmail());
        admService.updateUsers(user1);
        Users user = homeService.getUserById(id);
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
        Admin admp = admService.getAdminDataById(user.getRole_id());

        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("userClickAdminProfile", true);

        return mv;
    }

    @RequestMapping(value = "/viewalladmin/{user_id}")
    public ModelAndView viewAllAdmin(
            @PathVariable("user_id") int id
    ) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        Users user = homeService.getUserById(id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        List<Admin> aList = admService.getAdminList();
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("aList", aList);

        mv.addObject("viewAllAdmin", true);

        return mv;
    }

    @RequestMapping(value = "/viewallusers/{user_id}")
    public ModelAndView viewAllUsers(
            @PathVariable("user_id") int id
    ) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        Users user = homeService.getUserById(id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        List<Users> uList = admService.getUsersList();
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("uList", uList);

        mv.addObject("viewAllUsers", true);

        return mv;
    }

    @RequestMapping("/gotoaddadmin/{user_id}")
    public ModelAndView gotoAddAdmin(
            @PathVariable int user_id) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
        mv.addObject("gotoAddAdmin", true);
        Users user = homeService.getUserById(user_id);
        Admin admin = admService.getAdminDataById(user.getRole_id());
        mv.addObject("user", user);
        mv.addObject("admp", admin);
        mv.addObject("users", new Users());
        mv.addObject("admin", new Admin());

        return mv;
    }

    @RequestMapping("/addadmin/{user_id}")
    public ModelAndView addAdminToDB(
            @ModelAttribute("admin") Admin admin1,
            @PathVariable int user_id) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        Admin status = admService.addAdminToDB(admin1);
        String message;
        if (status.getId() > 0) {
            message = "Add Admin was successful.";
        } else {
            message = "Add Admin was failure";
        }

        mv.addObject("AddAdminSuccess", true);
        mv.addObject("status", status.toString());
        mv.addObject("message", message);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("users", new Users());
        mv.addObject("admin", new Admin());

        return mv;
    }

    @RequestMapping("/deleteuser/{user_id}/{delete_id}")
    public ModelAndView deleteUser(
            @PathVariable int user_id,
            @PathVariable int delete_id) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        admService.deleteUserById(delete_id);
        List<Users> uList = admService.getUsersList();
        mv.addObject("viewAllUsers", true);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("uList", uList);
        return mv;
    }

    @RequestMapping("/gotoupdateadmin/{user_id}/{update_id}")
    public ModelAndView updateAnAdmin(
            @PathVariable int user_id,
            @PathVariable int update_id) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        Admin uadm = admService.getAdminDataById(update_id);

        mv.addObject("adminUpdateForm", true);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("uadm", uadm);
        mv.addObject("admin", new Admin());
        return mv;
    }

    @RequestMapping(value = "/updateAlladmin/{user_id}", method = RequestMethod.POST)
    public ModelAndView updateAlladmin(
            @ModelAttribute("admin") Admin admin,
            @PathVariable int user_id) {

        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        admService.updateAdmin(admin);
        Users user1 = homeService.getUserByRoleId(admin.getId());
        user1.setEmail(admin.getEmail());
        admService.updateUsers(user1);
        List<Admin> aList = admService.getAdminList();
        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        mv.addObject("aList", aList);

        mv.addObject("viewAllAdmin", true);
        mv.addObject("user", user);
        mv.addObject("admp", admp);

        return mv;

    }

    @RequestMapping("/deleteadmin/{user_id}/{delete_id}")
    public ModelAndView deleteAdmin(
            @PathVariable int user_id,
            @PathVariable int delete_id) {
        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        admService.deleteAdminById(delete_id);
//        Users user1 = homeService.getUserByRoleId(delete_id);
//                      admService.deleteUserById(user1.getId());
        List<Admin> aList = admService.getAdminList();
        mv.addObject("viewAllAdmin", true);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("aList", aList);
        return mv;
    }

    @RequestMapping(value = "/viewpayments/{user_id}")
    public ModelAndView viewPaymentHistoryList(
            @PathVariable int user_id
    ) {
        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        List<Payment> plist = admService.getPaymentsHistory();
        double Total = 0;
        double due = 0;
        for (int i = 0; i < plist.size(); i++) {
            Payment p = plist.get(i);
            due += p.getDue_amount();
            Total += p.getPaying_amount();
        }
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("Adminviewspayments", true);
        mv.addObject("pList", plist);
        mv.addObject("Total", Total);
        mv.addObject("Due", due);
        mv.addObject("dp", new Payment());

        return mv;

    }

    @RequestMapping(value = "/findstudentdueamount/{user_id}", method = RequestMethod.POST)
    public ModelAndView findStudentDuAmount(
            @ModelAttribute("dp") Payment dp,
            @PathVariable int user_id
    ) {
        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        int id = dp.getStudent_id();
        List<Payment> duelist = admService.getDueAmountListById(id);

        ModelAndView mv = new ModelAndView("user/admin/admin_login");
        mv.addObject("findStudentDuAmount", true);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("duelist", duelist);

        return mv;
    }

    @RequestMapping(value = "duepaymentform/{user_id}/{serial_id}")
    public ModelAndView duePaymentForm(
            @PathVariable int user_id,
            @PathVariable int serial_id
    ) {

        Payment duelist = admService.getPaymentDueRecordBySerialId(serial_id);
        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
        mv.addObject("duePaymentForm", true);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("duelist", duelist);
        mv.addObject("payment", new Payment());
        return mv;
    }

    @PostMapping(value = "updateduepayment/{user_id}")
    public ModelAndView updateDuePayment(
            @ModelAttribute Payment dupmt,
            @PathVariable int user_id
    ) {

        boolean status = admService.updateDuePayment(dupmt);
        String message;
        if (status) {
            message = "<h4> Thank you ! <br/> Your Repayment Transaction has been done successfully</h4>";
        } else {
            message = " <h4> Sorry ! the transaction has not been completed ."
                    + "<br/> Try Again </h4>";
        }

        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        ModelAndView mv = new ModelAndView("user/admin/admin_login");
//        mv.addObject("duePaymentForm", true);
        mv.addObject("message", message);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        return mv;
    }

    
    
    
    @RequestMapping(value="/receiveapayment/{user_id}")
    public ModelAndView receivePaymentForm(
            @PathVariable int user_id
    ) {

        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
        mv.addObject("receivePaymentForm", true);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("payment", new Payment());
        return mv;
    }
    
    
    
    
    @PostMapping(value="/receivepayment/{user_id}")
    public ModelAndView receivePayment(
            @PathVariable int user_id,
            @ModelAttribute Payment pmt
    ) {
        boolean status = admService.addPaymentToDB(pmt);
        String message;
        if (status) {
            message = "<h4> Thank you ! <br/> Your Payment Transaction has been done successfully</h4>";
        } else {
            message = " <h4> Sorry ! the transaction has not been completed ."
                    + "<br/> Try Again </h4>";
        }
        
        
        
        
        ModelAndView mv = new ModelAndView("user/admin/admin_login");

        Users user = homeService.getUserById(user_id);
        Admin admp = admService.getAdminDataById(user.getRole_id());
//        mv.addObject("receivePaymentForm", true);
        mv.addObject("message", message);
        mv.addObject("user", user);
        mv.addObject("admp", admp);
        mv.addObject("payment", new Payment());
        return mv;
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
