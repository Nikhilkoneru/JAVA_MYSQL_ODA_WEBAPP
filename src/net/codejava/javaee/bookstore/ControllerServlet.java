package net.codejava.javaee.bookstore;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @author nikhil
 */
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDAO bookDAO;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		bookDAO = new BookDAO(jdbcURL, jdbcUsername, jdbcPassword);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new1":
				showNewForm1(request, response);
				break;
			case "/insert1":
				insertBook1(request, response);
				break;
			case "/delete1":
				deleteBook1(request, response);
				break;
			case "/edit1":
				showEditForm1(request, response);
				break;
			case "/update1":
				updateBook1(request, response);
				break;
			case "/new2":
				showNewForm2(request, response);
				break;
			case "/insert2":
				insertBook2(request, response);
				break;
			case "/delete2":
				deleteBook2(request, response);
				break;
			case "/edit2":
				showEditForm2(request, response);
				break;
			case "/update2":
				updateBook2(request, response);
				break;
			default:
				listBook(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listBook(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Book> listBook1 = bookDAO.listAllBooks1();
		List<Book> listBook2 = bookDAO.listAllBooks2();
		request.setAttribute("listBook1", listBook1);
		request.setAttribute("listBook2", listBook2);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookList.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm1(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Book existingBook = bookDAO.getBook1(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
		request.setAttribute("book1", existingBook);
		dispatcher.forward(request, response);

	}

	private void insertBook1(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		float price = Float.parseFloat(request.getParameter("price"));

		Book newBook = new Book(title, author, price);
		bookDAO.insertBook1(newBook);
		response.sendRedirect("list");
	}

	private void updateBook1(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		float price = Float.parseFloat(request.getParameter("price"));

		Book book = new Book(id, title, author, price);
		bookDAO.updateBook1(book);
		response.sendRedirect("list");
	}

	private void deleteBook1(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		Book book = new Book(id);
		bookDAO.deleteBook1(book);
		response.sendRedirect("list");

	}
	private void showNewForm2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm2.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm2(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Book existingBook = bookDAO.getBook2(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm2.jsp");
		request.setAttribute("book2", existingBook);
		dispatcher.forward(request, response);

	}

	private void insertBook2(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		float price = Float.parseFloat(request.getParameter("price"));

		Book newBook = new Book(title, author, price);
		bookDAO.insertBook2(newBook);
		response.sendRedirect("list");
	}

	private void updateBook2(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		float price = Float.parseFloat(request.getParameter("price"));

		Book book2 = new Book(id, title, author, price);
		bookDAO.updateBook2(book2);
		response.sendRedirect("list");
	}

	private void deleteBook2(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		Book book2 = new Book(id);
		bookDAO.deleteBook2(book2);
		response.sendRedirect("list");

	}

}
