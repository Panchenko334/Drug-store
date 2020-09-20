--чтобы не прописывать схему при обращении к таблицам
-- пропишем путь для поиска той или иной таблицы
set search_path=drug_story_db,public;
--зад 5
--№1 найти все значения из таблицы лекарственный препарат
 select
      *
 from
     drug_product;
--№2 вывести всех поставщиков из Москвы или Московской области
select
    *
from
     provider
where (address_txt like '%Москва%') or (address_txt  like '%Московская область%');
-- №3 вывести данные из таблицы продажи  на 01.09.2020
select
    *
from
    marketing
where
     date_dt='2020-09-01';
--№4 вывести клиентов, у которых предусмотрена скидка на товар
select
    *
from
    client
where
     concession_rate>0;
--№5 посчитать общую сумму поставок лекарственных препаратов, сгруппировать по дате
select
   sum(sum_amt_amt)
from
    provisioning
group by date_dt;