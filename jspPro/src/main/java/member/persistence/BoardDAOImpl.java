package member.persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import member.domain.BoardDTO;
import member.domain.MemberDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class BoardDAOImpl implements BoardDAO {

	private Connection conn = null;	
	//	private PreparedStatement pstmt = null;
	@Override
	public ArrayList<BoardDTO> select(int currentPage, int numberPerPage) throws Exception {
		int begin = (currentPage-1)*numberPerPage+1;
		int end = begin+numberPerPage-1;
		String sql = "SELECT * "
				+ "FROM ( "
				+ "        SELECT ROWNUM no, t.* "
				+ "        FROM (  "
				+ "                SELECT seq,  writer, email, title, readed , writedate "
				+ "                FROM tbl_cstvsboard "
				+ "                ORDER BY seq DESC "
				+ "        ) t "
				+ ")  b "
				+ "WHERE b.no BETWEEN ? AND ? ";		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<BoardDTO> list = null;			
		BoardDTO vo = null;		
		int seq;
		String writer;			
		String email;
		String title;
		Date writedate;
		int readed;					
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,begin);
			pstmt.setInt(2,end);;
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {	
					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");
					vo = BoardDTO.builder()
							.seq(seq)
							.writer(writer)
							.email(email)
							.title(title)
							.writedate(writedate)
							.readed(readed).build();
					list.add(vo);
				} while (rs.next());			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return list;		
	}

	@Override
	public ArrayList<BoardDTO> select() throws Exception {
		String sql = "SELECT seq, title,writer, email, writedate, readed "
				+ "FROM tbl_cstvsboard "				
				+ "order by seq desc ";		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<BoardDTO> list = null;			
		BoardDTO vo = null;		
		int seq;
		String writer;			
		String email;
		String title;
		Date writedate;
		int readed;					
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {	
					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");
					vo = BoardDTO.builder()
							.seq(seq)
							.writer(writer)
							.email(email)
							.title(title)
							.writedate(writedate)
							.readed(readed).build();
					list.add(vo);
				} while (rs.next());			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return list;
	}

	@Override
	public int insert(BoardDTO dto) throws Exception {
		int rowCount = 0;
		String sql = 
				"INSERT INTO tbl_cstvsboard ( seq, writer, pwd, email, title, tag, content ) "
						+ " VALUES (SEQ_TBL_CSTVSBOARD.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = null;

		pstmt = this.conn.prepareStatement(sql);	
		pstmt.setString(1,  dto.getWriter() );
		pstmt.setString(2,  dto.getPwd() );
		pstmt.setString(3,  dto.getEmail() );
		pstmt.setString(4,  dto.getTitle() );
		pstmt.setInt(5, dto.getTag());
		pstmt.setString(6,  dto.getContent() );
		rowCount = pstmt.executeUpdate();	         		
		pstmt.close();			
		return rowCount;				
	}

	@Override
	public void increaseReaded(int seq) throws Exception {	
		String sql = "UPDATE TBL_CSTVSBOARD "
				+ "SET readed = readed +1 "
				+ "WHERE seq = ? ";
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1,seq);
		pstmt.executeUpdate();
		pstmt.close();
	}

	@Override
	public BoardDTO view(int seq) throws Exception {
		String sql = "SELECT seq,writer,email,title,readed,writedate,content "
				+ "FROM TBL_CSTVSBOARD "
				+ "WHERE seq = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = this.conn.prepareStatement(sql);		
		pstmt.setInt(1,seq);
		BoardDTO dto = null;
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto = BoardDTO.builder()
					.seq(seq)
					.writer(rs.getString("writer"))
					.email(rs.getString("email"))
					.title(rs.getString("title"))
					.readed(rs.getInt("readed"))
					.writedate(rs.getDate("writedate"))
					.content(rs.getString("content")).build();
		}
		rs.close();
		pstmt.close();
		return dto;
	}

	@Override
	public int delete(int seq) throws Exception {
		int rowCount = 0;
		String sql = "DELETE FROM TBL_CSTVSBOARD "				
				+ "WHERE seq = ?";
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1,seq);

		rowCount = pstmt.executeUpdate();
		pstmt.close();
		return rowCount;

	}

	@Override
	public int update(BoardDTO dto) throws Exception {
		int rowCount =0;

		String sql = "UPDATE tbl_cstvsboard "
				+ "SET email =?, title=?, content=? "
				+ "WHERE seq = ? AND pwd = ? ";
		PreparedStatement pstmt = this.conn.prepareStatement(sql);
		pstmt.setString(1, dto.getEmail());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setInt(4, dto.getSeq());
		pstmt.setString(5, dto.getPwd());
//		System.out.println(sql);
		rowCount = pstmt.executeUpdate();

		pstmt.close();
		return rowCount;
	}

	@Override
	public ArrayList<BoardDTO> search(int searchCondition, String searchWord) throws Exception {
		String sql = "SELECT seq, title,writer, email, writedate, readed "
				+ "FROM tbl_cstvsboard ";
		switch (searchCondition) {
		case 1: //제목
			sql += "WHERE REGEXP_LIKE(title,?,'i') ";
			break;
		case 2: //내용
			sql += "WHERE REGEXP_LIKE(content,?,'i') ";
			break;
		case 3: //작성자
			sql += "WHERE REGEXP_LIKE(writer,?,'i') ";
			break;
		case 4: //제목+내용
			sql += "WHERE REGEXP_LIKE(title,?,'i') OR  REGEXP_LIKE(content,?,'i') ";
			break;		
		}
		sql+= "order by seq desc ";		
		System.out.println(sql);
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<BoardDTO> list = null;			
		BoardDTO vo = null;		
		int seq;
		String writer;			
		String email;
		String title;
		Date writedate;
		int readed;					
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,searchWord);
			if(searchCondition==4) {			
				pstmt.setString(2,searchWord);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {	
					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");
					vo = BoardDTO.builder()
							.seq(seq)
							.writer(writer)
							.email(email)
							.title(title)
							.writedate(writedate)
							.readed(readed).build();
					list.add(vo);
				} while (rs.next());			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return list;
	}

	@Override
	public ArrayList<BoardDTO> search(int currentPage, int numberPerPage, int searchCondition, String searchWord) {
		int begin = (currentPage-1)*numberPerPage+1;
		int end = begin+numberPerPage-1;
		String sql = "SELECT * "
				+ "FROM ( "
				+ "        SELECT ROWNUM no, t.* "
				+ "        FROM (  "
				+ "                SELECT seq,  writer, email, title, readed , writedate "
				+ "                FROM tbl_cstvsboard ";
		switch (searchCondition) {
		case 1: //제목
			sql += "WHERE REGEXP_LIKE(title,?,'i')";
			break;
		case 2: //내용
			sql += "WHERE REGEXP_LIKE(content,?,'i') ";
			break;
		case 3: //작성자
			sql += "WHERE REGEXP_LIKE(writer,?,'i') ";
			break;
		case 4: //제목+내용
			sql += "WHERE REGEXP_LIKE(title,?,'i') OR  REGEXP_LIKE(content,?,'i') ";
			break;		
		}
		sql += "                ORDER BY seq DESC "
				+ "        ) t "
				+ ")  b "
				+ "WHERE b.no BETWEEN ? AND ? ";			
		System.out.println(sql);
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<BoardDTO> list = null;			
		BoardDTO vo = null;		
		int seq;
		String writer;			
		String email;
		String title;
		Date writedate;
		int readed;					
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,searchWord);			
			if(searchCondition==4) {			
				pstmt.setString(2,searchWord);
				pstmt.setInt(3,begin);
				pstmt.setInt(4,end);
			}else {
				pstmt.setInt(2,begin);
				pstmt.setInt(3,end);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {	
					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");
					vo = BoardDTO.builder()
							.seq(seq)
							.writer(writer)
							.email(email)
							.title(title)
							.writedate(writedate)
							.readed(readed).build();
					list.add(vo);
				} while (rs.next());			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return list;
	}	
	@Override
	public int gettotalRecords() throws Exception {
		int totalRecords = 0;
		String sql = "SELECT COUNT(*) FROM TBL_CSTVSBOARD ";								
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = null;
		rs = pstmt.executeQuery();
		if(rs.next())totalRecords = rs.getInt(1);
		rs.close();
		pstmt.close();
		return totalRecords;
	}

	@Override
	public int gettotalPages(int numberPerPage) throws Exception {
		int totalPages = 0;
		String sql = "SELECT CEIL(COUNT(*)/?) "
				+ "FROM TBL_CSTVSBOARD ";								
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1,numberPerPage);
		ResultSet rs = null;
		rs = pstmt.executeQuery();
		if(rs.next())totalPages = rs.getInt(1);
		rs.close();
		pstmt.close();
		return totalPages;

	}

	@Override
	public int gettotalPages(int numberPerPage, int searchCondition, String searchWord) throws Exception {		
		int totalPages = 0;
		String sql = "SELECT CEIL(COUNT(*)/?) "
				+ "FROM TBL_CSTVSBOARD ";
		switch (searchCondition) {
		case 1: //제목
			sql += "WHERE REGEXP_LIKE(title,?,'i')";
			break;
		case 2: //내용
			sql += "WHERE REGEXP_LIKE(content,?,'i') ";
			break;
		case 3: //작성자
			sql += "WHERE REGEXP_LIKE(writer,?,'i') ";
			break;
		case 4: //제목+내용
			sql += "WHERE REGEXP_LIKE(title,?,'i') OR  REGEXP_LIKE(content,?,'i') ";
			break;		
		}
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1,numberPerPage);
		pstmt.setString(2,searchWord);
		if(searchCondition==4) {						
			pstmt.setString(3,searchWord);
		}
		ResultSet rs = null;
		rs = pstmt.executeQuery();
		if(rs.next())totalPages = rs.getInt(1);
		rs.close();
		pstmt.close();
		return totalPages;
	}

	// 9.
	@Override
	public String getOriginalPwd(int seq) throws Exception {

		String originalPwd = null;

		PreparedStatement pstmt = null;

		String sql = "SELECT pwd "
				+ " FROM tbl_cstvsboard "
				+ " WHERE seq =  ? ";

		pstmt = this.conn.prepareStatement(sql); 
		pstmt.setInt(1, seq);
		ResultSet rs = pstmt.executeQuery()   ;      
		if( rs.next() ) {
			originalPwd = rs.getString("pwd");
		}      
		pstmt.close();
		rs.close();
		return originalPwd;
	}

	@Override
	public int join(MemberDTO dto) throws Exception {
		int rowCount = 0;
		String sql = 
				"INSERT INTO board_member ( name, id, pwd, email ) "
						+ " VALUES (?, ?, ?, ?)";
		PreparedStatement pstmt = null;

		pstmt = this.conn.prepareStatement(sql);	
		pstmt.setString(1,  dto.getName() );
		pstmt.setString(2,  dto.getId() );
		pstmt.setString(3,  dto.getPwd() );
		pstmt.setString(4,  dto.getEmail() );
		System.out.println(sql);
		rowCount = pstmt.executeUpdate();
		System.out.println(rowCount);
		pstmt.close();			
		return rowCount;				
	}

	@Override
	public ArrayList<MemberDTO> logon(MemberDTO dto) throws Exception {
		int rowCount = 0;
		String sql = "SELECT name, id,pwd, email "
				+ " FROM board_member "
				+ " WHERE id = ? "
				+ " AND pwd = ?";				
					
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<MemberDTO> list = null;			
		MemberDTO vo = null;			
		String name=null;
		String id=null;
		String pwd=null;
		String email=null;
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);;
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {
					name = rs.getString("name");
					id = rs.getString("id");
					pwd = rs.getString("pwd");
					email = rs.getString("email");										
					vo = MemberDTO.builder()
							.name(name)
							.id(id)
							.pwd(pwd)
							.email(email).build();							
					list.add(vo);
				} while (rs.next());			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return list;		
	}

}
