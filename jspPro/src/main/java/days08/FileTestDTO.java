package days08;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileTestDTO {
	// fileds  == table column name
	   private int num;                             // 번호
	   private String subject;                 // 제목
	   private String filesystemname;    // 시스템파일명
	   private String originalfilename;     // 오리지널파일명
	   private long filelength;                    // 파일크기
}
