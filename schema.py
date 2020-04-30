import graphene
from graphene import relay
from graphene_sqlalchemy import SQLAlchemyObjectType, SQLAlchemyConnectionField
from models import Department as DepartmentModel
from models import Employee as EmployeeModel


class Department(SQLAlchemyObjectType):
    class Meta:
        model = DepartmentModel
        interfaces = (relay.Node,)


class DepartmentConnection(relay.Connection):
    class Meta:
        node = Department


class Employee(SQLAlchemyObjectType):
    class Meta:
        model = EmployeeModel
        interfaces = (relay.Node,)


class PersonConnection(relay.Connection):
    class Meta:
        node = Employee


class Query(graphene.ObjectType):
    node = relay.Node.Field()
    all_employees = SQLAlchemyConnectionField(PersonConnection)
    all_departments = SQLAlchemyConnectionField(DepartmentConnection, sort=None)


schema = graphene.Schema(query=Query)
