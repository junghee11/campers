package com.javalec.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.dto.cartDto;
import com.javalec.ex.dto.itemDto;
import com.javalec.ex.dto.jjimDto;
import com.javalec.ex.dto.memberDto;
import com.javalec.ex.dto.reviewDto;

public class myDao {
	
	DataSource datasource;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static myDao instance = new myDao();
	
	public static myDao getInstance() {
		return instance;
	}
	
	int ri = 0;
	public int ttl = 0;
//	public final int MEMBER_NONEXISTENT = 0;
//	public final int MEMBER_EXISTENT = 1;
//	
//	public final int MEMBER_JOIN_FAIL = 0;
//	public final int MEMBER_JOIN_SUCCESS = 1;

	public final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public final int MEMBER_LOGIN_SUCCESS = 1;
	public final int MEMBER_LOGIN_IS_NOT = -1;
	
	private Connection getConnection() {
		try {
			Context ctx;
			ctx = new InitialContext();
			datasource = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			conn = datasource.getConnection();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int insertMember(memberDto dto) {
		try {
			conn = getConnection();
			String sql = "insert into member(id, pw, name, addr, phone) values(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getPhone());
			
			pstmt.executeUpdate();
			ri = 1;
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	//수정페이지 개인정보 불러올때
	public memberDto getMember(String id) {
		memberDto dto = null;
		
		try {
			conn = getConnection();
			String sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new memberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setPhone(rs.getString("phone"));
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public int updateMember(String pw, String name, String addr, String phone, String id) {
		try {
			conn = getConnection();
			String sql = "update member set pw=?, name=?, addr=?, phone=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, addr);
			pstmt.setString(4, phone);
			pstmt.setString(5, id);
			
			pstmt.executeUpdate();
			ri = 1;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public void deleteMember(String id) {
		try {
			conn = getConnection();
			String sql = "delete from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public int loginCheck(String id, String pw) {
		String dbPw;
		try {
			conn = getConnection();
			String sql = "select pw from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbPw = rs.getString("pw");
				if(dbPw.equals(pw)) {
					ri = MEMBER_LOGIN_SUCCESS;
				} else {
					ri = MEMBER_LOGIN_PW_NO_GOOD;
				}
			} else {
				ri = MEMBER_LOGIN_IS_NOT;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	public int joinCheck(String id) {
		try {
			conn = getConnection();
			String sql = "select id from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ri = 1;
			} else {
				ri = 0;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	//아이디찾기, 비밀번호찾기
	public memberDto findId(String name, String phone) {
		
		memberDto dto = null;
		
		try {
			conn = getConnection();
			String sql = "select * from member where name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new memberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setPhone(rs.getString("phone"));
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	public memberDto findPw(String name, String id) {
		
		memberDto dto = null;
		
		try {
			conn = getConnection();
			String sql = "select * from member where name=? and id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new memberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setPhone(rs.getString("phone"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public ArrayList<reviewDto> list() {
		ArrayList<reviewDto> dtos = new ArrayList<reviewDto>();
		try {
			conn = getConnection();
			
			String sql = "select review_idx, rName, rTitle, rContent, rDate, rHit, rGroup, rStep, rIndent from review order by rGroup desc, rStep asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //executeQuery = select문, executeUpdate = insert, update, delete문
			while(rs.next()) {
				int review_idx= rs.getInt("review_idx");
				String rName= rs.getString("rName"); //작성자id
				String rTitle= rs.getString("rTitle"); //제품명
				String rContent= rs.getString("rContent");
				Timestamp rDate= rs.getTimestamp("rDate");
				int rHit= rs.getInt("rHit");
				int rGroup= rs.getInt("rGroup");
				int rStep= rs.getInt("rStep");
				int rIndent= rs.getInt("rIndent");
				
				reviewDto dto = new reviewDto(review_idx, rName, rTitle, rContent, rDate, rHit, rGroup, rStep, rIndent);
				dtos.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
	}
	public ArrayList<reviewDto> myreview(String strID) {
		ArrayList<reviewDto> dtos = new ArrayList<reviewDto>();
		try {
			conn = getConnection();
			
			String sql = "select review_idx, rName, rTitle, rContent, rDate, rHit, rGroup, rStep, rIndent from review where rName=? order by rGroup desc, rStep asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strID);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int review_idx= rs.getInt("review_idx");
				String rName= rs.getString("rName"); //작성자id
				String rTitle= rs.getString("rTitle"); //제품명
				String rContent= rs.getString("rContent");
				Timestamp rDate= rs.getTimestamp("rDate");
				int rHit= rs.getInt("rHit");
				int rGroup= rs.getInt("rGroup");
				int rStep= rs.getInt("rStep");
				int rIndent= rs.getInt("rIndent");
				
				reviewDto dto = new reviewDto(review_idx, rName, rTitle, rContent, rDate, rHit, rGroup, rStep, rIndent);
				dtos.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
	}
	public ArrayList<cartDto> mycart(String strID) {
		ArrayList<cartDto> dtos = new ArrayList<cartDto>();
		try {
			conn = getConnection();
			
			String sql = "select cart.item_idx, pName, amount, price, imgLink from cart join item on cart.item_idx = item.item_idx where mem_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strID);
			
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				int item_idx = rs.getInt("item_idx");
				String pName = rs.getString("pName");
				int amount = rs.getInt("amount");
				int price = rs.getInt("price");
				String imgLink = rs.getString("imgLink");
				ttl += price*amount;
				
				cartDto dto = new cartDto(item_idx, pName, amount, price, imgLink);
				dtos.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
	}
	public ArrayList<itemDto> myjjim(String strID) {
		ArrayList<itemDto> dtos = new ArrayList<itemDto>();
		try {
			conn = getConnection();
			
			String sql = "select jjim.item_idx, pName, price, imgLink from jjim join item on jjim.item_idx = item.item_idx where mem_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strID);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int item_idx= rs.getInt("item_idx");
				String pName= rs.getString("pName");
				int price= rs.getInt("price");
				String imgLink= rs.getString("imgLink");
				
				itemDto dto = new itemDto(item_idx, pName, price, imgLink);
				dtos.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
	}
	//미구현
	public ArrayList<reviewDto> myorder(String strID) {
		ArrayList<reviewDto> dtos = new ArrayList<reviewDto>();
		try {
			conn = getConnection();
			
			String sql = "select review_idx, rName, rTitle, rContent, rDate, rHit, rGroup, rStep, rIndent from review where rName=? order by rGroup desc, rStep asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strID);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int review_idx= rs.getInt("review_idx");
				String rName= rs.getString("rName"); //작성자id
				String rTitle= rs.getString("rTitle"); //제품명
				String rContent= rs.getString("rContent");
				Timestamp rDate= rs.getTimestamp("rDate");
				int rHit= rs.getInt("rHit");
				int rGroup= rs.getInt("rGroup");
				int rStep= rs.getInt("rStep");
				int rIndent= rs.getInt("rIndent");
				
				reviewDto dto = new reviewDto(review_idx, rName, rTitle, rContent, rDate, rHit, rGroup, rStep, rIndent);
				dtos.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
	}
	public reviewDto contentView(String strID) {
		upHit(strID);
		reviewDto dto = null;
		try {
			conn = getConnection();
			String sql = "select * from review where review_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strID);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int review_idx= rs.getInt("review_idx");
				String rName= rs.getString("rName"); //작성자id
				String rTitle= rs.getString("rTitle"); //제품명
				String rContent= rs.getString("rContent");
				Timestamp rDate= rs.getTimestamp("rDate");
				int rHit= rs.getInt("rHit");
				int rGroup= rs.getInt("rGroup");
				int rStep= rs.getInt("rStep");
				int rIndent= rs.getInt("rIndent");
				
				dto = new reviewDto(review_idx, rName, rTitle, rContent, rDate, rHit, rGroup, rStep, rIndent);
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	private void upHit(String review_idx) {
		try {
			conn = getConnection();
			String sql = "update review set rHit= rHit+1 where review_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review_idx);
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void modifyReview(String review_idx, String rContent) {
		try {
			conn = getConnection();
			String sql = "update review set rContent = ? where review_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rContent);
			pstmt.setString(2, review_idx);
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void writeReview(String rName, String rTitle, String rContent) {
		try {
			conn = getConnection();
			String sql = "insert into review(review_idx, rName, rTitle, rContent, rHit, rGroup, " + 
			"rStep, rIndent) values(nextval('review'), ?, ?, ?, 0, currval('review'), 0, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rName);
			pstmt.setString(2, rTitle);
			pstmt.setString(3, rContent);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	

	public void reply(String review_idx, String rName, String rTitle, String rContent, String rStep, String rGroup, String rIndent) {
		replyShape(rGroup, rStep);
		try {
			conn = getConnection();
			String sql = "insert into review(review_idx, rName, rTitle, rContent, rHit, rGroup, " + 
					"rStep, rIndent) values(nextval('review'), ?, ?, ?, 0, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rName);
			pstmt.setString(2, rTitle);
			pstmt.setString(3, rContent);
			pstmt.setInt(4, Integer.parseInt(rGroup));
			pstmt.setInt(5, Integer.parseInt(rStep)+1);
			pstmt.setInt(6, Integer.parseInt(rIndent)+1);
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	private void replyShape(String rGroup, String rStep) {
		try {
			conn = getConnection();
			String sql = "update review set rStep=rStep+1 where rGroup=? and rStep>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(rGroup));
			pstmt.setInt(2, Integer.parseInt(rStep));
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void deleteReview(String review_idx) {
		try {
			conn = getConnection();
			String sql = "delete from review where review_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(review_idx));
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<itemDto> itemList(String kind, String orderBy) {
		ArrayList<itemDto> dtos = new ArrayList<itemDto>();
		try {
			String sql = "";
			conn = getConnection();
			switch(orderBy) {
			case "" : 
				sql = "select item.item_idx, category, pName, pContent, price, sellCount, imgLink, (select count(*) from jjim where jjim.item_idx = item.item_idx) jjim, date from item where category like ? order by date asc";
				break;
			case "date" : 
				sql = "select item.item_idx, category, pName, pContent, price, sellCount, imgLink, (select count(*) from jjim where jjim.item_idx = item.item_idx) jjim, date from item where category like ? order by date asc";
				break;
			case "sell" : 
				sql = "select item.item_idx, category, pName, pContent, price, sellCount, imgLink, (select count(*) from jjim where jjim.item_idx = item.item_idx) jjim, date from item where category like ? order by SellCount desc";
				break;
			case "jjim" : 
				sql = "select item.item_idx, category, pName, pContent, price, sellCount, imgLink, (select count(*) from jjim where jjim.item_idx = item.item_idx) jjim, date from item where category like ? order by jjim asc";
				break;
			case "low" : 
				sql = "select item.item_idx, category, pName, pContent, price, sellCount, imgLink, (select count(*) from jjim where jjim.item_idx = item.item_idx) jjim, date from item where category like ? order by price asc";
				break;
			case "high" : 
				sql = "select item.item_idx, category, pName, pContent, price, sellCount, imgLink, (select count(*) from jjim where jjim.item_idx = item.item_idx) jjim, date from item where category like ? order by price desc";
				break;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+kind); // chip == category
			
			rs = pstmt.executeQuery(); //executeQuery = select문, executeUpdate = insert, update, delete문
			while(rs.next()) {
				int item_idx= rs.getInt("item_idx");
				String category= rs.getString("category"); //작성자id
				String pName= rs.getString("pName"); //제품명
				String pContent= rs.getString("pContent");
				int price = rs.getInt("price");
				int sellCount = rs.getInt("sellCount");
				String imgLink = rs.getString("imgLink");
				int jjim = rs.getInt("jjim");
				
				itemDto dto = new itemDto(item_idx, category, pName, pContent, price, sellCount, imgLink, jjim);
				dtos.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
	}
	
	public itemDto itemView(String mem_id, String strID) {
		//upHit(strID);
		itemDto dto = null;
		try {
			conn = getConnection();
			String sql = "select *, (select count(*) from jjim where mem_id = ? && item_idx = ? ) jjim from item where item_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, strID);
			pstmt.setString(3, strID);
			System.out.println(mem_id);
			System.out.println(strID);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int item_idx = rs.getInt("item_idx");
				String category = rs.getString("category"); //작성자id
				String pName = rs.getString("pName"); //제품명
				String pContent= rs.getString("pContent");
				int price = rs.getInt("price");
				int sellCount = rs.getInt("sellCount");
//				int pickCount = rs.getInt("pickCount");
				String imgLink = rs.getString("imgLink");
				int jjim = rs.getInt("jjim");
				
				dto = new itemDto(item_idx, category, pName, pContent, price, sellCount, imgLink, jjim);
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	//2022.05.17 만들다가 맘, 밑에 주문이랑 같이하기
	private void upSellCount(String item_idx) {
		try {
			conn = getConnection();
			String sql = "update item set sellCount = sellCount+1 where item_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item_idx);
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void orderProduct(String mem_id, String item_idx, int amount, int total_amount) {
		upSellCount(item_idx);
		try {
			conn = getConnection();
			String sql = "insert into ordertbl(mem_id, item_idx, quantity, total_amount) values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, item_idx);
			pstmt.setInt(3, amount);
			pstmt.setInt(4, total_amount);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	///item 추가, 삭제, 수정 완성해야함!!
	public void insertItem(int item_idx, String category, String pName, String pContent, int price, String imgLink) {
		try {
			conn = getConnection();
			String sql = "insert into item(item_idx, category, pName, pContent, price, sellCount, " + 
			"imgLink) values(?, ?, ?, ?, ?, 0, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item_idx);
			pstmt.setString(2, category);
			pstmt.setString(3, pName);
			pstmt.setString(4, pContent);
			pstmt.setInt(5, price);
			pstmt.setString(6, imgLink);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void deleteItem(int item_idx) {
		try {
			conn = getConnection();
			String sql = "delete from item where item_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item_idx);
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public void modifyItem(String pName, String pContent, int price, String imgLink, int item_idx) {
		try {
			conn = getConnection();
			String sql = "update item set pName = ?, pContent = ?, price = ?, imgLink = ? where item_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pName);
			pstmt.setString(2, pContent);
			pstmt.setInt(3, price);
			pstmt.setString(4, imgLink);
			pstmt.setInt(5, item_idx);
			pstmt.executeUpdate();
			
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public void insertCart(String mem_id, String item_idx, String amount) {
		try {
			conn = getConnection();
			String sql = "insert into cart(mem_id, item_idx, amount) values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, Integer.parseInt(item_idx));
			pstmt.setInt(3, Integer.parseInt(amount));
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void updateCart(String cart_idx) {
		try {
			conn = getConnection();
			String sql = "update cart set purchase='결제완료' where cart_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart_idx);
//			pstmt.setInt(2, Integer.parseInt(item_idx));
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void doJjim(String mem_id, String item_idx) {
		try {
			conn = getConnection();
			String sql = "select * from jjim where mem_id=? and item_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, Integer.parseInt(item_idx));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String sql2 = "delete from jjim where mem_id=? and item_idx=?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, mem_id);
				pstmt.setInt(2, Integer.parseInt(item_idx));
				pstmt.executeUpdate();
			} else {
				String sql3 = "insert into jjim(mem_id, item_idx) values(?, ?)";
				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, mem_id);
				pstmt.setInt(2, Integer.parseInt(item_idx));
				pstmt.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
