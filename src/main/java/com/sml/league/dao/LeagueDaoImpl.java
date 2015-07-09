package com.sml.league.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.league.dto.LeagueDto;

@Component
public class LeagueDaoImpl implements LeagueDao{

	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * @함수명:getLeagueList
	 * @작성일:2015. 7. 9.
	 * @작성자:변형린
	 * @설명문:개설 된 리그정보 열람용 데이터베이스연결
	 */
	@Override
	public List<LeagueDto> getLeagueList(String sportType) {				
		return sqlSession.selectList("dao.LeagueMapper.getLeagueList", sportType);
	}

	/**
	 * @함수명:applicate
	 * @작성일:2015. 7. 9.
	 * @작성자:조영석
	 * @설명문:리그신청관리 데이트베이스연결
	 */
	@Override
	public int applicate(String teamId, int leagueCode) {
		int teamCode=sqlSession.selectOne("dao.LeagueMapper.teamSelect", teamId);
		
		HashMap<String,Object> Hmap=new HashMap<String,Object>();
		Hmap.put("teamCode", teamCode);
		Hmap.put("leagueCode", leagueCode);
		
		System.out.println("teamCode"+teamCode);
		
		int value=sqlSession.selectOne("dao.LeagueMapper.leagueJoinSelect",teamCode);
		
		System.out.println("value"+value);
		int check=0;
		
		if(value==0){
			check=sqlSession.insert("dao.LeagueMapper.applicate",Hmap);
		}else if(value>0){
			return 0;
		}


		return check;
	}

}
