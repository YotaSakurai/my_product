const AWS = require("aws-sdk");
const dynamo = new AWS.DynamoDB.DocumentClient({
    region: "ap-northeast-1"
});
const tableName = "transactions";
/* 個人のトランザクションをすべて取得 */
exports.handler = (event, context, callback) => {
    var response = {
        statusCode : 200,
        headers: {
            "Access-Control-Allow-Origin" : "*"
        },
        body: JSON.stringify({"message" : ""})
    };

    //var txhash = event.queryStringParameters.txhash;
    var FromAddress = event.queryStringParameters.FromAddress;
    //var ToAddress = event.queryStringParameters.ToAddress;

    console.log(FromAddress);
    if(ToAddress){
        console.log(ToAddress);
    }
    

    var param = {
        "TableName" : tableName,
        //キー、インデックスによる検索の定義
        KeyConditionExpression: "fromAddress = :from",
        //FilterExpression: "#to = to"
        //"KeyConditionExpression": "FromAddress = :from",  //パーティションキー
        //検索値のプレースホルダの定義
        ExpressionAttributeNames:{
            ':from': FromAddress
            //'#to': 'to'
        },
        "ExpressionAttributeValues" : {
            ":from": FromAddress
            //":to": ToAddress
        },
        
    };

    dynamo.query(param, function(err, data){
        if(err){
            
            response.statusCode = 500;
            response.body = JSON.stringify({
                "message": "予期せぬエラーが発生したちょん"
            });
            console.log("えらー = " + err);
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

