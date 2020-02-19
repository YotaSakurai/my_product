var vm = new Vue({
    el: "#app", // Vue.jsを使うタグのIDを指定
    data: {
    // Vue.jsで使う変数はここに記述する
        posts: [],
        post:{
            userId:null,
            text:null,
            category:null,
            timestamp:null
            
        },
        query:{
            userId:null,
            category:null,
            start:null,
            end:null,
        }
    },
    computed: {
    // 計算した結果を変数として利用したいときはここに記述する
    filteredUsers: function() {
        var result = this.posts;
        if (this.query.userId) {
          result = result.filter(function (target) {
              if (target.userId) {
                return target.userId.match(vm.query.userId);
              }
          });
        }
        if(this.query.category){
            result = result.filter(function (target){
                if(target.category){
                    return target.category.match(vm.query.category);
                }
            });
        }
        if (this.query.start) {
          result = result.filter(function (target) {
            return target.timestamp >= vm.query.start;
          });
        }
        if (this.query.end) {
          result = result.filter(function (target) {
            return target.timestamp <= vm.query.end;
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
        fetch(url + "/post/posts",{
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
        vm.posts = json.posts


        })
        .catch(function(err) {
        // レスポンスがエラーで返ってきたときの処理はここに記述する
        });
    },

    methods: {
    // Vue.jsで使う関数はここで記述する
    /*submit:function(){
        
            // APIにPOSTリクエストを送る
          fetch(url + "/user/signup", {
            method: "POST",
            body: JSON.stringify({
              "userId": null,
              "text":vm.article.text,
              "category":vm.article.category,
              "timestamp":null,
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
            console.log(content);
        })
        .catch(function(err) {
    // レスポンスがエラーで返ってきたときの処理はここに記述する
            vm.err = "エラーが発生しました";
            console.log(vm.err);
        });

        },*/
/*
        deleteUser:function(){
            fetch(url + "/user",{
                method:"DELETE",
                headers:new Headers({
                    "Authorization":localStorage.getItem('token')
                }),
                body: JSON.stringify({
                    "userId":localStorage.getItem('userId')
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
                location.href = "./login.html";
            })
            .catch(function(err) {
        // レスポンスがエラーで返ってきたときの処理はここに記述する
                vm.err = "エラーが発生しました";
                console.log(vm.err);
            });
    
        }
        */
    
    },
});

