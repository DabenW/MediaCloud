package dbutil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * The database initializer is a listener to
 * create initial database.
 *
 */


public class DatabaseInitializer implements ServletContextListener{
	public void contextInitialized(ServletContextEvent event) {
		new EmbeddedDbCreator().createDatabase();
	}
	  
	public void contextDestroyed(ServletContextEvent event) {}
}