package com.service;

import java.util.List;
import com.entity.*;
public interface NewsService {
	/**
	 * 查询全部新闻
	 * @return
	 */
	public List<News> listNews();
	/**
	 * 添加新闻
	 * @param user
	 */
	public void addNews(News news);
	/**
	 * 更新新闻
	 * @param user
	 * @return
	 */
	public void updateNews(News news);

	/**
	 * 基于ID获取指定新闻
	 * @param id
	 * @return
	 */
	public News getNews(int id);
	/**
	 * 基于ID删除指定新闻
	 */
	public void deleteNews(int id);
	/**
	 * 从数据库按日期降序取出5条新闻
	 * @return
	 */
	public List<News> listFiveNews();
}
