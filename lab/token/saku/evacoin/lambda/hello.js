exports.handler = (event, content, callback) => {

    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : ""
        }
    };

    response.body = JSON.stringify({"message" : "Hello World"});

    callback(null, response);
}