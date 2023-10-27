package domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SalgradeVO {
		
	private int grade;
	private int losal;
	private int hisal;	
	private int cnt;
	
	@Override
	public String toString() {
		return String.format("%d등급   ( %d~%d ) - %d명\n"
				,this.grade,this.losal,this.hisal,this.cnt);
	}
	
}//class
