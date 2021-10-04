import json

def handler(event, context):
  return {
      'statusCode': 200,
      'headers': { 'Content-Type': 'application/json' },
      'body': json.dumps("Que guarda Darth Vader en el freezer? Helado oscuro")
  }