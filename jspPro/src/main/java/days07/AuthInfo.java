package days07;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 인증받은 사용자 정보를 저장할 클래스
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthInfo {
	
	private String id;
	private String name;
	private String authority; // 권한
}
