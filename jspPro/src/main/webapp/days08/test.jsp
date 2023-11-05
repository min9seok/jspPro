<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<!--=========================== Header Start ===========================-->
	<div class="content-header content-header-padding">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h5 class="m-0 text-dark"><i class="fab fa-get-pocket"></i></h5>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">위험성평가</a></li>
						<li class="breadcrumb-item active">위험성평가 등록</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--=========================== Header End ===========================-->
	
	<!--=========================== Contents Start ===========================-->
	<section class="content">
		<div class="container-fluid">

			<!--=========================== Search Area Start ===========================-->
			<div class="card card-success">
				
				<div class="card-body card-padding">
					<form id="srchForm" name="srchForm" method="post" onkeyPress="if (event.keyCode==13){return false;}">
					
						<!--=========================== Button Area End ===========================-->
 					
						<!--=========================== Button Area Start ===========================-->
						<div class="row">
							<div class="col-12">
								    <button type="button" class="btn btn-sm btn-secondary" style="float:right;margin-right:1px;" onclick="javascript: excel();"><i class="fas fa-file-excel"></i> 엑셀</button>
	                                <button type="button" class="btn btn-sm btn-info" style="float:right;margin-right:1px;" onclick="save();"><i class="fas fa-save"></i> 저장</button>
									<button type="button" class="btn btn-sm btn-secondary" style="float:right;margin-right:1px;" onclick="javascript: search();"></i>조회</button>
							</div>
						</div>
						<!--=========================== Button Area End ===========================-->
						
						<div class="space_h">&nbsp;</div>
						
						
						<!--=========================== Input Area Start ===========================-->
				        <!-- ------------------------------- 1 Row ------------------------------ -->
						<div class="form-group form-group-padding row">

							<label for="srch_evl_seq" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label" style="width: 100px;" >평가차수</label>
							<div class="col-sm-2">
								<select class="form-control form-control-sm select2 select2-danger" id="srch_evl_seq" name="srch_evl_seq" data-dropdown-css-class="select2-danger" style="width: 100%;" onchange="javascript: search();">
									<c:choose>
										<c:when test="${fn:length(EVL_SEQ_23)>0}">
											<c:forEach items="${EVL_SEQ_23}" var="row">
												<option value="${row.cd}" >${row.nm}</option>
											</c:forEach>
										</c:when>
									</c:choose>
								</select>
							</div>

							<label for="srch_evl_seq" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label" >회사</label>
							<div class="col-sm-2">
              			        <input type="hidden" name="srch_com_cd" id="srch_com_cd"  />
								<select class="form-control form-control-sm select select-danger" id="sel_com_cd" name="sel_com_cd" data-dropdown-css-class="select-danger" style="width: 200px;" >
									<c:choose>
										<c:when test="${fn:length(COM_CD)>0}">
											<c:forEach items="${COM_CD}" var="row">
												<option value="${row.cd}" >${row.cd} : ${row.nm}</option>
											</c:forEach>
										</c:when>
									</c:choose>
								</select>
							</div>


		                    <label for="srch_dept_nm" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label" style="width: 100px;">사업장</label>
		                    <div class="col-sm-3">
		                    <div class="input-group">
		                      <input type="text" class="form-control form-control-sm" id="srch_dept_nm" name="srch_dept_nm" value="" title="사업장" minlength="1" maxlength="100" placeholder="사업장" onkeyPress="if (event.keyCode==13){findDept5();}" >		                      
		                          <div class="input-group-prepend">
		                              <span class="input-group-text" style="cursor:pointer;" id="srch_dept_findDept5" onclick="javascript: findDept5();">
		                                  <i class="fas fa-search"></i>
		                              </span>
		                              <span class="input-group-text" style="cursor:pointer;" id="srch_dept_clearDept5" onclick="javascript: clearDept5();">
		                                  <i class="fas fa-eraser"></i>
		                              </span>
		                              <input type="text" class="form-control form-control-sm"  style="width: 80px;"  readonly id="srch_dept_cd" name="srch_dept_cd" <%--  value="${sessionScope.member_id.dept_cd}" --%> />		                          </div>
		                        </div>
		                    </div>
 
				  	<label for="srch_biz_kind" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label">업종</label>
							<div class="col-sm-1">
							 <input type="hidden" name="srch_biz_kind" id="srch_biz_kind" /> 
								<select class="form-control form-control-sm select2 select2-danger" id=sel_biz_kind" name="sel_biz_kind" data-dropdown-css-class="select2-danger" style="width: 100%;" onchange="javascript: search();">
									<c:choose>
										<c:when test="${fn:length(BIZ_KIND)>0}">
											<c:forEach items="${BIZ_KIND}" var="row">
												<option value="${row.cd}" >${row.nm}</option>
											</c:forEach>
										</c:when>
									</c:choose>
								</select>
							</div>

				        </div>
				        
					
						<!--=========================== Input Area End ===========================-->
					</form>
				</div>
			</div>
			<!--=========================== Search Area End ===========================-->


			<!--=========================== Master Area Start ===========================-->
			<div class="card card-success">
				<div class="card-body card-padding">
					<form id="mstForm" name="mstForm" method="post" onkeyPress="if (event.keyCode==13){return false;}">
              			<input type="hidden" name="evl_year" id="evl_year"  />
              			<input type="hidden" name="evl_seq" id="evl_seq"  />
              			<input type="hidden" name="com_cd" id="com_cd"  />
              			<input type="hidden" name="dept_cd" id="dept_cd"  />              			              			
              			<input type="hidden" name="stat" id="stat" />
              		    <input type="hidden" name="biz_kind_cd" id="biz_kind_cd" /> 
              			<input type="hidden" name="next_risk" id="next_risk" />
              			<input type="hidden" name="curr_risk" id="curr_risk" />
              			

						<div class="space_h">&nbsp;</div>
						<!--=========================== Input Area Start ===========================-->
				        
				        <!-- ------------------------------- 1 Row ------------------------------ -->
						<div class="form-group form-group-padding row">
							<label for="sch_text" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label">평가담당자</label>
							<div class="col-sm-2">
								<input type="text" class="form-control form-control-sm" id="evl_emp_nm" name="evl_emp_nm" placeholder="평가담당자"  />
							</div>

							<label for="sch_text" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label">참여근로자</label>
							<div class="col-sm-2">
								<input type="text" class="form-control form-control-sm" id="evl_worker_nm" name="evl_worker_nm" placeholder="참여근로자"  />
							</div>

							<label for="sch_text" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label">평가일자</label>
							<div class="col-sm-2">
								<input type="text" class="form-control form-control-sm" id="evl_dt" name="evl_dt"  />
							</div>

							<label for="sch_text" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label">결재상태</label>
							<div class="col-sm-2">
								<input type="text" class="form-control form-control-sm" id="evl_stat" name="evl_stat" placeholder="" readonly />
							</div>


				        </div>
				<input type="checkbox" id ="file_id" name="file_id"> ←외부양식 업로드				
	                <div class="form-group form-group-padding row">
						<label for="edu_att_file_id" id="file1" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label">사전교육결과<br/><a href="/XLS/사전교육일지.xlsx">(양식)</a></label>
	                    <div class="col-sm-2" id="file11">
	                        <!-- bbs_file 필수 파일 업로드 후 bbs_file 설정됨 -->
	                         <input type="hidden" name="edu_att_file_id" id="edu_att_file_id" value="" />
	                         <!-- fileListDiv ID 필수 첨부된 파일 목록과 기능버튼 html loadFileListPage 함수에서 설정 -->
	                         <div id="fileListDiv1" style="width:60%;"></div>
	                         
	                    </div>
	                    <label for="edu_form_file_id" id="file3" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label">회의록<br/><a href="/XLS/회의록.xlsx">(양식)</a></label>
	                    <div class="col-sm-2" id="file33">
	                        <!-- bbs_file 필수 파일 업로드 후 bbs_file 설정됨 -->
	                         <input type="hidden" name="edu_form_file_id" id="edu_form_file_id" value="" />
	                         <!-- fileListDiv ID 필수 첨부된 파일 목록과 기능버튼 html loadFileListPage 함수에서 설정 -->
	                         <div id="fileListDiv3" style="width:60%;"></div>	                         
	                    </div>
	           			<label for="edu_meet_file_id" id="file2" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label">사후교육결과<br/><a href="/XLS/사후교육일지.xlsx">(양식)</a></label>
	                    <div class="col-sm-2" id="file22">
	                        <!-- bbs_file 필수 파일 업로드 후 bbs_file 설정됨 -->
	                         <input type="hidden" name="edu_meet_file_id" id="edu_meet_file_id" value="" />
	                         <!-- fileListDiv ID 필수 첨부된 파일 목록과 기능버튼 html loadFileListPage 함수에서 설정 -->
	                         <div id="fileListDiv2" style="width:60%;"></div>	                         
	                    </div> 
                    					 	 
					<label for="edu_side_file_id" id="file4" class="text-sm text-sm-left text-md-right col-sm-1 col-form-label" style="display:none">외부양식</label>
	                    <div class="col-sm-2" id="file44" style="display:none">
	                        <!-- bbs_file 필수 파일 업로드 후 bbs_file 설정됨 -->
	                         <input type="hidden" name="edu_side_file_id" id="edu_side_file_id" value="" />
	                         <!-- fileListDiv ID 필수 첨부된 파일 목록과 기능버튼 html loadFileListPage 함수에서 설정 -->
	                         <div id="fileListDiv4" style="width:60%;"></div>
	                        
	                    </div>   					        
	            		</div>
						<!--=========================== Input Area End ===========================-->
					</form>
				</div>
			</div>
			<!--=========================== Master Area End ===========================-->
			
			<!--=========================== Grid Area Start ===========================-->
			<div class="card card-success">
				

		         <!-- 버튼영역 -->
		         <div class="row">
		             <div class="col-6">
	        			<h3 class="card-title text-md" id="setGrdTitl" style="padding: 5px 5px 5px 5px;">반납품목</h3>
		             </div>
		             <div class="col-6">
						<button type="button" class="btn btn-sm btn-success" style="float:right;margin-right:1px;" id="btn_gridDel" onclick="javascript: delRow();"><i class="fas fa-minus"></i>항목삭제</button>
						<button type="button" class="btn btn-sm btn-success" style="float:right;margin-right:1px;" id="btn_gridAdd" onclick="javascript: addRow();"><i class="fas fa-plus"></i>빈항목추가</button>
		                <button type="button" class="btn btn-sm btn-warning" style="float:right;margin-right:1px;" id="btn_gridItm" onclick="javascript: bad_factor_popup();"><i class="fas fa-search"></i> 평가항목추가</button>
		             </div>
		         </div>
                 <!-- row 여백 -->
                 <div class="space_h">&nbsp;</div>


				
				<div class="card-header card-padding"></div>
				<div class="card-body" style="padding:0px;">
					<div class="row">
						<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<center>
								<div id="grid_array" style="margin: auto;"></div>
							</center>
						</article>
					</div>
				</div>
			</div>
			<!--=========================== Grid Area End ===========================-->
		</div>
	</section>
	<!--=========================== Contents End ===========================-->
	
	<script type="text/javascript">

	var autoHypenPhone = function(str){
	      str = str.replace(/[^0-9]/g, '');	      
 	      var tmp = '';
 	    if(str.length = 8){
 	    tmp = 	str.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'); 
	          return tmp;
	      }	  
	      return str; 	     	    	    
	}
	
	var evl_dt = document.getElementById('evl_dt');

	evl_dt.onkeyup = function(){
	  console.log(this.value);
	  this.value = autoHypenPhone( this.value ) ;  
	}
		
	//파일첨부 페이지 로딩
	function loadFileListPage1( bbs_file){
	    var loadurl = "/common/fileList.do";
	    loadurl += "?FILE_ID="+bbs_file;  //(필수)
	    loadurl += "&EDIT_YN=Y";    //파일 추가삭제 가능여부(필수)
	    loadurl += "&POPUP_YN=Y";   //팝업여부(필수)
	    $('#fileListDiv1').load(loadurl);
	}
	
 	function loadFileListPage3( bbs_file){
	    var loadurl = "/common/fileList3.do";
	    loadurl += "?FILE_ID3="+bbs_file;  //(필수)
	    loadurl += "&EDIT_YN=Y";    //파일 추가삭제 가능여부(필수)
	    loadurl += "&POPUP_YN=Y";   //팝업여부(필수)
	    $('#fileListDiv3').load(loadurl);
	}
 	
	function loadFileListPage2( bbs_file){
	    var loadurl = "/common/fileList2.do";
	    loadurl += "?FILE_ID2="+bbs_file;  //(필수)
	    loadurl += "&EDIT_YN=Y";    //파일 추가삭제 가능여부(필수)
	    loadurl += "&POPUP_YN=Y";   //팝업여부(필수)
	    $('#fileListDiv2').load(loadurl);
	}
	

	function loadFileListPage4( bbs_file){
	    var loadurl = "/common/fileList4.do";
	    loadurl += "?FILE_ID4="+bbs_file;  //(필수)
	    loadurl += "&EDIT_YN=Y";    //파일 추가삭제 가능여부(필수)
	    loadurl += "&POPUP_YN=Y";   //팝업여부(필수)
	    $('#fileListDiv4').load(loadurl);
	} 
	
	
	
	// 출력
	function print1() {
		
		var url = "/A/A13_Pop.do";
		_openPopupCenter(url, 900, 1000, "A13_Pop");
	}

	
	
	// 출력
	function print2() {
		
		var url = "/A/A14_Pop.do";
		_openPopupCenter(url, 900, 1000, "A14_Pop");
	}
     
	$('input[name="file_id"]').change(function(){		
		var file_id = $("#file_id").prop("checked");
		if(file_id == true){
			$("#file1").hide(); $("#file11").hide();
			$("#file2").hide(); $("#file22").hide();
			$("#file3").hide(); $("#file33").hide();
			$("#file4").show(); $("#file44").show();
		}
		else if(file_id == false){
			$("#file1").show(); $("#file11").show();
			$("#file2").show(); $("#file22").show();
			$("#file3").show(); $("#file33").show();
		    $("#file4").hide(); $("#file44").hide(); 		    		   
		}
		
	});

	
	
	// 마스터 조회
	function search() {		
	    var srch_evl_seq = $('select[name="srch_evl_seq"]').val();//평가차수
	    var srch_com_cd = $('select[name="sel_com_cd"]').val();//회사
	    var srch_dept_cd = $("#srch_dept_cd").val(); //사업장
	    var srch_dept_nm = $("#srch_dept_nm").val(); //사업장명
	    var srch_biz_kind = $('select[name="sel_biz_kind"]').val(); //업종

	    
	    if ( fn_isNull(srch_evl_seq) ) {
	    	alert('평가차수를 선택해 주세요.');
	    	$("#srch_evl_seq").focus();
	    	return;
	    }
	    
	    if ( fn_isNull(srch_com_cd) ) {
	    	alert('회사를 선택해 주세요.');
	    	$("#sel_com_cd").focus();
	    	return;
	    }
	    //alert(srch_biz_kind);
	    $("#srch_com_cd").val(srch_com_cd);
	    $("#srch_biz_kind").val(srch_biz_kind);
	    
/*
	    if ( fn_isNull(srch_dept_cd) ) {
	    	alert('사업장을 선택해 주세요.');
	    	$("#srch_dept_nm").focus();
	    	return;
	    }
*/
/*	    if ( fn_isNull(srch_biz_kind) ) {
	    	alert('업종을 선택해 주세요.');
	    	$("#srch_biz_kind").focus();
	    	return;
	    }
	    if ( fn_isNull(srch_biz_kind) ) {
	    	alert('업종을 선택해 주세요.');
	    	$("#srch_biz_kind").focus();
	    	return;
	    }*/
		//alert('search()');
        var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
		var srchForm = $("#srchForm").serializeObject();
		//alert( 'srchForm : ' + JSON.stringify( srchForm ) )
        
         //post changes to server 
         $.ajax({
        	 type: "POST",
             url: "/A/A11_select.do",
             data: srchForm,             
             success: function (result) {
  				//alert('success');
  				if (fn_isNull(result)) {
  					alert("오류");
  				} else {
  	                //alert("result : " + JSON.stringify( result ) );
  					var data = result.data;
  					//alert("data.length : " + data.length );
  					if ( data.length == 1) {
  						//alert("기 동록된 자료를 불러옵니다.");
  	  					$("#evl_year").val(data[0].evl_year);
  	  					$("#evl_seq").val(data[0].evl_seq);
  	  					$("#com_cd").val(data[0].com_cd);
  	  					$("#dept_cd").val(data[0].dept_cd);
  	  					$("#biz_kind_cd").val(data[0].biz_kind_cd);
  	  					$("#stat").val(data[0].stat);
  						
  	  					$("#evl_emp_nm").val(data[0].evl_emp_nm);
  	  					$("#evl_worker_nm").val(data[0].evl_worker_nm);
  	  					$("#evl_dt").val(data[0].evl_dt);
  	  					$("#evl_stat").val(data[0].evl_stat);
  	  					$("#edu_att_file_id").val(data[0].edu_att_file_id);
  	  				    $("#edu_form_file_id").val(data[0].edu_form_file_id);
  	  					$("#edu_meet_file_id").val(data[0].edu_meet_file_id);  	  					
  	  					$("#edu_side_file_id").val(data[0].edu_side_file_id);
  	  					/*
  					} else {
  	  					$("#evl_emp_nm").val("");
  	  					$("#evl_worker_nm").val("");
  	  					$("#evl_dt").val("");
  	  					$("#evl_stat").val("");
  	  					$("#edu_att_file_name").val("");
  	  					$("#edu_meet_file_name").val("");
  	  					*/
  					}
  					
  		            var fileId1 = data[0].evl_year + "_" + data[0].evl_seq + "_" + data[0].com_cd + "_" + data[0].dept_cd + "_" + data[0].biz_kind_cd + "_1"  ; 
                    loadFileListPage1( fileId1 );

                    var fileId3 = data[0].evl_year + "_" + data[0].evl_seq + "_" + data[0].com_cd + "_" + data[0].dept_cd + "_" + data[0].biz_kind_cd + "_3"  ; 
                    loadFileListPage3( fileId3 );
                    
  		            var fileId2 = data[0].evl_year + "_" + data[0].evl_seq + "_" + data[0].com_cd + "_" + data[0].dept_cd + "_" + data[0].biz_kind_cd + "_2"  ; 
                    loadFileListPage2( fileId2 );
                                   
                    var fileId4 = data[0].evl_year + "_" + data[0].evl_seq + "_" + data[0].com_cd + "_" + data[0].dept_cd + "_" + data[0].biz_kind_cd + "_4"  ; 
                    loadFileListPage4( fileId4 ); 
  					//그리드 조회
  					search_Dtl();
	  				
                    //평가차수, 사업장, 업종
  				    //$("#evl_seq").val( srchForm.srch_evl_seq );
 	  				//$("#dept_cd").val( srchForm.srch_dept_cd );
 	  				//$("#biz_kind").val( srchForm.srch_biz_kind );
 	  				
 	  				

  				}

             },
             error:function( jqXHR, textStatus, errorThrown ){
  				alert('error');
                 //세션이나 쿠키가 없을 때는 WebLoginInterceptor 에서 401 에러 발생
                 if ( jqXHR.status == '401') {
                     parent.location = "/common/login.do";
                 }
                 else {
                     alert("ERR="+'HTTP status code: ' + jqXHR.status + '\n' + 'textStatus: ' + textStatus + '\n' + 'errorThrown: ' + errorThrown);
                     console.log('HTTP message body (jqXHR.responseText): ' + '\n' + jqXHR.responseText);    
                 }
             },
             complete: function () {
   				 //alert('complete');
                 grid.hideLoading();
             }
         });
    }
    
		
	
	// 평가목록  조회
	function search_Dtl() {
		$("#grid_array").pqGrid("option", "dataModel.postData", $("#srchForm").serializeObject());
		//alert(JSON.stringify($("#srchForm").serializeObject()));
		$("#grid_array").pqGrid("refreshDataAndView");
	}
	
	//화면 처음 접속시 조회를 막기위한 데이터 생성
	function makeFstParam(){
		var data = {};
		//data = {sch_text: "조회하지마라!!!@@@!!!", auth_group_id: "", out_yn: "", srch_dept_id: ""};
		/* data = { sch_trgt_fr: Number(moment( new Date()).format('YYYY')) -1
			   , sch_trgt_to: Number(moment( new Date()).format('YYYY')) +1
			   , sch_stat: ""
			   }; */
		return data;
	}
	
	
	
	
	// 추가
	function addRow() {
		
	    var srch_evl_seq = $('select[name="srch_evl_seq"]').val();//평가차수
	    var srch_com_cd = $('select[name="sel_com_cd"]').val();//회사
	    var srch_dept_cd = $("#srch_dept_cd").val(); //사업장
	    var srch_dept_nm = $("#srch_dept_nm").val(); //사업장명
	    var srch_biz_kind = $('select[name="sel_biz_kind"]').val(); //업종
	    
	    var stat     = $("#stat").val(); //평가상태 
	    var evl_stat = $("#evl_stat").val(); //결재상태 
	    
	    var evl_emp_nm = $("#evl_emp_nm").val(); //평가담당자
	    var evl_worker_nm = $("#evl_worker_nm").val(); //참여근로자

	    if ( fn_isNull(srch_evl_seq) ) {
	    	alert('평가차수를 선택해 주세요.');
	    	$("#srch_evl_seq").focus();
	    	return;
	    }
	    
	    if ( fn_isNull(srch_com_cd) ) {
	    	alert('회사를 선택해 주세요.');
	    	$("#sel_com_cd").focus();
	    	return;
	    }
	    $("#srch_com_cd").val(srch_com_cd);
	    if ( fn_isNull(srch_dept_cd) ) {
	    	alert('사업장을 선택해 주세요.');
	    	$("#srch_dept_nm").focus();
	    	return;
	    }

	    if ( fn_isNull(srch_biz_kind) ) {
	    	alert('업종을 선택해 주세요.');
	    	$("#srch_biz_kind").focus();
	    	return;
	    }

	    if ( stat != "평가중" ) {
	    	alert('평가차수의 상태가 [평가중] 상태일때만 수정 할 수 있습니다.');
	    	return;
	    }

	    if ( evl_stat != "요청전" ) {
	    	alert('결재 상태가 [요청전] 상태일때만 수정 할 수 있습니다.');
	    	return;
	    }

	    if ( fn_isNull(evl_emp_nm) ) {
	    	alert('평가담당자를 입력해 주세요.');
	    	$("#evl_emp_nm").focus();
	    	return;
	    }

	    if ( fn_isNull(evl_worker_nm) ) {
	    	alert('참여근로자를 입력해 주세요.');
	    	$("#evl_worker_nm").focus();
	    	return;
	    }
		var rowData = {				
			  	evl_year : srch_evl_seq.substring(0,4)
			  , evl_seq : srch_evl_seq.substring(4)
			  , com_cd : srch_com_cd
			  ,	dept_cd : srch_dept_cd		
			  , biz_kind_cd : srch_biz_kind
			  }; //empty row template

            var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
			var rowIndx = grid.addRow( { rowData: rowData, checkEditable: false });
			grid.goToPage({ rowIndx: rowIndx });
			grid.editFirstCellInRow({ rowIndx: rowIndx });

	}


	
	// 삭제
	function delRow() {
		var grid = $("#grid_array").pqGrid("getInstance").grid;
		var gridChanges = grid.getChanges({ format: 'byVal' });
		var data = grid.option("dataModel.data");
		
		var chkStat = false;
		var chkCnt  = 0;
		for (var i=data.length - 1; i>=0; i--) {
			var sel_yn = data[i].sel_yn;
			if (sel_yn == "Y") {
				chkStat = true;
				chkCnt  = chkCnt +1;
				//break;
			}
		}
		
		if (!chkStat) {
			alert("선택된 데이터가 없습니다.");
			return;
		}
		if (!confirm("선택한 " + chkCnt + "건을 삭제하시겠습니까?")) return;
		
		for (var i=data.length - 1; i>=0; i--) {
			var sel_yn = data[i].sel_yn;
			if (sel_yn == "Y") {
				$("#grid_array").pqGrid("deleteRow", {rowIndx: i}); // 행삭제
				
				if ($("#evl_dt").val() == '') { return; };
			}
		}
		
		
		
		$.ajax({
			dataType: "json"
			, type: "POST"
			, async: true
			, processData: true
			, contentType : "application/json; charset=UTF-8" //JSON 데이터로 전송
			, beforeSend: function (jqXHR, settings) {
				grid.showLoading();
			}
			, url: "/A/A11_delete_dtl.do"
			, data: JSON.stringify(gridChanges)
			, success: function (changes) {
				if (changes.result == "success") {
					alert("삭제되었습니다.");
					search(); // 재조회
				} else {
					alert("오류가 발생했습니다.");
				}
			}
			, error: function (jqXHR, textStatus, errorThrown) {
				// 세션이나 쿠키가 없을 때는 WebLoginInterceptor 에서 401 에러 발생
				if (jqXHR.status == "401") {
					parent.location = "/common/login.do";
				} else {
					alert("ERR=" + "HTTP status code: " + jqXHR.status + "\n" + "textStatus: " + textStatus + "\n" + "errorThrown: " + errorThrown);
					console.log("HTTP message body (jqXHR.responseText): " + "\n" + jqXHR.responseText);
				}
			}
			, complete: function () {
				grid.hideLoading();
			}
		});
	}
	

	

    //그리드 저장
    function save( ) {
	    var srch_evl_seq = $('select[name="srch_evl_seq"]').val();//평가차수
	    var srch_com_cd = $('select[name="sel_com_cd"]').val();//회사
	    var srch_dept_cd = $("#srch_dept_cd").val(); //사업장
	    var srch_dept_nm = $("#srch_dept_nm").val(); //사업장명
	    var srch_biz_kind = $('select[name="sel_biz_kind"]').val(); //업종
		var evl_dt   = $("#evl_dt").val();	    
	    
	    var stat     = $("#stat").val();     //평가상태 
	    var evl_stat = $("#evl_stat").val(); //결재상태 
	    
	    var evl_emp_nm = $("#evl_emp_nm").val(); //평가담당자
	    var evl_worker_nm = $("#evl_worker_nm").val(); //참여근로자

	    if ( fn_isNull(srch_evl_seq) ) {	    	
	    	alert('평가차수를 선택해 주세요.');
	    	$("#srch_evl_seq").focus();
	    	return;
	    }
	    
	    if ( fn_isNull(srch_com_cd) ) {
	    	alert('회사를 선택해 주세요.');
	    	$("#sel_com_cd").focus();
	    	return;
	    }

	    if ( fn_isNull(srch_dept_cd) ) {
	    	alert('사업장을 선택해 주세요.');
	    	$("#srch_dept_nm").focus();
	    	return;
	    }

	    if ( fn_isNull(srch_biz_kind) ) {
	    	alert('업종을 선택해 주세요.');
	    	$("#srch_biz_kind").focus();
	    	return;
	    }

	    if ( stat != "평가중" ) {
	    	alert('평가차수의 상태가 [평가중] 상태일때만 수정 할 수 있습니다.');
	    	return;
	    }

	    if ( evl_stat != "요청전" ) {
	    	alert('결재 상태가 [요청전] 상태일때만 수정 할 수 있습니다.');
	    	return;
	    }

	    if ( fn_isNull(evl_emp_nm) ) {
	    	alert('평가담당자를 입력해 주세요.');
	    	$("#evl_emp_nm").focus();
	    	return;
	    }

	    if ( fn_isNull(evl_worker_nm) ) {
	    	alert('참여근로자를 입력해 주세요.');
	    	$("#evl_worker_nm").focus();
	    	return;
	    }
	    if ( fn_isNull(evl_dt) ) {
	    	alert('평가일자를 입력해 주세요.');
	    	$("#evl_dt").focus();
	    	return;
	    }

        var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
        
        //if ( !grid.isDirty() ) {
        //	alert("수정된 자료가 없습니다.");
        //    return;
        //}
        
        //편집상태에서 저장할 수 없음
        if (grid.saveEditCell() === false) {
            return false;
        }
        
        if ( grid.isValidChange({ focusInvalid: true }).valid ) {
            //변경목록
            var gridChanges = grid.getChanges({ format: 'byVal' });
            var gridAll     = grid.getData();
            //추가목록
            var add_list = gridChanges.addList;
             
            if ( add_list != null) {

                for( var i = 0; i<gridAll.length; i++) {
                    $( "#grid_array" ).pqGrid( "setSelection", null );
                    $( "#grid_array" ).pqGrid( "setSelection", { rowIndx: i, focus: true } ); //row select

                    if ( fn_isNull(gridAll[i]["job_class_nm"]) ) {
            	    	alert('작업분류를 입력해 주세요.');
            	    	return;
            	    }
                    
                    if ( fn_isNull(gridAll[i]["factor_nm"]) ) {
            	    	alert('위험요인을 입력해 주세요.');
            	    	return;
            	    }
                    
                    if ( fn_isNull(gridAll[i]["bad_factor_nm"]) ) {
            	    	alert('유해위험요인파악을 입력해 주세요.');
            	    	return;
            	    }
                    
                    if ( fn_isNull(gridAll[i]["action_curr_nm"]) ) {
            	    	alert('현재의 안전보건조치를 입력해 주세요.');
            	    	return;
            	    }
                    
                    if ( fn_isNull(gridAll[i]["curr_psbl"]) ) {
            	    	alert('가능성을 입력해 주세요.');
            	    	return;
            	    }
                    
                    if ( fn_isNull(gridAll[i]["curr_impt"]) ) {
            	    	alert('중대성을 입력해 주세요.');
            	    	return;
            	    }

                    if ( gridAll[i]["next_risk"] >="4") {
                    if( fn_isNull(gridAll[i]["action_next_nm3"]) ){
                    	alert("계선실행계획을 입력하세요");
                    //	parent.loadPage("A12","계선실행계획 등록","/A/A12.do", "tab", '', '', '5');
            	    	return;
                    }
            	    }
                    

                }
            } 

         
      		
           // 20220905 박민석 첨부양식 주석처리
 /*           if(  $("#edu_meet_file_id").val() == "" || $("#edu_meet_file_id").val() == null ){
            	alert("교육 결과 문서를 첨부하세요.")
            	return;
            }
            if(  $("#edu_att_file_id").val() == "" ||  $("#edu_att_file_id").val() == null ){
            	alert("회의 결과 문서를 첨부하세요.")
            	return
            }*/

            
     		if ( !confirm("저장하시겠습니까?")) {
	            return;
	        }
            //첨부파일 처리 #1
            var fileId = _addFile(); //여기서 파일이 업로드됨
            
            //첨부불가 확장자 오류 등 오류처리
            if( fileId == "-1"){
                return;
            }
            //첨부파일 bbs_file 지정
            var bbsFile = $("#edu_att_file_id").val();
            if(bbsFile == "" || bbsFile == null){
            	$("#edu_att_file_id").val( fileId );
            } 
            
            //첨부파일 처리 #3
            var fileId3 = _addFile3(); 
            
            //첨부불가 확장자 오류 등 오류처리
            if( fileId3 == "-1"){
                return;
            }
            //첨부파일 bbs_file 지정
            var bbsFile3 = $("#edu_form_file_id").val();
            if(bbsFile3 == "" || bbsFile3 == null){
            	 $("#edu_form_file_id").val( fileId3 );
            } 
                                   
            //첨부파일 처리 #2
            var fileId2 = _addFile2(); //여기서 파일이 업로드됨
            
            //첨부불가 확장자 오류 등 오류처리
            if( fileId2 == "-1"){
                return;
            }
            //첨부파일 bbs_file 지정
            var bbsFile2 = $("#edu_meet_file_id").val();
            if(bbsFile2 == "" || bbsFile2 == null){
            	 $("#edu_meet_file_id").val( fileId2 );
            } 

            
          //첨부파일 처리 #4
            var fileId4 = _addFile4(); //여기서 파일이 업로드됨
            
            //첨부불가 확장자 오류 등 오류처리
            if( fileId4 == "-1"){
                return;
            }
            //첨부파일 bbs_file 지정
            var bbsFile4 = $("#edu_side_file_id").val();
            if(bbsFile4 == "" || bbsFile4 == null){
            	 $("#edu_side_file_id").val( fileId4 );
            } 
            
     		var dataList = new Array();
     		dataList.push( $("#mstForm").serializeObject());
     		//dataList.push( gridChanges );
     		
     		var paramMap = { "mst": dataList 
     				       , "dtl": gridChanges
     				       }; 
      
     		console.log( JSON.stringify( paramMap ) );
     		
     		
            //post changes to server 
            $.ajax({
                dataType: "json",
                type: "POST",
                async: false,
                processData : true,
                contentType : "application/json; charset=UTF-8", //JSON 데이터로 전송
                beforeSend: function (jqXHR, settings) {
                    grid.showLoading();
                },
                url: "/A/A11_save.do",
                data: JSON.stringify( paramMap ) ,
                success: function (changes) {
                    if( changes.result == 'success') {
                        alert("저장되었습니다.");
                        search();
                    }
                    else {
                        alert("오류가 발생했습니다.");
                    }
                },
                error:function( jqXHR, textStatus, errorThrown ){
                    //세션이나 쿠키가 없을 때는 WebLoginInterceptor 에서 401 에러 발생
                    if ( jqXHR.status == '401') {
                        parent.location = "/common/login.do";
                    }
                    else {
                        alert("ERR="+'HTTP status code: ' + jqXHR.status + '\n' + 'textStatus: ' + textStatus + '\n' + 'errorThrown: ' + errorThrown);
                        console.log('HTTP message body (jqXHR.responseText): ' + '\n' + jqXHR.responseText);    
                    }
                },
                complete: function () {
                    grid.hideLoading();
                }
            });
        }
    }
    
	
	
	
	// 엑셀 저장
	function excel() {
		
		var grid = $( "#grid_array" ).pqGrid("getInstance").grid;
		var format = "xlsx";
		var blob = grid.exportData({format: "xlsx", sheetName: "DATA", nopqdata: true, render: false });

		saveAs(blob, "평가등록."+ format );
	}


	var dateEditor = function (ui) {
		var $inp = ui.$cell.find("input"),
			grid = this,
			validate = function (that) {
				var valid = grid.isValid({
					dataIndx: ui.dataIndx,
					value: $inp.val(),
					rowIndx: ui.rowIndx
			}).valid;
				if (!valid) {
					that.firstOpen = false;
				}
			};
		//initialize the editor
		$inp
		.on("input", function (evt) {
			validate(this);
		})
		.datepicker({
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			dateFormat: 'yy-mm-dd', 
			yearRange: '1901:9999',
			dayNamesMin: [ '일', '월', '화', '수', '목', '금', '토'], // 요일
			monthNames : ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			nextText: '>', // next 아이콘의 툴팁.
			prevText: '<' ,// prev 아이콘의 툴팁.

			onSelect: function () {
				this.firstOpen = true;
				validate(this);
			},
			beforeShow: function (input, inst) {
				return !this.firstOpen;
			},
			onClose: function () {
				this.focus();
			} 
		});
	}	
	


 	// 사업장 Popup - open
	function findDept5() {
		var srch_com_cd   = $('select[name="sel_com_cd"]').val();//회사
		var url = "/P/P_dept5.do";
		var param = "?parentMenuId"+parent.currentMenuId;
		param += "&year_seq=" + $('select[name="srch_evl_seq"]').val();
		param += "&sch_text=" + $("#srch_dept_nm").val();
		param += "&com_cd=" + srch_com_cd;
		param += "&_gubun=Dept5";					
		param += "&_funcNm=setDataForm";		

		//alert(url);
		_openPopupCenter(url+param, 1000, 600, "dept5Pop");
	} 

	
	// 유해위험요인 Popup - open
	function bad_factor_popup() {
		
	    var srch_evl_seq = $('select[name="srch_evl_seq"]').val();//평가차수
	    var srch_com_cd = $('select[name="sel_com_cd"]').val();//회사
	    var srch_dept_cd = $("#srch_dept_cd").val(); //사업장
	    var srch_dept_nm = $("#srch_dept_nm").val(); //사업장명
	    var srch_biz_kind = $('select[name="sel_biz_kind"]').val(); //업종
		
	    var stat     = $("#stat").val(); //평가상태 
	    var evl_stat = $("#evl_stat").val(); //결재상태 
	    
	    var evl_emp_nm = $("#evl_emp_nm").val(); //평가담당자
	    var evl_worker_nm = $("#evl_worker_nm").val(); //참여근로자

	    if ( fn_isNull(srch_evl_seq) ) {
	    	alert('평가차수를 선택해 주세요.');
	    	$("#srch_evl_seq").focus();
	    	return;
	    }

	    if ( fn_isNull(srch_dept_cd) ) {
	    	alert('사업장을 선택해 주세요.');
	    	$("#srch_dept_nm").focus();
	    	return;
	    }

	    if ( fn_isNull(srch_biz_kind) ) {
	    	alert('업종을 선택해 주세요.');
	    	$("#srch_biz_kind").focus();
	    	return;
	    }

	    if ( stat != "평가중" ) {
	    	alert('평가차수의 상태가 [평가중] 상태일때만 수정 할 수 있습니다.');
	    	return;
	    }

	    if ( evl_stat != "요청전" ) {
	    	alert('결재 상태가 [요청전] 상태일때만 수정 할 수 있습니다.');
	    	return;
	    }

	    if ( fn_isNull(evl_emp_nm) ) {
	    	alert('평가담당자를 입력해 주세요.');
	    	$("#evl_emp_nm").focus();
	    	return;
	    }

	    if ( fn_isNull(evl_worker_nm) ) {
	    	alert('참여근로자를 입력해 주세요.');
	    	$("#evl_worker_nm").focus();
	    	return;
	    }

		var url = "/P/P_bad_factor.do";
		var param = "?parentMenuId"+parent.currentMenuId;
		param += "&srch_biz_kind=" + srch_biz_kind;
		param += "&_gubun=bad_factor";
		param += "&_funcNm=setDataForm";

		//alert(url);
		_openPopupCenter(url+param, 1000, 600, "bad_factor");

	}


	
	// 현재의안전보건조치 Popup - open
	function action_curr_popup( _rowIndx ) {
	    var srch_biz_kind = $('select[name="sel_biz_kind"]').val(); //업종
		
		var url = "/P/P_action_curr_with_risk.do";
		var param = "?parentMenuId"+parent.currentMenuId;
		
        var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
        var data = grid.option("dataModel.data");

		param += "&srch_biz_kind=" + srch_biz_kind;
		param += "&_rowIndx=" + _rowIndx;

		param += "&curr_psbl="      + data[_rowIndx].curr_psbl; //현재가능성
		param += "&curr_impt="      + data[_rowIndx].curr_impt; //현재중대성
		param += "&curr_risk="      + data[_rowIndx].curr_risk; //현재위험성
		param += "&next_psbl="      + data[_rowIndx].next_psbl; //개선후가능성
		param += "&next_impt="      + data[_rowIndx].next_impt; //개선후중대성
		param += "&next_risk="      + data[_rowIndx].next_risk; //개선후위험성
		
		param += "&_gubun=action_curr";
		param += "&_funcNm=setDataForm";

		//alert(url);
		_openPopupCenter(url+param, 600, 650, "action_curr");

	}

	// 개선계획 등록 Popup - open
	function action_plan_popup( _rowIndx ) {
	    var srch_evl_year = $("#evl_year").val();//평가년도
	    var srch_evl_seq = $("#evl_seq").val();//평가차수
	    var srch_com_cd = $('select[name="sel_com_cd"]').val();//회사
	    var srch_dept_cd = $("#srch_dept_cd").val(); //사업장
	    var srch_dept_nm = $("#srch_dept_nm").val(); //사업장명
	    var srch_biz_kind = $('select[name="sel_biz_kind"]').val(); //업종
	    
	    var stat     = $("#stat").val(); //평가상태 
	    var evl_stat = $("#evl_stat").val(); //결재상태 
	              	
		var url = "/P/P_action_plan.do";
		var param = "?parentMenuId"+parent.currentMenuId;
		
		var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
        var data = grid.option("dataModel.data");
		
		param += "&srch_evl_year="  + srch_evl_year;
		param += "&srch_evl_seq="   + srch_evl_seq;
		param += "&srch_com_cd="    + srch_com_cd;
		param += "&srch_dept_cd="   + srch_dept_cd;
		param += "&srch_biz_kind="  + srch_biz_kind;
		
		param += "&stat="           + stat;
		param += "&evl_stat="       + evl_stat;
		param += "&_rowIndx=" + _rowIndx;
		param += "&dtl_seq="        + data[_rowIndx].dtl_seq; //순번
		param += "&acdt_type_cd="   + data[_rowIndx].acdt_type_cd; //재해유형코드
		param += "&acdt_type_nm="   + data[_rowIndx].acdt_type_nm; //재해유형명
		param += "&action_next_cd=" + data[_rowIndx].action_next_cd; //개선대책코드
		param += "&action_next_nm=" + data[_rowIndx].action_next_nm; //개성대책명
		param += "&curr_psbl="      + data[_rowIndx].curr_psbl; //현재가능성
		param += "&curr_impt="      + data[_rowIndx].curr_impt; //현재중대성
		param += "&curr_risk="      + data[_rowIndx].curr_risk; //현재위험성
		param += "&next_psbl="      + data[_rowIndx].next_psbl; //개선후가능성
		param += "&next_impt="      + data[_rowIndx].next_impt; //개선후중대성
		param += "&next_risk="      + data[_rowIndx].next_risk; //개선후위험성
		param += "&action_next_nm2="      + data[_rowIndx].action_next_nm2; //개선후위험성
		param += "&action_next_nm3="      + data[_rowIndx].action_next_nm3; //개선후위험성
		param += "&next_plan_dt="   + data[_rowIndx].next_plan_dt; //개선조치예정일
		param += "&_gubun=action_plan";
		param += "&_funcNm=setDataForm";

		//alert(param);
		_openPopupCenter(url+param, 800, 500, "action_plan");

	}


	//form 그룹 팝업 set
	function setDataForm(data){
	    var srch_evl_seq = $('select[name="srch_evl_seq"]').val();//평가차수
	    var srch_com_cd = $('select[name="sel_com_cd"]').val();//회사
	    var srch_dept_cd = $("#srch_dept_cd").val(); //사업장
	    var srch_dept_nm = $("#srch_dept_nm").val(); //사업장명
	    var srch_biz_kind = $('select[name="sel_biz_kind"]').val(); //업종

	    
    	switch(data[0]+"") {
        
	        case 'Dept5' :
	        	//1. 사업장
				$("#srch_dept_cd").val(data[1]);
				$("#srch_dept_nm").val(data[2]);
				$('select[name="sel_com_cd"]').val(data[3]);
				$('select[name="sel_biz_kind"]').val(data[4]);
				$('select[name="srch_evl_seq"]').val(data[5]);	
				search(); //조회

	            break;

	        case 'bad_factor' :
	        	//2. 유해위험요인 (더블클릭 - 한건)
	    		var rowData = {
					evl_year      : srch_evl_seq.substring(0,4)
				  , evl_seq       : srch_evl_seq.substring(4)
				  , com_cd        : srch_com_cd
				  , dept_cd       : srch_dept_cd
				  ,	biz_kind_cd   : srch_biz_kind
				  ,	bad_factor_cd : data[1]
				  ,	job_class_nm  : data[2]
				  ,	factor_nm     : data[3]	        	  
				  ,	bad_factor_nm : data[4]
	    		  , test          : data[5]
				  }; //empty row template

	            var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
				var rowIndx = grid.addRow( { rowData: rowData, checkEditable: false });
				grid.goToPage({ rowIndx: rowIndx });
				grid.editFirstCellInRow({ rowIndx: rowIndx });

	
	            break;

	        case 'bad_factor_MULTI' :
	        	//3. 유해위험요인 (멀티선택 - 여러건)
	        	var data = data[1];
	        	
	    		for (var i=0; i < data.length; i++) {
	    			var sel_yn = data[i].sel_yn;
	    			if (sel_yn == "Y") {
	    				//alert(data[i].bad_factor_cd);
			    		var rowData = {
								evl_year      : srch_evl_seq.substring(0,4)
							  , evl_seq       : srch_evl_seq.substring(4)
				              , com_cd        : srch_com_cd
							  , dept_cd       : srch_dept_cd
							  ,	biz_kind_cd   : srch_biz_kind
							  ,	bad_factor_cd : data[i].bad_factor_cd
							  ,	job_class_nm  : data[i].job_class_nm
							  ,	factor_nm     : data[i].factor_nm
							  ,	bad_factor_nm : data[i].bad_factor_nm
							  , test          : data[2]
							  }; //empty row template

    		            var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
    					var rowIndx = grid.addRow( { rowData: rowData, checkEditable: false });
    					grid.goToPage({ rowIndx: rowIndx });
    					grid.editFirstCellInRow({ rowIndx: rowIndx });
	    			}
	    		}

	            break;

	        case 'action_curr' :
	        	//alert('action_curr :' + data[1]);

			 	$('select[name="sel_biz_kind"]').val(data[7]);
	        	var rIdx = data[1];
	        	
	    		var rowData = {	    			
	    				action_curr_cd : data[2]
				      , action_curr_nm : data[3]
				      , curr_psbl      : data[4]
				      , curr_impt      : data[5]	    		      
	    		      , curr_risk      : data[6]	    		      
				 	  }; 
    	
		        var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
				var rowIndx = grid.updateRow( { rowIndx: rIdx
				                              , newRow: rowData
		                                      }
				                             );

				
	            break;
	            
	        case 'action_curr_MULTI' :

	        	//alert('action_curr_MULTI :' + data[1]);
	        	$('select[name="sel_biz_kind"]').val(data[6]);
	        	var rIdx = data[1];
	        	var multiData = data[2];
	        	var CD_s = '';
	        	var NM_s = '';
	        	var cnt  = 0;
	        	
	        	
	    		for (var i=0; i < multiData.length; i++) {
	    			var sel_yn = multiData[i].sel_yn;
	    			if (sel_yn == "Y") {
		    			if (cnt != 0) {
		    				NM_s = NM_s + "\n";
		    				CD_s = CD_s + "\n"; 
		    			}
		    			NM_s = NM_s + multiData[i].action_curr_nm
		    			CD_s = CD_s + multiData[i].action_curr_cd
		    			cnt++;
	    			}
	    		}

	    	    		var rowData = {
	    	    				action_curr_cd : CD_s
	    					  , action_curr_nm : NM_s
	    				      , curr_psbl      : data[3]
					          , curr_impt      : data[4]
	    	    		      , curr_risk      : data[5]
	    					  }; 
	        	
	            var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
				var rowIndx = grid.updateRow( { rowIndx: rIdx
				                              , newRow: rowData
                                              }
				                             );


	
	            break;

	        case 'action_plan' :
	        //	$('select[name="sel_biz_kind"]').val(data[1]);
	        var rIdx = data[1];
	        	var rowData = {
	        		acdt_type_cd   : data[2]
    			  , acdt_type_nm   : data[3]
	        	  , action_next_cd : data[4]
			      , action_next_nm : data[5]
			      , next_psbl      : data[6]
			      , next_impt      : data[7]	    		      
    		      , next_risk      : data[8]
	        	  , next_plan_dt   : data[9]
			 	  };  
	        	 var grid = $( "#grid_array" ).pqGrid('getInstance').grid;
 				 	var rowIndx = grid.updateRow( { rowIndx: rIdx
					                              , newRow: rowData
			                                      }
					                             );  
					                        

	     		break;

	        default: 
	             break;
	     }
			
		
	}
	
    
    //사업장 Clear
    function clearDept5(){ 
		$("#srch_dept_cd").val('');
		$("#srch_dept_nm").val('');    
		//조회
		search();
    }
    
	
	// 그리드 설정
	function build_grid() {
		var obj = {
			showTop: false
			, resizable: false
			, location: "remote"
			, rowBorders: true
			, stripeRows: false
			, wrap: true  
			, flex:{ one: false }
			, pasteModel: {on: false} 
			, numberCell: {show: true}
			, trackModel: { on: true} //to turn on the track changes.
			, scrollModel: {autoFit: false} /* false : 가로 스크롤바 생김, true : 가로 스크롤바 안생김 */
			, selectionModel: {
				type: "row" // 행이나 셀은 'cell', 'row'또는 null 값에 따라 UI (키보드 / 마우스)로 선택할 수 있습니다. 행 선택과 셀 선택이 모두 필요한 경우 checkbox 행 선택과 함께 셀 선택을 사용하십시오. 
				, mode: "block" // 단일 행 / 셀은 값에 따라 'single'또는 'block'을 선택할 수 있습니다.
			}
			, dataType: "JSON"
			, method: "POST"
			, width: '100%'
			, height: 600
			, draggable: false
			, swipeModel: {on: false}
            , editModel: {
                onBlur: 'validate',
                clicksToEdit: 1,
                keyUpDown: false
             }
			, editor: {
			       select: true
			       }

		};
		
		obj.colModel = [
			  {title:"pk", dataIndx:"pk", hidden:true, editable:false, dataType:"string"} /*데이터 변경여부와 신규여부 판단 필드 (PK로 사용 PK가 한 필드가 아니면 붙여서 사용해야 함) */
            , {title:"<input type='checkbox'/>",
                  dataIndx: "sel_yn"
                  , maxWidth: 50
                  , minWidth: 50
                  , type: "checkbox"
                  , align: "center"
                  , cb: {
                      all: false //header checkbox to affect checkboxes on all pages.
                      , header: true //for header checkbox.
                      , check: "Y" //check the checkbox when cell value is "Y".
                      , uncheck: "N" //uncheck when "N".
                  }
                  , render: function(ui) {
                      var cb = ui.column.cb
                          , cellData = ui.cellData
                          , checked = cb.check === cellData ? "checked" : ""
                          , disabled = this.isEditableCell(ui) ? "" : "disabled"
                          , text = cb.check === cellData ? "TRUE" : (cb.uncheck === cellData ? "FALSE" : "<i>unknown</i>");
                      return {
                          text: "<label><input type='checkbox' " + checked + " /></label>"
                          , style: (disabled ? "background: lightgray" : "")
                      };
                  }
                  , cls : "possible"
                  , editor: false //cell renderer i.e., checkbox serves as editor, so no separate editor.
                  , editable: function(ui) {
                      // to make checkboxes editable selectively.
                      return !ui.rowData.disabled;
                  }
              }

			, {title:"평가년도", dataIndx:"evl_year", hidden:true, nodrag:true, valign:"middle", align:"center", width:20, editable:false, dataType:"string"}
			, {title:"차수", dataIndx:"evl_seq", hidden:true, nodrag:true, valign:"middle", align:"center", width:20, editable:false, dataType:"string"}			
			, {title:"사업장", dataIndx:"dept_cd", hidden:true, nodrag:true, valign:"middle", align:"center", width:20, editable:false, dataType:"string"}
			, {title:"업종", dataIndx:"biz_kind_cd", hidden:true, nodrag:true, valign:"middle", align:"center", width:20, editable:false, dataType:"string"}
			, {title:"stat", dataIndx:"stat", hidden:true, nodrag:true, valign:"middle", align:"center", width:20, editable:false, dataType:"string"}
			, {title:"evl_stat", dataIndx:"evl_stat", hidden:true, nodrag:true, valign:"middle", align:"center", width:20, editable:false, dataType:"string"}
			
			, {title:"순번", dataIndx:"dtl_seq", hidden:false, nodrag:true, valign:"middle", align:"center", width:10, editable:false, dataType:"string"}
			, {title:"유해요인코드", dataIndx:"bad_factor_cd", hidden:false, nodrag:true, valign:"middle", align:"center", width:20, editable:false, editor: {type: "textarea"}, dataType:"string"}
			, {title:"작업분류", dataIndx:"job_class_nm", hidden:false, nodrag:true, valign:"middle", align:"left", width:90, dataType:"string", editor: {type: "textarea"}, editModel: {saveKey: ''} ,
				editable: function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
                		return true;
                	} else {
                		return false;
                	}
				 },
                render : function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
                		return { style :"background-color :#FFFFD2" }
                	}
					
				},
              }
			, {title:"위험요인", dataIndx:"factor_nm", hidden:false, nodrag:true, valign:"middle", align:"left", width:100, dataType:"string", editor: {type: "textarea"}, editModel: {saveKey: ''} ,
				editable: function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
                		return true;
                	} else {
                		return false;
                	}
				 },
                render : function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
                		return { style :"background-color :#FFFFD2" }
                	}
					
				},
              }
			, {title:"유해요인파악", dataIndx:"bad_factor_nm", hidden:false, nodrag:true, valign:"middle", align:"left", width:200, dataType:"string", editor: {type: "textarea"}, editModel: {saveKey: ''} ,
				editable: function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
                		return true;
                	} else {
                		return false;
                	}
				 },
                render : function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
                		return { style :"background-color :#FFFFD2" }
                	}
					
				},
              }
			, {title:"현재조치코드", dataIndx:"action_curr_cd", hidden:true, nodrag:true, valign:"middle", align:"left", width:20, editable:true, dataType:"string" }
			, {title:"현재의 안전보건조치", dataIndx:"action_curr_nm", hidden:false, nodrag:true, valign:"middle", align:"left", width:200, dataType:"string", editor: {type: "textarea"}, editModel: {saveKey: ''},
				editable: function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
                		return true;
                	} else {
                		return false;
                	}
				 },
                render : function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
                		return { style :"background-color :#FFFFD2" }
                	}
					
				},
               }
			, {title:"조치", dataIndx:"action_curr_pop", hidden:false, nodrag:true, halign:"center",  align:"center", width:30, editable:false, cls : "impossible"
				, render: function (ui) {
					var text = '';
					var cls = 'impossible';
					if(  ui.rowData.stat == '2' || ui.rowData.stat == null ){
						if( ui.rowData.code_id != "10"){
							text = '<span style="line-height: 10px;"><button onClick="action_curr_popup(\''+ ui.rowIndx + '\');" type="button" class="btn btn-sm btn-info"> <i class="fas fa-search"></i> </button></span>';
							cls = 'possible';
						}
					}
					return {
							text : text,
							cls : cls
							};
				},
				editable : false,
			}
			, {title:"현재 위험성", halign:"center", align:"center" 
				,  colModel: [{title:"가능성<br>(발생빈도)", dataIndx:"curr_psbl", hidden:false, nodrag:true, valign:"middle", align:"center", width:70, dataType:"string", 
				                editor:{
				                            type: 'select',
				                            valueIndx: "value",
				                            labelIndx: "text",
				                            mapIndices: {"text": "curr_psbl", "value": "curr_psbl"},
				                            options: [
				                                        { "value":"1", "text":"1"},
				                                        { "value":"2", "text":"2"},
				                                        { "value":"3", "text":"3"}
				                                      ]
				                        },
				        				editable: function( ui){
				                        	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
				                        		return true;
				                        	} else {
				                        		return false;
				                        	}
				        				 },
				                        render : function( ui){
				                        	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
				                        		return { style :"background-color :#FFFFD2" }
				                        	}
				        					
				        				},
				                       
					          }
				            , {title:"중대성<br>(위험정도)", dataIndx:"curr_impt", hidden:false, nodrag:true, valign:"middle", align:"center", width:70, dataType:"string",
				                editor:{
				                            type: 'select',
				                            valueIndx: "value",
				                            labelIndx: "text",
				                            mapIndices: {"text": "curr_impt", "value": "curr_impt"},
				                            options: [
				                                        { "value":"1", "text":"1"},
				                                        { "value":"2", "text":"2"},
				                                        { "value":"3", "text":"3"}
				                                      ]
				                        },
				        				editable: function( ui){
				                        	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
				                        		return true;
				                        	} else {
				                        		return false;
				                        	}
				        				 },
				                        render : function( ui){
				                        	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) ) {
				                        		return { style :"background-color :#FFFFD2" }
				                        	}
				        					
				        				}, 
					          }				            
				            , {title:"위험성", dataIndx:"curr_risk", hidden:false, nodrag:true, valign:"middle", align:"center", width:60, editable:true, dataType:"string",editor: {type: "textarea"}, 
				                render : function( ui){
				                	if (ui.rowData.curr_risk >= 4) {
				                		return { style :"color :red" }
				                	} else {
				                		return { style :"color : black" }
				                	}
									
								},
				              }
				             ]
              }
			, {title:"재해유형", dataIndx:"acdt_type_cd", hidden:true, nodrag:true, valign:"middle", align:"center", width:20, dataType:"string"}
			, {title:"재해유형", dataIndx:"acdt_type_nm", hidden:false, nodrag:true, valign:"middle", align:"center", width:20, dataType:"string"}
			, {title:"개선대책", dataIndx:"action_next_cd", hidden:true, nodrag:true, valign:"middle", align:"left", width:140, dataType:"string", editor: {type: "textarea"}, editModel: {saveKey: ''}/*, attr: "rows=2 cols=20", style: "resize:both;"*/ }
			, {title:"개선대책", dataIndx:"action_next_nm", hidden:false, nodrag:true, valign:"middle", align:"left", width:140, dataType:"string", editor: {type: "textarea"}, editModel: {saveKey: ''}/*, attr: "rows=2 cols=20", style: "resize:both;"*/ }			
			, {title:"대책", dataIndx:"action_next_pop", hidden:false, nodrag:true, halign:"center",  align:"center", width:30, editable:false, cls : "impossible"
				, render: function (ui) {
					var text = '';
					var cls = 'impossible';
					if(  ui.rowData.curr_risk >= 4 ){
						if( ui.rowData.code_id != "10"){
							text = '<span style="line-height: 10px;"><button onClick="action_plan_popup(\''+ ui.rowIndx + '\');" type="button" class="btn btn-sm btn-info"> <i class="fas fa-edit"></i> </button></span>';
							cls = 'possible';
						}
					}
					return {
							text : text,
							cls : cls
							};
				},
				editable : false
			}
			, {title:"개선 후 위험성", halign:"center", align:"center" 
				,  colModel: [{title:"가능성<br>(발생빈도)", dataIndx:"next_psbl", hidden:false, nodrag:true, valign:"middle", align:"center", width:70, editable:true, dataType:"string", 
	                editor:{
                        type: 'select',
                        valueIndx: "value",
                        labelIndx: "text",
                        mapIndices: {"text": "next_psbl", "value": "next_psbl"},
                        options: [
                                    { "value":"1", "text":"1"},
                                    { "value":"2", "text":"2"},
                                    { "value":"3", "text":"3"}
                                  ]
                    },
    				editable: function( ui){
                    	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) && ( ui.rowData.curr_risk >= 4 ) ) {
                    		return true;
                    	} else {
                    		return false;
                    	}
    				 },
                    render : function( ui){
                    	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) && ( ui.rowData.curr_risk >= 4 ) ) {
                    		return { style :"background-color :#FFFFD2" }
                    	}
    					
    				},
                   
          }
				            , {title:"중대성<br>(위험정도)", dataIndx:"next_impt", hidden:false, nodrag:true, valign:"middle", align:"center", width:70, editable:true, dataType:"string", 
				                editor:{
		                            type: 'select',
		                            valueIndx: "value",
		                            labelIndx: "text",
		                            mapIndices: {"text": "next_impt", "value": "next_impt"},
		                            options: [
		                                        { "value":"1", "text":"1"},
		                                        { "value":"2", "text":"2"},
		                                        { "value":"3", "text":"3"}
		                                      ]
		                        },
		        				editable: function( ui){
		                        	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) && ( ui.rowData.curr_risk >= 4 ) ) {
		                        		return true;
		                        	} else {
		                        		return false;
		                        	}
		        				 },
		                        render : function( ui){
		                        	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) && ( ui.rowData.curr_risk >= 4 ) ) {
		                        		return { style :"background-color :#FFFFD2" }
		                        	}
		        					
		        				},
		                       
			          }
				            , {title:"위험성", dataIndx:"next_risk", hidden:false, nodrag:true, valign:"middle", align:"center", width:60, editable:true, dataType:"string",editor: {type: "textarea"},				            
				                render : function( ui){
				                	if (ui.rowData.next_risk >= 4) {				                		
				                		return { style :"color :red" }
				                	} else {
				                		return { style :"color : black" }
				                	}
									
								},
				              }
				             ]
              }
			, {title:"개선조치<br>예정일", dataIndx:"next_plan_dt", hidden:false, nodrag:true, halign:"center", align:"center", width:80, dataType:"string"}
			, {title:"개선전<br>대책방안", dataIndx:"action_next_nm2", hidden:false, nodrag:true, halign:"center", align:"center", width:80, dataType:"string", editor: {type: "textarea"},
				render : function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) && ( ui.rowData.curr_risk >= 4 ) ) {
                		return { style :"background-color :#FFFFD2" }
                	}
					
				}
			}
			, {title:"개선실행<br>계획", dataIndx:"action_next_nm3", hidden:false, nodrag:true, halign:"center", align:"center", width:80, dataType:"string", editor: {type: "textarea"}}						 
			, {title:"개선조치<br>완료일", dataIndx:"next_fnsh_dt", hidden:false, nodrag:true, halign:"center", align:"center", width:90, dataType:"date" , format: 'yy-mm-dd', editor: {type: 'textbox', init: dateEditor},
				editable: function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) && ( ui.rowData.curr_risk >= 4 ) ) {
                		return true;
                	} else {
                		return false;
                	}
				 },
                render : function( ui){
                	if ( (ui.rowData.stat == '2' || ui.rowData.stat == null) && (ui.rowData.evl_stat == '1' || ui.rowData.evl_stat == null) && ( ui.rowData.curr_risk >= 4 ) ) {
                		return { style :"background-color :#FFFFD2" }
                	}
					
				}
			}
			, {title:"등록자", dataIndx:"crt_id", hidden:false, nodrag:true, halign:"center", align:"center", width:70, editable:false, dataType:"string"}
			, {title:"등록일시", dataIndx:"crt_dt", hidden:false, nodrag:true, halign:"center", align:"center", width:120, editable:false, dataType:"string"}
			, {title:"수정자", dataIndx:"upd_id", hidden:false, nodrag:true, halign:"center", align:"center", width:70, editable:false, dataType:"string"}
			, {title:"수정일시", dataIndx:"upd_dt", hidden:false, nodrag:true, halign:"center", align:"center", width:120, editable:false, dataType:"string"}
		];
		
		obj.dataModel ={
			location: "remote"
			, dataType: "JSON"
			, method: "POST"
			, recIndx: "pk"			
			, url: "/A/A11_select_dtl.do" // 프로그램명을 pk로 가져간다.			
			//, postData: makeFstParam()
			, getData: function (dataJSON) {
				var data = dataJSON.data;
				$("#setGrdTitl").html("<i class='fab fa-wpforms'></i> 평가정보 [" + data.length + "건]");					
				return {data: data};			
			}			
			, error: function (jqXHR, textStatus, errorThrown) {
				//세션이나 쿠키가 없을 때는 WebLoginInterceptor 에서 401 에러 발생
				if (jqXHR.status == "401") {
					parent.location = "/common/login.do";
				} else if (jqXHR.status == "0") {
                    //Open시 즉시 조회오류 Alert방지
				} else {
					alert("ERR="+'HTTP status code: ' + jqXHR.status + '\n' + 'textStatus: ' + textStatus + '\n' + 'errorThrown: ' + errorThrown);
					console.log('HTTP message body (jqXHR.responseText): ' + '\n' + jqXHR.responseText);
				}
			} 
		}
		
		$("#grid_array").pqGrid(obj);
		
		$("#grid_array").pqGrid({
	        //더블클릭 이벤트
			rowDblClick: function (event, ui) {
				if( !fn_isNull( ui.rowData.pk) ){
					//openUserInfoPopup( ui.rowData );
				}
			},
			//열너비이벤트
			complete: function( event, ui ) {
	               //this.flex();
	            }
			
		});
	}

	$(document).ready(function() {
    	//기간 설정
        //$("#sch_trgt_fr").val( Number(moment( new Date()).format('YYYY')) -1);
        //$("#sch_trgt_to").val( Number(moment( new Date()).format('YYYY')) +1);
    	
    	$(".datePicker").datepicker({
            dateFormat: 'yy'
                ,changeYear: true       // 년을 바꿀수 있는 셀렉트 박스를 표시한다.
                ,changeMonth: true    // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
                ,showMonthAfterYear: true  // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
    			, selectedYear: (new Date()).getFullYear()
    			, startYear: (new Date()).getFullYear()-10
    			, finalYear: (new Date()).getFullYear()+10
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
    			, id: "monthpicker_" + (Math.random() * Math.random()).toString().replace('.', '')
    			, openOnFocus: true
    			, disabledMonths: []
        });

		
		// 그리드 생성
		build_grid();
		
		//페이지 loading이 완료되면 parent의 iframe과 div의 height 변경(필수)
		parent.autoResizeFromIframe();
		
		// 객체 높이 자동 조절
		_setResizeInfo("grid_array", "TAB");
		
		
		
		//초기값 세팅 
		// 1. 메뉴에서 열었을때 - 부서만 세션값으로 세팅			
		if ( fn_isNull('${param.evl_year}') ) {
		    $('select[name="sel_com_cd"]').val( '${sessionScope.member_id.com_cd}' ); //회사
			$("#srch_com_cd").val( '${sessionScope.member_id.com_cd}' ); //회사				

	    // 2. 위헙성 관리 화면에서 Send
		} else {
		 	var com_cd      = '${param.com_cd}';
			var evl_year    = '${param.evl_year}';
			var evl_seq     = '${param.evl_seq}';
			var dept_cd     = '${param.dept_cd}';
			var dept_nm     = '${param.dept_nm}';
			var biz_kind_cd = '${param.biz_kind_cd}';
		    var year_seq = evl_year + evl_seq;			
	        $('select[name="srch_evl_seq"]').val(year_seq);//평가차수	        
		    $('select[name="sel_com_cd"]').val(com_cd ); //회사
			$("#srch_com_cd").val( com_cd ); //회사
			$("#srch_dept_cd").val( dept_cd ); //사업장
			$("#srch_dept_nm").val( dept_nm ); //사업장명
			$('select[name="sel_biz_kind"]').val( biz_kind_cd ); 
			
			
		}
		
		//관리자 권한일때만 '회사' 변경가능
		if ( '${sessionScope.member_id.grp_name}' != '관리자' || '${sessionScope.member_id.auth_gu}' != 'G'  ) {
			$('select[name="sel_com_cd"]').prop('disabled',true);
			$('input[name="srch_dept_nm"]').prop('readonly',true);
			$('select[name="sel_biz_kind"]').prop('disabled',true);
			//$("#srch_dept_cd").val( '${sessionScope.member_id.cont_no}' ); //사업장		
			//$("#srch_dept_nm").val( '${sessionScope.member_id.svcpl_nm}' ); //사업장명
			if ( '${sessionScope.member_id.grp_name}' != '관리자' ) {
				$('select[name="sel_com_cd"]').prop('disabled',true);
				$('input[name="srch_dept_nm"]').prop('readonly',true);				
				$("#srch_dept_cd").val( '${sessionScope.member_id.cont_no}' ); //사업장		
				$("#srch_dept_nm").val( '${sessionScope.member_id.svcpl_nm}' ); //사업장명
			}
			//$("#srch_dept_nm").prop('disabled',true);
			//$("#srch_dept_findDept5").prop('onclick',"");
			//$("#srch_dept_clearDept5").prop('onclick',"");
		
		}
		//조회		
		search();		
		
	
	});
	</script>