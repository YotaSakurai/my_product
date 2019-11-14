var vm = new Vue({
    el: "#app", // Vue.jsを使うタグのIDを指定
    data: {
    // Vue.jsで使う変数はここに記述する
        food:{
            menuName :null,
            when: null
        },
        training:{
            menuName:null,
            set_number:null,
        },
        weight:{
            weight:null
        },
        mode_menu:[],
        mode_menu_set:[],
        mode_place:null,
        mode_purpose:null,
        user:{
            address:null,
            password:null,
            age:null,
            g_weight:null,
            weight:null,
            diff:null
        },
        Item:{
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
    /*if(localStorage.getItem("token") !== "mti2019"){
        location.href = "./login.html";
    }*/
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
            
                vm.user.address = json.Item.address;
                vm.user.password = json.Item.password;
                vm.user.name = json.Item.name;
                vm.user.age = json.Item.age;
                vm.user.gender = json.Item.gender;
                vm.user.weight = json.Item.weight;
                vm.user.g_weight = json.Item.g_weight;
                vm.user.height = json.Item.height;
                vm.user.diff = vm.user.weight - vm.user.g_weight;
                
            
            
            })
            .catch(function (err) {
                // レスポンスがエラーで返ってきたときの処理はここに記述する
            });

        var number = localStorage.getItem("get_number");
        var place = localStorage.getItem("get_place");

        if(place === "自宅"){
            this.mode_place = "自宅";
        }else if(place == "ジム"){
            this.mode_place = "ジム";

        }else{
            this.mode_place = '未設定';
        }
    
        if(number == 1){
            this.mode_purpose = "ダイエット";

        }else if(number == 2){
            this.mode_purpose = "健康維持";

        }else if(number == 3){
            this.mode_purpose = "マッチョ";

        }else{
            this.mode_purpose = "未設定";
        }

    fetch(url + "/selectmenu" +
    "?number=" +localStorage.getItem("get_number")+ "&place=" +localStorage.getItem("get_place"), {
    method: "GET"
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
    vm.mode_menu.push(json.Item.menu1,json.Item.menu2,json.Item.menu3,json.Item.menu4,json.Item.menu5,json.Item.menu6,json.Item.menu7);
    vm.mode_menu_set.push(json.Item.menu1_set,json.Item.menu2_set,json.Item.menu3_set,json.Item.menu4_set,json.Item.menu5_set,json.Item.menu6_set,json.Item.menu7_set);


    
    })
    .catch(function(err) {
    // レスポンスがエラーで返ってきたときの処理はここに記述する
    });
    },


    methods: {
    // Vue.jsで使う関数はここで記述する
    submit_food:function(){
    fetch(url +"/food", {
        method: "POST",
        body: JSON.stringify({
            "address": localStorage.getItem("address"),
            "menuName":vm.food.menuName,
            "when":vm.food.when
        })
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
        location.href = "./index.html"
    })
    .catch(function(err) {
// レスポンスがエラーで返ってきたときの処理はここに記述する
        vm.err = "エラーが発生しました";



    });
    },

    get_training_menu:function(training_num){
        //vm.training.menuName = mode_menu[0]
        vm.training.menuName = vm.mode_menu[training_num];
        vm.training.set_number = vm.mode_menu_set[training_num];
          
    },

    submit_training:function(){
        fetch(url +"/finishmenu", {
            method: "POST",
            body: JSON.stringify({
                "address": localStorage.getItem("address"),
                "menuName":vm.training.menuName,
                "number":vm.training.set_number
            })
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
            location.href = "./index.html"
        })
        .catch(function(err) {
    // レスポンスがエラーで返ってきたときの処理はここに記述する
            vm.err = "エラーが発生しました";
    
    
    
        });
        },

        submit_weight:function(){
            fetch(url +"/weight", {
                method: "POST",
                body: JSON.stringify({
                    "userId": localStorage.getItem("address"),
                    "weight":vm.weight.weight
                })
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
                location.href = "./index.html"
            })
            .catch(function(err) {
        // レスポンスがエラーで返ってきたときの処理はここに記述する
                vm.err = "エラーが発生しました";        
        
            });
            }

    }
});


