package com.cdu.videoshare.listener;



import com.cdu.videoshare.model.User;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.ArrayList;
import java.util.List;


@WebListener("OnlineListener")
public class OnlineListener implements ServletContextListener, HttpSessionAttributeListener {
    List<User> onlineUser;

    public void contextInitialized(ServletContextEvent sce) {
        this.onlineUser = new ArrayList<>();
        sce.getServletContext().setAttribute("online", this.onlineUser);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

    public void attributeAdded(HttpSessionBindingEvent se) {
        if ("user".equals(se.getName())) {
            this.onlineUser.add((User) se.getValue());
        }

        se.getSession().getServletContext().setAttribute("online", this.onlineUser);
    }

    public void attributeRemoved(HttpSessionBindingEvent se) {
        if ("user".equals(se.getName())) {
            this.onlineUser.remove(se.getValue());
        }
        se.getSession().getServletContext().setAttribute("online", this.onlineUser);
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent) {

    }


}
