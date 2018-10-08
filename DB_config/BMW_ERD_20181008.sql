/* 회원정보 */
DROP TABLE Member 
	CASCADE CONSTRAINTS;

/* 게시글 */
DROP TABLE Board 
	CASCADE CONSTRAINTS;

/* 저장파일 */
DROP TABLE SaveFiles 
	CASCADE CONSTRAINTS;

/* 제품정보 */
DROP TABLE ItemInfo 
	CASCADE CONSTRAINTS;

/* 카테고리 */
DROP TABLE Category 
	CASCADE CONSTRAINTS;

/* 제품성분 */
DROP TABLE Ingredient 
	CASCADE CONSTRAINTS;

/* 스크랩 */
DROP TABLE Clip 
	CASCADE CONSTRAINTS;

/* 성분목록 */
DROP TABLE IngtList 
	CASCADE CONSTRAINTS;

/* 랭킹 */
DROP TABLE Ranking 
	CASCADE CONSTRAINTS;

/* 공통테이블 */
DROP TABLE Common 
	CASCADE CONSTRAINTS;

/* 첨부글 */
DROP TABLE Comments 
	CASCADE CONSTRAINTS;

/* 회원정보 */
CREATE TABLE Member (
	memberId VARCHAR2(20 CHAR) NOT NULL, /* 아이디 */
	passwd VARCHAR2(20 CHAR) NOT NULL, /* 비밀번호 */
	nickname VARCHAR2(20 CHAR) NOT NULL, /* 닉네임 */
	name VARCHAR2(10 CHAR) NOT NULL, /* 이름 */
	birth CHAR(8) NOT NULL, /* 생년월일 */
	sex CHAR(1) DEFAULT 0 NOT NULL, /* 성별 */
	skinType CHAR(1) DEFAULT 0 NOT NULL, /* 피부타입 */
	skinComplex VARCHAR2(50 CHAR) DEFAULT 0 NOT NULL, /* 피부고민 */
	grade CHAR(1) DEFAULT 3 NOT NULL, /* 회원등급 */
	email VARCHAR2(25 CHAR) NOT NULL, /* 이메일 */
	isEmail VARCHAR2(1 CHAR) DEFAULT 0 NOT NULL, /* 이메일수신여부 */
	phone VARCHAR2(15 CHAR), /* 핸드폰번호 */
	address VARCHAR2(100 CHAR), /* 주소 */
	question VARCHAR2(30 CHAR) NOT NULL, /* 질문 */
	answer VARCHAR2(10 CHAR) NOT NULL, /* 답 */
	joinDate CHAR(14) NOT NULL, /* 가입일자 */
	regDate CHAR(14) NOT NULL /* 최근변동일시 */
);

COMMENT ON TABLE Member IS '회원정보';

COMMENT ON COLUMN Member.memberId IS '아이디';

COMMENT ON COLUMN Member.passwd IS '비밀번호';

COMMENT ON COLUMN Member.nickname IS '닉네임';

COMMENT ON COLUMN Member.name IS '이름';

COMMENT ON COLUMN Member.birth IS '생년월일';

COMMENT ON COLUMN Member.sex IS '0 : 남성 (default)
1 : 여성';

COMMENT ON COLUMN Member.skinType IS '0 : 건성
1 : 중성
2 : 지성
3 : 복합성
';

COMMENT ON COLUMN Member.skinComplex IS '0 : 해당없음 (default)
1 : 아토피 
2 : 여드름 
3 : 민감성

공통테이블 연계';

COMMENT ON COLUMN Member.grade IS '0 : 관리자
1 : 판매자
2 : 일반인 
3 : 승인대기 (default)

';

COMMENT ON COLUMN Member.email IS '이메일';

COMMENT ON COLUMN Member.isEmail IS '0 : 수신거부
1 : 수신ok';

COMMENT ON COLUMN Member.phone IS '핸드폰번호';

COMMENT ON COLUMN Member.address IS '주소';

COMMENT ON COLUMN Member.question IS '질문';

COMMENT ON COLUMN Member.answer IS '답';

COMMENT ON COLUMN Member.joinDate IS '가입일자';

COMMENT ON COLUMN Member.regDate IS '최근변동일시';

CREATE UNIQUE INDEX PK_Member
	ON Member (
		memberId ASC
	);

ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			memberId
		);

/* 게시글 */
CREATE TABLE Board (
	boardNo NUMBER(8) NOT NULL, /* 글번호 */
	boardCategory VARCHAR2(10 CHAR) NOT NULL, /* 게시판 분류 */
	title VARCHAR2(200 CHAR) NOT NULL, /* 제목 */
	content VARCHAR2(4000 CHAR) NOT NULL, /* 내용 */
	viewGrade CHAR(1) NOT NULL, /* 열람등급 */
	isPublic CHAR(1) NOT NULL, /* 공개여부 */
	hits NUMBER(8) NOT NULL, /* 조회수 */
	memberId VARCHAR2(20 CHAR) NOT NULL, /* 등록자ID */
	regDate CHAR(14) NOT NULL /* 등록일시 */
);

COMMENT ON TABLE Board IS '게시글';

COMMENT ON COLUMN Board.boardNo IS '글번호';

COMMENT ON COLUMN Board.boardCategory IS '도메인 : BBS,Notice 
공통테이블에 도메인 정의';

COMMENT ON COLUMN Board.title IS '제목';

COMMENT ON COLUMN Board.content IS '내용';

COMMENT ON COLUMN Board.viewGrade IS '공통테이블에 열람등급 정의';

COMMENT ON COLUMN Board.isPublic IS '공개여부';

COMMENT ON COLUMN Board.hits IS '조회수';

COMMENT ON COLUMN Board.memberId IS '회원정보 FK';

COMMENT ON COLUMN Board.regDate IS '등록일시';

CREATE UNIQUE INDEX PK_Board
	ON Board (
		boardNo ASC
	);

ALTER TABLE Board
	ADD
		CONSTRAINT PK_Board
		PRIMARY KEY (
			boardNo
		);

/* 저장파일 */
CREATE TABLE SaveFiles (
	mainNo VARCHAR2(20 CHAR) NOT NULL, /* 메인글번호 */
	subNo NUMBER(4) NOT NULL, /* 서브글번호 */
	ref_Table VARCHAR2(20) NOT NULL, /* 참조테이블명 */
	filesNo NUMBER(4) NOT NULL, /* 파일저장번호 */
	originFileName VARCHAR2(255 CHAR) NOT NULL, /* 원본파일명 */
	savedFileName VARCHAR2(255 CHAR) NOT NULL, /* 저장파일명 */
	fileExtend VARCHAR2(10 CHAR) NOT NULL, /* 확장자 */
	filePath VARCHAR2(255 CHAR) NOT NULL, /* 저장경로 */
	fileSize NUMBER(8) NOT NULL, /* 파일사이즈 */
	regDate CHAR(14) NOT NULL /* 등록일시 */
);

COMMENT ON TABLE SaveFiles IS '저장파일';

COMMENT ON COLUMN SaveFiles.mainNo IS '메인글번호';

COMMENT ON COLUMN SaveFiles.subNo IS '서브글번호';

COMMENT ON COLUMN SaveFiles.ref_Table IS '게시글(board), 덧글(reply), 회원정보, 제품, 스크랩 등의 테이블을 명칭을 입력
예1) 게시글 테이블에서 파일 첨부시 
메인글번호 8자리 + 서브글번호 4자리(없으므로 ''0000'') + 참조 테이블명 ''Board'' + 파일저장번호 4자리

예2) 덧글 테이블에서 파일 첨부시 
메인글번호 8자리 + 서브글번호 4자리 + 참조 테이블명 ''Board'' + 파일저장번호 4자리

예3) 제품정보 테이블에서 파일 첨부시 
메인글번호 8자리 + 서브글번호 4자리(없으므로 ''0000'') + 참조 테이블명 ''Board'' + 파일저장번호 4자리

예4) 스크랩 테이블에서 파일 첨부시 
메인글번호 8자리 + 서브글번호 4자리 + 참조 테이블명 ''Board'' + 파일저장번호 4자리

예5) 회원정보 테이블에서 파일 첨부시 
메인글번호 8자리 + 서브글번호 4자리(없으므로 ''0000'') + 참조 테이블명 ''Board'' + 파일저장번호 4자리


';

COMMENT ON COLUMN SaveFiles.filesNo IS '파일저장번호';

COMMENT ON COLUMN SaveFiles.originFileName IS '원본파일명';

COMMENT ON COLUMN SaveFiles.savedFileName IS '저장파일명';

COMMENT ON COLUMN SaveFiles.fileExtend IS '확장자';

COMMENT ON COLUMN SaveFiles.filePath IS '저장경로';

COMMENT ON COLUMN SaveFiles.fileSize IS '파일사이즈';

COMMENT ON COLUMN SaveFiles.regDate IS '등록일시';

CREATE UNIQUE INDEX PK_SaveFiles
	ON SaveFiles (
		mainNo ASC,
		subNo ASC,
		ref_Table ASC,
		filesNo ASC
	);

ALTER TABLE SaveFiles
	ADD
		CONSTRAINT PK_SaveFiles
		PRIMARY KEY (
			mainNo,
			subNo,
			ref_Table,
			filesNo
		);

/* 제품정보 */
CREATE TABLE ItemInfo (
	itemNo NUMBER(8) NOT NULL, /* 제품번호 */
	categoryNo NUMBER(8) DEFAULT 0 NOT NULL, /* 카테고리번호 */
	brand VARCHAR2(20 CHAR) NOT NULL, /* 브랜드명 */
	name VARCHAR2(20 CHAR) NOT NULL, /* 제품명 */
	info VARCHAR2(4000 CHAR), /* 제품설명 */
	price NUMBER(12), /* 가격 */
	rating NUMBER(1,1), /* 평균평점 */
	hits NUMBER(8) DEFAULT 0 NOT NULL, /* 조회수 */
	likeCnt NUMBER(8) DEFAULT 0 NOT NULL, /* 추천수 */
	isPublic CHAR(1) DEFAULT 1 NOT NULL, /* 공개여부 */
	memberId VARCHAR2(20 CHAR) NOT NULL, /* 등록자ID */
	regDate CHAR(14) NOT NULL /* 등록일시 */
);

COMMENT ON TABLE ItemInfo IS '제품정보';

COMMENT ON COLUMN ItemInfo.itemNo IS '제품번호';

COMMENT ON COLUMN ItemInfo.categoryNo IS '0 : 임시카테고리 (default)
1.
2.
3.
4.
';

COMMENT ON COLUMN ItemInfo.brand IS '0 : 미정 (default)
1.
2
3.


공통테이블 연계
';

COMMENT ON COLUMN ItemInfo.name IS '제품명';

COMMENT ON COLUMN ItemInfo.info IS 'link 통해서 표현';

COMMENT ON COLUMN ItemInfo.price IS '가격';

COMMENT ON COLUMN ItemInfo.rating IS 'ra';

COMMENT ON COLUMN ItemInfo.hits IS '조회수';

COMMENT ON COLUMN ItemInfo.likeCnt IS '추천수';

COMMENT ON COLUMN ItemInfo.isPublic IS '0 : 비공개
1 : 공개 ( default)';

COMMENT ON COLUMN ItemInfo.memberId IS '등록자ID';

COMMENT ON COLUMN ItemInfo.regDate IS '등록일시';

CREATE UNIQUE INDEX PK_ItemInfo
	ON ItemInfo (
		itemNo ASC
	);

ALTER TABLE ItemInfo
	ADD
		CONSTRAINT PK_ItemInfo
		PRIMARY KEY (
			itemNo
		);

/* 카테고리 */
CREATE TABLE Category (
	categoryNo NUMBER(8) NOT NULL, /* 카테고리번호 */
	name VARCHAR2(20 CHAR) NOT NULL, /* 이름 */
	parent VARCHAR2(20 CHAR), /* 상위카테고리 */
	isPublic VARCHAR2(1 CHAR) DEFAULT 1 NOT NULL /* 공개여부 */
);

COMMENT ON TABLE Category IS '카테고리';

COMMENT ON COLUMN Category.categoryNo IS '카테고리번호';

COMMENT ON COLUMN Category.name IS '이름';

COMMENT ON COLUMN Category.parent IS '상위카테고리';

COMMENT ON COLUMN Category.isPublic IS '0 : 비공개
1 : 공개 (default)';

CREATE UNIQUE INDEX PK_Category
	ON Category (
		categoryNo ASC
	);

ALTER TABLE Category
	ADD
		CONSTRAINT PK_Category
		PRIMARY KEY (
			categoryNo
		);

/* 제품성분 */
CREATE TABLE Ingredient (
	ingredientNo NUMBER(8) NOT NULL, /* 성분번호 */
	name VARCHAR2(20 CHAR) NOT NULL, /* 성분명 */
	grade VARCHAR2(2 CHAR) DEFAULT 0 NOT NULL, /* 성분등급 */
	danger20 VARCHAR2(40 CHAR), /* 20가지주의성분 */
	dangerAllergy VARCHAR2(40 CHAR), /* 알레르기주의성분 */
	specialyType VARCHAR2(40 CHAR), /* 피부타입별특이성분 */
	functional VARCHAR2(40 CHAR) /* 기능성성분 */
);

COMMENT ON TABLE Ingredient IS '제품성분';

COMMENT ON COLUMN Ingredient.ingredientNo IS '성분번호';

COMMENT ON COLUMN Ingredient.name IS '성분명';

COMMENT ON COLUMN Ingredient.grade IS '0 : 미지정
1.
2.

';

COMMENT ON COLUMN Ingredient.danger20 IS '20가지주의성분';

COMMENT ON COLUMN Ingredient.dangerAllergy IS '알레르기주의성분';

COMMENT ON COLUMN Ingredient.specialyType IS '피부타입별특이성분';

COMMENT ON COLUMN Ingredient.functional IS '기능성성분';

CREATE UNIQUE INDEX PK_Ingredient
	ON Ingredient (
		ingredientNo ASC
	);

ALTER TABLE Ingredient
	ADD
		CONSTRAINT PK_Ingredient
		PRIMARY KEY (
			ingredientNo
		);

/* 스크랩 */
CREATE TABLE Clip (
	memberId VARCHAR2(20 CHAR) NOT NULL, /* 아이디 */
	mainNo NUMBER(8) NOT NULL, /* 메인글번호 */
	subNo NUMBER(4) NOT NULL, /* 서브글번호 */
	title VARCHAR2(100 CHAR) NOT NULL, /* 커스텀제목 */
	regDate CHAR(14) NOT NULL /* 등록일시 */
);

COMMENT ON TABLE Clip IS '스크랩';

COMMENT ON COLUMN Clip.memberId IS '아이디';

COMMENT ON COLUMN Clip.mainNo IS '메인글번호';

COMMENT ON COLUMN Clip.subNo IS '서브글번호';

COMMENT ON COLUMN Clip.title IS 'default -> 이전 제목 가져오기';

COMMENT ON COLUMN Clip.regDate IS '등록일시';

CREATE UNIQUE INDEX PK_Clip
	ON Clip (
		memberId ASC,
		mainNo ASC,
		subNo ASC
	);

ALTER TABLE Clip
	ADD
		CONSTRAINT PK_Clip
		PRIMARY KEY (
			memberId,
			mainNo,
			subNo
		);

/* 성분목록 */
CREATE TABLE IngtList (
	itemNo NUMBER(8) NOT NULL, /* 제품번호 */
	ingredientNo NUMBER(8) NOT NULL /* 성분번호 */
);

COMMENT ON TABLE IngtList IS '성분목록';

COMMENT ON COLUMN IngtList.itemNo IS '제품번호';

COMMENT ON COLUMN IngtList.ingredientNo IS '성분번호';

CREATE UNIQUE INDEX PK_IngtList
	ON IngtList (
		itemNo ASC,
		ingredientNo ASC
	);

ALTER TABLE IngtList
	ADD
		CONSTRAINT PK_IngtList
		PRIMARY KEY (
			itemNo,
			ingredientNo
		);

/* 랭킹 */
CREATE TABLE Ranking (
	rankNo NUMBER(8) NOT NULL, /* 랭킹번호 */
	groupName VARCHAR2(20 CHAR), /* 그룹 */
	item VARCHAR2(10 CHAR) /* 항목 */
);

COMMENT ON TABLE Ranking IS '랭킹';

COMMENT ON COLUMN Ranking.rankNo IS '랭킹번호';

COMMENT ON COLUMN Ranking.groupName IS '그룹';

COMMENT ON COLUMN Ranking.item IS '항목';

CREATE UNIQUE INDEX PK_Ranking
	ON Ranking (
		rankNo ASC
	);

ALTER TABLE Ranking
	ADD
		CONSTRAINT PK_Ranking
		PRIMARY KEY (
			rankNo
		);

/* 공통테이블 */
CREATE TABLE Common (
	commonCode VARCHAR2(20 CHAR) NOT NULL, /* 공통코드 */
	codeName VARCHAR2(200 CHAR) NOT NULL, /* 코드 */
	codeValue VARCHAR2(200 CHAR) NOT NULL, /* 값 */
	seq NUMBER(3) NOT NULL, /* 순서 */
	explain VARCHAR2(500 CHAR), /* 설명 */
	memberId VARCHAR2(20 CHAR) NOT NULL, /* 등록자ID */
	regDate CHAR(14) NOT NULL /* 등록일시 */
);

COMMENT ON TABLE Common IS '공통테이블';

COMMENT ON COLUMN Common.commonCode IS '값들의 공통적인 부분을 집합시켜 사용

예 1) 카테고리를 사용시
대분류 카테고리 일때 
CommonCode = ''Category'',
Value = ''Category'' 또는 ''카테고리'',		Seq = 0,
Desc = ''카테고리의 대분류'',

예 2) 카테고리의 내용을 사용시 대분류 카테고리에 항목들
CommonCode = ''Category'',
Value = ''Face'' 또는 ''얼굴'', 			Seq = 1,
Desc = ''카테고리의 분류내 얼굴 항목'',

CommonCode = ''Category'',
Value = ''Lip'' 또는 ''입술'',				Seq = 2,
Desc = ''카테고리의 분류내 입술 항목'',

CommonCode = ''Category'' ,			
Value = ''Eyes'' 또는 ''눈'',				Seq = 3,
Desc = ''카테고리의 분류내 눈 항목'',

중분류로 나눌때
CommonCode = ''Lip'',
Value = ''Lip'' 또는 ''입술'',				Seq = 0,
Desc = ''입술의 중분류'',

CommonCode = ''Lip'',
Value = ''LipBam'' 또는 ''립밤'',			Seq = 1,
Desc = ''입술의 분류내 립밤 항목'',

CommonCode = ''Lip'',
Value = ''LipStick'' 또는 ''립스틱'',		Seq = 2,
Desc = ''입술의 분류내 립스틱 항목'',
';

COMMENT ON COLUMN Common.codeName IS '코드명';

COMMENT ON COLUMN Common.codeValue IS '값 정의';

COMMENT ON COLUMN Common.seq IS '공통코드 내에 순서를 정의할때';

COMMENT ON COLUMN Common.explain IS '각 값의 설명 기술';

COMMENT ON COLUMN Common.memberId IS '등록자ID';

COMMENT ON COLUMN Common.regDate IS '등록일시';

CREATE UNIQUE INDEX PK_Common
	ON Common (
		commonCode ASC,
		codeName ASC
	);

ALTER TABLE Common
	ADD
		CONSTRAINT PK_Common
		PRIMARY KEY (
			commonCode,
			codeName
		);

/* 첨부글 */
CREATE TABLE Comments (
	mainNo NUMBER(8) NOT NULL, /* 메인글번호 */
	subNo NUMBER(4) NOT NULL, /* 서브글번호 */
	ref_Table VARCHAR2(20 CHAR) NOT NULL, /* 참조테이블명 */
	isRePublic CHAR(1) NOT NULL, /* 공개여부 */
	hits NUMBER(8) NOT NULL, /* 조회수 */
	ref NUMBER(4), /* 참조글 */
	re_Step NUMBER(4), /* 정렬순서 */
	re_Level NUMBER(4), /* 레벨 */
	content VARCHAR2(4000 CHAR), /* 내용 */
	rating NUMBER(1), /* 평점 */
	likeCnt NUMBER(8), /* 추천수 */
	memberId VARCHAR2(20 CHAR) NOT NULL, /* 등록자ID */
	regDate CHAR(14) NOT NULL /* 등록일시 */
);

COMMENT ON TABLE Comments IS '첨부글';

COMMENT ON COLUMN Comments.mainNo IS '메인글번호';

COMMENT ON COLUMN Comments.subNo IS '서브글번호';

COMMENT ON COLUMN Comments.ref_Table IS '제품정보';

COMMENT ON COLUMN Comments.isRePublic IS '공개여부';

COMMENT ON COLUMN Comments.hits IS '조회수';

COMMENT ON COLUMN Comments.ref IS '참조글';

COMMENT ON COLUMN Comments.re_Step IS '정렬순서';

COMMENT ON COLUMN Comments.re_Level IS '레벨';

COMMENT ON COLUMN Comments.content IS '내용';

COMMENT ON COLUMN Comments.rating IS '평점';

COMMENT ON COLUMN Comments.likeCnt IS '추천수';

COMMENT ON COLUMN Comments.memberId IS '등록자ID';

COMMENT ON COLUMN Comments.regDate IS '등록일시';

CREATE UNIQUE INDEX PK_Comments
	ON Comments (
		mainNo ASC,
		subNo ASC
	);

ALTER TABLE Comments
	ADD
		CONSTRAINT PK_Comments
		PRIMARY KEY (
			mainNo,
			subNo
		);

ALTER TABLE ItemInfo
	ADD
		CONSTRAINT FK_Category_TO_ItemInfo
		FOREIGN KEY (
			categoryNo
		)
		REFERENCES Category (
			categoryNo
		);

ALTER TABLE IngtList
	ADD
		CONSTRAINT FK_ItemInfo_TO_IngtList
		FOREIGN KEY (
			itemNo
		)
		REFERENCES ItemInfo (
			itemNo
		);

ALTER TABLE IngtList
	ADD
		CONSTRAINT FK_Ingredient_TO_IngtList
		FOREIGN KEY (
			ingredientNo
		)
		REFERENCES Ingredient (
			ingredientNo
		);

ALTER TABLE Comments
	ADD
		CONSTRAINT FK_Board_TO_Comments
		FOREIGN KEY (
			mainNo
		)
		REFERENCES Board (
			boardNo
		);

ALTER TABLE Comments
	ADD
		CONSTRAINT FK_ItemInfo_TO_Comments
		FOREIGN KEY (
			mainNo
		)
		REFERENCES ItemInfo (
			itemNo
		);