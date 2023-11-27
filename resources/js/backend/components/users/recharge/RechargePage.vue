<template>
    <div>







        <form @submit.stop.prevent="onSubmit">

            <div class="d-flex mx-3 my-3 mb-3">
                <div class="w-50 " style="display: flex;align-items: center;">
                    <img :src="$asseturl + 'Recharge/onepay2.png'" width="30px" alt=""> <span style="    font-size: 24px;
        font-weight: 700;">OnePay</span>
                </div>
                <div class="text-end w-50" style="font-size: 24px;">
                    <b style="font-family: auto;">{{ time }} </b>

                </div>

            </div>
            <div>
                <p class="bg-warning mx-3 ps-4 py-2 rounded-top-5 pt-3"
                    style="margin-bottom: 3px;font-size: 14px;border-top-left-radius: 2em!important; border-top-right-radius: 2em !important;font-family: auto;background-color: #FFD530!important;">
                    অর্ডার আইডি : {{ form.orderid }}</p>
                <div>
                    <p class="bg-warning fw-medium mx-3 pt-2 py-5 rounded-bottom-5 text-center"
                        style="border-bottom-right-radius: 2rem !important;border-bottom-left-radius: 2rem !important;font-size: 28px !important;font-weight: 700;font-family: auto;background-color: #FFD530!important;">
                        {{ form.amount }} TK</p>
                </div>

            </div>
            <div class="mx-4 mt-3">
                <p class="ms-1" style="font-size: 14px;">আপনার একাউন্ট</p>
                <input class="form-control mb-3 onepaynumberInput" type="number" v-model="form.sender"
                    placeholder="016xxxxx345" minlength="11" maxlength="11" style="font-family: auto;" required>

                <small style="color: white;
        background: #000000a8;
        padding: 9px 16px;
        border-radius: 14px;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);" v-if="accounterror">{{ accounterror }}</small>

            </div>

            <div class="mx-4">
                <p class="ms-1" style="font-size: 14px;">পেমেন্ট চ্যানেল </p>

                <div data-v-705785f8="" style="position:relative">
                    <div data-v-705785f8="" class="selectdiv flex_row_between  paddinglr20" @click="showPayments">
                        <div data-v-705785f8="" class="flex_row_left afz12 acl252525"><!---->

                            <p data-v-705785f8="" class="m-0" v-if="!payname"><span>আপনার পেমেন্ট চ্যানেল নির্বাচন করুন</span></p>

                            <div data-v-705785f8="" v-else class="flex_row_left afz12 acl252525">
                                <div data-v-705785f8="" class="amgr10">
                                    <div data-v-705785f8="" class="img36 amgr10">
                                        <img style="width: 18px;margin-right: 12px;"  v-if="payname=='bKash'" :src="$asseturl+'Recharge/bkash.f4a39710.png'" draggable="false">

                                        <img style="width: 18px;margin-right: 12px;" v-else-if="payname=='Nagad'" :src="$asseturl+'Recharge/nagad.826da2e3.png'" draggable="false">
                                        <img style="width: 18px;margin-right: 12px;" v-else-if="payname=='Rocket'" :src="$asseturl+'Recharge/rocket.png'" draggable="false">
                                        <img style="width: 18px;margin-right: 12px;" v-else-if="payname=='Bank card'" :src="$asseturl+'Recharge/bankcard.png'" draggable="false">
                                    </div>
                                </div>
                                <p data-v-705785f8="" style="margin-bottom: 0;margin-left: 11px;"><span>{{ payname }}</span></p>
                            </div>

                        </div>
                        <div data-v-705785f8="" class="img16">

                            <img width="100%"
                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABL0lEQVRIS7XWvStHURzH8dePMihZmDzMjGaiDBiVFDZkUxSzRSYWRhmMHjZKmcRg9a+IwSAPfev8dJKH38O9Z7rDPe/3Ped8v59zK2ofa9jGBRbxWsvUSi0vpXee0JGezzCP9//m1yO4xWgGPMJKkYIu3GEwg+5j/S9JPSsITg/u0Z9B41y2fpPUKwjOQFpJdwaNAjj4SdKIIDhDuEFngn5gCcffJY0KgjOCa7Qn6BsWEBX2NZoRBGQy9UVbIkZvTOOqamhWEJxZnKAlQV8wlc5JEYLgRj8cZjvzjDE8FCUI9iZ2M0mU83CRgg3sZYKosvGiBMuI6KiOQrdoBqdoLeOQSy3TUhut1KgoNez6Ulz3lhHXpV84kZwT2ZcXfmU+Zvl/jrmiL/1V7OCynt+WT3sHPhlLtGB8AAAAAElFTkSuQmCC"
                                draggable="false">
                        </div>
                    </div>


                    <div data-v-705785f8="" class="filterdiv" v-if="patmentChannel">
                    <div data-v-705785f8="" class="showdiv  bgwhite">
                        <div data-v-705785f8="" class="lineh50 paddinglr40 afz13 fontweight">পেমেন্ট চ্যানেল</div>


                        <div data-v-705785f8="" class="lineh50 paddinglr40 flex_row_left afz13 fontweight" style="cursor: pointer;" v-for="pay in rowss" :key="'pay' + pay.id" v-if="pay.name=='bKash' || pay.name=='Nagad' || pay.name=='Rocket'"  @click="selectMethod(pay.id,pay.name)">
                            <div data-v-705785f8="" class="img24_24 amgr10">
                                <img width="100%" v-if="pay.name=='bKash'"  :src="$asseturl+'Recharge/bkash.f4a39710.png'" draggable="false">
                                <img width="100%" v-if="pay.name=='Nagad'"  :src="$asseturl+'Recharge/nagad.826da2e3.png'" draggable="false">
                                <img width="100%" v-if="pay.name=='Rocket'"  :src="$asseturl+'Recharge/rocket.png'" draggable="false">
                            </div>
                            <div data-v-705785f8="">{{ pay.name }}</div>
                        </div>

                        <div data-v-705785f8="" class="lineh50 paddinglr40 flex_row_left afz13 fontweight" style="cursor: pointer;"  @click="selectMethod(0,'Bank card')">
                            <div data-v-705785f8="" class="img24_24 amgr10">
                                <img width="100%"  :src="$asseturl+'Recharge/bankcard.png'" draggable="false">
                            </div>
                            <div data-v-705785f8="">Bank card</div>
                        </div>




                    </div>
                </div>




                </div>













                <button style="
        height: 53px;
        /* background: rgb(167, 159, 159); */
        box-shadow: rgba(180, 184, 204, 0.5) 0px 3px 6px;
        opacity: 1;
        border-radius: 12px;
        margin-top: 25px;
        border: 0 !important;
        width: 100%;
        color: white;
        font-size: 16px;
        font-weight: 700;"  :style="[form.method ? {'background': '#000000'} : {'background': 'rgb(167, 159, 159)'}]"   type="submit">পেমেন্টে যান</button>

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


            var res = await this.callApi('get', `/api/admin/withdraw/gateway`, []);
            this.rowss = res.data;

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



            if (this.payname=='Bank card') {
                this.$router.push({ name: 'rechargeFailed' });
            }else{

            if (this.form.sender.length == 11) {
                localStorage.setItem('rechargeData', JSON.stringify(this.form))
                this.menual = true
                this.countdown(this.menual);

                var regTimer = new Date(new Date().getTime() + 900000);
                localStorage.setItem('regTimer',regTimer);

                this.$router.push({ name: 'rechargecheckout' });

                this.accounterror = '';
            } else {

                this.accounterror = 'আপনার একাউন্ট অবৈধ';
                setTimeout(() => {
                    this.accounterror = '';
                }, 3000);

                // Notification.customError(`আপনার একাউন্ট অবৈধ `);

            }
        }






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
