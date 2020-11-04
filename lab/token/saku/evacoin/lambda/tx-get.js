var AWS = require("aws-sdk");
var dynamo = new AWS.DynamoDB.DocumentClient();
var tablename = "txs";

exports.handler = (event, context, callback) => {
    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message" : ""})
    };

    var txhash = event.queryStringParameters.txhash;

    var param = {
        "TableName": tablename,
        "Key":{
            "txhash": txhash
        }
    };

    dynamo.get(param, function(err, data){
        if(err){
            
            response.statusCode = 500;
            response.body = JSON.stringify({
                "message": "予期せぬエラーが発生したちょん"
            });
            callback(null, response);
            return;
        }else{
            console.log(data.Item.txhash);
            console.log(data.Item.FromAddress);
        }

        response.body = JSON.stringify(data);
        callback(null, response);
    });
};

