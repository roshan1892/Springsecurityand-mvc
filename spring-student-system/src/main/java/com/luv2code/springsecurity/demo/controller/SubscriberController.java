package com.luv2code.springsecurity.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.springsecurity.demo.entity.Student;
import com.luv2code.springsecurity.demo.service.StudentService;

@Controller
@RequestMapping("/leaders")
public class SubscriberController {


	//need to inject our customer service
	@Autowired
   private StudentService studentService;
	

	@GetMapping("/listForUpdate")
	public String listStudents(Model theModel) {
		
		//get customers from the service	
		List<Student>students = studentService.getStudents();
		
		//add the customers to the model
		theModel.addAttribute("students", students);
		
		 return "update-list";
	}
	
	@GetMapping("/showFormForUpdate")
public String showFormForUpdate(@RequestParam("studentId") int theId,Model theModel) {
		
		//get the customer from the database
		Student theStudent =studentService.getStudent(theId);
		
		//set customer as a model attribute to pre-populate the form
		theModel.addAttribute("student", theStudent);
		
		//send over to our form 
		return "student-form";
	}
	
	@PostMapping("/saveStudent")
	public String saveStudent(@ModelAttribute("student") Student theStudent) {
	  
		//save the customer using our service 		
		studentService.saveStudent(theStudent);
		
		
		return "redirect:/leaders/listForUpdate";
	}
	
	
	
}
