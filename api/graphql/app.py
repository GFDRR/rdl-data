#!/usr/bin/env python

import os
import json
from flask import Flask
from flask_graphql import GraphQLView
import graphene from graphql import GraphQLError
from graphene_sqlalchemy import SQLAlchemyConnectionField, SQLAlchemyObjectType, utils
from sqlalchemy import Column, DateTime, ForeignKey, Integer, String, Sequence, func, create_engine
from sqlalchemy.orm import backref, relationship, scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base

app = Flask(__name__)

# Database

POSTGRES_CONNECTION_STRING = os.environ.get('POSTGRES_CONNECTION_STRING')

engine = create_engine(POSTGRES_CONNECTION_STRING, convert_unicode=True)
db_session = scoped_session(sessionmaker(autocommit=False,
                                         autoflush=False,
                                         bind=engine))
Base = declarative_base()
Base.query = db_session.query_property()


def init_db():
    # import all modules here that might define models so that
    # they will be registered properly on the metadata.  Otherwise
    # you will have to import them first before calling init_db()
    Base.metadata.drop_all(bind=engine)
    Base.metadata.create_all(bind=engine)
    db_session.commit()


#############################################################################

################################## MODELS ###################################

class UserModel(Base):
    __tablename__ = 'users'
    id = Column(Integer, Sequence('users_id_seq'), primary_key=True)
    name = Column(String)
    balance = Column(Integer)


#############################################################################


################################## SCHEMA ###################################

# Query #########################
class User(SQLAlchemyObjectType):
    class Meta:
        model = UserModel


class Query(graphene.ObjectType):
    hello = graphene.String()

    def resolve_hello(self, info):
        return "Hello World!"

    users = graphene.List(User)

    def resolve_users(self, info):
        query = User.get_query(info)
        return query.all()


schema = graphene.Schema(query=Query)


# Flask app
app.add_url_rule('/', view_func=GraphQLView.as_view('graphql', schema=schema, graphiql=True))


@app.teardown_appcontext
def shutdown_session(exception=None):
    db_session.remove()



# Execution

if os.environ.get('LAMBDA_LOCAL_DEVELOPMENT') == '1':
    if __name__ == '__main__':
        if os.environ.get('DATABASE_INIT') == '1':
            init_db()
        app.run()



# GraphQL handler
def graphqlHandler(eventRequestBody, context={}):
    try:
        requestBody = json.loads(eventRequestBody)
    except:
        requestBody = {}
    query = ''
    variables = {}
    if ('query' in requestBody):
        query = requestBody['query']
    if ('variables' in requestBody):
        variables = requestBody['variables']
    executionResult = schema.execute(query, variables=variables)

    responseBody = {
        "data": dict(executionResult.data) if executionResult.data != None else None,
    }
    if (executionResult.errors != None):
        responseBody['errors'] = []
        for error in executionResult.errors:
            responseBody['errors'].append(str(error))
    return responseBody


# Lambda handler

responseHeaders = {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE",
    "Access-Control-Allow-Headers": "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization",
}


def lambda_handler(event, context):
    httpMethod = event.get('httpMethod')
    if (httpMethod == 'OPTIONS'):
        return {
            'statusCode': 200,
            'headers': responseHeaders,
            'body': ''
        }
    requestBody = event.get('body')
    responseBody = graphqlHandler(requestBody, context)
    return {
        'statusCode': 200,
        'headers': responseHeaders,
        'body': json.dumps(responseBody)
    }



###############################################################################


# from flask import Flask
# from flask_graphql import GraphQLView
#
# from models import db_session
# from schema import schema
#
# app = Flask(__name__)
# app.debug = True
#
# app.add_url_rule(
#     '/graphql',
#     view_func=GraphQLView.as_view(
#         'graphql',
#         schema=schema,
#         graphiql=True # for having the GraphiQL interface
#     )
# )
#
# @app.teardown_appcontext
# def shutdown_session(exception=None):
#     db_session.remove()
#
# if __name__ == '__main__':
#     app.run()
