
google.charts.load('current', {packages: ['corechart', 'line'], "language":"ja"});
google.charts.setOnLoadCallback(drawBasic);

var vm = new Vue


function drawBasic() {
    fetch(url + "/user" +
                "?address=" + localStorage.getItem("address"), {
                method: "GET",
            })
                .then(function (response) {
                    
                    
                    if (response.status == 200) {
                        return response.json();
                    }
                    // 200番以外のレスポンスはエラーを投げる
                    return response.json().then(function (json) {
                        throw new Error(json.message);
                    });
                })
                .then(function (json) {
                    // レスポンスが200番で返ってきたときの処理はここに記述する
                    localStorage.setItem("g_weight", json.Item.g_weight);
                    user_g_weight = json.Item.g_weight;
                    
                    
                    
                })
                .catch(function (err) {
                    // レスポンスがエラーで返ってきたときの処理はここに記述する
                });

    var data = new google.visualization.DataTable();
    fetch(url + "/weight" + 
    "?userId=" + localStorage.getItem("address"),{
        method: "GET",
    })
    .then(function(response) {
        if (response.status == 200) {
            return response.json();
        }
        // 200番以外のレスポンスはエラーを投げる
        return response.json().then(function(json) {
            throw new Error(json.message);
        });
    })
    .then(function(json) {
    // レスポンスが200番で返ってきたときの処理はここに記述する
        //if(json.Items){
        delete json.Items.userId;
        //}
        weights = json.Items;
        i = 0;
        day = 1;
        data.addColumn('string', 'days');
        data.addColumn('number', '体重');
        data.addColumn('number', '目標体重');
        data.addRows(weights.length);
        g_border = localStorage.getItem("g_weight");
        min_weight = 0;
        max_weight = 0;
        weights.forEach( function (weight) {
            //data.addRows([weight.timeStamp, weight.weight]);
            s = "8/" + day;
            data.setValue(i, 0, s);
            data.setValue(i, 1, weight.weight);
            data.setValue(i, 2, localStorage.getItem("g_weight"));//localStorage.getItem("g_weight")で目標取得
            if(max_weight < weight.weight){
                max_weight = weight.weight;
            }
            if(min_weight > weight.weight){
                min_weight = weight.weight;
            }
            //data.addRows([i, j]);
            i = i + 1;
            day++;
        });
        
        
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        /*var options = {
            hAxis: {
                title: '年月'
            },
            vAxis: {
                title: '体重(kg)'
            },
            "width":700,
            "height":400
        };*/
        options = {
            width: 700,
            height: 400,
            legend: 'bottom',
            vAxis:{minValue:(g_border - 5),maxValue:(max_weight + 5),gridlined:{count:5 }},
            title: '体重の推移'
            };

        

        chart.draw(data, options);


    })
    .catch(function(err) {
    // レスポンスがエラーで返ってきたときの処理はここに記述する
    });
    
    /*  
    data.addRows([
    [0, 0],   [1, 10],  [2, 23],  [3, 17],  [4, 18],  [5, 9],
    [6, 11],  [7, Number(weight.weight)],  [8, 33],  [9, 40],  [10, 32], [11, 35],
    [12, 30], [13, 40], [14, 42], [15, 47], [16, 44], [17, 48],
    [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
    [24, 60], [25, 50], [26, 52], [27, 51], [28, 49], [29, 53],
    [30, 55], [31, 60], [32, 61], [33, 59], [34, 62], [35, 65],
    [36, 62], [37, 58], [38, 55], [39, 61], [40, 64], [41, 65],
    [42, 63], [43, 66], [44, 67], [45, 69], [46, 69], [47, 70],
    [48, 72], [49, 68], [50, 66], [51, 65], [52, 67], [53, 70],
    [54, 71], [55, 72], [56, 73], [57, 75], [58, 70], [59, 68],
    [60, 64], [61, 60], [62, 65], [63, 67], [64, 68], [65, 69],
    [66, 70], [67, 72], [68, 75], [69, 80]
]);*/



}