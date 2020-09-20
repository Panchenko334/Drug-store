
from peewee import *
from datetime import date
db = PostgresqlDatabase(database="postgres", user="postgres", password="postgres")
db.connect()

#создали базовый класс устанавливает подключение базы данных и расширили его
class BaseModel(Model):
    #Конфигурация модели хранится в пространстве имен в специальном вызываемом классе Meta
    class Meta:
        database =  db
# определили класс модели  Аптека
class Drug_store(BaseModel):
    #тип varchar
    name_nm= CharField(max_length=100)
    address_txt=CharField(max_length=100)
    phone_no=CharField(max_length=20)

    class Meta:
        #явно задаем имя базы для таблицы
        db_table = "drug-store"
        order_by = ('name_nm',)
        # создание таблицы аптека


Drug_store.truncate_table

Drug_store.create_table()
# заполнение таблицы данными
Аптека=Drug_store.create(name_nm='Социальная аптека',address_txt='г. Черкесск ул Парковая 21', phone_no='+7916057055')
Аптека_36_6=Drug_store.create(name_nm='Аптека 36,6',address_txt='г. Черкесск ул Октябрьская 388', phone_no='7916177066')
АптекаВита=Drug_store.create(name_nm='Аптека Вита',address_txt='г. Черкесск ул Доватора 35', phone_no='+7916185253')
АптекаПульс=Drug_store.create(name_nm='Аптека Пульс',address_txt='г. Черкесск ул Ленина 57', phone_no='+7916114978')
АптекаЛинияЖизни=Drug_store.create(name_nm='Аптека Линия Жизни',address_txt='г. Черкесск ул Октябрьская 309Г', phone_no='+7916171855')

# обновим записи
Аптека_36_6.name_nm='Аптека 36++ 6'
Аптека_36_6.save()  # обновление записи аптеки

# Вставляем запись
АптекаАпрель=Drug_store.create(name_nm='Аптека Апрель',address_txt='г. Черкесск ул Первомайская 40', phone_no='+7916242555')
АптекаАпрель.save()

# удаление из базы записи с аптекой Апрель
АптекаАпрель.delete_instance()
# выборка данных
for Drug_store in Drug_store.select():
    print(Drug_store.name_nm,Drug_store.address_txt)




