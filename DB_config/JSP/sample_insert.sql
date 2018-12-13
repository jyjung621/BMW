
-- INGREDIENT Table sample data
INSERT INTO ingredient VALUES
(
    1,
    '티타늄다이옥사이드',
    '3',
    '',
    '',
    '지성피부',
    '자외선 차단'
);
INSERT INTO ingredient VALUES
(
    70,
    '7티타늄다이옥사이드1',
    'aq',
    'assaa',
    '',
    '지성피부',
    '자외선 차단'
);
    
--SELECT * FROM (SELECT ROWNUM rn, A.* FROM (SELECT * FROM ingredient ORDER BY name ) A ) where rn between 1 and 10;
SELECT * FROM (SELECT ROWNUM rn, A.*FROM (SELECT * FROM iteminfo where categoryno=12 and name like '%O%' ORDER BY rating desc) A ) where rn between 1 and 10;

select count(*) from iteminfo where name like '%O%';

commit;

ALTER TABLE ingtlist
drop CONSTRAINT FK_iteminfo_to_ingtlist;

ALTER TABLE ingtlist
ADD CONSTRAINT FK_iteminfo_to_ingtlist
    FOREIGN KEY (itemNO)
    REFERENCES iteminfo
        (itemno)
    ON DELETE CASCADE;

select * from iteminfo where name like '%O%';

