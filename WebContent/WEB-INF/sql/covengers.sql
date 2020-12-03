select * from tab;

select * from AN_tbl_product_test_1;

create table AN_tbl_product_test_1 (
pnum                NUMBER not null
, fk_category       varchar2(20) not null
, pname             varchar2(50) not null
, pprice            NUMBER not null
, pinfo             varchar2(200) not null
, pimage            varchar2(200) not null
, pproducedate      date not null
, pexpiredate       date not null
, madein            varchar2(30) not null
, constraint PK_AN_tbl_product_test_1_pnum primary key(pnum)
, constraint FK_AN_tbl_product_test_1_cate foreign key (fk_category) references AN_tbl_category_test(category)
, constraint CK_AN_tbl_option_test_pprice check(pprice > 0)
);

select *
from AN_tbl_product_test_1;

delete from AN_tbl_product_test_1
where pnum between 31 and 45;

create sequence pnum
    start with 1         -- 첫번째 출발은 1부터 한다.
    increment by 1        -- 증가치 값
    nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
    nominvalue          -- 최소값이 없다.
    nocycle             -- 반복이 없는 직진
    nocache;
    

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'floral', 'floral1', '꽃 향이 납니다.1', 90000, 'perfume1.jpg', sysdate, add_months(sysdate, 24), 'Italy');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'floral', 'floral2', '꽃 향이 납니다.2', 120000, 'perfume2.jpg', sysdate, add_months(sysdate, 23), 'Germany');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'floral', 'floral3', '꽃 향이 납니다.3', 70000, 'perfume3.jpg', sysdate, add_months(sysdate, 22), 'U.S.A');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'citrus', 'citrus1', '시트러스 향이 납니다.1', 50000, 'perfume1.jpg', sysdate, add_months(sysdate, 21), 'NewZealand');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'citrus', 'citrus2', '시트러스 향이 납니다.2', 210000, 'perfume2.jpg', sysdate, add_months(sysdate, 20), 'U.S.A');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'citrus', 'citrus3', '시트러스 향이 납니다.3', 50000, 'perfume3.jpg', sysdate, add_months(sysdate, 19), 'Italy');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'citrus', 'citrus4', '시트러스 향이 납니다.4', 160000, 'perfume2.jpg', sysdate, add_months(sysdate, 18), 'Germany');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'woody', 'woody1', '나무 향이 납니다.1', 80000, 'perfume1.jpg', sysdate, add_months(sysdate, 17), 'Canada');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'woody', 'woody2', '나무 향이 납니다.2', 95000, 'perfume3.jpg', sysdate, add_months(sysdate, 16), 'Spain');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'spicy', 'spicy1', '매운 향이 납니다.1', 60000, 'perfume1.jpg', sysdate, add_months(sysdate, 15), 'France');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'spicy', 'spicy2', '매운 향이 납니다.2', 64000, 'perfume2.jpg', sysdate, add_months(sysdate, 14), 'Korea');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'spicy', 'spicy3', '매운 향이 납니다.3', 84000, 'perfume3.jpg', sysdate, add_months(sysdate, 13), 'Japan');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'fruity', 'fruity1', '과일 향이 납니다.1', 450000, 'perfume1.jpg', sysdate, add_months(sysdate, 12), 'Spain');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'fruity', 'fruity2', '과일 향이 납니다.2', 55000, 'perfume2.jpg', sysdate, add_months(sysdate, 11), 'China');

insert into AN_tbl_product_test_1(pnum, fk_category, pname, pinfo, pprice, pimage, pproducedate, pexpiredate, madein)
values (pnum.nextval, 'fruity', 'fruity3', '과일 향이 납니다.3', 190000, 'perfume3.jpg', sysdate, add_months(sysdate, 10), 'Korea');


------------------------------------------------------------------------------------------------------------------------------------
create table AN_tbl_kind_test(
knum                number not null
, kind              varchar2(20) not null
, constraint PK_AN_tbl_kind_test_knum primary key(knum)
, constraint UK_AN_tbl_kind_test_kind unique (kind)
);

select *
from AN_tbl_kind_test;

create sequence knum
    start with 1         -- 첫번째 출발은 1부터 한다.
    increment by 1        -- 증가치 값
    nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
    nominvalue          -- 최소값이 없다.
    nocycle             -- 반복이 없는 직진
    nocache;

    
insert into AN_tbl_kind_test(knum, kind)
values (knum.nextval, 'perfume');

insert into AN_tbl_kind_test(knum, kind)
values (knum.nextval, 'diffuser');

insert into AN_tbl_kind_test(knum, kind)
values (knum.nextval, 'candle');

select *
from AN_tbl_kind_test;

-------------------------------------------------------------------------------------------------------------------------------

create table AN_tbl_category_test (
cnum                NUMBER not null
, fk_pkind       varchar2(30) not null
, category          varchar2(30) not null
, constraint PK_AN_tbl_category_test_cnum primary key(cnum)
, constraint FK_AN_tbl_category_test_pkind foreign key (fk_pkind) references AN_tbl_kind_test(kind)
, constraint UK_AN_tbl_category_test_cate unique (category)
);

select *
from AN_tbl_category_test;

create sequence cnum
    start with 1         -- 첫번째 출발은 1부터 한다.
    increment by 1        -- 증가치 값
    nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
    nominvalue          -- 최소값이 없다.
    nocycle             -- 반복이 없는 직진
    nocache;
    
insert into AN_tbl_category_test(cnum, fk_pkind, category)
values (cnum.nextval, 'perfume', 'floral');

insert into AN_tbl_category_test(cnum, fk_pkind, category)
values (cnum.nextval, 'perfume', 'citrus');

insert into AN_tbl_category_test(cnum, fk_pkind, category)
values (cnum.nextval, 'perfume', 'woody');

insert into AN_tbl_category_test(cnum, fk_pkind, category)
values (cnum.nextval, 'perfume', 'spicy');

insert into AN_tbl_category_test(cnum, fk_pkind, category)
values (cnum.nextval, 'perfume', 'fruity');

---------------------------------------------------------------------------------------------------------------------------------
create table AN_tbl_option_test (
onum                NUMBER not null
, fk_pnum           NUMBER not null
, poption           varchar2(30) not null
, addprice          NUMBER not null
, stock             number not null
, constraint PK_AN_tbl_option_test primary key (onum)
, constraint FK_AN_tbl_option_test_fk_pname foreign key (fk_pnum) references AN_tbl_product_test_1(pnum)
, constraint CK_AN_tbl_option_test_addprice check(addprice >= 0)
);

select *
from AN_tbl_option_test;

create sequence onum
    start with 1         -- 첫번째 출발은 1부터 한다.
    increment by 1        -- 증가치 값
    nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
    nominvalue          -- 최소값이 없다.
    nocycle             -- 반복이 없는 직진
    nocache;

drop sequence onum;
drop table AN_tbl_option_test purge;
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 16, '50', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 16, '70', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 16, '90', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 17, '54', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 17, '74', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 17, '94', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 18, '55', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 18, '75', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 18, '95', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 19, '150', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 19, '170', 120000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 19, '190', 310000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 20, '50', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 20, '70', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 20, '90', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 21, '54', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 21, '74', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 21, '94', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 22, '55', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 22, '75', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 22, '95', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 23, '150', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 23, '170', 120000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 23, '190', 310000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 24, '54', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 24, '74', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 24, '94', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 25, '55', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 25, '75', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 25, '95', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 26, '150', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 26, '170', 120000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 26, '190', 310000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 27, '50', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 27, '70', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 27, '90', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 28, '54', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 28, '74', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 28, '94', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 29, '55', 0, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 29, '75', 20000, 100);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 29, '95', 30000, 100);

insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 30, '150', 0);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 30, '170', 120000);
insert into AN_tbl_option_test(onum, fk_pnum, poption, addprice)
values (onum.nextval, 30, '190', 310000);
---------------------------------------------------------------------------------------------------------------------------------
create table AN_product_detail_test (
pcode                         varchar2 not null
, fk_onum                     NUMBER not null
, pstatus                     NUMBER(1) not null
, constraint PK_AN_product_detail_test primary key(pcode)
, constraint FK_AN_product_detail_test foreign key (fk_onum) references AN_tbl_option_test(onum)
, constraint CK_AN_product_detail_test check (pstatus in (0,1)) 
)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select pnum, fk_category, pname, pprice, pinfo, pimage, pproducedate, pexpiredate, madein
from AN_tbl_product_test_1
where fk_category = 'floral';

select pnum, fk_category, pname, pprice, pinfo, pimage, pproducedate, pexpiredate, madein
from AN_tbl_product_test_1
where pnum = 16;    

    select onum, pnum, poption, addprice
    from
    (select onum, fk_pnum, poption, addprice
    from AN_tbl_option_test)
    o join (
    select pnum
    from AN_tbl_product_test_1) p
    on o.fk_pnum = p.pnum
    order by 1, 2;



 
insert into AN_tbl_cart_test (mnum, pnum, oqty, totalprice, onum)
values(?, ?, ?, ?, ?);


select *
from AN_tbl_cart_test;







delete from AN_tbl_cart_test
where mnum = 121;

commit;

CREATE TABLE TBL_CART (
  cartno           NUMBER        NOT NULL        -- 장바구니 번호
, fk_userno        NUMBER        NOT NULL        -- 회원번호 (유저테이블 참조)
, fk_pnum          NUMBER        NOT NULL        -- 상품번호 (상품테이블 참조)
, poqty            NUMBER(8)     NOT NULL        -- 상품 수량
, fk_ponum         NUMBER        NOT NULL        -- 상품 옵션 번호
, pprice           NUMBER(10)    NOT NULL        -- 상품 단가(옵션값 포함) 
, CONSTRAINT PK_TBL_CART PRIMARY KEY(cartno) 
, CONSTRAINT FK_TBL_CART_userno FOREIGN KEY(fk_userno) REFERENCES TBL_MEMBER(userno)
, CONSTRAINT FK_TBL_CART_pnum FOREIGN KEY(fk_pnum) REFERENCES AN_TBL_PRODUCT_TEST_1(pnum)
, CONSTRAINT FK_TBL_CART_ponum FOREIGN KEY(fk_ponum) REFERENCES AN_TBL_OPTION_TEST(onum)
);



select * from AN_TBL_OPTION_TEST;


CREATE TABLE TBL_CART (
  cartno           NUMBER        NOT NULL        -- 장바구니 번호
, fk_userno        NUMBER        NOT NULL        -- 회원번호 (유저테이블 참조)
, fk_pnum          NUMBER        NOT NULL        -- 상품번호 (상품테이블 참조)
, poqty            NUMBER(8)     NOT NULL        -- 상품 수량
, fk_ponum         NUMBER        NOT NULL        -- 상품 옵션 번호
, pprice           NUMBER(10)    NOT NULL        -- 상품 단가(옵션값 포함) 
, CONSTRAINT PK_TBL_CART PRIMARY KEY(cartno) 
, CONSTRAINT FK_TBL_CART_userno FOREIGN KEY(fk_userno) REFERENCES TBL_MEMBER(userno)
, CONSTRAINT FK_TBL_CART_pnum FOREIGN KEY(fk_pnum) REFERENCES AN_TBL_PRODUCT_TEST_1(pnum)
, CONSTRAINT FK_TBL_CART_ponum FOREIGN KEY(fk_ponum) REFERENCES AN_TBL_OPTION_TEST(onum)
);

select cartno, fk_userno, fk_pnum, poqty, fk_ponum, pprice
from TBL_CART
order by 1;

rollback;

commit;


select cartno, poqty
from TBL_CART
where fk_userno = ? and fk_pnum = ?;

update TBL_CART set poqty = poqty + ?
where cartno = ?;




select *
from TBL_CART;


delete from TBL_CART;
rollback;
commit;

create table AN_tbl_each_product_test (
pcode               varchar2 not null
, fk_onum           number not null
, status            number(1) not null
, constraint PK_AN_tbl_each_product_test primary key (pcode)
, constraint FK_AN_tbl_each_product_test foreign key (fk_onum) references AN_tbl_option_test(onum)
, constraint CK_AN_tbl_each_product_test check (status in (0,1));
);



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table tbl_kind(
kindcode              varchar2(30) not null
, enkindname          varchar2(30) not null
, krkindname          varchar2(30) not null
, constraint PK_tbl_kind_kindcode primary key(kindcode)
, constraint UK_tbl_kind_enkindname unique (enkindname)
, constraint UK_tbl_kind_krkindname unique (krkindname)
);

insert into tbl_kind(kindcode, enkindname, krkindname)
values ('PF', 'perfume', '향수');

insert into tbl_kind(kindcode, enkindname, krkindname)
values ('DF', 'diffuser', '디퓨저');
insert into tbl_kind(kindcode, enkindname, krkindname)
values ('IS', 'insense', '인센스');

update tbl_kind set enkindname = 'incense'
where enkindname = 'insense';

commit;

select *
from tbl_kind;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table tbl_category (
categorycode        varchar2(30) not null
, fk_kindcode       varchar2(30) not null
, encategoryname    varchar2(30) not null
, krcategoryname    varchar2(30) not null
, constraint PK_tbl_category_categorycode primary key(categorycode)
, constraint FK_tbl_category_fk_kindcode foreign key (fk_kindcode) references tbl_kind(kindcode)
, constraint UK_tbl_category_encategoryname unique (encategoryname)
, constraint UK_tbl_category_krcategoryname unique (krcategoryname)
);

insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('101', 'PF', 'floral', '플로랄');
insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('102', 'PF', 'citrus', '시트러스');
insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('103', 'PF', 'woody', '우디');
insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('104', 'PF', 'spicy', '스파이시');
insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('105', 'PF', 'fruity', '프루티');

insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('201', 'DF', 'indoors', '실내용');
insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('202', 'DF', 'vehicles', '차량용');

insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('301', 'IS', 'candle', '향초');
insert into tbl_category (categorycode, fk_kindcode, encategoryname, krcategoryname) 
values('302', 'IS', 'incense', '향');

select *
from tbl_category;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table tbl_product (
productcode             varchar2(30) not null
, fk_kindcode           varchar2(30) not null
, fk_categorycode       varchar2(30) not null
, enproductname         varchar2(100) not null
, krproductname         varchar2(100) not null
, productimg1           varchar2(200) not null
, productimg2           varchar2(200)
, price                 number(8) not null
, saleprice             number(8) not null
, origin                varchar2(30) not null
, productdescshort      varchar2(200) not null
, productinputdate      date default sysdate not null
, manufacturedate       date not null
, expiredate            date not null
, productdesc1          varchar2(2000) not null
, productdesc2          varchar2(2000)
, ingredient            varchar2(2000) not null
, precautions           varchar2(2000) not null
, productstatus         number(1) default 1 not null  -- 상품을 삭제할 경우 데이터베이스에서 상태를 바꿔주기 위해 필요한 상태
, constraint PK_tbl_product_productcode primary key(productcode)
, constraint FK_tbl_product_fk_kindcode foreign key (fk_kindcode) references tbl_kind(kindcode)
, constraint FK_tbl_product_fk_categorycode foreign key (fk_categorycode) references tbl_category(categorycode)
, constraint UK_tbl_product_enproductname unique (enproductname)
, constraint UK_tbl_product_krproductname unique (krproductname)
, constraint CK_tbl_product_productstatus check(productstatus in (0, 1))
, constraint CK_tbl_product_price check (price > 0)
, constraint CK_tbl_product_saleprice check (saleprice > 0)
);

commit;

delete tbl_product;

select *
from tbl_product;

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-101-001', 'PF', '101', 'Original Floral Perfume1', '오리지날 플로랄 퍼퓸1', 'perfume1.jpg', 50000, 120000, 'Canada', '라벤더향기가 나는 향수에요', add_months(sysdate, -10), add_months(sysdate, 36), '봄꽃의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-101-002', 'PF', '101', 'Original Floral Perfume2', '오리지날 플로랄 퍼퓸2', 'perfume2.jpg', 60000, 130000, 'Spain', '자스민향기가 나는 향수에요', 
add_months(sysdate, -10), add_months(sysdate, 36), '여름꽃의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 무화과향의 믹스매치로 사랑스러운 향을 연출합니다.',
'자스민 추출물, 무화과 향나는 주스, 무화과추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-101-003', 'PF', '101', 'Original Floral Perfume3', '오리지날 플로랄 퍼퓸3', 'perfume3.jpg', 70000, 140000, 'France', '장미향기가 나는 향수에요', 
add_months(sysdate, -10), add_months(sysdate, 36), '가을꽃의 향을 담은 아름다운 향기에 취해보세요. 장미의 향과 포도향의 믹스매치로 사랑스러운 향을 연출합니다.',
'장미 추출물, 포도 향나는 주스, 포도추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

----------- 완료

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-102-001', 'PF', '102', 'Original Citrus Perfume1', '오리지날 시트러스 퍼퓸1', 'perfume1.jpg', 50000, 120000, 'Canada', '시향기가 나는 향수에요',
add_months(sysdate, -10), add_months(sysdate, 36), '봄꽃의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-102-002', 'PF', '102', 'Original Citrus Perfume2', '오리지날 시트러스 퍼퓸2', 'perfume2.jpg', 60000, 130000, 'USA', '트향기가 나는 향수에요',
add_months(sysdate, -11), add_months(sysdate, 37), '시트러스의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'자스민 추출물, 무화과 향나는 주스, 무화과추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-102-003', 'PF', '102', 'Original Citrus Perfume3', '오리지날 시트러스 퍼퓸3', 'perfume3.jpg', 70000, 140000, 'Spain', '러향기가 나는 향수에요',
add_months(sysdate, -12), add_months(sysdate, 38), '시트러스의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'장미 추출물, 포도 향나는 주스, 포도추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-102-004', 'PF', '102', 'Original Citrus Perfume4', '오리지날 시트러스 퍼퓸4', 'perfume1.jpg', 80000, 150000, 'France', '스향기가 나는 향수에요',
add_months(sysdate, -13), add_months(sysdate, 39), '시트러스의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'자스민 추출물, 무화과 향나는 주스, 무화과추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

----------------완료

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-103-001', 'PF', '103', 'Original Woody Perfume1', '오리지날 우디 퍼퓸1', 'perfume1.jpg', 50000, 120000, 'France', '우디향기가 나는 향수에요',
add_months(sysdate, -10), add_months(sysdate, 36), '나무의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-103-002', 'PF', '103', 'Original Woody Perfume2', '오리지날 우디 퍼퓸2', 'perfume2.jpg', 60000, 130000, 'Germany', '우디향기가 나는 향수에요',
add_months(sysdate, -11), add_months(sysdate, 37), '나무의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'자스민 추출물, 무화과 향나는 주스, 무화과추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

----------------완료


insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-104-001', 'PF', '104', 'Original Spicy Perfume1', '오리지날 스파이시 퍼퓸1', 'perfume1.jpg', 50000, 120000, 'Canada', '스파이시한 향기가 나는 향수에요',
add_months(sysdate, -10), add_months(sysdate, 36), '스파이시1의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-104-002', 'PF', '104', 'Original Spicy Perfume2', '오리지날 스파이시 퍼퓸2', 'perfume2.jpg', 60000, 130000, 'Italy', '스파이시한 향기가 나는 향수에요',
add_months(sysdate, -11), add_months(sysdate, 37), '스파이시2의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-104-003', 'PF', '104', 'Original Spicy Perfume3', '오리지날 스파이시 퍼퓸3', 'perfume3.jpg', 70000, 140000, 'Korea', '스파이시한 향기가 나는 향수에요',
add_months(sysdate, -12), add_months(sysdate, 38), '스파이시3의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-104-004', 'PF', '104', 'Original Spicy Perfume4', '오리지날 스파이시 퍼퓸4', 'perfume1.jpg', 80000, 150000, 'Maxico', '스파이시한 향기가 나는 향수에요',
add_months(sysdate, -13), add_months(sysdate, 39), '스파이시4의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

----------------완료


insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-105-001', 'PF', '105', 'Original Fruity Perfume1', '오리지날 프루티 퍼퓸1', 'perfume1.jpg', 50000, 120000, 'Spain', '프루티향기가 나는 향수에요',
add_months(sysdate, -10), add_months(sysdate, 36), '봄꽃의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-105-002', 'PF', '105', 'Original Fruity Perfume2', '오리지날 프루티 퍼퓸2', 'perfume2.jpg', 60000, 130000, 'Canada', '프루티향기가 나는 향수에요',
add_months(sysdate, -11), add_months(sysdate, 37), '봄꽃의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

insert into tbl_product(productcode, fk_kindcode, fk_categorycode, enproductname, krproductname, productimg1,
price, saleprice, origin, productdescshort, manufacturedate, expiredate, productdesc1, ingredient, precautions)
values ('PF-105-003', 'PF', '105', 'Original Fruity Perfume3', '오리지날 프루티 퍼퓸3', 'perfume3.jpg', 70000, 140000, 'Uganda', '프루티향기가 나는 향수에요',
add_months(sysdate, -12), add_months(sysdate, 38), '봄꽃의 향을 담은 아름다운 향기에 취해보세요. 라벤더의 향과 자몽향의 믹스매치로 사랑스러운 향을 연출합니다.',
'라벤더 추출물, 자몽 향나는 주스, 자몽추출물', '절대로 먹지마세요. 눈에 들어갔을 경우에는 반드시 흐르는 물에 씻어내세요. 알러지 반응이 있으실 경우 의사와 상의후 사용바랍니다.');

----------------완료
drop table tbl_product purge;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table tbl_option (
optioncode          varchar2(30) not null
, fk_productcode    varchar2(30) not null
, optionname        varchar2(30) not null
, addprice          NUMBER not null
, stock             NUMBER default 0 not null
, constraint PK_tbl_option_optioncode primary key (optioncode)
, constraint FK_tbl_optionfk_fk_productcode foreign key (fk_productcode) references tbl_product(productcode)
, constraint CK_tbl_addprice check (addprice >= 0)
, constraint CK_tbl_stock check (stock >= 0)
);

drop table tbl_option purge;

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-001-S01', 'PF-101-001', '50', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-001-S02', 'PF-101-001', '70', 30000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-001-S03', 'PF-101-001', '90', 50000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-002-S01', 'PF-101-002', '51', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-002-S02', 'PF-101-002', '71', 31000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-002-S03', 'PF-101-002', '91', 51000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-003-S01', 'PF-101-003', '52', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-003-S02', 'PF-101-003', '72', 32000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-003-S03', 'PF-101-003', '92', 52000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-101-003-S04', 'PF-101-003', '102', 52000);
-------------------complete
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-001-S01', 'PF-102-001', '53', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-001-S02', 'PF-102-001', '73', 33000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-001-S03', 'PF-102-001', '93', 53000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-002-S01', 'PF-102-002', '54', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-002-S02', 'PF-102-002', '74', 34000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-002-S03', 'PF-102-002', '94', 54000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-003-S01', 'PF-102-003', '55', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-003-S02', 'PF-102-003', '75', 35000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-003-S03', 'PF-102-003', '95', 55000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-004-S01', 'PF-102-004', '56', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-004-S02', 'PF-102-004', '76', 36000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-102-004-S03', 'PF-102-004', '96', 56000);
---------완료
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-103-001-S01', 'PF-103-001', '57', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-103-001-S02', 'PF-103-001', '77', 37000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-103-001-S03', 'PF-103-001', '97', 57000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-103-002-S01', 'PF-103-002', '58', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-103-002-S02', 'PF-103-002', '78', 38000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-103-002-S03', 'PF-103-002', '98', 58000);
--------완료
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-001-S01', 'PF-104-001', '60', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-001-S02', 'PF-104-001', '80', 40000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-001-S03', 'PF-104-001', '100', 60000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-002-S01', 'PF-104-002', '61', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-002-S02', 'PF-104-002', '81', 41000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-002-S03', 'PF-104-002', '110', 61000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-003-S01', 'PF-104-003', '62', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-003-S02', 'PF-104-003', '82', 42000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-003-S03', 'PF-104-003', '120', 62000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-004-S01', 'PF-104-004', '63', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-004-S02', 'PF-104-004', '83', 43000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-104-004-S03', 'PF-104-004', '130', 63000);
----- 완료
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-001-S01', 'PF-105-001', '54', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-001-S02', 'PF-105-001', '74', 34000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-001-S03', 'PF-105-001', '94', 54000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-001-S04', 'PF-105-001', '141', 84000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-002-S01', 'PF-105-002', '55', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-002-S02', 'PF-105-002', '75', 35000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-002-S03', 'PF-105-002', '95', 55000);

insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-003-S01', 'PF-105-003', '55', 0);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-003-S02', 'PF-105-003', '75', 36000);
insert into tbl_option (optioncode, fk_productcode, optionname, addprice)
values ('PF-105-003-S03', 'PF-105-003', '95', 56000);

select *
from tbl_option;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table tbl_each_goods (
eachgoodscode     varchar2(30) not null
, fk_optioncode     varchar2(30) not null
, status            number(1) default 1 not null  -- 상품이 판매됐을 경우 0, 기본적으로 1
, constraint PK_tbl_each_goods_eachcode primary key (eachgoodscode)
, constraint FK_tbl_each_goods_optioncode foreign key (fk_optioncode) references tbl_option(optioncode)
, constraint CK_tbl_each_goods_status check (status in (0,1))
);

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-001-S01-1001', 'PF-101-001-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-001-S01-1002', 'PF-101-001-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-001-S02-1001', 'PF-101-001-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-001-S02-1002', 'PF-101-001-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-001-S03-1001', 'PF-101-001-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-001-S03-1002', 'PF-101-001-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-002-S01-1001', 'PF-101-002-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-002-S01-1002', 'PF-101-002-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-002-S02-1001', 'PF-101-002-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-002-S02-1002', 'PF-101-002-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-002-S03-1001', 'PF-101-002-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-002-S03-1002', 'PF-101-002-S03');

-----------완료

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-003-S01-1001', 'PF-101-003-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-003-S01-1002', 'PF-101-003-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-003-S02-1001', 'PF-101-003-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-003-S02-1002', 'PF-101-003-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-003-S03-1001', 'PF-101-003-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-003-S03-1002', 'PF-101-003-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-003-S04-1001', 'PF-101-003-S04');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-101-003-S04-1002', 'PF-101-003-S04');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-001-S01-1001', 'PF-102-001-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-001-S01-1002', 'PF-102-001-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-001-S02-1001', 'PF-102-001-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-001-S02-1002', 'PF-102-001-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-001-S03-1001', 'PF-102-001-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-001-S03-1002', 'PF-102-001-S03');

-----------완료
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-002-S01-1001', 'PF-102-002-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-002-S01-1002', 'PF-102-002-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-002-S02-1001', 'PF-102-002-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-002-S02-1002', 'PF-102-002-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-002-S03-1001', 'PF-102-002-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-002-S03-1002', 'PF-102-002-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-003-S01-1001', 'PF-102-003-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-003-S01-1002', 'PF-102-003-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-003-S02-1001', 'PF-102-003-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-003-S02-1002', 'PF-102-003-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-003-S03-1001', 'PF-102-003-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-003-S03-1002', 'PF-102-003-S03');

---------------- 완료
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-004-S01-1001', 'PF-102-004-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-004-S01-1002', 'PF-102-004-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-004-S02-1001', 'PF-102-004-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-004-S02-1002', 'PF-102-004-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-004-S03-1001', 'PF-102-004-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-102-004-S03-1002', 'PF-102-004-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-001-S01-1001', 'PF-103-001-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-001-S01-1002', 'PF-103-001-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-001-S02-1001', 'PF-103-001-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-001-S02-1002', 'PF-103-001-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-001-S03-1001', 'PF-103-001-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-001-S03-1002', 'PF-103-001-S03');

--------------완료
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-002-S01-1001', 'PF-103-002-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-002-S01-1002', 'PF-103-002-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-002-S02-1001', 'PF-103-002-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-002-S02-1002', 'PF-103-002-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-002-S03-1001', 'PF-103-002-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-103-002-S03-1002', 'PF-103-002-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-001-S01-1001', 'PF-104-001-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-001-S01-1002', 'PF-104-001-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-001-S02-1001', 'PF-104-001-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-001-S02-1002', 'PF-104-001-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-001-S03-1001', 'PF-104-001-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-001-S03-1002', 'PF-104-001-S03');


------------------완료

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-002-S01-1001', 'PF-104-002-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-002-S01-1002', 'PF-104-002-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-002-S02-1001', 'PF-104-002-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-002-S02-1002', 'PF-104-002-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-002-S03-1001', 'PF-104-002-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-002-S03-1002', 'PF-104-002-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-003-S01-1001', 'PF-104-003-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-003-S01-1002', 'PF-104-003-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-003-S02-1001', 'PF-104-003-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-003-S02-1002', 'PF-104-003-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-003-S03-1001', 'PF-104-003-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-003-S03-1002', 'PF-104-003-S03');

-------------완료

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-004-S01-1001', 'PF-104-004-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-004-S01-1002', 'PF-104-004-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-004-S02-1001', 'PF-104-004-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-004-S02-1002', 'PF-104-004-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-004-S03-1001', 'PF-104-004-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-104-004-S03-1002', 'PF-104-004-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-001-S01-1001', 'PF-105-001-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-001-S01-1002', 'PF-105-001-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-001-S02-1001', 'PF-105-001-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-001-S02-1002', 'PF-105-001-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-001-S03-1001', 'PF-105-001-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-001-S03-1002', 'PF-105-001-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-001-S04-1001', 'PF-105-001-S04');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-001-S04-1002', 'PF-105-001-S04');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-002-S01-1001', 'PF-105-002-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-002-S01-1002', 'PF-105-002-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-002-S02-1001', 'PF-105-002-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-002-S02-1002', 'PF-105-002-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-002-S03-1001', 'PF-105-002-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-002-S03-1002', 'PF-105-002-S03');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-003-S01-1001', 'PF-105-003-S01');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-003-S01-1002', 'PF-105-003-S01');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-003-S02-1001', 'PF-105-003-S02');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-003-S02-1002', 'PF-105-003-S02');

insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-003-S03-1001', 'PF-105-003-S03');
insert into tbl_each_goods (eachgoodscode, fk_optioncode)
values ('PF-105-003-S03-1002', 'PF-105-003-S03');

select *
from tbl_each_goods;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

desc tbl_product;

--select p.productcode, c.encategoryname, c.krcategoryname, p.fk_kindcode, fk_categorycode, enproductname, krproductname
--, productimg1, productimg2, price, saleprice, origin, productdescshort, productinputdate
--, manufacturedate, expiredate, productdesc1, productdesc2, ingredient, precautions, productstatus
--from tbl_product p left join tbl_category c
--on p.fk_categorycode = c.categorycode
--where p.fk_categorycode = ? ;

select * from tbl_product;
select * from tbl_category;

select p.productcode, c.encategoryname, c.krcategoryname, enproductname, krproductname
, productimg1, saleprice,  productdescshort 
from tbl_product p left join tbl_category c
on p.fk_categorycode = c.categorycode
where p.fk_categorycode = ? ;

select p.productcode, c.encategoryname, c.krcategoryname, p.fk_kindcode, fk_categorycode, enproductname, krproductname
, productimg1, productimg2, price, saleprice, origin, productdescshort, productinputdate
, manufacturedate, expiredate, productdesc1, productdesc2, ingredient, precautions, productstatus
from tbl_product p left join tbl_category c
on p.fk_categorycode = c.categorycode
where p.productstatus = 1 and p.productcode = ? ;

select optioncode, optionname, addprice 
from tbl_option
where stock = 0 and fk_productcode = ?;


create table tbl_cart (
cartno          NUMBER not null
, fk_userno     varchar2(30) not null
, fk_productcode varchar2(30) not null
, poqty         NUMBER not null
, fk_optioncode varchar2(30) not null
, pprice        NUMBER not null
, constraint PK_tbl_cart_cartno primary key (cartno) 
, constraint FK_tbl_cart_fk_userno foreign key (fk_userno) references tbl_member(userno)
, constraint FK_tbl_cart_fk_productcode foreign key (fk_productcode) references tbl_product(productcode)
, constraint FK_tbl_cart_fk_optioncode foreign key (fk_optioncode) references tbl_option(optioncode)
, constraint CK_tbl_cart_poqty check (poqty >= 0)
, constraint CK_tbl_pprice check (pprice >= 0)
);

create sequence seq_cartno
    start with 1         -- 첫번째 출발은 1부터 한다.
    increment by 1        -- 증가치 값
    nomaxvalue          -- 최대값이 없이 무제한으로 증가시키겠다는 뜻. 최대값을 주고 싶다면 maxvalue 100이런 식으로 주면 된다.
    nominvalue          -- 최소값이 없다.
    nocycle             -- 반복이 없는 직진
    nocache;

    select * from tab;

    select *
    from user_constraints;
    
    alter table KOY_TBL_CART_TEST
    drop constraint PK_TBL_CART_cartno;
    
    
    select *
    from tbl_member;

     select cartno 
     from TBL_CART 
     where fk_userno = ? and fk_productcode = ? and fk_optioncode = ? 

select *
from tbl_option;

select optioncode, fk_productcode, optionname, addprice 
from tbl_option
where stock = 0 and fk_productcode = 'PF-101-001';

select *
from tbl_cart;


select * from tab;

select * from TBL_CART;
select * from TBL_MEMBER;
select * from TBL_PRODUCT;
select * from TBL_OPTION;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------