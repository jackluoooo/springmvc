package com.luo.myweb.dao;

import com.luo.myweb.entity.Department;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Repository
public class DepartmentDao {

    private static Map<Integer, Department> departments=null;

    static {
        departments=new HashMap<Integer,Department>();

        departments.put(1001,new Department(1,"A"));
        departments.put(1002,new Department(1,"B"));
        departments.put(1003,new Department(1,"C"));
        departments.put(1004,new Department(1,"D"));

    }

    public Collection<Department> getDepartments() {
        return departments.values();
    }

    public Department getDepartment(Integer id) {
        return departments.get(id);
    }

}
