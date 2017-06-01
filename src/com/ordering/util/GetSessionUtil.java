package com.ordering.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.Source;
import org.springframework.stereotype.Component;

@Component
public class GetSessionUtil {

	@Source
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
}
