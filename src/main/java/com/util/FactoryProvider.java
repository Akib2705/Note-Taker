package com.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {

		if (sessionFactory == null) {
			sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}

		return sessionFactory;

	}

	public void closeFactory() {
		if (sessionFactory.isOpen()) {
			sessionFactory.close();
		}
	}

}
