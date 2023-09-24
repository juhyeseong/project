drop table wishList purge;
drop table report purge;
drop table reviewReport purge;
drop table review_img purge;
drop table review purge;
drop table reservation purge;
drop table rent_img purge;
drop table rent purge;
drop table member purge;

drop sequence wishList_seq;
drop sequence report_seq;
drop sequence reviewReport_seq;
drop sequence review_img_seq;
drop sequence review_seq;
drop sequence reservation_seq;
drop sequence rent_img_seq;
drop sequence rent_seq;
drop sequence member_seq;

create sequence member_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;
    
create sequence rent_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;

create sequence rent_img_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;

create sequence reservation_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;

create sequence review_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;
    
create sequence review_img_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;
    
create sequence reviewReport_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;
    
create sequence report_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;
    
create sequence wishList_seq
    start with 1
    increment by 1
    maxvalue 9999
    nocache
    nocycle;
    
create table member(
    idx         number          default member_seq.nextval primary key,
    userId      varchar2(200)   not null unique,
    userPw      varchar2(255)   not null,
    userNick    varchar2(50)    not null unique,
    email       varchar2(255)   not null,
    userName    varchar2(50)    not null,
    birth       date            not null,
    phoneNum    varchar2(100)   not null,
    profile     varchar2(255)   default 'http://192.168.64.200/basicProfile.png',
    gender      varchar2(10)
);

create table rent(
    idx         number          default rent_seq.nextval primary key,
    member      number          not null,
    category    varchar2(100)   not null,
    roomType    varchar2(100)   not null,
    address    varchar2(255)    not null,
    detailAddress varchar2(255) not null,
    roomCount   number          not null,
    guestCount  number          not null,
    bedCount    number          not null,
    bathCount   number          not null,
    information varchar2(3000)  ,
    title       varchar2(255)   not null,
    content     varchar2(4000)  not null,
    price       number          not null,
    contactNum  varchar2(100)   not null,
    discount    number          ,
    state       number          default 0 check(state in (0, 1, 2)),
    
    constraint rent_member_fk
        foreign key(member)
        references member(idx)
        on delete cascade
);

create table rent_img(
    idx         number          default rent_img_seq.nextval primary key,
    rent        number          not null,
    filePath    varchar2(255)   not null,
    
    constraint rent_img_fk
        foreign key(rent)
        references rent(idx)
        on delete cascade
);

create table reservation(
    idx         number          default reservation_seq.nextval primary key,
    member      number          not null,
    rent        number          not null,
    startDate   date            not null,
    endDate     date            not null,
    guestCount  number          not null,
    totalPrice  number          not null,
    merchant_uid varchar(300)   ,
    
    constraint reservation_member_fk
        foreign key(member)
        references member(idx)
        on delete cascade,
        
    constraint reservation_rent_fk
        foreign key(rent)
        references rent(idx)
        on delete cascade
);

create table review(
    idx         number          default review_seq.nextval primary key,
    member      number          not null,
    rent        number          not null,
    content     varchar2(4000)  not null,
    point       number          check(0 < point and point <= 5)not null,
    reportStatus number          DEFAULT 0 check(reportStatus in (0,1)),
    
    constraint review_member_fk
        foreign key(member)
        references member(idx)
        on delete cascade,
        
    constraint review_rent_fk
        foreign key(rent)
        references rent(idx)
        on delete cascade
);

create table review_img(
    idx         number          default review_img_seq.nextval primary key,
    review      number          not null,
    filePath    varchar2(255)   not null,
    
    constraint review_img_fk
        foreign key(review)
        references review(idx)
        on delete cascade
);

create table reviewReport(
    idx number DEFAULT reviewReport_seq.nextval PRIMARY key,
    member    number   not null,
    review    number   not null,
    reportType  VARCHAR2(100) not null,
    content   VARCHAR2(4000) not null,
    
    CONSTRAINT reviewReport_member_fk
        FOREIGN key(member)
        REFERENCES member(idx)
        on delete cascade,
        
    CONSTRAINT reviewReport_reply_fk
        FOREIGN key (review)
        REFERENCES review(idx)
        on delete CASCADE
);

create table report(
    idx         number          default report_seq.nextval primary key,
    member      number          not null,
    rent        number          not null,
    reportType  varchar2(100)   not null,
    content     varchar2(4000)  not null,
    
    constraint report_member_fk
        foreign key(member)
        references member(idx)
        on delete cascade,
        
    constraint report_rent_fk
        foreign key(rent)
        references rent(idx)
        on delete cascade
);

create table wishList(
    idx         number          default report_seq.nextval primary key,
    member      number          not null,
    rent        number          not null,
    
    constraint wishList_member_fk
        foreign key(member)
        references member(idx)
        on delete cascade,
        
    constraint wishList_rent_fk
        foreign key(rent)
        references rent(idx)
        on delete cascade
);