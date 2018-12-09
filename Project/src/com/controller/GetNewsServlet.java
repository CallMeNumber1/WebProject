package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.News;
import com.google.gson.Gson;
import com.service.NewsService;
import com.service.ServiceFactory;

/**
 * Servlet implementation class GetNewsServlet
 */
@WebServlet("/GetNewsServlet")
public class GetNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsService newsService = ServiceFactory.getNewsService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String type = request.getParameter("type");
		//System.out.println("query之前");
		if (type != null && "query".equals(type)) {
			//System.out.println("query");
            try {
                this.query(request, response, newsService);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
//		// 获取指定ID用户的详细信息
//		int id = Integer.parseInt(request.getParameter("nid"));
//		News news = newsService.getNews(id);
//		request.setAttribute("news", news);
//		request.getRequestDispatcher("/WEB-INF/jsp/detail.jsp")
//		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("enter post");
		doGet(request, response);
	}
	public void query(HttpServletRequest request, HttpServletResponse response, NewsService service)
            throws Exception {
        Integer id = Integer.parseInt(request.getParameter("id"));
        News news = newsService.getNews(id);
        Gson gson = new Gson();
        String json = gson.toJson(news);
        System.out.println(json);
        response.getWriter().write(json);
    }

}
