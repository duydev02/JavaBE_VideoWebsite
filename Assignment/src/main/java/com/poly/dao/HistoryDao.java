package com.poly.dao;

import java.util.List;

import com.poly.entity.History;

public interface HistoryDao {
	List<History> findByUser(String username);
	List<History> findByUserAndIsLiked(String username);
	History findByUserIdAndVideoId(Integer userId, Integer videoId);
	History create(History entity);
	History update(History entity);
}
