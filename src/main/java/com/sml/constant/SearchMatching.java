package com.sml.constant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchMatching extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int i=0;
	@Override
	public void init() throws ServletException {
		super.init();
		
	}
	
    public SearchMatching() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		gogo();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public void gogo(){
		while(true){
        	System.out.println(i++);
        	if(i==10){
        		break;
        	}
        	try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
	}
}
