package member.persistence;

import java.util.ArrayList;

import member.domain.MemberDTO;


public interface MemberDAO {
	
	// 1. 회원가입
	int join(MemberDTO dto) throws Exception;
	
	// 2. 로그인 정보
	ArrayList<MemberDTO> logon(MemberDTO dto) throws Exception;
	
	// 3. 로그인 확인
	int logonchk(String id, String pwd) throws Exception;
	
}
