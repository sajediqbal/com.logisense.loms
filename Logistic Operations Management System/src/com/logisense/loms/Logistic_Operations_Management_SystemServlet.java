package com.logisense.loms;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Logistic_Operations_Management_SystemServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
}
