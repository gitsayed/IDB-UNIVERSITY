/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.idb.config;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author USER
 */
public class A {
    
    public static void main(String[] args) {
       String a = new SimpleDateFormat("dd-MM-yyyy HH:mm ").format(new Date());
System.out.println(a);    
        
    }
}
