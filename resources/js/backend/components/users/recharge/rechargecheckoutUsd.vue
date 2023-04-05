<template>
    <div>

        <header class="header-text mb-5" style="background-color: #d14d0e;margin-bottom: -16px;">
        <p class="py-2 text-white text-center">রিচার্জ </p>
    </header>
    <form @submit.stop.prevent="onSubmit">

        <p class="fw-bold ms-5">অবশিষ্ট অর্থ প্রদানের সময় <span class="fs-4 ms-2 text-primary">{{ time }}</span></p>

        <div class="mx-3" style="display: grid;grid-template-columns: repeat(2,1fr); gap: 14px;">
            <div class=" lh-1 py-3 rounded-4 text-center" style="background-color: #d14d0e3d;">
                <p class="">অর্ডার নাম্বার</p>
                <p class="mb-0 text-primary">{{ form.orderid }}</p>
            </div>
            <div class=" lh-1 py-3 rounded-4 text-center" style="background-color: #d14d0e3d;">
                <p class="">মুদ্রা</p>
                <p class="mb-0 text-primary">USDT</p>
            </div>
            <div class=" lh-1 py-3 rounded-4 text-center" style="background-color: #d14d0e3d;">
                <p class="">পরিমাণ</p>
                <p class="mb-0 text-primary">{{ parseFloat(form.amount/rowss.rate).toFixed(2) }}</p>
            </div>
            <div class=" lh-1 py-3 rounded-4 text-center" style="background-color: #d14d0e3d;">
                <p class="">অর্ডার স্ট্যাটাস</p>
                <p class="mb-0 text-primary">অর্থ দিতে হবে</p>
            </div>
        </div>
        <div class="fw-bold mt-3 mx-auto px-5 text-primary">
            <p class="mb-0 mx-5 p-2 rounded text-center" style="background-color: #d14d0e3d;">TRC20 </p>
        </div>

        <div class="mt-3 text-center">
            <img :src="'https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl='+rowss.number+'&choe=UTF-8'" alt="" width="40%" class="img-fluid img-thumbnail" loading="lazy">
            <p class="fw-semibold mb-0 mt-3">ঠিকানা</p>

            <p class="fw-semibold">{{ rowss.number }}</p>
        </div>



<div data-v-464536f2="" style="height: 150px;"></div>

<div data-v-464536f2="" class="fifbutton flex_row_between afz14">
    <button type="button" @click="onCancel" data-v-464536f2="" style="border: 0 !important;background: transparent;" class="flex1">আদেশ বাতিল</button>
    <button type="button" @click="onSubmit" data-v-464536f2="" style="border: 0 !important;" class="flexauto onbut">পেমেন্ট নিশ্চিত করুন</button>
</div>

    </form>








<Message :Isactive="Messageactive" :Message="Message" />




    </div>
</template>

<script>
export default {
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

              bkash: [
                '01401933621',
                '01902904383',
                ],

              nagad: [
                '01401933621',
                '01902904383',
                ],

              rocket: [
                '01863476555'
                ],

              settings: {},
              paymentNumber:''
        }
    },
    methods: {
          async getData() {


            var res = await this.callApi('get', `/api/admin/withdraw/gateway/${this.form.method}`, []);
            this.rowss = res.data;
            if(this.rowss.name=='Bkash'){
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






            this.con = true
                var id = localStorage.getItem('userid');
                this.form['user_id'] = id;
                var res = await this.callApi('post', `/api/admin/deposit`, this.form);
                this.$router.push({ name: 'rechargesuccess' });

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

</style>
