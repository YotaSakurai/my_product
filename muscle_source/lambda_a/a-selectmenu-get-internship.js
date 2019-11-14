var AWS = require("aws-sdk");
var dynamo = new AWS.DynamoDB.DocumentClient();
var tableName = "a_selectMenu";

exports.handler = (event, context, callback) => {
    //レスポンスの雛形
    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message" : ""})
    };

    var number = event.queryStringParameters.number;   //見たいユーザのuserId
    var place = event.queryStringParameters.place;

    //TODO: 取得対象のテーブル名と検索に使うキーをparamに宣言
    var param = {
        "TableName": tableName,
        "Key":{                 //プライマリーキーは必須
            "number":Number(number),
            "place":place
        }
    };

    //dynamo.get()でDBからデータを取得
    dynamo.get(param, function(err, data){
        if(err){
            //TODO: 取得に失敗した時の処理を記述
            response.statusCode = 500;
            response.body = JSON.stringify({"message":"error"});
            console.log(err);
            callback(null,response);
            return;
        }

        //TODO: 条件に該当するデータがあればパスワードを隠蔽をする処理を記述
        if(data.Item){
            delete data.Item.password;
        }
        //TODO: レスポンスボディの設定とコールバックを記述
        response.body = JSON.stringify(data);
        callback(null,response);
        return;
    });
};
