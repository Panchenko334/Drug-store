--чтобы не прописывать схему при обращении к таблицам
-- пропишем путь для поиска той или иной таблицы
set search_path=drug_story_db,public;
-- зад 6

--№1 вывести информацию о лекарственных препаратах с указанием категории препарата
 -- соединение двух таблиц по условию
   select distinct
        name_drug_product_nm,dc.name_nm,price_amt,shelf_life_dt
   from drug_product as dp
        inner join drug_category as dc
        on dp.category_id= dp.category_id;
--№2 вывести название аптек, в которых есть препарат нурофен
   select
        name_nm
   from drug_story as ds
        inner join drug_product as dp
        on ds.drug_story_id= dp.drug_story_id
   and dp.name_drug_product_nm='Нурофен';
--№3 вывести информацию о  сумме продажи с указанием номера карты клиента и фамилии
select
    c.last_nm,c.first_nm,c.card_number_no,sum(total_sum_amt)
    from marketing as mk
     inner join client as c
     on mk.card_number_no=c.card_number_no
group by c.card_number_no;
--№4 вывести информацию о лекарственных препаратах с указанием производителя
 -- соединение двух таблиц по условию
   select distinct
        pr.company_nm,name_drug_product_nm,price_amt,shelf_life_dt
   from drug_product as dp
        inner join producer as pr
        on dp.producer_id= pr.producer_id;
--№5 вывести максимальную цену за препарат и минимальный срок хранения
select ds.name_nm,max(price_amt),min(shelf_life_dt)
    from drug_product as dp
 inner join  drug_story as ds
        on dp.drug_story_id= ds.drug_story_id
group by name_nm;
;

