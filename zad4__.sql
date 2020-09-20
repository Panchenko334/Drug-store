
--чтобы не прописывать схему при обращении к таблицам
-- пропишем путь для поиска той или иной таблицы
set search_path=drug_story_db,public;
-- зад 4
-- добавление в таблицу аптека
insert into drug_story values(1,'Социальная аптека', 'г. Черкесск ул Парковая 21','+7916057055');
insert into drug_story values(2,'Аптека 36,6', 'г. Черкесск ул Октябрьская 388','+7916177066');
insert into drug_story values(3,'Аптека Вита', 'г. Черкесск ул Доватора 35','+7916185253');
insert into drug_story values(4,'Аптека Пульс', 'г. Черкесск ул Ленина 57','+7916114978');
insert into drug_story values(5,'Аптека Линия Жизни', 'г. Черкесск ул Октябрьская 309Г','+7916171855');
-- добавление в таблицу категория препарата
insert into drug_category values(1,'Иммуностимулирующее');
insert into drug_category values(2,'Антисептик');
insert into drug_category values(3,'Снотвотрное');
insert into drug_category values(4,'Жаропонижающее');
insert into drug_category values(5,'Противовоспалительное');
-- добавление в таблицу
insert into provider values(1,'Фармстандарт', 'Сидоров И.И.','Московская область г. Долгопрудный','+7916144453');
insert into provider values(2,'Фирма Евросервис', 'Ивашкин А.Н.','г. Москва','+7916144453');
insert into provider values(3,'Сиа Интернейшнл', 'Демкин А.Ю.','г. Москва','+7916251453');
insert into provider values(4,'Р-Фарм', 'Игнатьев В.Г.','г. Москва','+7916851978');
insert into provider values(5,'Роста', 'Паникашвили Д.И.','Московская область г. Подольск','+7916851978');
-- исправляем одинаковые номера телефонов для двух фирм
UPDATE provider
SET phone_no='+7916144785'
  WHERE  company_nm ='Фирма Евросервис' ;
UPDATE provider
SET phone_no='+7916547774'
  WHERE  company_nm ='Роста' ;
-- добавляем в таблицу клиент
insert into client values(2200145264213452,0,'Сидоркин','Иван','Иванович');
insert into client values(2200254164213254,0,'Ивашкин','Лев','Николаевич');
insert into client values(2200625414213452,0,'Мартынов','Олег','Романович');
insert into client values(2200254164452312,5,'Михайлов','Станислав','Юрьевич');
insert into client values(2200254164212345,0,'Любушкин','Анатолий','Николаевич');
-- добавляем в таблицу производитель
insert into producer values(1,' компания Новартис', 'г. Москва ул Садовническая д.82 стр 2','+7917506055');
insert into producer values(2,' Байер', 'г. Москва ул.3-я Рыбинская дом 18 ','+7916506223');
insert into producer values(3,' АстраЗенека', 'г. Москва ул Береговая дом 3 стр 1','+7916332233');
insert into producer values(4,'MSD', 'г. Москва ул Тимура Фрунзе 11 к 1','+7917506055');
insert into producer values(5,' Астеллас', 'г. Москва ул Марксистская д.16','+7917503322');
-- добавляем в таблицу продажа
insert into marketing values(1,'2020-09-01',690,1,2200145264213452);
insert into marketing values(2,'2020-09-01',1180,1,2200145264213452);
insert into marketing values(3,'2020-09-02',490,2,2200254164213254);
insert into marketing values(4,'2020-09-02',370,2,2200625414213452);
insert into marketing values(5,'2020-09-02',1030,3,2200254164452312);
-- добавление в таблицу лекарственный препарат
 insert into drug_product values(1,'Нурофен',120,'2021-01-02',1,5,4);
 insert into drug_product values(2,'Ревит',160,'2021-01-03',2,2,1);
 insert into drug_product values(3,'Сахол',125,'2021-01-05',3,4,1);
 insert into drug_product values(4,'Гептрал',350,'2021-04-02',4,1,3);
 insert into drug_product values(5,'Бишофит',140,'2021-01-06',5,3,2);
-- добавление в таблицу поставки
insert into provisioning values(1,'2020-08-01',1200,'Иван',1,4,1);
insert into provisioning values(2,'2020-08-01',1600,'Михаил',2,1,2);
insert into provisioning values(3,'2020-08-03',500,'Олег',3,1,3);
insert into provisioning values(4,'2020-08-03',1400,'Иван',4,3,1);
insert into provisioning values(5,'2020-08-01',1400,'Антон',5,2,4);
-- добавление в таблицу лекарственный препарат продажа
insert into drug_product_x_marketing values(1,120,120,1,1);
insert into drug_product_x_marketing values(2,160,320,2,1);
insert into drug_product_x_marketing values(1,250,250,3,1);
insert into drug_product_x_marketing values(1,350,350,4,2);
insert into drug_product_x_marketing values(2,125,250,3,2);
insert into drug_product_x_marketing values(2,140,280,5,2);
insert into drug_product_x_marketing values(1,160,160,2,2);