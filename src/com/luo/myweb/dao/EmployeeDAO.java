package com.luo.myweb.dao;


import com.luo.myweb.entity.Department;
import com.luo.myweb.entity.Employee;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.*;


@Repository
public class EmployeeDAO {



    private static Map<Integer, Employee> employees = null;

    static {
        employees = new HashMap<Integer, Employee>();

        employees.put(1, new Employee(1, "zhao", 0, "2451652673@zhao.com",new Department(1,"A")));
        employees.put(2, new Employee(1, "qian", 0, "2451652673@qian.com",new Department(1,"A")));
        employees.put(3, new Employee(1, "sun", 0, "2451652673@sun.com",new Department(1,"A")));
        employees.put(4, new Employee(1, "li", 0, "2451652673@li.com",new Department(1,"A")));

    }

    private static Integer ID = 5;

    public void add(Employee bean) {
        employees.put(ID++, bean);
    }

    public void delete(int id) {
        employees.remove(id);
    }

    public Employee get(int id) {

        return employees.get(id);
    }

    public Collection<Employee> getAll() {

        return employees.values();
    }

    public void update(Integer id, Employee bean) {

        employees.put(id,bean);
    }
}
