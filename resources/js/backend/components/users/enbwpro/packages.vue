<template>
    <div>




<header class="header">
    <p class="header-text">Equipment</p>
</header>
<section>


    <div class="bg-white mb-2 mx-2 p-2 rounded-1" style="line-height: 35px;" v-for="packag in packages" :key="packag.id">
        <div class=" d-flex gap-1 justify-content-between ">
          <div class=" d-flex gap-1">
              <p>{{ packag.name }}</p>
          </div>
          <p>Time : {{ packag.packageDuration }}Days</p>
        </div>
        <div class="d-flex justify-content-between align-items-center">
          <div class="lh-1">
              <p style="color: #ed2828;">≈{{ packag.packageEarn }}BDT</p>
              <p class="income-price mt-3">Daily income</p>
          </div>
          <div>
              <p style="color: #216cf7;">≈{{ packag.packagePrice }}BDT</p>
              <p class="income-price">Rental Price</p>
          </div>
          <a class="rent" href="javascript:void(0)" @click="upgrade(packag)">rent</a>
      </div>
      <p class="description">Note: Equipment purchases are valid for {{ packag.packageDuration }} days and will generate ≈ {{ packag.packageEarn }}BDT per day for you. You can withdraw cash to your account at any time. This machine will earn a total of {{ packag.packageEarn*packag.packageDuration }}BDT in {{ packag.packageDuration }} days</p>
    </div>


</section>





    <Popups :PackPurchase="PackPurchase" :Title="PopupTitle" @event-close="ClosePopup" @event-submit="purchaseComplete"/>
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
            packages:{},
            datas:{},
            PopupTitle:'Are you sure to purchase this product?',
        }
    },
    methods: {
        async getPackages(){
            this.isActive =true;
            var res = await this.callApi('get',`/api/get/packages`,[]);
            this.packages = res.data
            this.isActive =false;
        },
        ClosePopup(){
            this.PackPurchase = false;
        },
        async upgrade(packag){

            this.PackPurchase = true;
            this.PopupTitle = 'Are you sure to purchase this product?';
            this.datas = {"packag":packag};
        },

        async purchaseComplete(){
            this.PackPurchase = false;
            this.isActive =true;
            var packag = this.datas.packag;
            var userid = localStorage.getItem('userid');
                var res = await this.callApi('post',`/api/package/upgrade/${userid}`,packag)

                if(res.data==1){
                    this.notifiyGlobal('Purchase Success')
                }else if(res.data==44){
                    this.notifiyGlobal('You dont have enough balance')
                }

                this.isActive =false;
        },
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
        this.getPackages();



    },
}
</script>

<style>
.homeicons i {
    font-size: 35px;
}

</style>
