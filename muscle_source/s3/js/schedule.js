

Events = {
    "monthly": [
    {
    "id": 1,
    "name": "ジムの日",
    "startdate": "2019-08-12",
    "enddate": "2019-08-12",
    "color": "#e84d38"
    },
    {
    "id": 2,
    "name": "ジムの日",
    "startdate": "2019-08-15",
    "enddate": "2019-08-15",
    "color": "#e84d38"
    },
    {
        "id": 3,
        "name": "ジムの日",
        "startdate": "2019-08-18",
        "enddate": "2019-08-18",
        "color":"#e84d38"
    },
    {
        "id": 4,
        "name": "ジムの日",
        "startdate": "2019-08-21",
        "enddate": "2019-08-21",
        "color":"#e84d38"
    },
    {
        "id": 5,
        "name": "ジムの日",
        "startdate": "2019-08-24",
        "enddate": "2019-08-24",
        "color":"#e84d38"
    },
    {
        "id": 6,
        "name": "ジムの日",
        "startdate": "2019-08-27",
        "enddate": "2019-08-27",
        "color":"#e84d38"
    },
    {
        "id": 7,
        "name": "ジムの日",
        "startdate": "2019-08-30",
        "enddate": "2019-08-30",
        "color":"#e84d38"
    },
    {
        "id": 8,
        "name": "チェストプレス",
        "startdate": "2019-08-12",
        "enddate": "2019-08-12",
        "color": "#e13d78"
        },
        {
            "id": 9,
            "name": "ラットプルダウン",
            "startdate": "2019-08-15",
            "enddate": "2019-08-15",
            "color": "#e13d78"
        },
        {
            "id": 10,
            "name": "カレー",
            "startdate": "2019-08-12",
            "enddate": "2019-08-12",
            "color": "#e65d89"
        },
        {
            "id": 11,
            "name": "とんかつ",
            "startdate": "2019-08-15",
            "enddate": "2019-08-15",
            "color": "#e65d89"
        },

    ]
}
     
    $(window).load( function() {
    $('#mycalendar').monthly(
    {mode: 'event',
    dataType: 'json',
    events: Events,
    eventList:true}
    );
    });



/*var Events = {
    "monthly": [
    {
    "id": 1,
    "name": "muscle",
    "startdate": "2019-08-27",
    "enddate": "2019-08-27",
    "color": "#e84d38"
    },
    {
    "id": 2,
    "name": "ランニング",
    "startdate": "2019-08-20",
    "enddate": "2019-08-20",
    "color": "#53c3db"
    }
    ]
    };
     
    $(window).load( function() {
    $('#mycalendar').monthly(
    {mode: 'event',
    dataType: 'json',
    events: Events,
    eventList:true}
    );
    });

var vm = new Vue({
        el: "#app", // Vue.jsを使うタグのIDを指定
        data: {
        // Vue.jsで使う変数はここに記述する
        Events = {
            "monthly": [
            {
            "id": 1,
            "name": "muscle",
            "startdate": "2019-08-27",
            "enddate": "2019-08-27",
            "color": "#e84d38"
            },
            {
            "id": 2,
            "name": "ランニング",
            "startdate": "2019-08-20",
            "enddate": "2019-08-20",
            "color": "#53c3db"
            }
            ]
            }
             
            $(window).load( function() {
            $('#mycalendar').monthly(
            {mode: 'event',
            dataType: 'json',
            events: Events,
            eventList:true}
            );
            })
        },
        computed: {
        // 計算した結果を変数として利用したいときはここに記述する
        },
        created: function() {
        // Vue.jsの読み込みが完了したときに実行する処理はここに記述する
        $(window).load( function() {
            $('#mycalendar').monthly(
            {mode: 'event',
            dataType: 'json',
            events: vm.Events,
            eventList:true}
            );
            })
        },
        methods: {
        // Vue.jsで使う関数はここで記述する
        },
    });
    
*/
