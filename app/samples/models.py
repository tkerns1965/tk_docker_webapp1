from peewee import *

database = MySQLDatabase('tkdw1-db', **{'host': '172.18.0.2', 'port': 3306, 'user': 'tony', 'password': '2hard4u'})

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Class(BaseModel):
    class_code = CharField()
    class_ = PrimaryKeyField(db_column='class_id')
    class_note = CharField(null=True)
    employee = IntegerField(db_column='employee_id')
    equipment_code = CharField(null=True)
    equipment_note = CharField(null=True)

    class Meta:
        db_table = 'class'
        indexes = (
            (('employee', 'class_code', 'class_note', 'equipment_code', 'equipment_note'), True),
        )

class Company(BaseModel):
    company_no = PrimaryKeyField()

    class Meta:
        db_table = 'company'

class Employee(BaseModel):
    employee_code = CharField()
    employee = PrimaryKeyField(db_column='employee_id')
    employee_note = CharField(null=True)
    timesheet = IntegerField(db_column='timesheet_id')

    class Meta:
        db_table = 'employee'
        indexes = (
            (('timesheet', 'employee_code', 'employee_note'), True),
        )

class Hours(BaseModel):
    class_ = IntegerField(db_column='class_id')
    equipment_hours = DecimalField(null=True)
    labor_hours = DecimalField()
    phase = IntegerField(db_column='phase_id')

    class Meta:
        db_table = 'hours'
        indexes = (
            (('phase', 'class_'), True),
        )
        primary_key = CompositeKey('class_', 'phase')

class Job(BaseModel):
    company_no = IntegerField()
    job_code = CharField()
    job = PrimaryKeyField(db_column='job_id')

    class Meta:
        db_table = 'job'
        indexes = (
            (('company_no', 'job_code'), True),
        )

class Phase(BaseModel):
    phase_code = CharField()
    phase = PrimaryKeyField(db_column='phase_id')
    phase_note = CharField(null=True)
    timesheet = IntegerField(db_column='timesheet_id')

    class Meta:
        db_table = 'phase'
        indexes = (
            (('timesheet', 'phase_code', 'phase_note'), True),
        )

class Timesheet(BaseModel):
    craft_code = CharField()
    job = IntegerField(db_column='job_id')
    temperature = CharField(null=True)
    timesheet_date = DateField()
    timesheet = PrimaryKeyField(db_column='timesheet_id')
    weather = CharField(null=True)

    class Meta:
        db_table = 'timesheet'
        indexes = (
            (('job', 'timesheet_date', 'craft_code'), True),
        )

