package com.northwind.model.mapper;

import com.northwind.model.bean.EmployeeBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class EmployeeMapper implements RowMapper<EmployeeBean> {

    @Override
    public EmployeeBean mapRow(ResultSet rs, int i) throws SQLException {
        EmployeeBean employee = new EmployeeBean();
        employee.setEmployeeID(rs.getInt("e.EmployeeID"));
        employee.setTitle(rs.getString("e.Title"));
        employee.setFirstName(rs.getString("e.FirstName"));
        employee.setLastName(rs.getString("e.LastName"));
        employee.setEmail(rs.getString("e.Email"));
        employee.setHomePhone(rs.getString("e.HomePhone"));
        employee.setExtension(rs.getString("e.Extension"));
        employee.setPostalCode(rs.getString("e.PostalCode"));
        employee.setRegion(rs.getString("e.Region"));
        employee.setRole(rs.getString("e.Role"));
        employee.setCountry(rs.getString("e.Country"));
        employee.setAddress(rs.getString("e.Address"));
        employee.setCity(rs.getString("e.City"));
        employee.setEnabled(rs.getInt("e.Enabled"));

        return employee;
    }        
    
}
