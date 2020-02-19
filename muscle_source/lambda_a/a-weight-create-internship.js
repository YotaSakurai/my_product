var AWS = require("aws-sdk");
var dynamo = new AWS.DynamoDB.DocumentClient();
var tableName = "a_weight";

exports.handler = (event, context, callback) => {
    var response = {
        statusCode: 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message" : ""})
    };

    var body = JSON.parse(event.body);
    var timeStamp = Date.now();

    //TODO: paramに更新対象のテーブル名と更新内容を記述
    var param = {
        "TableName" : tableName,
        "Item":{
            "userId":body.userId,
            "timeStamp":timeStamp,
            "weight":body.weight
        }
    };

    //dynamo.put()を用いてデータの更新
    dynamo.put(param, function(err, data){
        if(err){
            //TODO: 更新に失敗した場合の処理を記述
            response.statusCode = 500;
            response.body = JSON.stringify({"message":"error"});
            callback(null,response);
            return;
        }else{
            //TODO: 更新に成功した場合の処理を記述
            response.body = JSON.stringify(param.Item);
            callback(null,response);
            return;
        }
    });
};
