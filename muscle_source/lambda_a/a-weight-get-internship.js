var AWS = require("aws-sdk");
var dynamo = new AWS.DynamoDB.DocumentClient();
var tableName = "a_weight";

exports.handler = (event, context, callback) => {
    //レスポンスの雛形
    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message" : ""})
    };

    var userId = event.queryStringParameters.userId;   //見たいユーザのuserId
    var timeStamp = event.queryStringParameters.timeStamp;
    console.log(userId);
    //TODO: 取得対象のテーブル名と検索に使うキーをparamに宣言
    var param = {
        "TableName" : tableName,
        //キー、インデックスによる検索の定義
        "KeyConditionExpression": "userId = :uid",
        //検索値のプレースホルダの定義
        "ExpressionAttributeValues" : {
            ":uid": userId
        }
    };

    //dynamo.get()でDBからデータを取得
    dynamo.query(param, function(err, data){
        if(err){
            //TODO: 取得に失敗した時の処理を記述
            response.statusCode = 500;
            response.body = JSON.stringify({"message":"error"});
            callback(null,response);
            console.log(err);
            return;
        }

        //TODO: 条件に該当するデータがあればパスワードを隠蔽をする処理を記述
        if(data.Item){
            delete data.Item.userId;
        }
        //TODO: レスポンスボディの設定とコールバックを記述
        response.body = JSON.stringify(data);
        callback(null,response);
        return;
    });
};
