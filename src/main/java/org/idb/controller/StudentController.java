package org.idb.controller;

import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.Null;
import org.idb.model.Application;
import org.idb.model.Payment;
import org.idb.model.Students;
import org.idb.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("s")
public class StudentController {

    @Autowired
    StudentService stuService;

    
    
    
    
    
    
//    ---------------------------------------------------------------------//
    @RequestMapping(value = "/getmyprofile")
    public ModelAndView showEvaluation() {

        List<Students> list = stuService.getMyprofile();

        ModelAndView mv = new ModelAndView("user/student/student_login");

        mv.addObject("userClickGetMyprofile", true);
        mv.addObject("profile", list);

        return mv;
    }

    
    
 
//    ---------------------------------------------------------------------//   
    
    @RequestMapping(value = "/payfeeform")
    public ModelAndView showPayfeeForm() {

        ModelAndView mv = new ModelAndView("user/student/student_login");

        mv.addObject("userClickPayFeeForm", true);
        mv.addObject("payment", new Payment());
        return mv;
    }

//   consumes = MediaType.MULTIPART_FORM_DATA_VALUE
    @RequestMapping(value = "/paymentconfirm",
            method = RequestMethod.POST)
    public ModelAndView paymentConfirm(
            @ModelAttribute("payment") Payment payment
    
    ) {

        boolean status = stuService.getPayment(payment);
        String message;
        if(status){
        message="<h4> Thank you !<br/> Your payment has been done successfully</h4>.";
        } else{
        message="Sorry! <br/> The Payment has not been completed successfully."
                + "<br/> <h4><a href=\"${contextRoot}/s/payfeeform \">"
                + " Try Again</a></h4>"; 
        
        }
        ModelAndView mv = new ModelAndView("user/student/student_login");
        mv.addObject("payment", new Payment());
        mv.addObject("pm_status", true);
        mv.addObject("message", message);

        return mv;

    }


//    ---------------------------------------------------------------------//    
    
    @RequestMapping(value = "/applicationform" )
    public ModelAndView showApplicationform() { 
   
    ModelAndView mv = new ModelAndView("user/student/student_login");
//     List<Application> list = stuService.getApplictionList();
    mv.addObject("userClickApplication", true);
//    mv.addObject("applications", list);
    mv.addObject("application", new Application()); 
    
    return mv;
    }
    
    
    
    
    
    
//    ---------------------------------------------------------------------//
    
    
    
    
    @RequestMapping(value = "/applicationsubmit" , method=RequestMethod.POST)
    public ModelAndView submitApplication(
    @ModelAttribute("application") Application application) { 
    
      boolean status=stuService.submitApplication(application);
    String message ;    
         if(status){
        message="<h4> Thank you !<br/> Your Application has been submitted successfully</h4>.";
        } else{
        message="Sorry! <br/> The Application has not been submitted successfully.."
                + "<br/> <h4> Please <a href=\"applicationform \">"
                + " Try Again</a></h4>"; 
        
        } 
    
    ModelAndView mv = new ModelAndView("user/student/student_login");
    mv.addObject("application_status",true);
    mv.addObject("message", message);
//    mv.addObject("applications", list); 
    mv.addObject("application", new Application());
    
    
    return mv;
    }
    
    
//    ---------------------------------------------------------------------//
    
    @RequestMapping(value="/viewapplications")
    public ModelAndView  viewApplications(){ 

    List<Application> list = stuService.getApplictionList();     
    
    Application aap=list.get(0);
        System.out.println("viewapplicationsList = : "+aap.getA_id());
        
    ModelAndView mv = new ModelAndView("user/student/student_login");
    mv.addObject("userViewApplications", true);
    mv.addObject("applicationslist", list);
    mv.addObject("application", new Application());
    return mv;
    }
    
    
//    ---------------------------------------------------------------------//
       
    @RequestMapping(value="/removeapllication/{id}")
    public ModelAndView  removeApllication(
    @PathVariable int id
    ){ 

                             stuService.removeAppliction(id);     
    List<Application> list = stuService.getApplictionList();     
    
    
    ModelAndView mv = new ModelAndView("user/student/student_login");
    mv.addObject("userViewApplications", true);
    mv.addObject("applicationslist", list);
    
    return mv;
    }
    
    
    
//    ---------------------------------------------------------------------//
    
    @RequestMapping(value="/checkduepayment")
    public ModelAndView checkDuePayment(){ 
        int id=0;
    List<Payment> list = stuService.getDuePaymentList( id);   
    
    ModelAndView mv = new ModelAndView("user/student/student_login");
    mv.addObject("userViewDuePayment", true);
    mv.addObject("DuePaymentlist", list);
    
    return mv;
    
    } 
    
//    ---------------------------------------------------------------------//
    
@RequestMapping(value="/viewpaymenthistory")
    public ModelAndView viewPaymentHistoryList(){ 
        int id=0;
    List<Payment> list = stuService.getStudentPaymentHistory(id);   
    
    ModelAndView mv = new ModelAndView("user/student/student_login");
    mv.addObject("userClickPaymentHitsory", true);
    mv.addObject("PaymentHistoryList", list);
    
    return mv;
    
    }

    
//    ---------------------------------------------------------------------//
    
    @RequestMapping(value="/duepaymentform/{id}")
    public ModelAndView student_Due_payment_form(
            @PathVariable int id 
    ){ 
        
    List<Payment> list = stuService.getStudentPaymentDueRecord(id);   
    
    ModelAndView mv = new ModelAndView("user/student/student_login");
    mv.addObject("userWantsToPayDue", true);
    mv.addObject("PaymentDueHistory", list);
    mv.addObject("payment", new Payment());
    
    return mv;
    
    }    

//    ---------------------------------------------------------------------//
 
    @RequestMapping(value="/updateduepayment")
    public ModelAndView update_Student_Due_payment(
            @ModelAttribute("payment") Payment payment
    ){ 
        
    boolean status= stuService.updateStudentDuePayment(payment);   
    String message;
    if(status){
    message = "<h4> Thank you ! <br/> Your Repayment Transaction has been done successfully</h4>";
    }else{
    message = " <h4> Sorry ! the transaction has not been completed ."
            + "<br/> Try Again </h4>"; 
    }
    ModelAndView mv = new ModelAndView("user/student/student_login");
    mv.addObject("updateduepayment", true);
    mv.addObject("message", message);
    mv.addObject("payment", new Payment());
    
    return mv;
    
    }    
    
    
    
    
    
    
    
    
    
    
    
}
