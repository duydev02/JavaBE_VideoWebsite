package com.poly.service.Impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDao;
import com.poly.dao.impl.HistoryDaoImpl;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl implements HistoryService {

	private HistoryDao dao;
	private VideoService videoService = new VideoServiceImpl();

	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}

	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		// TODO Auto-generated method stub
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		History exisHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if (exisHistory == null) {
			exisHistory = new History();
			exisHistory.setUser(user);
			exisHistory.setVideo(video);
			exisHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
			exisHistory.setIsLiked(Boolean.FALSE);
			return dao.create(exisHistory);
		}
		return exisHistory;
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String videoHref) {
		Video video = videoService.findByHref(videoHref);
		History exisstHistory = findByUserIdAndVideoId(user.getId(), video.getId());

		if (exisstHistory.getIsLiked() == Boolean.FALSE) {
			exisstHistory.setIsLiked(Boolean.TRUE);
			exisstHistory.setLikedDate(new Timestamp(System.currentTimeMillis()));
		} else {
			exisstHistory.setIsLiked(Boolean.FALSE);
			exisstHistory.setLikedDate(null);
		}
		History updateHistory = dao.update(exisstHistory);
		return updateHistory != null ? true : false;
	}

}
