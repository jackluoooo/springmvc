package com.luo.myweb.controller;

import com.luo.myweb.dao.DepartmentDao;
import com.luo.myweb.dao.EmployeeDAO;
import com.luo.myweb.entity.Department;
import com.luo.myweb.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

@Controller
//@RequestMapping("employee")
public class EmployeeController {

    @Autowired
    private EmployeeDAO employeeDao;

    @Autowired
    private DepartmentDao departmentDao;

    @RequestMapping("/list")
    public String list(Map<String ,Object> map){
       map.put("employees",employeeDao.getAll());
       return "list";
    }

    @RequestMapping(value = "dep",method = RequestMethod.GET)
    public String input(Map <String ,Object> map){
        map.put("departments",departmentDao.getDepartments());
        map.put("employee",new Employee());
        return "input";
    }

    @ResponseBody
    @RequestMapping("/testJson")
    public Collection<Employee> testJson(){
        return employeeDao.getAll();
    }

    /**
     * 文件上传
     * @param body
     * @return
     */
    @ResponseBody
    @RequestMapping("/testHttpMessageConverter")
    public String testHttpMessageConverter(@RequestBody  String body){
        System.out.print(body);
        return "hello!"+new Date();

    }

    /**
     * 文件下载
     * @return
     */
    @RequestMapping("/testReponseEntity")
   public ResponseEntity<byte[]> testReponseEntity(HttpSession session) throws IOException {
       byte[] body=null;
       ServletContext servletContext=session.getServletContext();
       InputStream in=servletContext.getResourceAsStream("files/abc.txt");
       body=new byte[in.available()];
       in.read(body);

       HttpHeaders headers =new HttpHeaders();
       headers.add("Content-Disposition","attachment;filename=abc.txt");

       HttpStatus httpStatus=HttpStatus.OK;
       ResponseEntity<byte[]> responseEntity=new ResponseEntity<byte[]>(body,headers,httpStatus);
       return  responseEntity;
    }

    @RequestMapping(name = "/testFileUpload")
    public  String testFileUpload(@RequestParam("desc1") String desc, @RequestParam("file1") MultipartFile file){
        System.out.println(desc);
        System.out.println(file.getName());
        System.out.println(file.getContentType());
        return  "success";
    }

}
