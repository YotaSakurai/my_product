Vue.component('common-menu', {
    props:{
        current:null,


    },
    data:function(){
        return{
            menu_toggle:false,
        }
    },  
    
    template: `
    <div class="ui secondary pointing green inverted massive menu">
        <span class="item menu_toggle_button" v-on:click='topMenu_toggleMode'>メニュー</span>
      <a class="item menu_toggleTab " href="./index.html" v-bind:class="{active: current=='home',invisible: menu_toggle}">ホーム</a>
      <a class="item menu_toggleTab " href="./mode_choice.html" v-bind:class="{active: current=='mode_choice',invisible: menu_toggle}">モード選択</a>
      <a class="item menu_toggleTab " href="./record.html" v-bind:class="{active: current=='record',invisible: menu_toggle}">記録</a>
      <a class="item menu_toggleTab " href="./food.html" v-bind:class="{active: current=='food',invisible: menu_toggle}">食事</a>
      <div class="right menu"><button class="item" v-on:click="logout" v-bind:class="{invisible: menu_toggle}">Logout</button></div>
    </div>
    `,
    methods: {
        logout: function () {
            localStorage.removeItem('token');
            localStorage.removeItem('userId');
            location.href = "./login.html";
        },
        topMenu_toggleMode:function(){
            
            if(!this.menu_toggle){
                this.menu_toggle = true
                console.log(this.menu_toggle)
            }else{
                this.menu_toggle = false
                console.log(this.menu_toggle)
            }
            
        }
    }
}
);