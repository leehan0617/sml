package com.sml.baseball.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sml.baseball.dao.BaseballDao;
	
	@Service
	public class BaseballServiceImpl implements BaseballService{
		private Logger logger = Logger.getLogger(BaseballServiceImpl.class.getName());
		@Autowired
		private BaseballDao dao;
}

