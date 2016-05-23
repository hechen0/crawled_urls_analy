use urls;
create table tmt (
    id int not null auto_increment,
    title varchar(255) default null,
    scheme char(10) default null,
    host varchar(255) default null,
    url_path text default null,
    url_query text default null,
    url_fragment text default null,
    created_at datetime not null,
    updated_at datetime not null,
    primary key (id)
)  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
