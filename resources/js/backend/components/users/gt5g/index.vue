<template>
    <div>



    <main>
        <header>
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img :src="$asseturl+'img/sl1.jpeg'" class="d-block w-100" alt="Slide 1">
                    </div>
                    <div class="carousel-item">
                        <img :src="$asseturl+'img/sl2.jpeg'" class="d-block w-100" alt="Slide 2">
                    </div>
                    <div class="carousel-item">
                        <img :src="$asseturl+'img/sl3.jpeg'" class="d-block w-100" alt="Slide 2">
                    </div>
                </div>
                <button class="carousel-control-prev " type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon bg-dark" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon bg-dark" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>


        </header>


        <div class="d-flex marquee">
            <marquee>{{ settings.notice }}</marquee>
            <span>Notice</span>
        </div>



        <section class="d-flex gap-2 justify-content-between mb-2 mt-3">

            <router-link :to="{name:'Recharge'}" class="bg-white fw-bold py-3 shadow-lg text-center w-25 defaltColor homeicons">

                <i class="fa-solid fa-bolt"></i>
                <!-- <img :src="$asseturl+'img/5.1f17c1e9.png'" alt="" style="width: 36px; height: 36px;"> -->
                <p class="mb-0">Recharge</p>
            </router-link>

            <router-link :to="{name:'withdraw'}" class="bg-white fw-bold py-3 shadow-lg text-center w-25 defaltColor homeicons">
                <!-- <img :src="$asseturl+'img/1.469498f5.png'" alt="" style="width: 36px; height: 36px;"> -->
                <i class="fa-solid fa-arrow-up-from-bracket"></i>
                <p class="mb-0">Withdraw</p>
            </router-link>
            <router-link :to="{name:'noreward'}" class="bg-white fw-bold py-3 shadow-lg text-center w-25 defaltColor homeicons">
                <!-- <img :src="$asseturl+'img/3.d052248f.png'" alt="" style="width: 36px; height: 36px;"> -->
                <i class="fa-solid fa-question"></i>
                <p class="mb-0">How do</p>
            </router-link>
            <span @click="dailyCheckIn" class="bg-white fw-bold py-3 shadow-lg text-center w-25 defaltColor homeicons">
                <!-- <img :src="$asseturl+'img/5.1f17c1e9.png'" alt="" style="width: 36px; height: 36px;"> -->
                <i class="fa-solid fa-check-to-slot"></i>
                <p class="mb-0">Check in</p>
            </span>
        </section>



        <div class="mt-5">
            <img width="100%" :src="$asseturl+'img/partner.jpeg'" alt="">
        </div>



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
