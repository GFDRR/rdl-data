import json

# import psycopg2
# import sqlalchemy
# from sqlalchemy import create_engine

# table: cf_common.occupancy_enum

def occupancies(event, context):
  return {
    "statusCode": 200,
    "body": json.dumps([]),
  }

def lambda_handler(event, context):
  return {
    "statusCode": 200,
    "body": json.dumps([]),
  }
