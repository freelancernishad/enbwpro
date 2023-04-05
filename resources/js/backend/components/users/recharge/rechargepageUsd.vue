<template>
    <div>




        <header class="header-text mb-5" style="background-color: #d14d0e;margin-bottom: -16px;">
        <p class="py-2 text-white text-center">রিচার্জ </p>
    </header>

    <form @submit.stop.prevent="onSubmit">

        <p class="fw-bold ms-5">রিচার্জের পরিমাণ</p>

        <div class="mx-3 p-4 rounded-4 shadow border">
            <div class="input-group mb-3">
                <p class="border-0 border-bottom form-control text-center fw-bold">{{ form.amount }}</p>
                <!-- <input type="number" class="border-0 border-bottom form-control text-center fw-bold" aria-label="Username" disabled :value="form.amount" aria-describedby="basic-addon1"> -->
            </div>

            <div class="input-group mb-3">
                <p class="border-0 border-bottom form-control text-center fw-bold"> USDT = {{ parseFloat(form.amount/rowss.rate).toFixed(2) }} </p>
                <!-- <input type="text" class="border-0 border-bottom form-control text-center fw-bold" aria-label="Username" aria-describedby="basic-addon1" value="USDT = 000"> -->
            </div>

            <div class="form-group mb-3">
                <p class="ms-1" style="font-size: 14px;">আপনার একাউন্ট</p>
                <input class="form-control mb-3 onepaynumberInput" type="text" v-model="form.sender"
                    placeholder="************"  required>
            </div>
            <!-- <p class="mb-0 mx-5 p-2 rounded text-center" style="background-color: #d14c0e93;">নূন্যতম রিচার্জ : 10 </p> -->
        </div>

        <div class="mx-3 px-3 text-center" >
            <button type="submit"  class="border btn mt-3 p-2 rounded-5 w-100" href="#" role="button" style="background-color: #d14d0e">রিচার্জ নিশ্চিত করুন</button>
        </div>
    </form>








    </div>
</template>

<script>
export default {
    data() {
        return {
            rowss: {},
            patmentChannel:false,
            time: '05:00',
            copyMessage: '111111',
            form: {
                method: '',
                amount: '',
                sender: '',
                screenshot: '',
                trx: '',
            },
            timeout: 0,
            menual: false,
            accounterror: '',
            payname: '',
        }
    },
    methods: {

        showPayments(){
            this.patmentChannel = true
        },

        selectMethod(id,name){


            this.payname = name
            this.form.method = id
            this.patmentChannel = false
        },

        async getData() {


            var res = await this.callApi('get', `/api/admin/withdraw/gateway?name=USDT`, []);
            this.rowss = res.data;
            this.form.method = res.data.id

        },

        copyURL() {
            var Url = this.$refs.mylink;
            Url.innerHTML = window.location.href;
            console.log(Url.innerHTML)
            Url.select();
            document.execCommand("copy");
        },

        countdown() {


            if (localStorage.getItem('regTimer')) {
                var regTimer = localStorage.getItem('regTimer')

            } else {
                var regTimer = new Date(new Date().getTime() + 300000);
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




        async onSubmit() {




                localStorage.setItem('rechargeData', JSON.stringify(this.form))
                this.menual = true
                this.countdown(this.menual);

                var regTimer = new Date(new Date().getTime() + 900000);
                localStorage.setItem('regTimer',regTimer);

                this.$router.push({ name: 'rechargecheckoutUsd' });

                this.accounterror = '';







        },

    },
    mounted() {
        this.getData();
        this.countdown(this.menual);
        this.form = JSON.parse(localStorage.getItem('rechargeData'));
        // console.log(localStorage.getItem('rechargeData'))
        if (this.timeout == 1) {
            this.$router.push({ name: 'rechargeFailed' });
        }
    },
}
</script>

<style scoped>
body {
    background-color: #ffffff !important;
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
    border-radius: 12px !important;
    margin: 10px 0px !important;
}


.selectdiv {
    height: 48px;
    background: #fff;
    border: 2px solid #252525;
    box-shadow: 0 3px 6px rgba(208, 211, 226, .38);
    opacity: 1;
    border-radius: 24px;
}

.afz12 {
    font-size: 12px;
}

.flex_row_left {
    display: flex;
    align-items: center;
}

.acl252525 {
    color: #252525;
}

.paddinglr20 {
    padding-left: 10px;
    padding-right: 10px;
}

.flex_row_between {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.paddinglr20 {
    padding-left: 10px;
    padding-right: 10px;
}

.img16 {
    height: 25px;
    width: 16px;
}



.filterdiv {
    position: fixed;
    z-index: 8;
    width: 100%;
}

.showdiv {
    position: absolute;
    z-index: 10;
    top: 15px;
    border-radius: 16px;
    overflow: hidden;
    width: 335px;
    border: 2px solid #252525;
    box-shadow: 0 3px 6px rgba(208, 211, 226, .38);
}

.bgwhite {
    background: #fff;
}


.afz13 {
    font-size: 13px;
}

.paddinglr40 {
    padding-left: 20px;
    padding-right: 20px;
}

.flex_row_left {
    display: flex;
    align-items: center;
}

.fontweight {
    font-weight: 700;
}

.lineh50 {
    min-height: 50px;
    line-height: 50px;
}

.img24_24 {
    width: 24px;
    height: 50px;
    margin-right: 9px;
    cursor: pointer;
}

.img36 {
    height: 18px;
    width: 18px;
}


</style>
