package member.persistence;

import java.sql.Connection;
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
public class MemberDAOImpl implements MemberDAO {

	private Connection conn = null;	
	
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
	public MemberDTO logon(String id, String pwd) throws Exception {
		String sql = "SELECT name, id, pwd, email "
				+ " FROM board_member "
				+ " WHERE id = ? "
				+ " AND pwd = ? ";							
					
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<MemberDTO> list = null;			
		MemberDTO vo = null;			
		String name;
		String email;	
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = MemberDTO.builder()						
						.name(rs.getString("name"))
						.id(rs.getString("id"))
						.pwd(rs.getString("pwd"))
						.email(rs.getString("email")).build();
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
		return vo;		
	}

	@Override
	public int logonchk(String id, String pwd) throws Exception {
		String sql = "SELECT count(*) cnt "
				+ " FROM board_member "
				+ " WHERE id = ? "
				+ " AND pwd = ? ";												
		ResultSet rs = null;
		PreparedStatement pstmt = null;						
		int rowCount=0;		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rowCount = rs.getInt(1);					
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
		return rowCount;
	}

}
