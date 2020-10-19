exports.handler = (event, context, callback) => {
    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message": ""})
    };

    var rbody = JSON.parse(event.body);

    response.body = JSON.stringify(rbody);

    callback(null, response);
};