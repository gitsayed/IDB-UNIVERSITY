<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>



    .pro{
        border: 1px solid black;
        border-collapse: collapse;
        width: 30%;  
        text-align: left; 
        color: black;
    }
    .pro3{
        border: 1px solid black;
        border-collapse: collapse;
        /*width: 30%;*/  
        text-align: center; 
        color: black;
        padding-left:  10px; 
    }
    .pro2{
        border: 1px solid black;
        border-collapse: collapse;
        text-align: left;  
        /*padding: 10px;*/  
        padding-left:  10px;  
        font-weight:  bold;
        width: 50%;
        color: black;
    }  

    .pro4{
        border: 1px solid black;
        border-collapse: collapse;
        text-align: center;  
        /*padding: 10px;*/  
        padding-left:  10px;  
        font-weight:  bold;
        /*width: 50%;*/
        color: black;
    }  

    .pro5{
        border: 1px solid black;
        border-collapse: collapse;
        text-align: left;  
        /*padding: 10px;*/  
        padding-left:  5px;  
        font-weight:  bold;
        /*width: 50%;*/
        color: black;
    }

</style>


<c:if test="${userClickAdminProfile == true }">
    <br/>

    &emsp; <a href="${contextRoot}/adm/viewalladmin/${user.id}" class="btn btn-primary">View All Admins   </a>
    &emsp; <a href="${contextRoot}/adm/viewallusers/${user.id}" class="btn btn-primary">View All Users   </a>
    &emsp; <a href="${contextRoot}/adm/gotoaddadmin/${user.id}" class="btn btn-primary">Add  Admin   </a>

    <br/>
    <br/>
    <table style="width:80%"> 
        <caption class="pro4"><span class="btn btn-primary">Your User Logging Profile</span></caption>
        <tr>
            <td class="pro4">User ID</td><td class="pro4">${user.id}</td>
        </tr>
        <tr>
            <td class="pro4">User Name </td><td class="pro4">${user.username}</td>
        </tr>
        <tr>
            <td class="pro4">Email Address</td><td class="pro4">${user.email}</td>
        </tr>
        <tr>
            <td class="pro4">Password</td><td class="pro4">${user.password}</td>
        </tr>
        <tr>
            <td class="pro4">Role ID</td><td class="pro4">${user.role_id}</td>
        </tr>
        <tr>
            <td class="pro4">Role </td><td class="pro4">${user.user_role}</td>
        </tr>
        <tr><td class="pro4"></td>
            <td class="pro4">    <a href="${contextRoot}/adm/gotoupdateuser/${user.id}" class="btn btn-primary">Update</a>
            </td>
        </tr>
    </table>   


    <br/>
    <br/>
    <table style="width:80%"> 
        <caption class="pro4"><span class="btn btn-primary">Your Main  Profile</span></caption>
        <tr>
            <td class="pro4">Role ID</td><td class="pro4">${admp.id}</td>
        </tr>
        <tr>
            <td class="pro4"> Name </td><td class="pro4">${admp.name}</td>
        </tr>
        <tr>
            <td class="pro4">Father Name </td><td class="pro4">${admp.father_name}</td>
        </tr>
        <tr>
            <td class="pro4">Mother Name </td><td class="pro4">${admp.mother_name}</td>
        </tr>
        <tr>
            <td class="pro4">Date of Birth </td><td class="pro4">${admp.birth_date}</td>
        </tr>
        <tr>
            <td class="pro4">Age </td><td class="pro4">${admp.age}</td>
        </tr>
        <tr>
            <td class="pro4">Email Address</td><td class="pro4">${admp.email}</td>
        </tr>
        <tr>
            <td class="pro4">Gender</td><td class="pro4">${admp.gender}</td>
        </tr>
        <tr>
            <td class="pro4">Address</td><td class="pro4">${admp.address}</td>
        </tr>
        <tr>
            <td class="pro4">Contact No : </td><td class="pro4">${admp.contact_no}</td>
        </tr>
        <tr><td class="pro4"></td>
            <td class="pro4">    <a href="${contextRoot}/adm/gotoupdateadmin/${user.id}" class="btn btn-primary">Update</a>
            </td>
        </tr>
    </table>    


</c:if>

<c:if test="${gotoupdateuser == true}">
    <form:form action="${contextRoot}/adm/updateuser"  method="post" modelAttribute="users" >

        <br/>
        <br/>
        <br/>
        <center>
            <span class="btn btn-primary"> User Information Update Form
            </span>
        </center>
        <br/>
        <br/>
        <table style="width:80%">

            <tr><td class="pro4">Attribute</td> <td class="pro4">
                    Value</td>
            </tr> 
            <tr><td class="pro4">User ID</td> <td class="pro4">
                    <form:input path="id"  value="${user.id}" readonly="true" /></td>
            </tr> 
            <tr><td class="pro4">User Name</td> <td class="pro4">
                    <form:input path="username"  value="${user.username}" /></td>
            </tr> 
            <tr><td class="pro4">User Password</td> <td class="pro4">
                    <form:input path="password"  value="${user.password}" /></td>
            </tr> 
            <tr><td class="pro4">User Email </td> <td class="pro4">
                    <form:input path="email"  value="${user.email}" /></td>
            </tr> 
            <tr><td class="pro4">User Role</td> <td class="pro4">
                    <form:input path="user_role"  value="${user.user_role}" readonly="true" /></td>
            </tr> 
            <tr><td class="pro4">User Role ID</td> <td class="pro4">
                    <form:input path="role_id"  value="${user.role_id}" readonly="true" /></td>
            </tr> 

        </table>
        <br/>
        <br/>
        <center><button class="btn btn-primary">Update</button></center>
        </form:form>
    </c:if>


<c:if test="${gotoupdateadmin == true}">
    <form:form action="${contextRoot}/adm/updateadmin/${user.id}"  method="post" modelAttribute="admin" >

        <br/>
        <br/>
        <br/>
        <center>
            <span class="btn btn-primary"> Admin Information Update Form
            </span>
        </center>
        <br/>
        <br/>
        <table style="width:80%">

            <tr><td class="pro4">Attribute</td> <td class="pro4">
                    Value</td>
            </tr> 
            <tr><td class="pro4">Role ID</td> <td class="pro4">
                    <form:input path="id"  value="${admp.id}" readonly="true" /></td>
            </tr> 
            <tr><td class="pro4"> Name</td> <td class="pro4">
                    <form:input path="name"  value="${admp.name}" required="true"  /></td>
            </tr> 

            <tr><td class="pro4">Email ID</td> <td class="pro4">
                    <form:input path="email"  value="${admp.email}" required="true"  />
                </td>
            </tr> 
            <tr><td class="pro4">Age </td> <td class="pro4">
                    <form:input path="age"  value="${admp.age}" required="true"  /></td>
            </tr> 
            <tr><td class="pro4">Gender</td> <td class="pro4">
                    <span class="pro4"> ${admp.gender}</span> &nbsp; 
                    <form:radiobutton path="gender"  value="Male" required="true"/>Male  &nbsp;
                    <form:radiobutton path="gender"  value="Female" required="true"/>Female &nbsp;</td>
            </tr> 
            <tr><td class="pro4">Address</td> <td class="pro4"><span class="pro4">${admp.address}</span> &emsp;

                    <form:textarea class="" path="address"  value="${admp.address}" required="true"   ></form:textarea></td>
                </tr> 
                <tr><td class="pro4">Father Name</td> <td class="pro4">
                    <form:input path="father_name"  value="${admp.father_name}" required="true"   /></td>
            </tr> 
            <tr><td class="pro4">Mother Name</td> <td class="pro4">
                    <form:input path="mother_name"  value="${admp.mother_name}" required="true"  /></td>
            </tr> 
            <tr><td class="pro4">Date Of Birth</td> <td class="pro4">
                    <form:input path="birth_date" type="date"  value="${admp.birth_date}" required="true"  /></td>
            </tr> 
            <tr><td class="pro4">Contact No</td> <td class="pro4">
                    <form:input  path="contact_no"  value="${admp.contact_no}" required="true"  /></td>
            </tr> 

        </table>
        <br/>
        <br/>
        <center><button class="btn btn-primary">Update</button></center>
        </form:form>
    </c:if> 


<c:if test="${ viewAllUsers == true}">
    <br/>

    &emsp; <a href="${contextRoot}/adm/viewalladmin/${user.id}" class="btn btn-primary">View All Admins   </a>
    &emsp; <a href="${contextRoot}/adm/viewallusers/${user.id}" class="btn btn-primary">View All Users   </a>
    &emsp; <a href="${contextRoot}/adm/gotoaddadmin/${user.id}" class="btn btn-primary">Add  Admin   </a>

    <br/>
    <br/>
    <br/>
    <table style="width: 80%">
        <tr class=""> 
            <td class="pro5">ID</td>  
            <td class="pro5">User Name</td>  
            <td class="pro5">Email Address</td>  
            <td class="pro5">User Role</td>  
            <td class="pro5">Role ID</td>  
            <td class="pro5">Action</td>  


        </tr>
        <c:forEach var="ulist" items="${uList}">
            <tr class="">
                <td class="pro5">${ulist.id}</td>
                <td class="pro5">${ulist.username}</td>
                <td class="pro5">${ulist.email}</td>
                <td class="pro5">${ulist.user_role}</td>
                <td class="pro5">${ulist.role_id}</td>

                <td class="pro5">

                    <a href="${contextRoot}/adm/deleteuser/${user.id}/${ulist.id}" class="btn btn-warning" style="font-weight: bold; color: black">Delete</a>
                </td>


            </tr>  

        </c:forEach>
    </table>            
</c:if>            

<c:if test="${viewAllAdmin == true}">
    <br/>


    &emsp; <a href="${contextRoot}/adm/viewalladmin/${user.id}" class="btn btn-primary">View All Admins   </a>
    &emsp; <a href="${contextRoot}/adm/viewallusers/${user.id}" class="btn btn-primary">View All Users   </a>
    &emsp; <a href="${contextRoot}/adm/gotoaddadmin/${user.id}" class="btn btn-primary">Add  Admin   </a>

    <br/>
    <br/>
    <br/>
    <table style="width: 80%">
        <tr class=""> 
            <td class="pro5">ID</td>  
            <td class="pro5">Name</td>  
            <td class="pro5">Email</td>  
            <td class="pro5">Age</td>  
            <td class="pro5">Gender</td>  
            <td class="pro5">Address</td>  
            <td class="pro5">Father Name</td>  
            <td class="pro5">Mother Name</td>  
            <td class="pro5">Date of Birth</td>  
            <td class="pro5">Contact No</td>  
            <td class="pro5">Action</td>  

        </tr>
        <c:forEach var="adl" items="${aList}">
            <tr class="">
                <td class="pro5">${adl.id}</td>
                <td class="pro5">${adl.name}</td>
                <td class="pro5">${adl.email}</td>
                <td class="pro5">${adl.age}</td>
                <td class="pro5">${adl.gender}</td>
                <td class="pro5">${adl.address}</td>
                <td class="pro5">${adl.father_name}</td>
                <td class="pro5">${adl.mother_name}</td>
                <td class="pro5">${adl.birth_date}</td>
                <td class="pro5">${adl.contact_no}</td>
                <td class="pro5">
                    <a href="${contextRoot}/adm/gotoupdateadmin/${user.id}/${adl.id}" class="btn btn-warning" style="font-weight: bold; color: black">Update </a>
                    <a href="${contextRoot}/adm/deleteadmin/${user.id}/${adl.id}" class="btn btn-warning" style="font-weight: bold; color: black">Delete</a>
                </td>


            </tr>  

        </c:forEach>
    </table>

</c:if>    











<c:if test="${gotoAddAdmin == true}">
    <br/>

    &emsp; <a href="${contextRoot}/adm/viewalladmin/${user.id}" class="btn btn-primary">View All Admins   </a>
    &emsp; <a href="${contextRoot}/adm/viewallusers/${user.id}" class="btn btn-primary">View All Users   </a>
    &emsp; <a href="${contextRoot}/adm/gotoaddadmin/${user.id}" class="btn btn-primary">Add  Admin   </a>



    <br/> 
    <br/> 
    &emsp;&emsp;   &emsp;&emsp;     &emsp;&emsp;       &emsp;&emsp;
    &emsp;&emsp;   &emsp;&emsp;     &emsp;&emsp;       &emsp;&emsp;
    &emsp;&emsp;   &emsp;&emsp;            &emsp;&emsp;
    <span class="btn btn-primary"> Admin Add Form 
    </span>  <br/>
    <p style="color: black"> <span style="color: red" >Note : </span> </p>

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-6"> 
            <!--enctype="multipart/form-data"--> 

            <form:form action="${contextRoot}/adm/addadmin/${user.id}"  method="post" modelAttribute="admin"   >


                <form:label class=" form-group" path="name">Name </form:label>
                    <div>
                    <form:input  class="form-control"  path="name" placeholder="Name" required="true" /> 
                </div> 
                <br/>

                <form:label class=" form-group" path="email">Email Address  : </form:label>

                    <div >
                    <form:input class="form-control"   path="email" type="email" required="true" placeholder="Email Address"/> 
                </div> 

                <br/>

                <form:label class=" form-group" path="age">Age : </form:label>

                    <div >
                    <form:input class="form-control" path="age" placeholder="Age"   required="true" /> 
                </div> 

                <br/>
                <form:label class=" form-group" path="gender">Gender : </form:label>

                    <div>
                    <form:radiobutton class="" path="gender" value="Male"   required="true" /> Male &emsp; 
                    <form:radiobutton class="" path="gender" value="Female"  required="true" /> Female &emsp;

                </div> 
                <br/>
                <form:label class=" form-group" path="address">Address  :</form:label>
                    <div >
                    <form:textarea class="form-control"  path="address"  placeholder="Address" required="true" />
                </div> 
                <br/>

                <form:label class=" form-group" path="father_name">Father's Name : </form:label>
                    <div >
                    <form:input class="form-control"  path="father_name"  placeholder="Father's Name" required="true" />
                </div> 
                <br/>
                <form:label class=" form-group" path="mother_name">Mother's Name :</form:label>
                    <div >
                    <form:input class="form-control"  path="mother_name"  placeholder="Mother's Name" required="true" />
                </div> 
                <br/>

                <form:label class=" form-group" path="birth_date">Date of Birth :</form:label>
                    <div >
                    <form:input class="form-control"  path="birth_date"  placeholder="Date of Birth" type="date" required="true" />
                </div> 
                <br/>

                <form:label class=" form-group" path="contact_no">Contact Number :</form:label>
                    <div >
                    <form:input class="form-control"  path="contact_no"  placeholder="Contact Number" type="contact" required="true" />
                </div> 
                <br/>
                <center>
                    <span>
                        <form:button type="submit" class="btn btn-primary ">Submit</form:button>
                        </span>
                    </center> 
                    <br/>
            </form:form>

        </div>


        <div class="col-md-3">

        </div>
    </div>
</c:if>    

<c:if test="${AddAdminSuccess==true}">
    <br/>

    &emsp; <a href="${contextRoot}/adm/viewalladmin/${user.id}" class="btn btn-primary">View All Admins   </a>
    &emsp; <a href="${contextRoot}/adm/viewallusers/${user.id}" class="btn btn-primary">View All Users   </a>
    &emsp; <a href="${contextRoot}/adm/gotoaddadmin/${user.id}" class="btn btn-primary">Add  Admin   </a>



    <br/> 





    <h2>${message}</h2> <br/>
    <p>
        ${status}
    </p>


</c:if>


<c:if test="${adminUpdateForm == true}">
    <br/>

    &emsp; <a href="${contextRoot}/adm/viewalladmin/${user.id}" class="btn btn-primary">View All Admins   </a>
    &emsp; <a href="${contextRoot}/adm/viewallusers/${user.id}" class="btn btn-primary">View All Users   </a>
    &emsp; <a href="${contextRoot}/adm/gotoaddadmin/${user.id}" class="btn btn-primary">Add  Admin   </a>



    <br/> 
    <br/> 
    &emsp;&emsp;   &emsp;&emsp;     &emsp;&emsp;       &emsp;&emsp;
    &emsp;&emsp;   &emsp;&emsp;     &emsp;&emsp;       &emsp;&emsp;
    &emsp;&emsp;   &emsp;&emsp;            &emsp;&emsp;
    <span class="btn btn-primary"> Admin Information Update Form 
    </span>  <br/>
    <p style="color: black"> <span style="color: red" >Note : </span> </p>

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-6"> 
            <!--enctype="multipart/form-data"--> 

            <form:form action="${contextRoot}/adm/updateAlladmin/${user.id}"  method="post" modelAttribute="admin"   >


                <form:label class=" form-group" path="id">ID : </form:label>
                    <div>
                    <form:input  class="form-control"  path="id" value="${uadm.id}" placeholder="ID" required="true" readonly="true" /> 
                </div> 
                <br/>
                <form:label class=" form-group" path="name">Name </form:label>
                    <div>
                    <form:input  class="form-control"  path="name" value="${uadm.name}" placeholder="Name" required="true" /> 
                </div> 
                <br/>

                <form:label class=" form-group" path="email">Email Address  : </form:label>

                    <div >
                    <form:input class="form-control"   path="email" value="${uadm.email}" type="email" required="true" placeholder="Email Address"/> 
                </div> 

                <br/>

                <form:label class=" form-group" path="age">Age : </form:label>

                    <div >
                    <form:input class="form-control" path="age" value="${uadm.age}" placeholder="Age"   required="true" /> 
                </div> 

                <br/>
                <form:label class=" form-group" path="gender">Gender : &emsp;&emsp;<span class="pro4">${uadm.gender}</span> </form:label>

                    <div>
                    <form:radiobutton class="" path="gender" value="Male"   required="true" /> Male &emsp; 
                    <form:radiobutton class="" path="gender" value="Female"  required="true" /> Female &emsp;

                </div> 
                <br/>
                <form:label class=" form-group" path="address">Address  : <br/> ${uadm.address}</form:label>
                    <div >
                    <form:textarea class="form-control"  path="address" value="${uadm.address}" placeholder="Address" required="true" />
                </div> 
                <br/>

                <form:label class=" form-group" path="father_name">Father's Name : </form:label>
                    <div >
                    <form:input class="form-control"  path="father_name" value="${uadm.father_name}" placeholder="Father's Name" required="true" />
                </div> 
                <br/>
                <form:label class=" form-group" path="mother_name">Mother's Name :</form:label>
                    <div >
                    <form:input class="form-control"  path="mother_name" value="${uadm.mother_name}"  placeholder="Mother's Name" required="true" />
                </div> 
                <br/>

                <form:label class=" form-group" path="birth_date">Date of Birth :</form:label>
                    <div >
                    <form:input class="form-control"  path="birth_date" value="${uadm.birth_date}"  placeholder="Date of Birth" type="date" required="true" />
                </div> 
                <br/>

                <form:label class=" form-group" path="contact_no">Contact Number :</form:label>
                    <div >
                    <form:input class="form-control"  path="contact_no" value="${uadm.contact_no}" placeholder="Contact Number" type="contact" required="true" />
                </div> 
                <br/>
                <center>
                    <span>
                        <form:button type="submit" class="btn btn-primary ">Submit</form:button>
                        </span>
                    </center> 
                    <br/>
            </form:form>

        </div>


        <div class="col-md-3">

        </div>
    </div>

</c:if>
<c:if test="${Adminviewspayments==true}">
    <br/>

    <form:form action="${contextRoot}/adm/findstudentdueamount/${user.id}" method="post" modelAttribute="dp">
        <span class="btn btn-primary"> Receive Due Payment</span> 
        <form:input type="number" path="student_id" placeholder="Type Student ID" />
        <button class="btn btn-primary" >Submit</button> 
        &emsp;
        <a href="${contextRoot}/adm/receiveapayment/${user.id}" class="btn btn-primary"> Receive A Payment</a>
    </form:form>

    <a></a>
    <a></a>

    <center>
        <br/>

        <span class="btn btn-primary">
            Payment History  Table  

        </span>
        <br/> <br/>
    </center> 

    <table id="count_it" style="width: 80%">

        <tr class="pro4">
            <td class="pro4" > Date          </td>
            <td class="pro4" > Student ID    </td>
            <td class="pro4" > BKASH Trx ID  </td>
            <td class="pro4" > Category      </td>
            <td class="pro4" > Payable Amount</td>
            <td class="pro4" > Paid Amount   </td>
            <td class="pro4" > Due Amount    </td>

        </tr>            
        <c:forEach var="pd" items="${pList}"> 

            <tr class="pro3">
                <td class="pro3" >${pd.p_date}</td>
                <td class="pro3" >${pd.student_id}</td>
                <td class="pro3" >${pd.btrx_id}</td>
                <td class="pro3" >${pd.payment_category}</td>
                <td class="pro3" >${pd.payable_amount}</td>
                <td class="pro3 paid" >${pd.paying_amount}</td>
                <td class="pro3 due" >${pd.due_amount}</td>

            </tr>

        </c:forEach>
        <tr>
            <td></td>
            <td></td>
            <td></td>

            <td class="pro4">Total</td>
            <td class="pro4"></td>
            <td class="pro4">${Total}</td>
            <td class="pro4">${Due}</td>
        </tr> 
    </table> 

</c:if>


<c:if test="${findStudentDuAmount == true}">

    <br/><br/>
    <center><span class="btn btn-primary"> Due Payment History</span>
        <br/>
        <br/>
    </center>
    <table style="width: 80%">

        <tr class="pro4">
            <td class="pro4" > Date </td>
            <td class="pro4" > Student ID</td>
            <td class="pro4" > Category </td>
            <td class="pro4" > Payable Amount</td>
            <td class="pro4" > Paid Amount</td>
            <td class="pro4" > Due Amount</td>
            <td class="pro4" > To Do</td>
        </tr>            
        <c:forEach var="pd" items="${duelist}"> 

            <tr class="pro3">
                <td class="pro3">${pd.p_date}</td>
                <td class="pro3"> ${pd.student_id}</td>
                <td class="pro3"> ${pd.payment_category}</td>
                <td class="pro3" >${pd.payable_amount}</td>
                <td class="pro3" >${pd.paying_amount}</td>
                <td class="pro3" >${pd.due_amount}</td>
                <td class="pro3" style="padding: 7px" >
                    <a href="${contextRoot}/adm/duepaymentform/${user.id}/${pd.serial_id}" class="btn btn-primary" >  Pay Due Payment</a>
                </td>
            </tr>

        </c:forEach>

    </table>        



</c:if>

<c:if test="${duePaymentForm == true}">
    <center> <br/>
        <span class="btn btn-primary"> Due Payment  Form 
        </span>   </center><br/>
    <p style="color: black"> <span style="color: red" >Note : </span> Pay through this BKASH Merchant Number : <b>01717-232 454</b>
    <br/> or,  
    &emsp;
    &nbsp;
    Enter BILL  Number instead of Trx ID.
    </p>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-6"> 
            <!--enctype="multipart/form-data"--> 

            <form:form action="${contextRoot}/adm/updateduepayment/${user.id}"  method="post" modelAttribute="payment"   >



                <div>
                    <form:input  class="form-control"  path="payable_amount" value="${duelist.payable_amount}"  type="hidden" /> 
                    <form:input  class="form-control"  path="serial_id" value="${duelist.serial_id}"  type="hidden" /> 
                </div>    

                <form:label class=" form-group" path="student_id">Student ID : </form:label>
                    <div>
                    <form:input  class="form-control"  path="student_id" value="${duelist.student_id}" placeholder="Student ID" readonly="true" /> 
                </div> 
                <br/>



                <form:label class=" form-group" path="contact_number">Contact Number  : </form:label>

                    <div >
                    <form:input class="form-control"   path="contact_number" required="true"  value="${duelist.contact_number}"    placeholder="Contact Number"  /> 
                </div> 
                <br/>





                <form:label class=" form-group" path="payment_category">Payment_Category  : </form:label>

                    <div>
                    <form:input  class="form-control" path="payment_category" value="${duelist.payment_category}" placeholder="Payment Category" readonly="true" />

                </div> 
                <br/>

                <form:label class=" form-group" path="due_amount">Due Amount : </form:label>

                    <div >
                    <form:input class="form-control" path="due_amount" value="${duelist.due_amount}" placeholder="Due Amount"   required="true" readonly="true" /> 
                </div> 

                <br/>






                <form:label class=" form-group" path="paying_amount">Paying Amount : </form:label>

                    <div>
                    <form:input class="form-control"  style="width:80%" path="paying_amount" placeholder="Paying Amount"   required="true" /> 

                </div> 
                <br/>
                <form:label class=" form-group" path="btrx_id">BKASH Trx ID : </form:label>
                    <div >
                    <form:input class="form-control"  path="btrx_id"  placeholder="BKASH TrxID" required="true" /> </div> 
                <br/> 
                <center>
                    <span>
                        <form:button type="submit" class="btn btn-primary ">Submit</form:button>
                        </span>
                    </center> 
                    <br/> 
            </form:form>

        </div>


        <div class="col-md-1">

        </div>
    </div>





</c:if>

    <c:if test="${message != null}">
        
        <span style="color: black">
            ${message}
                </span>
        
        
    </c:if>

    <c:if test="${receivePaymentForm == true}">
        
            <center> <br/>
                <span class="btn btn-primary"> Payment Form 
                </span>   </center><br/>
            <p style="color: black"> <span style="color: red" >Note : </span> Pay through this BKASH Merchant Number : <b>01717-232 454</b>
             <br/> or,  
    &emsp;
    &nbsp;
    Enter BILL  Number instead of Trx ID.
            </p>

            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-6"> 
                    <!--enctype="multipart/form-data"--> 

                    <form:form action="${contextRoot}/adm/receivepayment/${user.id}"  method="post" modelAttribute="payment"   >

                        <form:label class=" form-group" path="student_id">Student ID : </form:label>
                            <div>
                            <form:input  class="form-control"  path="student_id" placeholder="Student ID" required="true" /> 
                        </div> 
                        <br/>

                        <form:label class=" form-group" path="contact_number">Contact Number  : </form:label>

                            <div >
                            <form:input class="form-control"   path="contact_number" required="true" placeholder="Contact Number"/> 
                        </div> 
                        <br/>
                        <form:label class=" form-group" path="payment_category">Payment_Category  : </form:label>

                            <div>
                            <form:select  class="form-control" path="payment_category" placeholder="Select">
                                <option>  </option>
                                <option > Admission Fee</option>
                                <option > Exam Fee</option>
                                <option > Monthly Fee</option>
                                <option > Semester Fee</option>
                                <option > Tour Fee</option>
                                <option > Development Fee</option>
                            </form:select>
                        </div> 
                        <br/>

                        <form:label class=" form-group" path="payable_amount">Payable Amount : </form:label>

                            <div >
                            <form:input class="form-control" path="payable_amount" placeholder="Payable Amount"   required="true" /> 
                        </div> 

                        <br/>

                        <form:label class=" form-group" path="paying_amount">Paying Amount : </form:label>

                            <div>
                            <form:input class="form-control" path="paying_amount" placeholder="Paying Amount"   required="true" /> 

                        </div> 
                        <br/>
                        <form:label class=" form-group" path="btrx_id">BKASH Trx ID : </form:label>
                            <div >
                            <form:input class="form-control"  path="btrx_id"  placeholder="BKASH TrxID" required="true" /> </div> 
                        <br/>
                        <center>
                            <span>
                                <form:button type="submit" class="btn btn-primary ">Submit</form:button>
                                </span>
                            </center> 
                            <br/>
                    </form:form>

                </div>


                <div class="col-md-3">
                    
                </div>
                </div>
            </c:if>

        
        