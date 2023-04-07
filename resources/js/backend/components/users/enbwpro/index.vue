<template>
    <div>



        <header class="bg-danger py-2 rounded-bottom-4 text-white">
    <div class="align-items-center d-flex justify-content-between mx-2 pt-2 text-white">
        <p class="fs-3">Hello</p>
        <p class="app-download"><i class="fa-solid fa-download p-2"></i>App download</p>
    </div>
    <div class="">
        <div class="row">
            <div class="col-md-12">
                <div class="align-items-center breaking-news d-flex justify-content-between mx-2 ps-3 rounded bg-trasparent">
                    <div class="d-flex flex-row flex-grow-1 flex-fill justify-content-center py-2 text-white px-1 news"><span style="margin-left: -10px;" class="d-flex align-items-center">&nbsp;<i class="fa-solid fa-volume-high"></i></span></div>
                    <marquee class="news-scroll" behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();"> {{ settings.notice }}</marquee>
                </div>
            </div>
        </div>
    </div>

<div class="d-flex d-sm-flex justify-content-between lh-1 mt-4 mx-2">
<div>
    <p class="balance-number">{{ parseFloat(row.user.balance).toFixed(2) }}</p>
    <p class="balance">Balance</p>

</div>
<div>
    <p class="balance-number">0.00</p>
    <p class="balance">UBS Balance</p>

</div>
<div>
    <p class="balance-number">0.00</p>
    <p class="balance">Accumulated earnings</p>

</div>

</div>

  </header>
  <main>
    <section class="d-flex justify-content-between mx-4 py-4 text-center section-div">
        <router-link :to="{name:'Recharge'}" class="text-dark">
            <i class="fa-solid fa-rotate-right"></i>
            <p>Recharge</p>
        </router-link>
        <router-link :to="{name:'withdraw'}" class="text-dark" >
            <i class="fa-solid fa-arrow-down"></i>
            <p>Withdrawals</p>
        </router-link>
        <router-link :to="{name:'Earning'}" class="text-dark">
            <i class="fa-regular fa-circle-check"></i>
            <p>Generator income</p>
        </router-link>

        <router-link :to="{name:'noreward'}" class="text-dark">
            <i class="fa-solid fa-circle-exclamation"></i>
            <p>Info</p>
        </router-link>
    </section>
    <section class="invite-section mx-2 mb-5">
        <h1 class="fw-bold invite-h1 text-white">Invite friends to earn rewards</h1>
        <router-link :to="{name:'share'}" class="invite text-decoration-none" href="">Invite</router-link>
    </section>


  </main>


    <Preload :Isactive="isActive"/>
    <Message :Isactive="Messageactive" :Message="Message"/>





    </div>
</template>

<script>
export default {
    data(){
        return {
            isActive:false,
            PackPurchase:false,
            Messageactive:false,
            Message:'',

            datas:{},
            PopupTitle:'Are you sure to purchase this product?',
        }
    },
    methods: {


        async dailyCheckIn(){
            this.isActive =true;
            var userid = localStorage.getItem('userid');
            var res = await this.callApi('post',`/api/daily/check/in?user_id=${userid}`,[]);
            this.isActive =false;
            if(res.data==1){
                this.notifiyGlobal('Daily checked in completed')
            }else{
                this.notifiyGlobal('Come Back Tomorrow')
            }

        },






    },
    mounted() {




    },
}
</script>

<style>
.homeicons i {
    font-size: 35px;
}

.d-flex.marquee {
    border: 2px solid var(--defaltColor);
    margin: 18px 21px;
}

.d-flex.marquee span {
    background: var(--defaltColor);
    padding: 5px 14px;
    color: white;
    font-weight: 700;
}

.d-flex.marquee marquee {
    padding: 5px 14px;
    background: #d14d0ec7;
    color: white;
}
</style>
