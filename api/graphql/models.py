from sqlalchemy import *
from sqlalchemy.orm import (scoped_session, sessionmaker, relationship,
                            backref)
from sqlalchemy.ext.declarative import declarative_base

engine = create_engine('postgresql://postgres@localhost/rdl')
db_session = scoped_session(sessionmaker(autocommit=False,
                                         autoflush=False,
                                         bind=engine))

Base = declarative_base()
Base.query = db_session.query_property()

class HazardType(Base):
    __tablename__ = "hazard_type"
    __table_args__ = dict(schema='cf_common')
    code = Column(String, primary_key=True)
    name = Column(String)

class Imt(Base):
    __tablename__ = "imt"
    __table_args__ = dict(schema='cf_common')
    im_code = Column(String, primary_key=True)
    hazard_code = Column(String)
    process_code = Column(String)
    description = Column(String)
    units = Column(String)

# Public

class Monster(Base):
    __tablename__ = "monsters"
    name = Column(String, primary_key=True)
