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
      <a class="item menu_toggleTab " href="../index2.html" v-bind:class="{active: current=='home',invisible: menu_toggle}">送金</a>
      <a class="item menu_toggleTab " href="../transactions.html" v-bind:class="{active: current=='mode_choice',invisible: menu_toggle}">Tx一覧</a>
      <a class="item menu_toggleTab " href="./user.html" v-bind:class="{active: current=='record',invisible: menu_toggle}">マイページ</a>
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