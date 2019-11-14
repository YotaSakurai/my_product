var vm = new Vue({
    el: "#app", // Vue.jsを使うタグのIDを指定
    data: {
    // Vue.jsで使う変数はここに記述する
        selectMenu:{
            number:null,
            place:null,
            menu4:null
        }
    },
    computed: {
    // 計算した結果を変数として利用したいときはここに記述する
    },
    created: function() {
    // Vue.jsの読み込みが完了したときに実行する処理はここに記述する
    },
    methods: {
    // Vue.jsで使う関数はここで記述する
        window:onload = function(){
            fetch(url + "/selectmenu" +
            "?number="+localStorage.getItem("number") +
            "&place="+localStorage.getItem("place"),{
                method:"GET",
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
                    vm.selectMenu.number = json.Item.number;
                    vm.selectMenu.place = json.Item.place;
                    vm.selectMenu.menu4 = json.Item.menu4;
                            
                })
                        
                .catch(function(err) {
                    // レスポンスがエラーで返ってきたときの処理はここに記述する
                });
        }
        
        
    },
});
