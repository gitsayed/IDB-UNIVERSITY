
package org.idb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="department")
public class Department {
   
    @Id
    @Column(name="id") 
    private int id;
    @Column(name="dept_name")
    private String dept_name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    
    
    
    public Department() {
    }

    public Department(int id, String dept_name) {
        this.id = id;
        this.dept_name = dept_name;
    }
    
    
}
