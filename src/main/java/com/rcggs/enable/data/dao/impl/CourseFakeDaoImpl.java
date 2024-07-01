package com.rcggs.enable.data.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.fernandospr.example.model.Course;
import com.rcggs.enable.data.dao.CourseDao;

@Repository("courseDao")
public class CourseFakeDaoImpl implements CourseDao {

	private static List<Course> courses;
	private static Integer id = 1;
	static {
		courses = new ArrayList<>(Arrays.asList(new Course("foo", 50, "baz"),
												new Course("foo2", 30, "baz2")));
		for(Course course : courses) {
			course.setId(id);
			id++;
		}
	}


	@Override
	public List<Course> findAll() {
		return courses;
	}

	@Override
	public Course find(Integer id) {
		return null;
	}

	@Override
	public Course save(Course courseToSave) {
		setCourseId(courseToSave);
		courses.add(courseToSave);
		return courseToSave;
	}

	@Override
	public Course update(Integer id, Course newCourse) {
		Course courseToUpdate = this.find(id);
		if(courseToUpdate != null) {
			courseToUpdate.merge(newCourse);
			return courseToUpdate;
		} else {
			courses.add(newCourse);
			return newCourse;
		}
	}

	private void setCourseId(Course studentToSave) {
		studentToSave.setId(id);
		id++;
	}

	@Override
	public void delete(Course student) {
		courses.remove(student);
	}

	@Override
	public void deleteById(Integer id) {
		Course course = this.find(id);
		this.delete(course);
	}
}
