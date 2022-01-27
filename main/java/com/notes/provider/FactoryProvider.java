package com.notes.provider;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	
	public static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		factory = new Configuration().configure().buildSessionFactory();
		return factory;
	}
	
	public static void closeConnection() {
		factory.close();
	}
}
