var AWS = require("aws-sdk");
var dynamo = new AWS.DynamoDB.DocumentClient({
    region: "ap-northeast-1"
});
var tableName = "users-test";                 //DynamoDB

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
    var Address = body.Address.toLowerCase();
    //TODO: DBに登録するための情報をparamオブジェクトとして宣言する（中身を記述）
    var param = {
        "TableName":tableName,
        "Item":{
            "Address":Address,
            "name":body.name,
            "totalReceive":body.totalReceive,
            "totalSend":body.totalSend,
            "TimeStamp":timeStamp
        }
    };

    //dynamo.put()でDBにデータを登録
    dynamo.put(param, function(err, data) {
        if (err) {
            //TODO: 登録に失敗した場合の処理を記述
            response.statusCode = 500;
            response.body = JSON.stringify({"message":"error"});
            console.log(err);
            callback(null,response);
            return;
        } else {
            //TODO: 登録に成功した場合の処理を記述
            response.body = JSON.stringify(param.Item);
            callback(null,response);
            return;
        }
    });
};