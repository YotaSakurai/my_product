exports.handler = (event, context, callback) => {
    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message" : ""})
    };

    var name = event.queryStringParameters.name;
    var totalReceive = event.queryStringParameters.totalReceive;
    var address = event.queryStringParameters.address;

    

    response.body = JSON.stringify({"message" : address});

    callback(null, response);
};

