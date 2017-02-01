package com.northwind.model.dao;

import com.northwind.model.bean.EmployeeBean;
import com.northwind.model.mapper.EmployeeMapper;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("employeeDAO")
public class EmployeeDAO {

    @Autowired
    private DataSource dataSource;

    public List<EmployeeBean> listemployeexmanager(EmployeeBean manager, EmployeeBean employee) {

        String query = "select e.EmployeeID, "
                + "e.Title, "
                + "e.FirstName, "
                + "e.LastName, "
                + "e.Email, "
                + "e.HomePhone, "
                + "e.Extension, "
                + "e.PostalCode, "
                + "e.Region, "
                + "e.Role, "
                + "e.Address, "
                + "e.City, "
                + "e.Country, "
                + "e.Enabled "
                + "from employees e, "
                + "employees ee "
                + "where e.ReportsTo = ee.EmployeeID "
                + "and ee.EmployeeID= ? ";

        List<Object> parametros = new ArrayList<Object>();
        parametros.add(manager.getEmployeeID());

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<EmployeeBean> employee_list = jdbcTemplate.query(query, parametros.toArray(), new EmployeeMapper());
        return employee_list;

    }

    public List<EmployeeBean> listemployees() {

        String query = "select e.EmployeeID, "
                + "e.Title, "
                + "e.FirstName, "
                + "e.LastName, "
                + "e.Email, "
                + "e.HomePhone, "
                + "e.Extension, "
                + "e.PostalCode, "
                + "e.Region, "
                + "e.Role, "
                + "e.Address, "
                + "e.City, "
                + "e.Country, "
                + "e.Enabled "
                + "from employees e where e.ENABLED=1";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<EmployeeBean> employee_list = jdbcTemplate.query(query, new EmployeeMapper());
        return employee_list;

    }

  public EmployeeBean info(int id) {

        String query = "select e.EmployeeID, "
                + "e.Title, "
                + "e.FirstName, "
                + "e.LastName, "
                + "e.Email, "
                + "e.HomePhone, "
                + "e.Extension, "
                + "e.PostalCode, "
                + "e.Region, "
                + "e.Role, "
                + "e.Address, "
                + "e.City, "
                + "e.Country, "
                + "e.Enabled "
                + "from employees e "
                + "where e.EmployeeID = ?";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        EmployeeBean employee = jdbcTemplate.queryForObject(query, new Object[]{id}, new EmployeeMapper());
        return employee;
    }    
    
    public EmployeeBean get(String email) {

        String query = "select e.EmployeeID, "
                + "e.Title, "
                + "e.FirstName, "
                + "e.LastName, "
                + "e.Email, "
                + "e.HomePhone, "
                + "e.Extension, "
                + "e.PostalCode, "
                + "e.Region, "
                + "e.Role, "
                + "e.Address, "
                + "e.City, "
                + "e.Country, "
                + "e.Enabled "
                + "from employees e "
                + "where e.Email = ?";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        EmployeeBean employee = jdbcTemplate.queryForObject(query, new Object[]{email}, new EmployeeMapper());
        return employee;
    }

    public void update(EmployeeBean employee) {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE employees SET FirstName = ?,"
                + " LastName = ? ,"
                + " HomePhone = ? ,"
                + " Extension = ? ,"
                + " Address = ? ,"
                + " City = ? ,"
                + " Country = ?, "
                + " Region = ? "
                + " WHERE EmployeeID = ?");
        
        try{
            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
            List<Object> parametros = new ArrayList<Object>();
            parametros.add(employee.getFirstName());
            parametros.add(employee.getLastName());
            parametros.add(employee.getHomePhone());
            parametros.add(employee.getExtension());
            parametros.add(employee.getAddress());
            parametros.add(employee.getCity());
            parametros.add(employee.getCountry());
            parametros.add(employee.getRegion());
            parametros.add(employee.getEmployeeID());
            jdbcTemplate.update(sql.toString(), parametros.toArray());
        }catch (Exception ex) {
            System.out.println(ex.toString());
        }
    }

}
