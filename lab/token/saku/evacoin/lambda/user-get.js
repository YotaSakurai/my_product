var AWS = require("aws-sdk");
var dynamo = new AWS.DynamoDB.DocumentClient({
    region: "ap-northeast-1"
});
var tablename = "users";

/* users全件取得 */

exports.handler = (event, context, callback) => {
    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message" : ""})
    };


    var param = {
        "TableName": tablename
    };

    dynamo.scan(param, function(err, data){
        if(err){
            response.statusCode = 500;
            response.body = JSON.stringify({
                "message": "予期せぬエラーが発生したちょん"
            });
            console.log("エラー = " + err);
            callback(null, response);
            return;
        }

        response.body = JSON.stringify({
            "users": data.Items
        });
        callback(null, response);
    });
};

