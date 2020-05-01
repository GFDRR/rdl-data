import graphene
from graphene import relay
from graphene_sqlalchemy import SQLAlchemyObjectType, SQLAlchemyConnectionField

from models import HazardType as HazardTypeModel, Imt as ImtModel, Monster as MonsterModel

# COMMON SCHEMA

class Imt(SQLAlchemyObjectType):
    class Meta:
        model = ImtModel
        interfaces = (relay.Node,)

class ImtConnection(relay.Connection):
    class Meta:
        node = Imt

class HazardType(SQLAlchemyObjectType):
    class Meta:
        model = HazardTypeModel
        interfaces = (relay.Node,)

class HazardTypeConnection(relay.Connection):
    class Meta:
        node = HazardType

# PUBLIC SCHEMA

class MonsterModel(SQLAlchemyObjectType):
    class Meta:
        model = MonsterModel
        interfaces = (relay.Node,)
class MonsterConnection(relay.Connection):
    class Meta:
        node = MonsterModel

class Query(graphene.ObjectType):
    node = relay.Node.Field()
    hazard_types = SQLAlchemyConnectionField(HazardTypeConnection, sort=None)
    imt = SQLAlchemyConnectionField(ImtConnection, sort=None)
    all_monsters = SQLAlchemyConnectionField(MonsterConnection)

schema = graphene.Schema(query=Query)
