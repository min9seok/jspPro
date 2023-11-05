package domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class EmpVO {
	
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private String hiredate;
//	private Date hiredate;
	private double sal;
	private double comm;
	private int deptno;
//	@Override
	public String toString() {
		return "EmpVO [empno=" + empno + ", ename=" + ename + ", job=" + job + ", mgr=" + mgr + ", hiredate=" + hiredate
				+ ", sal=" + sal + ", comm=" + comm + ", deptno=" + deptno + "]";
	}
	
}//class
