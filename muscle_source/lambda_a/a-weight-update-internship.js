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
    //var timeStamp = Date.now();

    //TODO: paramに更新対象のテーブル名と更新内容を記述
    var param = {
        "TableName" : tableName,
        "Item":{
            "userId":body.userId,
            "timeStamp":body.timeStamp,
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
//dsjk

//pbcopy < ~/.ssh/id_rsa.pub
//ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyWbI72u7lQlyVilJ2/hJiQ/E99XyKjYiJwAxYwnd5y27DqBaIWqzHA6gMhjjsj88dLh6ZnBSGlZ579TnJlfUST4RIXFb0jEldaXkV41bDCZliyqPk9n4RnpdrFdVF6DraLSeG9ZlslZv6TWSX8DvDPkfxxIeSeEq7ibTQftrPlh7w5/8y3XwD1slf/lVUaQwp2dUaQcszgOlWDDR95Drg1iweuBLi8A4xI7I8QfeDtjcmJgRTmAWw2Wi9Yr6x7NWIGMrrOy6pYyrLy2tySTKLwGtlmST4ni4DdFht8s5OR0mvsVFml+13suHmODFrec+WOlloPvdWKqYYiHj0i889 s92y71k9@gmail.com
