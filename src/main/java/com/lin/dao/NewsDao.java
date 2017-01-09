package com.lin.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lin.entity.NewsEntity;
import com.lin.entity.RectiCheckEntity;
import com.lin.entity.StandardDatabaseEntity;
@Repository
public class NewsDao
{
	@Resource(name="namedParameterJdbcTemplate")
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	private static Logger logger = Logger.getLogger(NewsDao.class);
	public NewsDao()
	{
	}



	public List<NewsEntity> getAll()
	{
		logger.info("["+this.getClass().getName()+"][getAll][start]");
		String sql = "SELECT * from t_news WHERE 1=1 order by fabushijian desc";
		logger.info("["+this.getClass().getName()+"][getAll][SQL]"+sql);
		
		List<NewsEntity>  list = namedParameterJdbcTemplate.getJdbcOperations().query(sql, new BeanPropertyRowMapper(NewsEntity.class));
		
		logger.info("["+this.getClass().getName()+"][getAll][end]");
		return list;
	}
	
	
	public String insert(NewsEntity entity){
		logger.info("["+this.getClass().getName()+"][insert][start]");
		String sql = "insert into t_news values("
				+ "'"+ entity.getId()+"'"
				+ ",'"+ entity.getFabushijian()+"'"
				+ ",'"+ entity.getXinxilaiyuan()+"'"
				+ ",'"+ entity.getZhuangaoren()+"'"
				+ ",'"+ entity.getGuanzhudu()+"'"
				+ ",'"+ entity.getTitle()+"'"
				+ ",'"+ entity.getUrl()+"'"
				+ ")";
		logger.info("["+this.getClass().getName()+"][insert][SQL]"+sql);
		namedParameterJdbcTemplate.getJdbcOperations().update(sql);
		logger.info("["+this.getClass().getName()+"][insert][end]");
		return entity.getId();
	}	
	
	
	public String delete(NewsEntity entity) {
		logger.info("["+this.getClass().getName()+"][delete][start]");
		String sql = "delete from t_news where id ='"+entity.getId()+"'";
	
		logger.info("["+this.getClass().getName()+"][delete][SQL]"+sql);
		namedParameterJdbcTemplate.getJdbcOperations().update(sql);
		logger.info("["+this.getClass().getName()+"][delete][end]");
		return entity.getId();
	}
}
