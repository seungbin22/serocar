CREATE TABLE MEMBER (
   membernum NUMBER,
   memberpassword varchar2(200) NOT null,
   memberemail varchar2(30) PRIMARY KEY NOT null,
   memberbirth varchar2(30) NOT null,
   membergender varchar2(10) NOT null,
   membernickname varchar2(30) NOT null,
   memberdate DATE,
   busniessNum varchar2(100),
   profile varchar2(1000) default'default_profile.jpg' NOT null
   );

 CREATE SEQUENCE seq_membernum
INCREMENT BY 1
START WITH 1 ;
DROP SEQUENCE seq_membernum;

select *
      from (select rownum as num, member.* from member)
      where num between '1' and '9';

INSERT INTO MEMBER values(seq_membernum.nextval, '123', '123', '191919', 'mela', '새로카', sysdate,'1','default_profile.jpg');
SELECT * FROM MEMBER;
DROP table MEMBER;

select * from member where memberEmail = '123';

UPDATE MEMBER SET PROFILE = 'default_profile.jpg', MEMBERNICKNAME = '홍석재' WHERE MEMBEREMAIL = 'hongs8823@nate.com';
  
  CREATE TABLE community(
   comnum NUMBER PRIMARY key,
   membernickname varchar2(30),
   memberemail varchar2(40),
   comtitle varchar2(1000) NOT null,
   comcontent varchar2(4000) NOT null,
   comdate DATE,
   comviews NUMBER,
   comreco NUMBER,
   com_re_ref NUMBER,
   com_re_lev NUMBER,
   com_re_seq NUMBER,
   CONSTRAINT c_community_fk FOREIGN KEY (memberemail) REFERENCES member(memberemail)
);
INSERT INTO COMMUNITY VALUES('0', '123', '123', '제목', '내용', sysdate, '1', '123', '1', '1', '1');
INSERT INTO COMMUNITY VALUES(seq_comnum.nextval, '닉네임', '123', '제목', '내용', sysdate, '1', '123', '1', '1', '1');

SELECT * FROM COMMUNITY c ;

SELECT * FROM 
(SELECT comnum AS num, community. * FROM COMMUNITY)
WHERE COMNUM  BETWEEN '1' AND '1'+9 AND comtitle LIKE '%제목%';

      select comnum, comtitle, membernickname, comcontent, com_re_ref,
            com_re_lev, com_re_seq, comviews, comdate
      from (select row_number() over (order by com_re_ref desc, com_re_seq asc) num, B.*
            from community B order by com_re_ref desc, com_re_seq asc)
      where num between '1' and '9' AND memberEmail = '123';

select comnum, comtitle, membernickname, comcontent, com_re_ref,
            com_re_lev, com_re_seq, comviews, comdate
      from (select row_number() over (order by com_re_ref desc, com_re_seq asc) num, B.*
            from community B order by com_re_ref desc, com_re_seq asc)
      WHERE comtitle LIKE '%%';

     select comnum, comtitle, membernickname, comcontent, com_re_ref,
            com_re_lev, com_re_seq, comviews, comdate
      from (select row_number() over (order by com_re_ref desc, com_re_seq asc) num, B.*
            from community B order by com_re_ref desc, com_re_seq asc)
      where comtitle LIKE '%%' and num between '1' and '1'+9;

CREATE SEQUENCE seq_comnum
INCREMENT BY 1
START WITH 1 ;
DROP SEQUENCE seq_comnum;

SELECT * FROM COMMUNITY;
DROP TABLE COMMUNITY;



CREATE TABLE news(
   newsnum NUMBER PRIMARY key,
   newsimage varchar2(2000),
   newstitle varchar2(100),
   newscontent varchar2(2000),
   newsdate DATE,
   newsreco NUMBER,
   memberemail varchar2(30),
   CONSTRAINT c_news_fk FOREIGN KEY (memberemail) REFERENCES member(memberemail)
);

CREATE SEQUENCE seq_newsnum
INCREMENT BY 1
START WITH 1 ;
DROP SEQUENCE seq_newsnum;

INSERT INTO news VALUES(seq_newsnum.nextval, '11.png', '고승빈은 sql 천재인가???', 'sql 을잘하는 고승빈은 천재가 아닌것으로 밝혀져 충격..얌ㅈㅇㅓㅈ다잗ㅂ자다ㅏㅁ럳ㅈ먀갖ㄷ거ㅏ더란ㅁ어라어낯컹타ㅓ아러잗거ㅑㄷㅈ거ㅏㄷ거ㅏ더가더가더갑ㄷ적ㅁ나아ㅣㅈ더김ㅈ더ㅏㄱㅈ디ㅏ걷미ㅏㅈ넝기맏저ㅣㅏ얻ㅈ미ㅏ엊ㅁ디ㅏㅓ이ㅏㅈㅁ더기ㅏㅈㄷㄱ디ㅏ겆디ㅏ겆ㅂ딥ㄷ적ㅂㄷ적벚ㄷㄱㅂㅈㄷㄱㅂㄷㅈㅂㅈㅂㅈㄱㅂ더갑ㅈ더기;ㅂㅈㄷ기ㅏㅂㅈㄷㅂ;ㅈ더ㅂㄷ저기ㅏ먿ㄴㄱ디ㅏㅓㄱㅂㅈㄷ깆다ㅓㄱㅂㅈㄱㄱㅈㅂ디가ㅣㄴㄷㅇ머긷자ㅓㄱㅂㄷㅈㅂㄷㅈㄱ잡ㄷㄱㅁㄴ디ㅏ억ㄷ자ㅣㅓㄱㅂㄷ저김ㄷ나ㅓ김ㅈ다ㅓㄱㅂㅈㄷ깆덕ㅂㄷ자ㅣ이ㅈㅏ미어ㅈㅁㅓ자어ㄴㅁㅇㄴ', sysdate, '1', '1');
SELECT * FROM NEWS;
DROP TABLE news;

CREATE TABLE COMMENT1 (
   com_no NUMBER,
   membernickname varchar2(30) NOT NULL,
   com_content varchar2(1000) NOT NULL,
   com_like NUMBER,
   com_hate NUMBER,
   re_com varchar2(1000) NOT NULL,
   com_type NUMBER,
   com_regdate DATE,
   comnum NUMBER,
   memberemail varchar2(30),
   ad_num NUMBER,
   notice_num NUMBER,
   CONSTRAINT c_comment1_fk FOREIGN key(comnum) REFERENCES community(comnum) ON DELETE CASCADE,
   FOREIGN KEY(memberemail) REFERENCES MEMBER (memberemail)ON DELETE CASCADE,
   FOREIGN KEY(ad_num) REFERENCES advertisement (ad_num)ON DELETE CASCADE,
   FOREIGN KEY(notice_num) REFERENCES notice (notice_num)ON DELETE CASCADE
   );

CREATE SEQUENCE seq_com_no
INCREMENT BY 1
START WITH 1 
NOCACHE ;

insert into comment1(com_no,memberNickname,com_content,com_like,com_hate,re_com,com_type,COM_REGDATE ,comnum)
      values (seq_com_no.nextval ,'2닉네임','댓글','0','0','1','1',sysdate,'24');   
SELECT * FROM COMMENT1 c ;
DROP TABLE COMMENT1 ;

CREATE SEQUENCE seq_com
INCREMENT BY 1
START WITH 1 
NOCACHE ;

CREATE TABLE comlike(
   likenum NUMBER NOT null,
   comnum NUMBER,
   memberemail varchar2(30),
   likeN number,
   ad_num number,
   notice_num NUMBER,
   CONSTRAINT c_comlike_fk FOREIGN key(comnum) REFERENCES community(comnum),
   FOREIGN KEY(memberemail) REFERENCES MEMBER (memberemail),
   FOREIGN KEY(ad_num) REFERENCES advertisement (ad_num),
   FOREIGN KEY(notice_num) REFERENCES notice (notice_num)
);

CREATE TABLE carlike(
   carlikenum NUMBER NOT null,
   carnum NUMBER,
   memberemail varchar2(30),
   carlikeN number,
   CONSTRAINT c_carlike_fk FOREIGN key(carnum) REFERENCES detail(carnum),
   FOREIGN KEY(memberemail) REFERENCES MEMBER (memberemail)
);
insert into carlike (carLikeNum ,carNum , memberEmail,carlikeN)
            values((select * from (select NVL (max(carLikeNum),0)+1 from carlike)), '37','2',1);

CREATE TABLE notice(
   notice_num NUMBER PRIMARY KEY,
   noticetitle varchar2(100),
   noticecontent varchar2(2000),
   noticeviews NUMBER,
   memberemail varchar2(30),
   membernickname varchar2(30),
   CONSTRAINT c_notice_fk FOREIGN key(memberemail) REFERENCES member(memberemail)
);

INSERT INTO notice VALUES('0', '123', '123', '1', '123','123',sysdate);
insert into comlike (likenum ,comNum , memberEmail,likeN)
      values((select * from (select NVL (max(likenum),0)+1 from comlike)), '61','2','1');
delete from comlike where comNum = '61' and memberEmail = '2' ;

DROP TABLE COMLIKE ;
SELECT * FROM COMLIKE c ;

CREATE TABLE NOTE (
   note_no NUMBER PRIMARY KEY NOT NULL,
   note_to varchar2(30),
   note_from varchar2(30),
   note_content varchar2(1000),
   memberemail varchar2(30),
   CONSTRAINT c_note_fk FOREIGN key(memberemail) REFERENCES member(memberemail) ON DELETE cascade
 );
SELECT * FROM NOTE n ;

CREATE SEQUENCE seq_note_no
INCREMENT BY 1
START WITH 1 
NOCACHE ;

CREATE TABLE detail(
   carnum NUMBER PRIMARY KEY,
   carname varchar2(30),
   carmoney varchar2(30),
   cartype varchar2(30),
   carbrand varchar2(30),
   carimage varchar2(2000) DEFAULT 'default_profile.jpg',
   carlink varchar2(100)
);

insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, '아반떼', '1866', '준중형', 'hyundai', 'avante.png', 'avante');

insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, '그랜저', '3716', '준중형', 'hyundai', 'grandeur.png', 'grandeur');   

insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, '아이오닉5', '5005', 'SUV', 'hyundai', 'ioniq5.png', 'ioniq5'); 
     
insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, 'K8', '3738', '대형', 'kia', 'k8.png', 'k8');
     
insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, '니로EV', '4640', 'SUV', 'hyundai', 'niroev.png', 'niroev');
     
insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, '싼타페', '3252', 'SUV', 'hyundai', 'santefe.png', 'santafe');
     
insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, '쏘나타', '2592', '중형', 'hyundai', 'sonata.png', 'sonata');
     
insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, '스포티지', '2474', 'SUV', 'kia', 'sportage.png', 'sportage');
     
insert into detail(carnum,carname,carmoney,cartype,carbrand,carimage, carlink)
      values (seq_carnum.nextval, '스팅어', '3878', '중형', 'kia', 'stinger.png', 'stinger');
     
     SELECT * FROM DETAIL d ;

DROP TABLE COMMUNITY;
DROP TABLE COMMENT1;
DROP TABLE comlike;
SELECT * FROM CARLIKE c ;
SELECT * FROM COMMUNITY c  ;
SELECT * FROM COMMENT1;
select count(com_no)from comment1 where comnum ='62';

		update community c
      		set c.comreco = (select count(com_no)from comment1 where comnum ='62')
      		where c.comNum = '62';

SELECT * FROM detail WHERE CARNUM  in (SELECT CARNUM  FROM carlike WHERE MEMBEREMAIL = '2');
SELECT carnum FROM detail WHERE carnum IN (SELECT CARNUM  FROM carlike WHERE MEMBEREMAIL = '2');
SELECT CARNUM  FROM carlike WHERE MEMBEREMAIL = '2';

DROP TABLE NOTICE ;
DROP TABLE MANAGER  ;
DROP TABLE NEWS  ;

SELECT * FROM community WHERE comtitle LIKE '%2%';

INSERT INTO news VALUES(seq_newsnum.nextval, 'bmw.jpg', '이주의 신차 BMW 뉴 7시리즈 - 현대차 ‘디 올 뉴 코나’ 공개',
' 지난 16일 BMW코리아는 플래그십 세단 7시리즈의 7세대 완전변경모델 뉴 7시리즈를 국내 출시하고 본격적인 판매에 들어간다고 밝혔다. 7시리즈는 1977년 첫선을 보인 대형 세단 모델로, 이번 뉴 7시리즈 라인업에는 순수 전기차 모델 뉴 i7이 추가된다.', sysdate, '1', '1');

INSERT INTO news VALUES(seq_newsnum.nextval, 'i7.png', '미국 켈리블루북 2023 최고의 신차에 현대차 아이오닉5',
' 미국 자동차 소비자들이 가장 신뢰하는 평가 매체 중 하나인 켈리 블루북이 2023년형 최고의 신차로 현대차의 전용 전기차 아이오닉5를 선정했습니다. 켈리블루북의 수석 편집자인 제이슨 앨런은 "아이오닉5는 인상적인 주행거리와 기술력을 바탕으로 경쟁사에 비해 뛰어난 가치를 제공한다"고 선정 이유를 밝혔습니다. 올해 최고의 신차와 전기차 부문을 동시에 수상한 아이오닉5는 미래지향적 디자인과 초고속 충전, 넓은 실내 공간, 300마일(482km) 이상의 주행거리에서 높은 평가를 받았습니다. 켈리블루북은 2023년형 신차를 대상으로 품질과 안전, 주행 성능, 차량 비용 등을 종합적으로 평가해 총 19개 부문에서 최고의 차를 뽑았습니다.
', sysdate, '1', '1');

CREATE TABLE advertisement(
   ad_num NUMBER PRIMARY key,
   membernickname varchar2(30),
   memberemail varchar2(40),
   ad_title varchar2(1000) NOT null,
   ad_content varchar2(4000) NOT null,
   ad_date DATE,
   ad_views NUMBER,
   ad_reco NUMBER,
   ad_file varchar2(4000),
   CONSTRAINT c_advertisement_fk FOREIGN KEY (memberemail) REFERENCES member(memberemail)
);
INSERT INTO advertisement VALUES('0', '123', '123', '1', '123',sysdate,'1','1','1','1','1','1','123');
INSERT INTO advertisement VALUES(seq_ad_num.nextval, '닉네임', '2', '제목', '내용', sysdate, '1', '1', '123');

CREATE SEQUENCE seq_notice_num
INCREMENT BY 1
START WITH 1 ;

 select * from member where memberNickname = '2닉네임';

DROP SEQUENCE seq_ad_num;

SELECT * FROM advertisement;
DROP TABLE advertisement;

CREATE TABLE detail(
   carnum NUMBER PRIMARY KEY,
   carname varchar2(30),
   carmoney varchar2(30),
   cartype varchar2(30),
   carbrand varchar2(30),
   carimage varchar2(2000),
   carlink varchar2(100),
   carcomment varchar2(1000)
);

CREATE SEQUENCE seq_carnum
INCREMENT BY 1
START WITH 1 ;

SELECT * FROM note;
DROP TABLE detail;

INSERT INTO DETAIL values(seq_carnum.nextval,'케이5', '2000', '준중형', 'kia.png', 'k5.jpg', 'link', '이 차는 과학입니다');
INSERT INTO DETAIL values(seq_carnum.nextval,'스파크', '1000', '경차', 'kia.png', 'spark.jpg', 'link', '이 차는 스파크입니다');

SELECT profile
FROM COMMUNITY c FULL OUTER JOIN "MEMBER" m ON c.MEMBEREMAIL = m.MEMBEREMAIL 
WHERE c.COMNUM = '61';

CREATE TABLE kakaoLogin(
memberNickname varchar2(30),
memberEmail varchar2(50),
memberDate DATE,
CONSTRAINT c_kakaoLogin_fk FOREIGN KEY (memberemail) REFERENCES member(memberemail)
);
SELECT * FROM kakaoLogin;
DROP TABLE kakaoLogin;

CREATE TABLE naverLogin(
membernickname varchar2(30),
memberemail varchar2(50),
memberdate DATE,
CONSTRAINT c_naverLogin_fk FOREIGN KEY (memberemail) REFERENCES member(memberemail)
);
