var AWS = require("aws-sdk");
var dynamo = new AWS.DynamoDB.DocumentClient({
    region: "ap-northeast-1"
});
var tableName = "transactions";

/* tx全件取得 */

exports.handler = (event, context, callback) => {
    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message" : ""})
    };

    var From_Address = event.queryStringParameters.FromAddress;
    //var ToAddress = event.queryStringParameters.ToAddress;
    console.log("Fromアドレス" + From_Address);
    var param = {
        "TableName" : tableName,
        //キー、インデックスによる検索の定義
        
        //FilterExpression: "#to = to"
        //"KeyConditionExpression": "FromAddress = :from",  //パーティションキー
        //検索値のプレースホルダの定義
        /*ExpressionAttributeNames:{
            "#from": "FromAddress"
            //'#to': 'to'
        },
        ExpressionAttributeValues : {
            ":from": {S: From_Address}
            //":to": ToAddress
        },

        KeyConditionExpression: "#from = :from"*/
        
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

        if(data.Items){
            data.Items.forEach(function(val){
                if(val.FromAddress != From_Address){
                    delete val.FromAddress;
                    delete val.TimeStamp;
                    delete val.Reason;
                    delete val.txhash;
                    delete val.ToAddress;
                    delete val.ToName;
                    delete val.Amount;
                    delete val.FromName;
                }
                
            });
        }

        response.body = JSON.stringify({
            "transactions": data.Items
        });
        callback(null, response);
    });
};

