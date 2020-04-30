import json

# import psycopg2
# import sqlalchemy
# from sqlalchemy import create_engine

def lambda_handler(event, context):
  return {
    "statusCode": 200,
    "body": json.dumps([]),
  }
