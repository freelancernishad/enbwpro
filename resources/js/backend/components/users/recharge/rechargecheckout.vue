<template>
    <div>






  <form @submit.stop.prevent="onSubmit">


    <header>


      <div class="heeeeee" style="background: #419EFF; color: #fff;">
   <p>পেমেন্ট তথ্য</p> </div>


</header>

    <div class="text-center mt-4">
    <img :src="$asseturl+'Recharge/onepay2.png'" alt="" style="width: 75px;">
    <p style="font-size: 16px;font-weight: 600;">ONE PAY</p>


    <div data-v-464536f2="" class="flex_row_left" style="    position: absolute;
    top: 100px;
    right: 18%;
    border: 1px solid rgb(206, 206, 206);
    border-radius: 6px;
    width: 60px;
    padding: 0px 3px;
    display: flex;
    justify-content: space-between;">
        <div data-v-464536f2="" style="width: 18px;height: 18px; margin-right: 3px;">
<img style="width: 100%;margin-bottom: 9px;" src="data:image/png;base64,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" draggable="false">
        </div>
        <p data-v-464536f2="" style="    font-size: 14px;color: #979797;" class="acla2a4af m-0"><span>{{ time }}</span></p>
    </div>


</div>


<div class="mx-3">
  <div class="mx-3 text-end"><a href="javascript:void(0)" @click="$router.go(-1)" class="text-decoration-none text-warning-emphasis" style="font-size: 12px;color: orange;">একাউন্ট সুইচ করতে ক্লিক করুন</a></div>

</div>
<div class="borderDashed border border-top-0 mb-4 mx-3 rounded">
  <p class="bg-primary text-white headFont paddinglr20 paddingtb10" v-if="rowss.name=='bKash'"> স্টেপ ১. বিকাশ ইনফর্মেশন </p>
  <p class="bg-primary text-white headFont paddinglr20 paddingtb10" v-else-if="rowss.name=='Nagad'"> স্টেপ ১. নগদ ইনফর্মেশন </p>
  <p class="bg-primary text-white headFont paddinglr20 paddingtb10" v-else-if="rowss.name=='Rocket'"> স্টেপ ১. রকেট ইনফর্মেশন </p>
  <div class="d-flex justify-content-between mx-4" style="border-bottom: 1px dashed #00000033;">

    <p class="text-body-secondary mb-1 textFontSize" style="color: #979797;padding: 10px 0px;" v-if="rowss.name=='bKash'">বিকাশ একাউন্ট</p>
    <p class="text-body-secondary mb-1 textFontSize" style="color: #979797;padding: 10px 0px;" v-else-if="rowss.name=='Nagad'">নগদ একাউন্ট</p>
    <p class="text-body-secondary mb-1 textFontSize" style="color: #979797;padding: 10px 0px;" v-else-if="rowss.name=='Rocket'">রকেট একাউন্ট</p>
    <p class="mb-1" style="font-size:16px;    padding: 9px 0px;"> {{ paymentNumber }}
        <i class="fa-regular fa-clone copyBtn" style="cursor:pointer;margin-left:5px" :data-clipboard-text="paymentNumber"  ></i>
        <!-- <i class="fa-regular fa-clone" style="cursor:pointer;margin-left:5px" @click="copyref"></i> -->
    </p>
  </div>

  <div class="d-flex justify-content-between mx-4 fw-bold mt-2">
    <p class="fs-6  textFontSize" style="font-size: 13px !important;padding: 8px 0px;"> পরিমাণ</p>
    <p class="fs-6 text-danger"  style="padding: 8px 0px;    font-weight: bold;font-family: math;font-size: 18px !important;"> {{ form.amount }} TK</p>
  </div>

</div>
<!-- <hr class="mx-4"> -->

<div class="borderDashed border border-top-0 mb-4 mx-3 rounded">
  <p class="bg-primary text-white mb-1 headFont paddinglr20 paddingtb10" v-if="rowss.name=='bKash'"> ধাপ 2. বিকাশ ট্রান্সফারের মাধ্যমে আপনি যে পরিমাণ রিচার্জ করতে চান তা আমাদের কাছে ট্রান্সফার করুন। </p>
  <p class="bg-primary text-white mb-1 headFont paddinglr20 paddingtb10" v-else-if="rowss.name=='Nagad'"> ধাপ 2. নগদ ট্রান্সফারের মাধ্যমে আপনি যে পরিমাণ রিচার্জ করতে চান তা আমাদের কাছে ট্রান্সফার করুন। </p>
  <p class="bg-primary text-white mb-1 headFont paddinglr20 paddingtb10" v-else-if="rowss.name=='Rocket'"> ধাপ 2. রকেট ট্রান্সফারের মাধ্যমে আপনি যে পরিমাণ রিচার্জ করতে চান তা আমাদের কাছে ট্রান্সফার করুন। </p>
  <p class="ms-3 my-1">
    <span class="textFontSize acl979797" style="color: #979797;padding: 10px 0px;"><span color="red">*</span> অর্থপ্রদানের পরে অনুগ্রহ করে আপনার [লেনদেন আইডি] অনুলিপি<br>করুন</span>
  </p>
</div>
<div class="borderDashed border border-top-0 mb-4 mx-3 rounded">
  <p class="bg-primary text-white mb-1 headFont paddinglr20 paddingtb10">
    ধাপ 3। রিচার্জ সম্পূর্ণ করতে অনুগ্রহ করে লেনদেন আইডি লিখুন
  </p>



    <div data-v-464536f2="" class="flex_row_center" v-if="rowss.name=='bKash'">
        <div data-v-464536f2="" style="width: 155px; height: 124px; margin: 10px;">
            <img width="100%" :src="$asseturl+'Recharge/tips.c9cf750b.png'" draggable="false">
        </div>
        <div data-v-464536f2="" style="width: 155px; height: 124px; margin: 10px;">
            <img width="100%" :src="$asseturl+'Recharge/tips1.1ddf646f.png'" draggable="false">
        </div>
    </div>


<!--
  <div class="text-center">
    <img v-if="rowss.name=='bKash'" :src="$asseturl+'Recharge/bkash_tnxid_2.png'" alt="" class="w-50">
    <img v-else-if="rowss.name=='Nagad'" :src="$asseturl+'Recharge/nagad_tnxid_1.jpg'" alt="" class="w-50">
    <img  v-else-if="rowss.name=='Rocket'" src="" alt="" class="w-50">
  </div> -->



  <div class="">

    <input class="form-control mb-3 onepaynumberInput" v-if="rowss.name=='bKash'" v-model="form.trx" type="text" placeholder="10 সংখ্যার লেনদেন আইডি">
    <input class="form-control mb-3 onepaynumberInput" v-if="rowss.name=='Nagad'" v-model="form.trx" type="text" placeholder="8 সংখ্যার লেনদেন আইডি">
    <input class="form-control mb-3 onepaynumberInput" v-if="rowss.name=='Rocket'" v-model="form.trx" type="text" placeholder="10 সংখ্যার লেনদেন আইডি">
  </div>

</div>

<div data-v-464536f2="" style="height: 150px;"></div>

<div data-v-464536f2="" class="fifbutton flex_row_between afz14" style="width: 270px !important;">
    <button type="button" @click="onCancel" data-v-464536f2="" style="border: 0 !important;background: transparent;min-width: 124px !important;font-size: 13px;" class="flex1">আদেশ বাতিল</button>
    <button type="button" @click="onSubmit" data-v-464536f2="" style="border: 0 !important;font-size: 13px;width: 52% !important;" class="flexauto onbut">পেমেন্ট নিশ্চিত করুন</button>
</div>



<!--
<div class="mb-5 mx-3">
  <button type="button" class="btn btn-secondary btn-sm px-3 py-2 rounded-4" style="    padding: 7px 8px !important;   margin-top: 10px;" @click="onCancel">অর্ডার বাতিল করুন</button>
<button type="button" class=" btn btn-primary btn-sm px-3 py-2 rounded-4" style="     padding: 7px 8px !important;   margin-top: 10px;" @click="onSubmit">অর্ডার নিশ্চিত করুন</button>
</div> -->



</form>






<Message :Isactive="Messageactive" :Message="Message" />




    </div>
</template>

<script>
import ClipboardJS from 'clipboard';
export default {

    created(){

        const clipboard = new ClipboardJS('.copyBtn');
        clipboard.on('success', (e)=> {
            this.notifiyGlobal('copied success')
        });
        clipboard.on('error', (e)=> {
            this.notifiy('Failed to copy to clipboard!');
        });
    },

    data(){
        return {

            Messageactive:false,
            Message:'',
              rowss: {},
              copyMessage:'111111',
              time: '15:00',
              form:{
                method: '',
                amount: '',
                sender: '',
                screenshot: '',
                trx: '',
              },

              bkash: [],
              nagad: [],
              rocket: [],

              settings: {},
              paymentNumber:''
        }
    },
    methods: {


        copyref() {
                navigator.clipboard.writeText(this.paymentNumber);
                this.notifiyGlobal('copied success')
            },


          async getData() {

            var res = await this.callApi('get',`/api/admin/setting/1`,[]);
            this.settings = res.data;

           this.bkash = this.settings.bkash;
           this.nagad = this.settings.nagad;
           this.rocket = this.settings.rocket;



            var res = await this.callApi('get', `/api/admin/withdraw/gateway/${this.form.method}`, []);
            this.rowss = res.data;
            if(this.rowss.name=='bKash'){
                const random = Math.floor(Math.random() * this.bkash.length);
                this.paymentNumber = this.bkash[random];
            }else if(this.rowss.name=='Nagad'){
                const random = Math.floor(Math.random() * this.nagad.length);
                this.paymentNumber = this.nagad[random];
            }else if(this.rowss.name=='Rocket'){
                const random = Math.floor(Math.random() * this.rocket.length);
                this.paymentNumber = this.rocket[random];
            }

        },



        async onSubmit() {

            if(!this.form.trx){

                this.notifiyGlobal('Please enter valid trxn id');
            }else{




            this.con = true
                var id = localStorage.getItem('userid');
                this.form['user_id'] = id;
                var res = await this.callApi('post', `/api/admin/deposit`, this.form);
                this.$router.push({ name: 'rechargesuccess' });
            }
        },
        onCancel(){
            localStorage.removeItem('regTimer');
            this.$router.push({ name: 'rechargeFailed' });
        },


        countdown() {


if (localStorage.getItem('regTimer')) {
    var regTimer = localStorage.getItem('regTimer')

} else {
    var regTimer = new Date(new Date().getTime() + 900000);
    localStorage.setItem('regTimer', regTimer);

}


// Set the end date



var endDate = new Date(regTimer).getTime();

// Update the count down every 1 second
var x = setInterval(() => {

    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the end date
    var distance = endDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    console.log(seconds)
    // Display the result in the element with id="countdown"

    if (minutes < 10) {
        minutes = minutes.toString().padStart(2, '0')
    }
    if (seconds < 10) {
        seconds = seconds.toString().padStart(2, '0')
    }

    this.time = minutes + ":" + seconds + " ";
    this.timeout = 0;


    // If the count down is finished, write some text
    if (distance < 0) {
        clearInterval(x);
        this.time = "0:00";
        this.timeout = 1;
    }
    if (this.menual) {
        console.log(this.menual)
        clearInterval(x);
    }
    if (this.timeout == 1) {
        this.$router.push({ name: 'rechargeFailed' });
    }


}, 1000);


},



    },
    mounted() {
        this.form = JSON.parse(localStorage.getItem('rechargeData'));
            this.getData();

            this.countdown(this.menual);







            // console.log(localStorage.getItem('rechargeData'))

    },
}
</script>

<style scoped>

.textFontSize{
    font-size: 10px !important;
}
.headFont {
    font-size: 14px !important;
    font-weight: 700;
}

.li {
    display: flex;
    justify-content: space-between;
}
.onepaynumberInput:focus {
    box-shadow: 0px 0px 0px black !important;
}
.onepaynumberInput {
    border: 1px solid #00000042 !important;
    border-radius: 11px !important;
    margin: 10px auto !important;
    width: 98%;
    font-size: 12px;
    padding: 8px 10px;
}
.heeeeee {
    width: 100%;
    height: 45px;
    font-size: 16px;
    color: #4a4a4a;
    text-align: center;
    padding-top: 8px;
    font-weight: 700;
}


.bg-primary {
    background-color: #419EFE !important;
}

.paddinglr20 {
    padding-left: 10px;
    padding-right: 10px;
}
.paddingtb10 {
    padding-top: 7px;
    padding-bottom: 7px;
}


.fifbutton {
    position: fixed;
    bottom: 80px;
    width: 341px;
    height: 52px;
    border-radius: 26px;
    box-shadow: 0 3px 6px rgba(183,197,255,.38);
    left: 17px;
    z-index: 99;
    background: #fff;
}
.fifbutton .flex1 {
    width: 125px;
    min-width: 125px!important;
    color: #abbcff;
}
.fifbutton .onbut {
    background: #5370e5;
    opacity: 1;
    height: 52px;
    border-radius: 0 26px 26px 0;
    color: #fff;
    width: 62%;
}
.flex_row_center {
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.borderDashed{
    border: 1px dashed #00000033 !important;
}


</style>
