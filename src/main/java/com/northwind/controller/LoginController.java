package com.northwind.controller;

import com.northwind.model.bean.EmployeeBean;

import com.northwind.model.dao.EmployeeDAO;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("employeeBean")
public class LoginController {

    @Autowired
    private EmployeeDAO employeeDAO;

    @RequestMapping(value = {"/login.do"}, method = RequestMethod.GET)
    public String showLogin(HttpSession session) {
        EmployeeBean employeeBean = (EmployeeBean) session.getAttribute("employeeBean");
        if (employeeBean != null) {
            if (employeeBean.getRole().equalsIgnoreCase("ADMINISTRATOR")) {
                return "/admin/index";
            } else {
                return "/user/index";
            }
        } else {
            return "index";
        }
    }
    
    @RequestMapping(value = {"/*"}, method = RequestMethod.GET)
    public String showIndex(HttpSession session) {
        EmployeeBean employeeBean = (EmployeeBean) session.getAttribute("employeeBean");
        if (employeeBean != null) {
            if (employeeBean.getRole().equalsIgnoreCase("ADMINISTRATOR")) {
                return "/index";
            } else {
                return "/index";
            }
        } else {
            return "index";
        }
    }
    
    @RequestMapping(value = {"/home.do"}, method = RequestMethod.GET)
    public String home(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String email = auth.getName();
        EmployeeBean employee = employeeDAO.get(email);
        model.addAttribute("employeeBean", employee);
        if (employee.getRole().equalsIgnoreCase("ADMINISTRATOR")) {
            return "/index";
        } else {
            return "/index";
        }
    }
    
    @RequestMapping(value = {"/accessdenied.do"}, method = RequestMethod.GET)
    public String denied() {
        return "/denied";
    }
}




