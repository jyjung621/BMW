INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '스킨', '스킨케어', 1); 

INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '로션', '스킨케어', 1); 

INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '에센스', '스킨케어', 1); 
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '세럼', '스킨케어', 1);     
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '립스틱', '메이크업', 1); 
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '파운데이션', '메이크업', 1);   
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '비비크림', '메이크업', 1); 
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '크림', '스킨케어', 1);     
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '마스카라', '메이크업', 1); 
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '셰도우', '메이크업', 1);
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '아이라이너', '메이크업', 1); 
    
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '쉐딩', '메이크업', 1);     

INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), 'OPI2', '네일', 1); 
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '노윤선', '메이크업', 1);     


INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '스킨케어', '', 1);   
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '메이크업', '', 1);   
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '클렌징', '', 1);   
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '팩', '', 1);
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '네일', '', 1); 
INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '향수', '', 1);       
ROLLBACK;
COMMIT;
delete from category;

insert into category values (fn_maxnofortable('category'),'립밤','','1');


SELECT * FROM (SELECT ROWNUM rn, A.* FROM (SELECT * FROM category ORDER BY name ) A ) where rn between 1 and 10;

select count(*) from category;

select count(*) from category;


SELECT * FROM category WHERE categoryNo=2;

select count(*) from category;

select * from category where parent is null;


INSERT INTO CATEGORY VALUES(
    fn_maxnofortable('category'), '마스카라', '에센스', 1); 

SELECT * FROM CATEGORY WHERE NAME='스킨';



select * from category where name=OPI;



