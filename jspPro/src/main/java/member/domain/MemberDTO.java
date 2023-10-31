package member.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
@Data
@AllArgsConstructor
@Builder
public class MemberDTO {

	private String name;
	private String id;
	private String pwd;
	private String email;	
}
