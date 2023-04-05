<template>
  <div>

    <main>
        <header>
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img :src="$asseturl+'img/slide-1.jpg'" class="d-block w-100" alt="Slide 1">
                    </div>
                    <div class="carousel-item">
                        <img :src="$asseturl+'img/slide-2.jpg'" class="d-block w-100" alt="Slide 2">
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

        <section class="d-flex gap-2 justify-content-between mb-2 mt-3">

            <router-link :to="{name:'Recharge'}" class="bg-white fw-bold py-3 shadow-lg text-center w-25">
                <img :src="$asseturl+'img/5.1f17c1e9.png'" alt="" style="width: 36px; height: 36px;">
                <p class="mb-0">Recharge</p>
            </router-link>

            <router-link :to="{name:'Withdraw'}" class="bg-white fw-bold py-3 shadow-lg text-center w-25">
                <img :src="$asseturl+'img/1.469498f5.png'" alt="" style="width: 36px; height: 36px;">
                <p class="mb-0">Withdraw</p>
            </router-link>
            <router-link :to="{name:'noreward'}" class="bg-white fw-bold py-3 shadow-lg text-center w-25">
                <img :src="$asseturl+'img/3.d052248f.png'" alt="" style="width: 36px; height: 36px;">
                <p class="mb-0">How do</p>
            </router-link>
            <router-link :to="{name:'Recharge'}" class="bg-white fw-bold py-3 shadow-lg text-center w-25">
                <img :src="$asseturl+'img/5.1f17c1e9.png'" alt="" style="width: 36px; height: 36px;">
                <p class="mb-0">Check in</p>
            </router-link>
        </section>


        <section class="">
            <div class="d-flex gap-2">
                <div class=" my-2 p-2 shadow-lg text-center bg-white">
                    <p class="fw-bold title-des">Micro base station - 5.2KW</p>
                    <img :src="$asseturl+'img/43c684a9fc3234a6b31a692f98e208c4.jpg'" class="img-fluid w-100">

                    <div class="d-flex justify-content-between  p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">Invest Price</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">Day Income:</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;color: #0036ca;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between  p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">validity period</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;">80</p>
                    </div>
                    <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: #0036ca;">Invest
                        Now</button>
                </div>
                <div class=" my-2 p-2 shadow-lg text-center bg-white">
                    <p class="fw-bold title-des">Small base station - 12KW</p>
                    <img :src="$asseturl+'img/43c684a9fc3234a6b31a692f98e208c4.jpg'" class="img-fluid w-100">

                    <div class="d-flex justify-content-between  p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">Invest Price</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">Day Income:</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;color: #0036ca;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between  p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">validity period</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;">80</p>
                    </div>
                    <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: #0036ca;">Invest
                        Now</button>
                </div>
            </div>
            <div class="d-flex gap-2">
                <div class=" my-2 p-2 shadow-lg text-center bg-white">
                    <p class="fw-bold title-des">Medium base station - 25KW</p>
                    <img :src="$asseturl+'img/43c684a9fc3234a6b31a692f98e208c4.jpg'" class="img-fluid w-100">

                    <div class="d-flex justify-content-between  p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">Invest Price</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">Day Income:</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;color: #0036ca;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between  p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">validity period</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;">80</p>
                    </div>
                    <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: #0036ca;">Invest
                        Now</button>
                </div>
                <div class=" my-2 p-2 shadow-lg text-center bg-white">
                    <p class="fw-bold  title-des">Large base station - 55KW</p>
                    <img :src="$asseturl+'img/43c684a9fc3234a6b31a692f98e208c4.jpg'" class="img-fluid w-100">

                    <div class="d-flex justify-content-between  p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">Invest Price</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">Day Income:</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;color: #0036ca;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between  p-1">
                        <p style="margin: 0;font-weight: 500;color: #666666;">validity period</p>
                        <p style="margin: 0;font-weight: 500;color: #666666;">80</p>
                    </div>
                    <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: #0036ca;">Invest
                        Now</button>
                </div>
            </div>


            <div class="d-flex gap-2">

                <div class=" my-2 p-2 shadow-lg text-center bg-white">
                    <p class="fw-bold  title-des">Large base station - 120KW</p>
                    <img :src="$asseturl+'img/43c684a9fc3234a6b31a692f98e208c4.jpg'" class="img-fluid w-100">

                    <div class="d-flex justify-content-between  p-1">
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">Invest Price</p>
                        <p style=" margin: 0;font-weight: 500;color: #666666;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between p-1">
                        <p style=" margin: 0;font-weight: 500;color: #666666;">Day Income:</p>
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);color: #0036ca;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between  p-1">
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">validity period</p>
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">80</p>
                    </div>
                    <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: #0036ca;">Invest
                        Now</button>
                </div>
                <div class=" my-2 p-2 shadow-lg text-center bg-white">
                    <p class="fw-bold  title-des">Giant Base Station - 255KW</p>
                    <img :src="$asseturl+'img/43c684a9fc3234a6b31a692f98e208c4.jpg'" class="img-fluid w-100">

                    <div class="d-flex justify-content-between  p-1">
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">Invest Price</p>
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between p-1">
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">Day Income:</p>
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);color: #0036ca;">800.00</p>
                    </div>
                    <div class="d-flex justify-content-between  p-1">
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">validity period</p>
                        <p style=" margin: 0;font-weight: 500;color: rgb(102, 102, 102);">80</p>
                    </div>
                    <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: #0036ca;">Invest
                        Now</button>
                </div>
            </div>





        </section>

    </main>


<!--
    <div class="homeMainContainer">

        <div class="d-flex justify-content-between align-items-center">
            <h3>{{ user.user.name }}</h3>
            <a :href="$asseturl+''">App Download</a>
        </div>

        <div class="d-flex noticebox">
            <span>Notice</span>
            <marquee>{{ settings.notice }}</marquee>
        </div>
        <div class="balanceBox d-flex justify-content-between align-items-center text-center">
            <span class="">{{ parseFloat(user.user.balance).toFixed(2) }} <br> Balance</span>
            <span class="">{{ parseFloat(user.todayearn).toFixed(2) }} <br> Today Earning</span>
        </div>



    </div>


    <div class="menuLink">
        <div class="d-flex justify-content-between">

            <router-link :to="{name:'Recharge'}" class="iconTex text-center">
                <i class="fa-solid fa-arrow-up-short-wide"></i><br>
                <span>Recharge</span>
            </router-link>

            <router-link :to="{name:'Withdraw'}" class="iconTex text-center">
                <i class="fa-solid fa-arrow-down-short-wide"></i><br>
                <span>Withdraw</span>
            </router-link>

            <router-link :to="{name:'companyPro'}"  class="iconTex text-center">
                <i class="fa-regular fa-id-badge"></i><br>
                <span>Company Profile</span>
            </router-link>

            <router-link :to="{name:'invite'}"  class="iconTex text-center">
                <i class="fa-solid fa-share-nodes"></i><br>
                <span>Invite Friend</span>
            </router-link>


        </div>
    </div>

 -->


















  </div>
</template>

<script>


export default {
    created() {
        if(localStorage.getItem('notice')==1){
             this.notice = false
        }
        this.getplans()
        // console.log(this.slider.length)
        var indexx = 1;
        this.slideimage = this.slider[0]
        setInterval(() => {
            if(indexx===this.slider.length)indexx = 0;
            // console.log(indexx);
            this.slideimage = this.slider[indexx]
            indexx++
        }, 5000);

    },
    data(){
        return {
            row:{},
            notice:true,
            slideimage:'',
            settings:{},
            teamdetails:{},
            user:{
                user:{},
                plans:{}
            },
            slider:[
            this.$asseturl+'/img/Daily-Task-Commisson-Chart.png',

            ]
        }
    },
    methods: {
        generator(){
        return '#'+(Math.random()*0xFFFFFF<<0).toString(16);
      },

        closeNotice(){
            this.notice = false

        localStorage.setItem('notice',1)

        },

       async getplans(){

        var resN = await this.callApi('get',`/api/admin/setting`,[])
              this.settings = resN.data


            var res = await this.callApi('get',`/api/admin/plan`,[])
            this.row = res.data


             var id = localStorage.getItem('userid');
            var results = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.user = results.data;

            var teamdetailsres = await this.callApi('get',`/api/front/teamdetails?id=${id}`,[]);
            this.teamdetails = teamdetailsres.data;


        }
    },

}
</script>
<style>

section#topbar .title {
    display: flex !important;
    justify-content: space-between;
    padding: 0 18px;
}

#marquee {
  margin: 24px 0;
}

    .reImage {
        padding: 6px;
background: #e1e1e1;
box-shadow: 0px 0px 10px 0px #0000008c;
    }
    .notice {
    width: 340px;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    background: #f0f0f0;
    padding: 52px 11px;
    z-index: 99;
    border-radius: 10px;
    text-align: center;
}

.closebtn {
  position: absolute;
  bottom: 7px;
  background: transparent;
  border: 2px solid #7683aa;
  border-radius: 6px;
  right: 23px;
}
.plansdesign{
    display: flex;
justify-content: space-between;
}

/* .planPack {
  width: 30%;
} */

</style>
