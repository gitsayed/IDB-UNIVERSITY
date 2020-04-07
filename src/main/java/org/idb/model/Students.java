
package org.idb.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Students", catalog="idb")
public class Students implements java.io.Serializable{
   
// @GeneratedValue(strategy=GenerationType.AUTO)

   @Id 
   @GeneratedValue(strategy=IDENTITY)
   @Column(name="id", unique=true, nullable=false)
   private Integer id; 
   @Column(name="name")
   private String name; 
   @Column(name="dept_id")
   private String dept_id; 
   @Column(name="birth_date")
   private String birth_date; 
   @Column(name="father_name")
   private String father_name; 
   @Column(name="mother_name")
   private String mother_name; 
   @Column(name="address")
   private String Address; 
   @Column(name="image")
   private byte  image;
   @Column(name="email")
   private String email;
   
   private Integer contact_no;

    public Students() {
    }

    public Students(Integer id, String name, String dept_id, String birth_date, String father_name, String mother_name, String Address, byte image, String email, Integer contact_no) {
        this.id = id;
        this.name = name;
        this.dept_id = dept_id;
        this.birth_date = birth_date;
        this.father_name = father_name;
        this.mother_name = mother_name;
        this.Address = Address;
        this.image = image;
        this.email = email;
        this.contact_no = contact_no;
    }

    @Override
    public String toString() {
        return "Students{" + "id=" + id + ", name=" + name + ", dept_id=" + dept_id + ", birth_date=" + birth_date + ", father_name=" + father_name + ", mother_name=" + mother_name + ", Address=" + Address + ", image=" + image + ", email=" + email + ", contact_no=" + contact_no + '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDept_id() {
        return dept_id;
    }

    public void setDept_id(String dept_id) {
        this.dept_id = dept_id;
    }

    public String getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(String birth_date) {
        this.birth_date = birth_date;
    }

    public String getFather_name() {
        return father_name;
    }

    public void setFather_name(String father_name) {
        this.father_name = father_name;
    }

    public String getMother_name() {
        return mother_name;
    }

    public void setMother_name(String mother_name) {
        this.mother_name = mother_name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public byte getImage() {
        return image;
    }

    public void setImage(byte image) {
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getContact_no() {
        return contact_no;
    }

    public void setContact_no(Integer contact_no) {
        this.contact_no = contact_no;
    }

 
   
}
