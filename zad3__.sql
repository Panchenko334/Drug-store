create schema drug_story_db;
--чтобы не прописывать схему при обращении к таблицам
-- пропишем путь для поиска той или иной таблицы
set search_path=drug_story_db,public;
-- создаем таблицу аптека
create table drug_story(
    drug_story_id serial primary key
    ,name_nm varchar(100) not null
    ,address_txt varchar(100)
    ,phone_no varchar(20) check (phone_no like '+79________')
);
-- создаем таблицу категория препарата
create table drug_category(
    category_id serial primary key
    ,name_nm varchar(100) not null
);-- таблица клиент
create table  client(
    card_number_no varchar(50) primary key
    ,concession_rate decimal(12,2)
    ,last_nm varchar(50)
    ,first_nm varchar(50)
    ,middle_nm varchar(50)
);-- таблица производитель
create table producer(
    producer_id serial primary key
    ,company_nm varchar(100)
    ,address_txt varchar(100)
    ,phone_no varchar(20) check (phone_no like '+79________')
);--продажа
create table  marketing(
    marketing_id serial primary key
    ,date_dt date
    ,total_sum_amt decimal(12,2)
    ,drug_story_id integer
    ,card_number_no varchar(50)
    ,foreign key(drug_story_id) references drug_story(drug_story_id)on delete cascade
    ,foreign key(card_number_no) references client(card_number_no)on delete cascade
);--таблица поставщик
create table  provider(
    provider_id serial primary key
    ,company_nm varchar(100)
    ,company_contact_nm varchar(50)
    ,address_txt varchar(100)
    ,phone_no varchar(20) check (phone_no like '+79________')
);
--таблица лекарственный препарат
create table  drug_product(
    drug_product_id serial primary key
    ,name_drug_product_nm varchar(100)
    ,price_amt decimal(12,2)
    ,shelf_life_dt date
    ,producer_id integer
    ,category_id integer
    ,drug_story_id integer
    ,foreign key(drug_story_id ) references drug_story(drug_story_id)on delete cascade
    ,foreign key(category_id) references drug_category(category_id)on delete cascade
    ,foreign key(producer_id) references producer(producer_id)on delete cascade
);--таблица Лекарственный препарат_X_продажа
create table drug_product_x_marketing(
    number_cnt integer
    ,unit_price_amt decimal(12,2)
    ,extended_amount_amt decimal(12,2)
    ,drug_product_id integer
    ,marketing_id  integer
    ,foreign key(drug_product_id) references drug_product(drug_product_id)on delete cascade
    ,foreign key(marketing_id) references marketing(marketing_id )on delete cascade
    ,constraint PK_drug_product_x_marketing primary key(drug_product_id,marketing_id)
);-- таблица поставки
create table provisioning(
    provisioning_id integer
    ,date_dt date
    ,sum_amt_amt decimal(12,2)
    ,driver_name_nm varchar(100)
    ,drug_product_id integer
    ,drug_story_id integer
    ,provider_id integer
    ,foreign key(drug_story_id ) references drug_story(drug_story_id)on delete cascade
    ,foreign key(drug_product_id) references drug_product(drug_product_id)on delete cascade
    ,foreign key(provider_id) references provider(provider_id)on delete cascade
    ,constraint PK_provisioning primary key(provisioning_id,drug_product_id,drug_story_id,provider_id)
);
--все имеющиеся ограничения в базе можно посмотреть
select *
from information_schema.table_constraints;
-- посмотреть уникальные и ключевые поля таблиц (PK,FK)
select *
from information_schema.key_column_usage;
-- информация по ограничениям с типом check
select *
    from information_schema.check_constraints;
