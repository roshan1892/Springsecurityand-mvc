package com.luv2code.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springsecurity.demo.entity.Student;

@Repository
public class StudentDAOImpl implements StudentDAO {

	// Need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Student> getStudents() {
		System.out.println("yes");
		// get a session
		Session currentSession = sessionFactory.getCurrentSession();

		// Create a query
		Query <Student>theQuery = currentSession.createQuery("from Student", Student.class);

		// execute query and get result list
		List<Student> students = theQuery.getResultList();

		// return the results
		return students;
	}

	@Override
	public void saveStudent(Student theStudent) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// save or update the customer
		currentSession.saveOrUpdate(theStudent);

	}

	@Override
	public Student getStudent(int theId) {
		// get a session
		Session currentSession = sessionFactory.getCurrentSession();

		// now retrieve/read from database using the primary kry
		Student theStudent = currentSession.get(Student.class, theId);

		return theStudent;
	}

	@Override
	public void deleteStudent(int theId) {
		// get a current session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete object with primary key
		Query theQuey = currentSession.createQuery("delete from Student where id=:student");
		theQuey.setParameter("student", theId);

		theQuey.executeUpdate();

	}

}
