2018.10.24
 - category Page 구현 진행중
 - category Page 구현 방안
 	.- totCnt 및 필요한 변수 값들 따로 구해서 오기 (완료) //-- 학원 --//
 	.- showList() 구현하기 (완료 집)
 	.- showPageList() 구현하기(완료 집)
 	
 - 수정 사항 필요 및 개선사항
 	.- 다른 페이지가 로드되더라도 최종적으로 한 페이지로 구성된다면 jquery를 이용하여 값 받고 보내기 가능
 	.- 이를 통하여 필요없는 데이터 전달 최소화 하기
 	
 	.- header에서 footer로드 이후에.... footer에서 자체적으로 header에 있는 자기자신을 불러오는 자리로 링크 보내보기...TEST필요
 	
 	
<!-- 링크에 함수 사용하는 방법 참고자료 -->
<!-- 	<a href="#" onclick="callFunction(); return false;">call function</a> -->

2018.10.29
 - 카테고리 정렬순서
 	.- 등록순 .... regdate char 형식이라... itemno순으로 대체??
 	
 - 처리사항
 	.- 제품등록 완료 후, 카테고리 메인 페이지로 이동 (완료)
 	.- 수정, 삭제 위와 동일 (완료)
 	
 	.- 관리자 권한으로 등록, 수정, 삭제 버튼 보이게하기
 	.- 관리자 권한.... 공개여부, 작성자 보이게 하기
 	
 	.- 상세페이지에 리뷰 붙이기 (완료)
 	
2018.10.31
  - 수정한 파일 정보
 	.- Item에 사진추가 진행
 		.-- iteminfo dto 에 savefile 추가
 		.-- writeform.jsp
 		.-- KISItemWriteProAct.java
 		.-- itemcontentAct.java
 		.-- 등..등.. 거의 전부 다.....ㅠㅠㅠㅠ
  - 진행사항
  	.- 제품 및 성분 list에서 검색 기능 추가 (완료)
  	.- Item 및 Review 파일 삽입, 수정, 삭제 기능 추가 (완료)
  	.- Comments 관련 issue(댓글 겹침) 해결(ref 속성이용) (완료)
  	.- 
  	
  - Error 사항 
 	.- ItemUpdate 문제 있음.... muli로 바꾸고서 어디...안됨  (완료 -> form에 enctype="multipart/form-data" 추가)
 		(제품 UpdateProAction error -> Posted content type isn't multipart/form-data)
 	.- 제품을 삭제할 경우... 사용중인 성분입니다..???? 로 인한 삭제 불가;;; Mapping table 지울수 있어야할듯 (완료  -> delete시 예외처리)
 	
  - 미진행사항
  	.- 성분 PopUpList에 검색기능 추가... ( 넣을려다가.. 여러가지 문제 발생으로 인하여.. 빼는게 좋을듯..) (안하는걸로 결정)
  	.- 제품에서 나올경우.. Header의 카테고리가 변하는 부분 수정 필요 (완료)
  	.- 사용 안하는 Class 및 File 정리 필요 (진행 중)
  	.- 또... 뭐있었지..??? 흠.. 몰라..
 		
	
 2018.11.01
  - 수정한 파일 정보
 	.- 
 	 
  - 진행사항
  	.- 제품 좋아요 기능 추가 (완료)
  	.- Header카테고리 issue 해결 (완료)
  	.- 통합 진행 ( 90% 완료 )
  	.- 제품리스트에서 검색결과내 재검색 method 사용x 주석처리함 (완료)
  	
  - Error 사항 
 	.- 댓글 수정 진행 error ... form 생성 안됨 (완료) --> form 실행시  action 에서 불필요한 정보 읽고있었음
 	.- sorting 전체적으로 확인 필요... 이상하게 동작함...
 	.- 
 	
  - 미진행사항
  	.- 디자인 작업 진행 중
  	.-
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	