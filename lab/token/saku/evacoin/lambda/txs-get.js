var AWS = require("aws-sdk");
var dynamo = new AWS.DynamoDB.DocumentClient();
var tablename = "txs";

/* tx全件取得 */

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
        "TableName": tablename
    };

    dynamo.scan(param, function(err, data){
        if(err){
            response.statusCode = 500;
            response.body = JSON.stringify({
                "message": "予期せぬエラーが発生したちょん"
            });
            callback(null, response);
            return;
        }

        response.body = JSON.stringify({
            "txs": data.Items
        });
        callback(null, response);
    });
};

