const AWS = require("aws-sdk");
const dynamoDB = new AWS.DynamoDB.DocumentClient({
  region: "ap-northeast-1" // DynamoDBのリージョン
});

exports.handler = (event, context, callback) => {
  const params = {
    TableName: "users", // DynamoDBのテーブル名
    KeyConditionExpression: "#PartitionKey = :id", // 取得するKey情報
    ExpressionAttributeNames: {
      "#PartitionKey": "id", // PartitionKeyのアトリビュート名
      //"#SortKey": "your-sort-key" // SortKeyのアトリビュート名
    },
    ExpressionAttributeValues: {
      ":partition-key-data": "id", // 取得したいPartitionKey名
      //":sort-key-data": "your-sort-key-data" // 取得したいSortKey名
    },
    ScanIndexForward: false, // 昇順か降順か(デフォルトはtrue=昇順)
    Limit: 2 // 取得するデータ件数
  }

  // DynamoDBへのquery処理実行
  dynamoDB.query(params).promise().then((data) => {
    console.log(data);
    callback(data);
  }).catch((err) => {
    console.log(err);
    callback(err);
  });
}