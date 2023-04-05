<template>
    <div id="wrapper" class="wrapper bg-ash"
        :class="{ 'sidebar-collapsed': sidebarstatus, 'sidebar-collapsed-mobile': mobileSidebar }">
        <!-- Header Menu Area Start Here -->
        <div class="navbar navbar-expand-md header-menu-one bg-light" id='topnavbar'>
            <div class="nav-bar-header-one">
                <div class="header-logo">
                    <router-link :to="{name:'Dashboard'}">
                        <img width="80%" src="http://esoft4u.tmscedu.com/asset/img/Logo123.png" alt="logo">
                    </router-link>
                </div>
                <div class="toggle-button sidebar-toggle">
                    <button type="button" class="item-link" @click="sidebarstatus = !sidebarstatus">
                        <span class="btn-icon-wrap">
                            <span></span>
                            <span></span>
                            <span></span>
                        </span>
                    </button>
                </div>
            </div>
            <div class="d-md-none mobile-nav-bar">
                <button class="navbar-toggler pulse-animation" type="button" data-toggle="collapse"
                    data-target="#mobile-navbar" aria-expanded="false">
                    <i class="far fa-arrow-alt-circle-down"></i>
                </button>
                <button type="button" class="navbar-toggler sidebar-toggle-mobile"
                    @click="mobileSidebar = !mobileSidebar">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
            <div class="header-main-menu collapse navbar-collapse" id="mobile-navbar">
                <ul class="navbar-nav">
                    <li class="navbar-item header-search-bar">
                        <div class="input-group stylish-input-group">
                            <span class="input-group-addon">
                                <button type="submit">
                                    <!-- <span class="flaticon-search" aria-hidden="true"></span> -->
                                </button>
                            </span>
                            <!-- <input type="text" class="form-control" placeholder="Find Something . . ."> -->
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="navbar-item dropdown header-admin">
                        <a class="navbar-nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                            aria-expanded="false">
                            <div class="admin-title">
                                <h5 class="item-title">{{ user.name }}</h5>
                                <!-- <span>{{ permission.roleName }}</span> -->
                            </div>
                            <div class="admin-img">
                                <img :src="$asseturl + 'dashboard_asset/img/figure/admin.jpg'" alt="Admin">
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="item-header">
                                <h6 class="item-title">{{ $localStorage.getItem('user') }}</h6>
                            </div>
                            <div class="item-content">
                                <ul class="settings-list">
                                    <li>
                                        <router-link class="dropdown-item" :to="{name:'logout'}">
                                            <i class="flaticon-turn-off"></i> Logout
                                        </router-link>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Header Menu Area End Here -->
        <!-- Page Area Start Here -->
        <div class="dashboard-page-one">
            <!-- Sidebar Area Start Here -->
            <div class="sidebar-main sidebar-menu-one sidebar-expand-md sidebar-color">
                <div class="mobile-sidebar-header d-md-none">
                    <div class="header-logo">
                        <a href="/" style="    padding: 10px !important;"><img width="80%" src="http://esoft4u.tmscedu.com/asset/img/Logo123.png" alt="logo"></a>
                    </div>
                </div>
                <div class="sidebar-menu-content" id="dashboardheight">
                    <ul class="nav nav-sidebar-menu sidebar-toggle-view navBar">





                        <li  class="nav-item" @click="submenu(0)" >
                            <router-link :to="{name:'Dashboard'}" class="nav-link"><i
                                    class="flaticon-dashboard"></i><span>Dashboard</span></router-link>
                        </li>
<!--
                        <li class="nav-item sidebar-nav-item" :class="{ active: selected == 101 }">
                            <a href="javascript:void(0)" class="nav-link" @click="submenu(101)"><i
                                    class="flaticon-technological"></i><span>Videos</span>
                            </a>
                            <transition name="slide">
                                <ul class="nav sub-group-menu menu-open child" v-if="selected == 101"
                                    style="display:block">

                                    <li class="nav-item">
                                        <router-link :to="{ name: 'category' }" class="nav-link"><i
                                                class="fas fa-angle-right"></i> Category </router-link>
                                    </li>

                                    <li class="nav-item">
                                        <router-link :to="{ name: 'blogs' }" class="nav-link"><i
                                                class="fas fa-angle-right"></i> Videos </router-link>
                                    </li>


                                </ul>
                            </transition>
                        </li> -->


                        <li  class="nav-item" @click="submenu(0)" >
                            <router-link :to="{name:'sendsms'}" class="nav-link"><i
                                    class="flaticon-dashboard"></i><span>Sms Notice</span></router-link>
                        </li>


                        <li  class="nav-item" @click="submenu(0)" >
                            <router-link :to="{name:'packages'}" class="nav-link"><i
                                    class="flaticon-dashboard"></i><span>Packages</span></router-link>
                        </li>


                        <!-- <li  class="nav-item" @click="submenu(0)" >
                            <router-link :to="{name:'MembersPlans'}" class="nav-link"><i
                                    class="flaticon-dashboard"></i><span>Membership Plans</span></router-link>
                        </li> -->



                        <li  class="nav-item" @click="submenu(0)" >
                            <router-link :to="{name:'Refercomition'}" class="nav-link"><i
                                    class="flaticon-dashboard"></i><span>Referral Commission</span></router-link>
                        </li>




                        <li class="nav-item sidebar-nav-item" :class="{ active: selected == 1 }">
                            <a href="javascript:void(0)" class="nav-link" @click="submenu(1)" ref="Acconunt"><i
                                    class="flaticon-technological"></i><span>Manage Users</span></a>
                            <transition name="slide">
                                <ul class="nav sub-group-menu menu-open child" v-if="selected == 1"
                                    style="display:block">
                                    <li class="nav-item"><router-link :to="{name:'Userslist', params:{status:'all'}}" class="nav-link"><i class="fas fa-angle-right"></i> All Users</router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'Userslist', params:{status:'active'}}" class="nav-link"><i class="fas fa-angle-right"></i> Active Users</router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'Userslist', params:{status:'banned'}}" class="nav-link"><i class="fas fa-angle-right"></i> Banned Users</router-link></li>
                                </ul>
                            </transition>
                        </li>


                        <li class="nav-item sidebar-nav-item" :class="{ active: selected == 2 }">
                            <a href="javascript:void(0)" class="nav-link" @click="submenu(2)" ref="Acconunt"><i
                                    class="flaticon-technological"></i><span>Withdrawals</span><label v-if="side.todayPendingWithdrawalCount > 0"
                                    style="background: rgb(223 12 12);
                                        padding: 0px 7px;
                                        color: wheat;
                                        font-size: 12px;
                                        border-radius: 5px;">{{ side.todayPendingWithdrawalCount }}</label></a>
                            <transition name="slide">
                                <ul class="nav sub-group-menu menu-open child" v-if="selected == 2"
                                    style="display:block">
                                    <li class="nav-item"><router-link :to="{name:'withdrawlMethods'}" class="nav-link"><i class="fas fa-angle-right"></i> Withdraw Methods</router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'withdrawls', params:{status:'pending'}}" class="nav-link"><i class="fas fa-angle-right"></i> Pending <label v-if="side.todayPendingWithdrawalCount > 0"
                                    style="background: rgb(223 12 12);
                                        padding: 0px 7px;
                                        color: wheat;
                                        font-size: 12px;
                                        border-radius: 5px;">{{ side.todayPendingWithdrawalCount }}</label></router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'withdrawls', params:{status:'approved'}}" class="nav-link"><i class="fas fa-angle-right"></i> Approved</router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'withdrawls', params:{status:'reject'}}" class="nav-link"><i class="fas fa-angle-right"></i> Reject</router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'withdrawls', params:{status:'all'}}" class="nav-link"><i class="fas fa-angle-right"></i> All</router-link></li>
                                </ul>
                            </transition>
                        </li>


                        <li class="nav-item sidebar-nav-item" :class="{ active: selected == 3 }">
                            <a href="javascript:void(0)" class="nav-link" @click="submenu(3)" ref="Acconunt"><i
                                    class="flaticon-technological"></i><span>Diposit System</span> <label v-if="side.todayPendingDepositCount > 0"
                                    style="background: rgb(223 12 12);
                                        padding: 0px 7px;
                                        color: wheat;
                                        font-size: 12px;
                                        border-radius: 5px;">{{ side.todayPendingDepositCount }}</label></a>
                            <transition name="slide">
                                <ul class="nav sub-group-menu menu-open child" v-if="selected == 3"
                                    style="display:block">
                                    <li class="nav-item"><router-link :to="{name:'Diposit', params:{status:'pending'}}" class="nav-link"><i class="fas fa-angle-right"></i> Pending <label v-if="side.todayPendingDepositCount > 0"
                                    style="background: rgb(223 12 12);
                                        padding: 0px 7px;
                                        color: wheat;
                                        font-size: 12px;
                                        border-radius: 5px;">{{ side.todayPendingDepositCount }}</label></router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'Diposit', params:{status:'approved'}}" class="nav-link"><i class="fas fa-angle-right"></i> Approved</router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'Diposit', params:{status:'reject'}}" class="nav-link"><i class="fas fa-angle-right"></i> Reject</router-link></li>
                                    <li class="nav-item"><router-link :to="{name:'Diposit', params:{status:'all'}}" class="nav-link"><i class="fas fa-angle-right"></i> All</router-link></li>
                                </ul>
                            </transition>
                        </li>




                        <li class="nav-item" :class="{ active: selected == 0 }">
                            <router-link :to="{name:'Settings'}" class="nav-link" @click="submenu(0)" ref="Acconunt"><i
                                    class="flaticon-technological"></i><span>Settings</span></router-link>

                        </li>




                    </ul>
                </div>
            </div>
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <slot></slot>
                <!-- Footer Area Start Here -->
                <footer class="footer-wrap-layout1">

                </footer>
                <!-- Footer Area End Here -->
            </div>
        </div>
        <!-- Page Area End Here -->
    </div>
</template>
<script>
export default {
     props: ['users','roles'],
    created() {


        this.createlink('dashboard_asset/css/normalize.css');
        this.createlink('dashboard_asset/css/main.css');
        this.createlink('dashboard_asset/css/bootstrap.min.css');
        this.createlink('dashboard_asset/css/all.min.css');
        this.createlink('dashboard_asset/fonts/flaticon.css');
        this.createlink('dashboard_asset/style.css?ver=1.0.1');

        this.createscript('dashboard_asset/js/popper.min.js');
        this.createscript('dashboard_asset/js/bootstrap.min.js');


		if (!User.loggedIn()) {
			window.location.href = '/'
		}



       this.$store.commit('setUpdateUser', this.users)
    //    this.$store.commit('setUserPermission', JSON.parse(this.permission.permission))
       this.$store.commit('setUserRoles', this.roles)



//  this.$store.dispatch("getUser",this.user);


        if (localStorage.getItem('selectedMenu')) {
            this.selected = localStorage.getItem('selectedMenu')
        }
        window.addEventListener("resize", this.myEventHandler);
        window.addEventListener("scroll", this.myscroll);

    },
    destroyed() {
        window.removeEventListener("resize", this.myEventHandler);
        window.removeEventListener("scroll", this.myscroll);
    },
    data() {
        return {
            selected: 0,
            sidebarstatus: false,
            mobileSidebar: false,
            side:{},
        }
    },
    methods: {


        async getdatagetdata(){
            var res = await this.callApi('get',`/api/backend/dashboard`,[]);
            this.side = res.data;
        },



        createlink(url=''){
            let recaptchaScript = document.createElement('link')
            recaptchaScript.setAttribute('href', this.$asseturl+url)
            recaptchaScript.setAttribute('rel', 'stylesheet')
            document.head.appendChild(recaptchaScript)
        },
        createscript(url=''){
            let recaptchaScript = document.createElement('script')
            recaptchaScript.setAttribute('src', this.$asseturl+url)
            document.body.appendChild(recaptchaScript)
        },







        myscroll(){



// Get the header
var header = document.getElementById("topnavbar");

var sticky = header.offsetTop;


  if (window.pageYOffset > sticky) {
    header.classList.add("fixednav");
  } else {
    header.classList.remove("fixednav");
  }



        },

        myEventHandler() {
            if (window.innerWidth > 768) {
                this.sidebarstatus = false
            } else {
                this.mobileSidebar = false
            }


            // var index = 1
            // if(localStorage.getItem('role')=='admin' || localStorage.getItem('role')=='teacher'){
            //     index= 0
            // }
                var clientHeight = document.getElementsByClassName('navBar')[0].clientHeight;

            var menuheight = 0
            if(clientHeight<window.innerHeight){
                menuheight= window.innerHeight
            }else{
                menuheight= '100%'
            }
            document.getElementById('wrapper').style.height = menuheight +'px';
            document.getElementById('dashboardheight').style.height = menuheight +'px';










        },
        submenu(ref) {

            if (this.selected > 0) {
                if (ref == this.selected) {
                    this.selected = 0
                    localStorage.setItem('selectedMenu', 0)
                } else {
                    this.selected = ref
                    localStorage.setItem('selectedMenu', ref)
                }
            } else {
                this.selected = ref
                localStorage.setItem('selectedMenu', ref)
            }
        }
    },
    mounted() {
        this.myEventHandler();
        this.getdatagetdata();


    }
}
</script>
<style>
ul.nav.sub-group-menu.menu-open.child {
    padding: 0 !important;
}
ul.nav.sub-group-menu.menu-open.child li {
    padding: 10px 0;
}
.slide-enter-active {
    -moz-transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s;
    -o-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -moz-transition-timing-function: ease-in;
    -webkit-transition-timing-function: ease-in;
    -o-transition-timing-function: ease-in;
    transition-timing-function: ease-in;
}
.slide-leave-active {
    -moz-transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s;
    -o-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -moz-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    -webkit-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    -o-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
    transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
}
.slide-enter-to,
.slide-leave {
    max-height: 100px;
    overflow: hidden;
}
.slide-enter,
.slide-leave-to {
    overflow: hidden;
    max-height: 0;
}
</style>
