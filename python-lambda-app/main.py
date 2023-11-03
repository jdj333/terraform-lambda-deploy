import json

def lambda_handler(event, context):
    # Extract the input number from the event
    input_number = event.get('number')

    # Perform some processing (double the number in this case)
    result = input_number * 2

    # Prepare a response
    response = {
        "statusCode": 200,
        "body": json.dumps({"result": result})
    }

    return response
