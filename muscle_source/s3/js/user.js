var vm = new Vue({
    el: "#app", // Vue.jsを使うタグのIDを指定
    data: {
    // Vue.jsで使う変数はここに記述する
        users: [],
        article:{
            userId:null,
            text:null,
            category:null,
            timestamp:null
            
        },
        query:{
            nickname:null,
            start:null,
            end:null,
        }
    },
    computed: {
    // 計算した結果を変数として利用したいときはここに記述する
    filteredUsers:function(){
        let result = this.users;
        if(this.query.nickname){
            result = result.filter(function (target){
                if(target.nickname){
                    return target.nickname.match(vm.query.nickname);
                }
            });
        }
        if(this.query.start){
            result = result.filter(function (target){
                if(target.age){
                    return target.age >= vm.query.start;
                }
            });
        }if(this.query.end){
            result = result.filter(function (target){
                if(target.age){
                    return target.age <= vm.query.end;
                }
            });
        }
        return result;
    }
    },
    created: function() {
    // Vue.jsの読み込みが完了したときに実行する処理はここに記述する
    /*if(localStorage.getItem("token") !== "mti2019"){
        location.href = "./login.html";
    }*/
        fetch(url + "/users",{
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
        vm.users = json.users


        })
        .catch(function(err) {
        // レスポンスがエラーで返ってきたときの処理はここに記述する
        });
    },

    methods: {
    // Vue.jsで使う関数はここで記述する
    submit:function(){
        
            // APIにPOSTリクエストを送る
          fetch(url + "/user/signup", {
            method: "POST",
            body: JSON.stringify({
              "userId": vm.user.userId,
              "password": vm.user.password,
              "nickname": vm.user.nickname,
              "age": Number(vm.user.age)
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
            let content = JSON.stringify(json, null, 2);
        })
        .catch(function(err) {
    // レスポンスがエラーで返ってきたときの処理はここに記述する
            vm.err = "エラーが発生しました";
        });

        }
    
    },
});

