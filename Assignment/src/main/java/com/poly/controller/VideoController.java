package com.poly.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;
import com.poly.service.Impl.HistoryServiceImpl;
import com.poly.service.Impl.VideoServiceImpl;

@WebServlet({ "/video", "/share" })
public class VideoController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		if (path.equals("/share")) {
			doGetShare(req, resp);
		} else {
			String actionParam = req.getParameter("action");
			String href = req.getParameter("id");
			HttpSession session = req.getSession();

			switch (actionParam) {
			case "watch":
				doGetWatch(session, href, req, resp);
				break;
			case "like":
				doGetLike(session, href, req, resp);
				break;
			}
		}
	}

	private void doGetShare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/share.jsp").forward(req, resp);
	}

	private void doGetWatch(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);

		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);

		if (currentUser != null) {
			History history = historyService.create(currentUser, video);
			req.setAttribute("flagLikedBtn", history.getIsLiked());
		}

		req.getRequestDispatcher("/views/user/video_detail.jsp").forward(req, resp);
	}

	private void doGetLike(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json");
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		boolean result = historyService.updateLikeOrUnlike(currentUser, href);
		if (result == true) {
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}
	}

//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession();
//		String path = req.getServletPath();
//		switch (path) {
//		case "/share":
//			doPostShare(session, req, resp);
//			break;
//		}
//	}
//
//	private void doPostShare(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//
//		resp.sendRedirect("login");
//	}

}
