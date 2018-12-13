/* ȸ������ */
DROP TABLE Member 
	CASCADE CONSTRAINTS;

/* �Խñ� */
DROP TABLE Board 
	CASCADE CONSTRAINTS;

/* �������� */
DROP TABLE SaveFiles 
	CASCADE CONSTRAINTS;

/* ��ǰ���� */
DROP TABLE ItemInfo 
	CASCADE CONSTRAINTS;

/* ī�װ� */
DROP TABLE Category 
	CASCADE CONSTRAINTS;

/* ��ǰ���� */
DROP TABLE Ingredient 
	CASCADE CONSTRAINTS;

/* ��ũ�� */
DROP TABLE Clip 
	CASCADE CONSTRAINTS;

/* ���и�� */
DROP TABLE IngtList 
	CASCADE CONSTRAINTS;

/* ��ŷ */
DROP TABLE Ranking 
	CASCADE CONSTRAINTS;

/* �������̺� */
DROP TABLE Common 
	CASCADE CONSTRAINTS;

/* ÷�α� */
DROP TABLE Comments 
	CASCADE CONSTRAINTS;

/* ȸ������ */
CREATE TABLE Member (
	memberId VARCHAR2(20 CHAR) NOT NULL, /* ���̵� */
	passwd VARCHAR2(20 CHAR) NOT NULL, /* ��й�ȣ */
	nickname VARCHAR2(20 CHAR) NOT NULL, /* �г��� */
	name VARCHAR2(10 CHAR) NOT NULL, /* �̸� */
	birth CHAR(8) NOT NULL, /* ������� */
	sex CHAR(1) DEFAULT 0 NOT NULL, /* ���� */
	skinType CHAR(1) DEFAULT 0 NOT NULL, /* �Ǻ�Ÿ�� */
	skinComplex VARCHAR2(50 CHAR) DEFAULT 0 NOT NULL, /* �Ǻΰ�� */
	grade CHAR(1) DEFAULT 3 NOT NULL, /* ȸ����� */
	email VARCHAR2(25 CHAR) NOT NULL, /* �̸��� */
	isEmail VARCHAR2(1 CHAR) DEFAULT 0 NOT NULL, /* �̸��ϼ��ſ��� */
	phone VARCHAR2(15 CHAR), /* �ڵ�����ȣ */
	address VARCHAR2(100 CHAR), /* �ּ� */
	question VARCHAR2(30 CHAR) NOT NULL, /* ���� */
	answer VARCHAR2(10 CHAR) NOT NULL, /* �� */
	joinDate CHAR(14) NOT NULL, /* �������� */
	regDate CHAR(14) NOT NULL /* �ֱٺ����Ͻ� */
);

COMMENT ON TABLE Member IS 'ȸ������';

COMMENT ON COLUMN Member.memberId IS '���̵�';

COMMENT ON COLUMN Member.passwd IS '��й�ȣ';

COMMENT ON COLUMN Member.nickname IS '�г���';

COMMENT ON COLUMN Member.name IS '�̸�';

COMMENT ON COLUMN Member.birth IS '�������';

COMMENT ON COLUMN Member.sex IS '0 : ���� (default)
1 : ����';

COMMENT ON COLUMN Member.skinType IS '0 : �Ǽ�
1 : �߼�
2 : ����
3 : ���ռ�
';

COMMENT ON COLUMN Member.skinComplex IS '0 : �ش���� (default)
1 : ������ 
2 : ���帧 
3 : �ΰ���

�������̺� ����';

COMMENT ON COLUMN Member.grade IS '0 : ������
1 : �Ǹ���
2 : �Ϲ��� 
3 : ���δ�� (default)

';

COMMENT ON COLUMN Member.email IS '�̸���';

COMMENT ON COLUMN Member.isEmail IS '0 : ���Űź�
1 : ����ok';

COMMENT ON COLUMN Member.phone IS '�ڵ�����ȣ';

COMMENT ON COLUMN Member.address IS '�ּ�';

COMMENT ON COLUMN Member.question IS '����';

COMMENT ON COLUMN Member.answer IS '��';

COMMENT ON COLUMN Member.joinDate IS '��������';

COMMENT ON COLUMN Member.regDate IS '�ֱٺ����Ͻ�';

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

/* �Խñ� */
CREATE TABLE Board (
	boardNo NUMBER(8) NOT NULL, /* �۹�ȣ */
	boardCategory VARCHAR2(10 CHAR) NOT NULL, /* �Խ��� �з� */
	title VARCHAR2(200 CHAR) NOT NULL, /* ���� */
	content VARCHAR2(4000 CHAR) NOT NULL, /* ���� */
	viewGrade CHAR(1) NOT NULL, /* ������� */
	isPublic CHAR(1) NOT NULL, /* �������� */
	hits NUMBER(8) NOT NULL, /* ��ȸ�� */
	memberId VARCHAR2(20 CHAR) NOT NULL, /* �����ID */
	regDate CHAR(14) NOT NULL /* ����Ͻ� */
);

COMMENT ON TABLE Board IS '�Խñ�';

COMMENT ON COLUMN Board.boardNo IS '�۹�ȣ';

COMMENT ON COLUMN Board.boardCategory IS '������ : BBS,Notice 
�������̺� ������ ����';

COMMENT ON COLUMN Board.title IS '����';

COMMENT ON COLUMN Board.content IS '����';

COMMENT ON COLUMN Board.viewGrade IS '�������̺� ������� ����';

COMMENT ON COLUMN Board.isPublic IS '��������';

COMMENT ON COLUMN Board.hits IS '��ȸ��';

COMMENT ON COLUMN Board.memberId IS 'ȸ������ FK';

COMMENT ON COLUMN Board.regDate IS '����Ͻ�';

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

/* �������� */
CREATE TABLE SaveFiles (
	mainNo VARCHAR2(20 CHAR) NOT NULL, /* ���α۹�ȣ */
	subNo NUMBER(4) NOT NULL, /* ����۹�ȣ */
	ref_Table VARCHAR2(20) NOT NULL, /* �������̺�� */
	filesNo NUMBER(4) NOT NULL, /* ���������ȣ */
	originFileName VARCHAR2(255 CHAR) NOT NULL, /* �������ϸ� */
	savedFileName VARCHAR2(255 CHAR) NOT NULL, /* �������ϸ� */
	fileExtend VARCHAR2(10 CHAR) NOT NULL, /* Ȯ���� */
	filePath VARCHAR2(255 CHAR) NOT NULL, /* ������ */
	fileSize NUMBER(8) NOT NULL, /* ���ϻ����� */
	regDate CHAR(14) NOT NULL /* ����Ͻ� */
);

COMMENT ON TABLE SaveFiles IS '��������';

COMMENT ON COLUMN SaveFiles.mainNo IS '���α۹�ȣ';

COMMENT ON COLUMN SaveFiles.subNo IS '����۹�ȣ';

COMMENT ON COLUMN SaveFiles.ref_Table IS '�Խñ�(board), ����(reply), ȸ������, ��ǰ, ��ũ�� ���� ���̺��� ��Ī�� �Է�
��1) �Խñ� ���̺��� ���� ÷�ν� 
���α۹�ȣ 8�ڸ� + ����۹�ȣ 4�ڸ�(�����Ƿ� ''0000'') + ���� ���̺�� ''Board'' + ���������ȣ 4�ڸ�

��2) ���� ���̺��� ���� ÷�ν� 
���α۹�ȣ 8�ڸ� + ����۹�ȣ 4�ڸ� + ���� ���̺�� ''Board'' + ���������ȣ 4�ڸ�

��3) ��ǰ���� ���̺��� ���� ÷�ν� 
���α۹�ȣ 8�ڸ� + ����۹�ȣ 4�ڸ�(�����Ƿ� ''0000'') + ���� ���̺�� ''Board'' + ���������ȣ 4�ڸ�

��4) ��ũ�� ���̺��� ���� ÷�ν� 
���α۹�ȣ 8�ڸ� + ����۹�ȣ 4�ڸ� + ���� ���̺�� ''Board'' + ���������ȣ 4�ڸ�

��5) ȸ������ ���̺��� ���� ÷�ν� 
���α۹�ȣ 8�ڸ� + ����۹�ȣ 4�ڸ�(�����Ƿ� ''0000'') + ���� ���̺�� ''Board'' + ���������ȣ 4�ڸ�


';

COMMENT ON COLUMN SaveFiles.filesNo IS '���������ȣ';

COMMENT ON COLUMN SaveFiles.originFileName IS '�������ϸ�';

COMMENT ON COLUMN SaveFiles.savedFileName IS '�������ϸ�';

COMMENT ON COLUMN SaveFiles.fileExtend IS 'Ȯ����';

COMMENT ON COLUMN SaveFiles.filePath IS '������';

COMMENT ON COLUMN SaveFiles.fileSize IS '���ϻ�����';

COMMENT ON COLUMN SaveFiles.regDate IS '����Ͻ�';

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

/* ��ǰ���� */
CREATE TABLE ItemInfo (
	itemNo NUMBER(8) NOT NULL, /* ��ǰ��ȣ */
	categoryNo NUMBER(8) DEFAULT 0 NOT NULL, /* ī�װ���ȣ */
	brand VARCHAR2(20 CHAR) NOT NULL, /* �귣��� */
	name VARCHAR2(20 CHAR) NOT NULL, /* ��ǰ�� */
	info VARCHAR2(4000 CHAR), /* ��ǰ���� */
	price NUMBER(12), /* ���� */
	rating NUMBER(1,1), /* ������� */
	hits NUMBER(8) DEFAULT 0 NOT NULL, /* ��ȸ�� */
	likeCnt NUMBER(8) DEFAULT 0 NOT NULL, /* ��õ�� */
	isPublic CHAR(1) DEFAULT 1 NOT NULL, /* �������� */
	memberId VARCHAR2(20 CHAR) NOT NULL, /* �����ID */
	regDate CHAR(14) NOT NULL /* ����Ͻ� */
);

COMMENT ON TABLE ItemInfo IS '��ǰ����';

COMMENT ON COLUMN ItemInfo.itemNo IS '��ǰ��ȣ';

COMMENT ON COLUMN ItemInfo.categoryNo IS '0 : �ӽ�ī�װ� (default)
1.
2.
3.
4.
';

COMMENT ON COLUMN ItemInfo.brand IS '0 : ���� (default)
1.
2
3.


�������̺� ����
';

COMMENT ON COLUMN ItemInfo.name IS '��ǰ��';

COMMENT ON COLUMN ItemInfo.info IS 'link ���ؼ� ǥ��';

COMMENT ON COLUMN ItemInfo.price IS '����';

COMMENT ON COLUMN ItemInfo.rating IS 'ra';

COMMENT ON COLUMN ItemInfo.hits IS '��ȸ��';

COMMENT ON COLUMN ItemInfo.likeCnt IS '��õ��';

COMMENT ON COLUMN ItemInfo.isPublic IS '0 : �����
1 : ���� ( default)';

COMMENT ON COLUMN ItemInfo.memberId IS '�����ID';

COMMENT ON COLUMN ItemInfo.regDate IS '����Ͻ�';

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

/* ī�װ� */
CREATE TABLE Category (
	categoryNo NUMBER(8) NOT NULL, /* ī�װ���ȣ */
	name VARCHAR2(20 CHAR) NOT NULL, /* �̸� */
	parent VARCHAR2(20 CHAR), /* ����ī�װ� */
	isPublic VARCHAR2(1 CHAR) DEFAULT 1 NOT NULL /* �������� */
);

COMMENT ON TABLE Category IS 'ī�װ�';

COMMENT ON COLUMN Category.categoryNo IS 'ī�װ���ȣ';

COMMENT ON COLUMN Category.name IS '�̸�';

COMMENT ON COLUMN Category.parent IS '����ī�װ�';

COMMENT ON COLUMN Category.isPublic IS '0 : �����
1 : ���� (default)';

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

/* ��ǰ���� */
CREATE TABLE Ingredient (
	ingredientNo NUMBER(8) NOT NULL, /* ���й�ȣ */
	name VARCHAR2(20 CHAR) NOT NULL, /* ���и� */
	grade VARCHAR2(2 CHAR) DEFAULT 0 NOT NULL, /* ���е�� */
	danger20 VARCHAR2(40 CHAR), /* 20�������Ǽ��� */
	dangerAllergy VARCHAR2(40 CHAR), /* �˷��������Ǽ��� */
	specialyType VARCHAR2(40 CHAR), /* �Ǻ�Ÿ�Ժ�Ư�̼��� */
	functional VARCHAR2(40 CHAR) /* ��ɼ����� */
);

COMMENT ON TABLE Ingredient IS '��ǰ����';

COMMENT ON COLUMN Ingredient.ingredientNo IS '���й�ȣ';

COMMENT ON COLUMN Ingredient.name IS '���и�';

COMMENT ON COLUMN Ingredient.grade IS '0 : ������
1.
2.

';

COMMENT ON COLUMN Ingredient.danger20 IS '20�������Ǽ���';

COMMENT ON COLUMN Ingredient.dangerAllergy IS '�˷��������Ǽ���';

COMMENT ON COLUMN Ingredient.specialyType IS '�Ǻ�Ÿ�Ժ�Ư�̼���';

COMMENT ON COLUMN Ingredient.functional IS '��ɼ�����';

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

/* ��ũ�� */
CREATE TABLE Clip (
	memberId VARCHAR2(20 CHAR) NOT NULL, /* ���̵� */
	mainNo NUMBER(8) NOT NULL, /* ���α۹�ȣ */
	subNo NUMBER(4) NOT NULL, /* ����۹�ȣ */
	title VARCHAR2(100 CHAR) NOT NULL, /* Ŀ�������� */
	regDate CHAR(14) NOT NULL /* ����Ͻ� */
);

COMMENT ON TABLE Clip IS '��ũ��';

COMMENT ON COLUMN Clip.memberId IS '���̵�';

COMMENT ON COLUMN Clip.mainNo IS '���α۹�ȣ';

COMMENT ON COLUMN Clip.subNo IS '����۹�ȣ';

COMMENT ON COLUMN Clip.title IS 'default -> ���� ���� ��������';

COMMENT ON COLUMN Clip.regDate IS '����Ͻ�';

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

/* ���и�� */
CREATE TABLE IngtList (
	itemNo NUMBER(8) NOT NULL, /* ��ǰ��ȣ */
	ingredientNo NUMBER(8) NOT NULL /* ���й�ȣ */
);

COMMENT ON TABLE IngtList IS '���и��';

COMMENT ON COLUMN IngtList.itemNo IS '��ǰ��ȣ';

COMMENT ON COLUMN IngtList.ingredientNo IS '���й�ȣ';

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

/* ��ŷ */
CREATE TABLE Ranking (
	rankNo NUMBER(8) NOT NULL, /* ��ŷ��ȣ */
	groupName VARCHAR2(20 CHAR), /* �׷� */
	item VARCHAR2(10 CHAR) /* �׸� */
);

COMMENT ON TABLE Ranking IS '��ŷ';

COMMENT ON COLUMN Ranking.rankNo IS '��ŷ��ȣ';

COMMENT ON COLUMN Ranking.groupName IS '�׷�';

COMMENT ON COLUMN Ranking.item IS '�׸�';

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

/* �������̺� */
CREATE TABLE Common (
	commonCode VARCHAR2(20 CHAR) NOT NULL, /* �����ڵ� */
	codeName VARCHAR2(200 CHAR) NOT NULL, /* �ڵ� */
	codeValue VARCHAR2(200 CHAR) NOT NULL, /* �� */
	seq NUMBER(3) NOT NULL, /* ���� */
	explain VARCHAR2(500 CHAR), /* ���� */
	memberId VARCHAR2(20 CHAR) NOT NULL, /* �����ID */
	regDate CHAR(14) NOT NULL /* ����Ͻ� */
);

COMMENT ON TABLE Common IS '�������̺�';

COMMENT ON COLUMN Common.commonCode IS '������ �������� �κ��� ���ս��� ���

�� 1) ī�װ��� ����
��з� ī�װ� �϶� 
CommonCode = ''Category'',
Value = ''Category'' �Ǵ� ''ī�װ�'',		Seq = 0,
Desc = ''ī�װ��� ��з�'',

�� 2) ī�װ��� ������ ���� ��з� ī�װ��� �׸��
CommonCode = ''Category'',
Value = ''Face'' �Ǵ� ''��'', 			Seq = 1,
Desc = ''ī�װ��� �з��� �� �׸�'',

CommonCode = ''Category'',
Value = ''Lip'' �Ǵ� ''�Լ�'',				Seq = 2,
Desc = ''ī�װ��� �з��� �Լ� �׸�'',

CommonCode = ''Category'' ,			
Value = ''Eyes'' �Ǵ� ''��'',				Seq = 3,
Desc = ''ī�װ��� �з��� �� �׸�'',

�ߺз��� ������
CommonCode = ''Lip'',
Value = ''Lip'' �Ǵ� ''�Լ�'',				Seq = 0,
Desc = ''�Լ��� �ߺз�'',

CommonCode = ''Lip'',
Value = ''LipBam'' �Ǵ� ''����'',			Seq = 1,
Desc = ''�Լ��� �з��� ���� �׸�'',

CommonCode = ''Lip'',
Value = ''LipStick'' �Ǵ� ''����ƽ'',		Seq = 2,
Desc = ''�Լ��� �з��� ����ƽ �׸�'',
';

COMMENT ON COLUMN Common.codeName IS '�ڵ��';

COMMENT ON COLUMN Common.codeValue IS '�� ����';

COMMENT ON COLUMN Common.seq IS '�����ڵ� ���� ������ �����Ҷ�';

COMMENT ON COLUMN Common.explain IS '�� ���� ���� ���';

COMMENT ON COLUMN Common.memberId IS '�����ID';

COMMENT ON COLUMN Common.regDate IS '����Ͻ�';

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

/* ÷�α� */
CREATE TABLE Comments (
	mainNo NUMBER(8) NOT NULL, /* ���α۹�ȣ */
	subNo NUMBER(4) NOT NULL, /* ����۹�ȣ */
	ref_Table VARCHAR2(20 CHAR) NOT NULL, /* �������̺�� */
	isRePublic CHAR(1) NOT NULL, /* �������� */
	hits NUMBER(8) NOT NULL, /* ��ȸ�� */
	ref NUMBER(4), /* ������ */
	re_Step NUMBER(4), /* ���ļ��� */
	re_Level NUMBER(4), /* ���� */
	content VARCHAR2(4000 CHAR), /* ���� */
	rating NUMBER(1), /* ���� */
	likeCnt NUMBER(8), /* ��õ�� */
	memberId VARCHAR2(20 CHAR) NOT NULL, /* �����ID */
	regDate CHAR(14) NOT NULL /* ����Ͻ� */
);

COMMENT ON TABLE Comments IS '÷�α�';

COMMENT ON COLUMN Comments.mainNo IS '���α۹�ȣ';

COMMENT ON COLUMN Comments.subNo IS '����۹�ȣ';

COMMENT ON COLUMN Comments.ref_Table IS '��ǰ����';

COMMENT ON COLUMN Comments.isRePublic IS '��������';

COMMENT ON COLUMN Comments.hits IS '��ȸ��';

COMMENT ON COLUMN Comments.ref IS '������';

COMMENT ON COLUMN Comments.re_Step IS '���ļ���';

COMMENT ON COLUMN Comments.re_Level IS '����';

COMMENT ON COLUMN Comments.content IS '����';

COMMENT ON COLUMN Comments.rating IS '����';

COMMENT ON COLUMN Comments.likeCnt IS '��õ��';

COMMENT ON COLUMN Comments.memberId IS '�����ID';

COMMENT ON COLUMN Comments.regDate IS '����Ͻ�';

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