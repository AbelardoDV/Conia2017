package com.northwind.controller;

import com.northwind.model.bean.EmployeeBean;

import com.northwind.model.dao.EmployeeDAO;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeDAO employeeDAO;

    @RequestMapping(value = "/admin/employee", method = RequestMethod.GET)
    public String inicio(Model model, @RequestParam(value = "action", required = false) String action) {
        List<EmployeeBean> employeeList = employeeDAO.listemployees();  
 /*      int i = 0;
       for(EmployeeBean x: employeeList){
           i++;
           if(x.getEnabled()==0){
                    employeeList.remove(i);
                   }
       }*/
        model.addAttribute("ListaEmployees", employeeList);
        
        return "/admin/employee/list";
    }

    @RequestMapping(value = {"/employee/list"}, method = RequestMethod.GET)
    public String lista(Model model, @RequestParam(value = "action", required = false) String action, HttpSession session) {
        EmployeeBean employeeBean = (EmployeeBean) session.getAttribute("employeeBean");
        List<EmployeeBean> employeeList = employeeDAO.listemployeexmanager(employeeBean, new EmployeeBean());
        model.addAttribute("employee", new EmployeeBean());
        model.addAttribute("ListaEmployees", employeeList);
        return "/user/employee/list";
    }

    @RequestMapping(value = {"/employee/profile"}, method = RequestMethod.GET)
    public String perfil(Model model, HttpSession session) {
        EmployeeBean employeeBean = (EmployeeBean) session.getAttribute("employeeBean");
        model.addAttribute("employee", employeeBean);
        return "/user/employee/form";
    }

    @RequestMapping(value = {"/employee/save"}, method = RequestMethod.POST)
    public String actualizar(@ModelAttribute EmployeeBean employee,  Model model, HttpSession session) {
        EmployeeBean employeeBean = (EmployeeBean) session.getAttribute("employeeBean");
        employeeBean.setFirstName(employee.getFirstName());
        employeeBean.setLastName(employee.getLastName());
        employeeBean.setAddress(employee.getAddress());
        employeeBean.setExtension(employee.getExtension());
        employeeBean.setCountry(employee.getCountry());
        employeeBean.setCity(employee.getCity());                
        employeeDAO.update(employeeBean);
        session.setAttribute("employeeBean", employeeBean);
        model.addAttribute("employee", employeeBean);
        return "redirect:/home.do";
    }

}
