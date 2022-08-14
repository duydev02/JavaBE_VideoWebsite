package com.poly.service.Impl;

import java.util.List;

import com.poly.dao.StatsDao;
import com.poly.dao.impl.StatsDaoImpl;
import com.poly.dto.VideoLikedInfo;
import com.poly.service.StatsService;

public class StatsServiceImpl implements StatsService {

	private StatsDao statsDao;
	
	public StatsServiceImpl() {
		statsDao = new StatsDaoImpl();
	}
	
	public List<VideoLikedInfo> findVideoLikedInfo() {
		return statsDao.findVideoLikedInfo();
	}

}
