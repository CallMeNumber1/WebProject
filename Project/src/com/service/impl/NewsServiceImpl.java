package com.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.entity.News;
import com.service.NewsService;
import com.util.DataSourceUtils;

public class NewsServiceImpl implements NewsService{
	private static Logger logger = Logger.getLogger(NewsServiceImpl.class.getName());
	
	@Override
	public List<News> listNews() {
		String sql = "SELECT * FROM news order by insertTime desc";
		List<News> newsList = new ArrayList<>();
		try(Connection conn = DataSourceUtils.getConnection();
				PreparedStatement st = conn.prepareStatement(sql);
				ResultSet rs = st.executeQuery()) {
				while (rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Date insertTime = rs.getDate("inserttime");
					News news = new News();
					news.setId(id);
					news.setTitle(title);
					news.setContent(content);
					news.setInsertTime(insertTime);
					newsList.add(news);
				}
		} catch (SQLException e) {
			logger.warning(e.getMessage());
		}
		// 是否需要放在finally里
		return newsList;
	}

	@Override
	public void addNews(News news) {
			String sql = "INSERT INTO news(title, content) values(?, ?)";
			try(Connection conn = DataSourceUtils.getConnection();
					PreparedStatement st = conn.prepareStatement(sql)) {
				st.setString(1, news.getTitle());
				st.setString(2, news.getContent());
				st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	@Override
	public void updateNews(News news) {
			int id = news.getId();
			String title = news.getTitle();
			String content = news.getContent();
			String sql = "UPDATE news SET title=?, content=? where id=?";
			try(Connection conn = DataSourceUtils.getConnection();
					PreparedStatement st = conn.prepareStatement(sql)) {
				st.setInt(3, id);
				st.setString(1, title);
				st.setString(2, content);
				st.executeUpdate();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	}

	@Override
	public News getNews(int id) {
		// TODO Auto-generated method stub
				String sql = "SELECT * FROM news where id=?";
				News news = null;
				try(Connection conn = DataSourceUtils.getConnection();
						PreparedStatement st = conn.prepareStatement(sql)) {
					st.setInt(1, id);
					try(ResultSet rs = st.executeQuery()) {
						while (rs.next()) {
							news = new News();
							news.setId(rs.getInt("id"));
							news.setTitle(rs.getString("title"));
							news.setContent(rs.getString("content"));
							news.setInsertTime(rs.getDate("inserttime"));
						}
					}
					// 嵌套try 后面只需要1个catch
		 		} catch(SQLException e) {
					logger.warning(e.getMessage());
				}
				return news;
	}
	@Override
	public void deleteNews(int id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM news where id=?";
		try(Connection conn = DataSourceUtils.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setInt(1, id);
			st.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	@Override
	public List<News> listFiveNews() {
		String sql = "SELECT * FROM news order by insertTime desc limit 5";
		List<News> newsList = new ArrayList<>();
		try(Connection conn = DataSourceUtils.getConnection();
				PreparedStatement st = conn.prepareStatement(sql);
				ResultSet rs = st.executeQuery()) {
				while (rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Date insertTime = rs.getDate("inserttime");
					News news = new News();
					news.setId(id);
					news.setTitle(title);
					news.setContent(content);
					news.setInsertTime(insertTime);
					newsList.add(news);
				}
		} catch (SQLException e) {
			logger.warning(e.getMessage());
		}
		// 是否需要放在finally里
		return newsList;
	}
}
