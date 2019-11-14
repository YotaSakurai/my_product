var vm = new Vue({
    el: "#app", // Vue.jsを使うタグのIDを指定
    data: {
    // Vue.jsで使う変数はここに記述する
        mode_choice:"where",
        mode_number:"number",
        mode_decide:"decide",
        place_gym:"ジム",
        place_home:"自宅",
        selectMenu:{
            number:null,
            place:null,
            menu1:null,
            menu1_count:null,
            menu1_set:null,
            menu2:null,
            menu2_count:null,
            menu2_set:null,
            menu3:null,
            menu3_count:null,
            menu3_set:null,
            menu4:null,
            menu4_count:null,
            menu4_set:null,
            menu5:null,
            menu5_count:null,
            menu5_set:null,
            menu6:null,
            menu6_count:null,
            menu6_set:null,
            menu7:null,
            menu7_count:null,
            menu7_set:null
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
        menuWhere:function(select){
            var selected = select;
            if(vm.mode_choice=="where"){
                //console.log(vm.mode_choice);
                var place = selected;
                localStorage.setItem("place",place);
                vm.mode_choice = "purpose";
            }else if(vm.mode_choice=="purpose"){
                //console.log(vm.mode_choice);
                
                var number = selected;
                localStorage.setItem("number",number);
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
                        vm.selectMenu.menu1 = json.Item.menu1;
                        vm.selectMenu.menu1_count = json.Item.menu1_count;
                        vm.selectMenu.menu1_set = json.Item.menu1_set;
                        vm.selectMenu.menu2 = json.Item.menu2;
                        vm.selectMenu.menu2_count = json.Item.menu2_count;
                        vm.selectMenu.menu2_set = json.Item.menu2_set;
                        vm.selectMenu.menu3 = json.Item.menu3;
                        vm.selectMenu.menu3_count = json.Item.menu3_count;
                        vm.selectMenu.menu3_set = json.Item.menu3_set;
                        vm.selectMenu.menu4 = json.Item.menu4;
                        vm.selectMenu.menu4_count = json.Item.menu4_count;
                        vm.selectMenu.menu4_set = json.Item.menu4_set;
                        vm.selectMenu.menu5 = json.Item.menu5;
                        vm.selectMenu.menu5_count = json.Item.menu5_count;
                        vm.selectMenu.menu5_set = json.Item.menu5_set;
                        vm.selectMenu.menu6 = json.Item.menu6;
                        vm.selectMenu.menu6_count = json.Item.menu6_count;
                        vm.selectMenu.menu6_set = json.Item.menu6_set;
                        vm.selectMenu.menu7 = json.Item.menu7;
                        vm.selectMenu.menu7_count = json.Item.menu7_count;
                        vm.selectMenu.menu7_set = json.Item.menu7_set;
                    })
                    .catch(function(err) {
                    // レスポンスがエラーで返ってきたときの処理はここに記述する
                    });
                //vm.mode_choice = "purpose";
            }
        },
        menuBack:function(){
            //var mode = select;
            vm.mode_choice = "where";
        },

        menuDecide:function(){
            localStorage.setItem("get_number",localStorage.getItem("number"));
            localStorage.setItem("get_place",localStorage.getItem("place"));

            fetch(url + "/selectmenu" +
                "?number="+localStorage.getItem("get_number") +
                "&place="+localStorage.getItem("get_place"),{
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
                    vm.selectMenu.menu1 = json.Item.menu1;
                    vm.selectMenu.menu1_count = json.Item.menu1_count;
                    vm.selectMenu.menu1_set = json.Item.menu1_set;
                    vm.selectMenu.menu2 = json.Item.menu2;
                    vm.selectMenu.menu2_count = json.Item.menu2_count;
                    vm.selectMenu.menu2_set = json.Item.menu2_set;
                    vm.selectMenu.menu3 = json.Item.menu3;
                    vm.selectMenu.menu3_count = json.Item.menu3_count;
                    vm.selectMenu.menu3_set = json.Item.menu3_set;
                    vm.selectMenu.menu4 = json.Item.menu4;
                    vm.selectMenu.menu4_count = json.Item.menu4_count;
                    vm.selectMenu.menu4_set = json.Item.menu4_set;
                    vm.selectMenu.menu5 = json.Item.menu5;
                    vm.selectMenu.menu5_count = json.Item.menu5_count;
                    vm.selectMenu.menu5_set = json.Item.menu5_set;
                    vm.selectMenu.menu6 = json.Item.menu6;
                    vm.selectMenu.menu6_count = json.Item.menu6_count;
                    vm.selectMenu.menu6_set = json.Item.menu6_set;
                    vm.selectMenu.menu7 = json.Item.menu7;
                    vm.selectMenu.menu7_count = json.Item.menu7_count;
                    vm.selectMenu.menu7_set = json.Item.menu7_set;
                    location.href = "./index.html";
                })
                .catch(function(err) {
                    // レスポンスがエラーで返ってきたときの処理はここに記述する
                });

        }
    },
});


