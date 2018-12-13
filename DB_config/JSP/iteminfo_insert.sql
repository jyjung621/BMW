INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '스킨푸드', '촉촉스킨', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '잇츠스킨', '로션', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '이니스프리', '아이리무버', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));

INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '올리브영', '마사지팩', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '스킨푸드', '에센스', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));

INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '샤넬', '앰플', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '디올', '립스틱', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '맥', '베이스', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '베네피트', '차차틴트', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, 'sk2', '에센스', '','','', 0, 0, 1, '윤선', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '스킨푸드', '바디로션', '','','', 0, 0, 1, '재연', fn_datetochar(sysdate));
    
INSERT INTO iteminfo VALUES(
    fn_maxnofortable('iteminfo'), 1, '설화수', '아이크림', '','','', 0, 0, 1, '재연', fn_datetochar(sysdate));
    
SELECT * FROM (SELECT ROWNUM rn, A.* FROM (SELECT * FROM iteminfo ORDER BY NAME ) A  WHERE ispublic=1) WHERE rn BETWEEN 1 AND 10;    


SELECT * FROM (SELECT ROWNUM rn, A.* FROM (SELECT * FROM category ORDER BY paren , name ) A ) where rn between 1 and 20;
    
    
