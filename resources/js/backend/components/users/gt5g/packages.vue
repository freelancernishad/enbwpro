<template>
    <div>



    <main>
        <header class="header-text mb-5 defaltColorBg" style="margin-bottom: -16px;">
        <p class="py-2 text-white"> Packages </p>
    </header>


        <section class="">
            <div class="row">
                <div class="col-6 col-md-6" v-for="packag in packages" :key="packag.id">
                    <div class="mt-3 p-2 shadow-lg text-center bg-white">
                    <p class="fw-bold  title-des">{{ packag.name }}</p>
                    <img :src="packag.image" class="img-fluid w-100">

                    <div class="d-flex justify-content-between  p-1">
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">Invest Price</p>
                        <p style=" margin: 0;font-weight: 500;color: #666666;">{{ packag.packagePrice }}</p>
                    </div>
                    <div class="d-flex justify-content-between p-1">
                        <p style=" margin: 0;font-weight: 500;color: #666666;">Day Income:</p>
                        <p style=" margin: 0;font-weight: 500;color: var(--defaltColor);">{{ packag.packageEarn }}</p>
                    </div>
                    <div class="d-flex justify-content-between  p-1">
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">validity period</p>
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">{{ packag.packageDuration }}</p>
                    </div>
                    <button class="btn fw-bold rounded-0 text-white w-100 defaltColorBg" style="background-color: #0036ca;" @click="upgrade(packag)">Upgrade Now</button>
                    </div>
                </div>
            </div>
        </section>
    </main>




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
