<template>
    <div>



        <header class="header-bg">


<div class="align-items-center d-flex pt-5 gap-3">
    <img :src="$asseturl+'img/logo.jpg'" alt="" style="width: 60px; height: 60px; border-radius: 50px;">
    <div>
        <p class="mb-0" style="font-size: 19px;
        font-family: ui-rounded;">ID: {{ row.user.username }}</p>
        <p class="description mb-0">Account: {{ row.user.mobile }}</p>
    </div>
</div>

<div class="mx-2 mb-5 mt-3 d-flex accountDW">
    <router-link :to="{name:'Recharge'}" class="text-dark mt-3"><p>Recharge</p></router-link>
    <router-link :to="{name:'withdraw'}" class="text-dark mt-3"><p>Withdraw</p></router-link>
</div>

<!-- <div class="invite-section mx-2 mb-5 mt-3"> -->
    <!-- <h1 class="fw-bold invite-h1 text-danger">Gift Redemption</h1>
    <a class="invite text-decoration-none" href="">exchange</a> -->
<!-- </div> -->

</header>
<main class="bg-white">
<!--  -->
<section class="px-4 d-flex justify-content-between mx-4 py-4 text-center section-div" style="flex-wrap: wrap;">
    <router-link :to="{name:'pullmoney'}" class="text-dark mt-3 accountMenu">
        <i class="fa-solid fa-building-columns" style="    font-size: 25px;"></i>
        <p>My Bank</p>
    </router-link>
    <!-- <router-link :to="{name:'Recharge'}" class="text-dark mt-3 accountMenu">
        <i class="fa-solid fa-bolt" style="    font-size: 25px;"></i>
        <p>My Equipment</p>
    </router-link> -->
    <router-link :to="{name:'team'}" class="text-dark mt-3 accountMenu">
        <i class="fa-solid fa-people-group" style="    font-size: 25px;"></i>
        <p>My Team</p>
    </router-link>

    <router-link :to="{name:'records'}" class="text-dark mt-3 accountMenu">
        <i class="fa-solid fa-table-list" style="    font-size: 25px;"></i>
        <p>Records</p>
    </router-link>
    <router-link :to="{name:'password'}" class="text-dark mt-3 accountMenu">
        <i class="fa-solid fa-lock" style="    font-size: 25px;"></i>
        <p>Change password</p>
    </router-link>
    <!-- <router-link :to="{name:'Recharge'}" class="text-dark mt-3 accountMenu">
        <i class="fa-solid fa-bolt" style="    font-size: 25px;"></i>
        <p>Withdrawal Password</p>
    </router-link> -->
</section>
<!-- <section class="description fs-5 mx-4"><p>Account Management</p></section> -->


<router-link :to="{name:'logout'}" class="d-block text-center logoutBtn">Logout</router-link>

</main>




    </div>
</template>




<script>


export default {

    data(){
        return {
            levelTeam: {
                level1: {},
                level2: {},
                level3: {},
            },
        }
    },
    methods: {
        async getData(){
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/user/multi/refer?id=${id}`, []);
            this.levelTeam = res.data;
        },
    },
    mounted() {
        this.getData();
    },
}
</script>

<style scoped>
.accountMenu{
    width: 48%;
    border: 1px solid var(--defaltColor);
    padding: 13px 0px;
}
section.px-4.d-flex.justify-content-between.mx-4.py-4.text-center.section-div {
    box-shadow: 0px 0px 2px black;
    background: #93939326;
    margin: 25px 4px;
}
.logoutBtn {
    color: #fff6f6;
    margin: 11px 0px;
    padding: 11px 0;
    background: #eb5462;
}
.accountDW a {
    width: 50%;
    text-align: center;
    background: orange;
    padding: 7px 5px;
    border-right: 1px solid white;
    color: white !important;
}
</style>
