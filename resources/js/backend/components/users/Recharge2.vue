<template>
    <div>

        <div class="container" style="    width: 90%;">
            <!-- <div class="van-nav-bar van-nav-bar--fixed mb-5">
                <div class="van-nav-bar__content"><div class="van-nav-bar__title van-ellipsis">ডিপোজিট</div></div>
            </div> -->



            <div v-if="step == 1" style="    margin-top: 70px;margin-bottom: 100px;">

                <div data-v-cd1085ee="" class="field-box-input van-cell van-field  mt-3">
                    <label class="inputlabel" for="">
                        <span>ডিপোজিটের মাধ্যম </span>
                    </label>
                    <select class="form-control" v-model="payMethods" @change="getMethods" required>
                        <option value="">Select</option>
                        <option v-for="pay in row" :key="'pay' + pay.id" :value="pay.id">{{ pay.name }}
                        </option>
                    </select>
                </div>



                <div data-v-cd1085ee="" class="field-box-input van-cell van-field mt-3">
                    <label class="inputlabel" for="">
                        <span>ডিপোজিটের পরিমাণ </span>
                    </label>
                    <input type="text" v-model="amount" class="form-control"
                        placeholder="অনুগ্রহ করে ডিপোজিটের পরিমাণ পূরণ করুন">
                </div>
                <div class="form-group">
                    <label for="">Sender Number</label>
                    <input type="tel" class="form-control" v-model="form.sender" required>
                </div>





                <!--
                <div class="row">
                    <div class="col-6 amount_item" @click="amount = 500 / rates"><span>{{
                    500/rates }}</span> </div>
                    <div class="col-6 amount_item" @click="amount = 1000 / rates"><span>{{
                    1000/rates }}</span></div>
                    <div class="col-6 amount_item" @click="amount = 2000 / rates"><span>{{
                    2000/rates }}</span></div>
                    <div class="col-6 amount_item" @click="amount = 5000 / rates"><span>{{
                    5000/rates }}</span></div>
                    <div class="col-6 amount_item" @click="amount = 10000 / rates"><span>{{
                    10000/rates }}</span></div>
                    <div class="col-6 amount_item" @click="amount = 20000 / rates"><span>{{
                    20000/rates }}</span></div>
                    <div class="col-6 amount_item" @click="amount = 25000 / rates"><span>{{
                    25000/rates }}</span></div>
                </div> -->
                <button class="money-btn" @click="nextFun(2)">Next</button>


                <!-- <p style="color: red;text-align: center;font-size: 17px;">{{ settings.recharagetext }}</p> -->

                <div class="instruct" data-v-7494dfc8=""><span class="title" data-v-7494dfc8="">Deposit
                        explanation</span><span data-v-7494dfc8=""
                        style="color: var(--van-button-danger-background-color);">1、 Please select machine category and
                        choose payment method. After deposit, if the deposit has not arrived within 10 mins, please
                        contact the online customer service.</span><span data-v-7494dfc8="">2、 After deposit, mining
                        machine will be upgraded, more commission will be earned when finishing mining.</span><span
                        data-v-7494dfc8="">3、 When doing deposit, do not leave the paying page until you finish the
                        transfer and input tnxID</span><span data-v-7494dfc8="">4、 Holidays are open for deposit as
                        well</span><span data-v-7494dfc8="">5、 Submit correct information when deposit. Please do not
                        submit the same tnxID multiple times.</span></div>


            </div>

            <form @submit.stop.prevent="onSubmit" v-else-if="step == 2" style="margin-bottom: 100px;">


                <div class="content" data-v-125b5982="">
                    <div class="title" data-v-125b5982="">
                        <div class="van-image" data-v-125b5982="">

                            <img :src="$asseturl+'Recharge/bkash.png'" class="van-image__img" v-if="form.method=='Bkash'" style="object-fit: fill;">
                            <img :src="$asseturl+'Recharge/nagad.png'" class="van-image__img" v-if="form.method=='Nagad'" style="object-fit: fill;">
                            <img :src="$asseturl+'Recharge/rocket.png'" class="van-image__img" v-if="form.method=='Rocket'" style="object-fit: fill;">
                            <img src="" class="van-image__img" v-else style="object-fit: fill;">

                        </div>
                    </div>
                    <div class="step" data-v-125b5982="">Step 1: Copy {{ form.method }} Information</div>
                    <div class="van-cell-group van-hairline--top-bottom" data-v-125b5982="">
                        <div class="van-cell" data-v-125b5982=""><!---->
                            <div class="van-cell__title"><span>{{ form.method }} account</span><!----></div>
                            <div class="van-cell__value"><span>{{ copyMessage }}</span>
                                <!-- <i @click="copyref" style="font-size: 20px;padding: 5px;" class="far fa-copy"></i> -->
                            </div>
                        </div>
                        <div class="van-cell amount" data-v-125b5982=""><!---->
                            <div class="van-cell__title"><span>Amount</span><!----></div>
                            <div class="van-cell__value"><span>{{ amount*rates }}৳</span></div><!----><!---->
                        </div>
                    </div>
                    <div class="step" data-v-125b5982="">Step 2: Transfer the amount you want to deposit to us by {{ form.method }}
                        transfer</div>
                    <div class="van-cell-group van-hairline--top-bottom" data-v-125b5982="">
                        <div class="van-cell step2" data-v-125b5982=""><!---->
                            <div class="van-cell__title"><span>* Please copy your [Transaction ID] after
                                    payment</span><!----></div><!----><!----><!---->
                        </div>
                    </div>
                    <div class="step" data-v-125b5982="">Step 3: Please input account number and Transaction ID to
                        complete the deposit</div>





                    <div class="van-row pic" style="    justify-content: center;    height: 393px;" data-v-125b5982="" v-if="form.method=='Bkash'">
                        <div class="van-col van-col--12 right" data-v-125b5982="">
                            <div class="van-image" data-v-125b5982="" style="height: 200px;"><img style="width: 170px;"
                                :src="$asseturl+'Recharge/bkash_tnxid_1.png'" class="van-image__img"></div>
                        </div>
                        <div class="van-col van-col--12" data-v-125b5982="">
                            <div class="van-image" data-v-125b5982="" style="height: 100px;"><img style="width: 170px;"
                                :src="$asseturl+'Recharge/bkash_tnxid_2.png'" class="van-image__img"></div>
                        </div>
                    </div>



                    <div class="van-row pic" style="    justify-content: center;" data-v-125b5982="" v-if="form.method=='Nagad'">
                        <div class="van-col van-col--12 right" data-v-125b5982="">
                            <div class="van-image" data-v-125b5982="" style="height: 200px;"><img style="width: 170px;"
                                :src="$asseturl+'Recharge/nagad_tnxid_1.jpg'" class="van-image__img"></div>
                        </div>

                    </div>



                    <div class="van-row pic" style="    justify-content: center;" data-v-125b5982="" v-if="form.method=='Rocket'">

                    </div>











                    <div class="form-group d-none">
                    <label for="">Screenshot</label>
                    <input class="form-control form-control-lg" id="formFileLg"
                        @change="FileSelected($event, 'screenshot')" type="file">
                    <img class="img-thumbnail" :src="form.screenshot" alt="">
                </div>


                        <input type="text" id="van-field-5-input"  v-model="form.trx" name="tnxId" class="form-control" placeholder="10-digit Transaction ID" required>

                        <div data-v-125b5982="" style="margin: 16px;">

                            <button type="button" class="money-btn" v-if="con">Please Wait....</button>
                            <button type="Submit" class="money-btn" v-else>Confirm</button>

                        </div>

                </div>







            </form>

        </div>





        <div class="copyPopup" v-if="popup">
            <span> Number copied success</span>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            popup: false,
            form: {
                method: '',
                amount: '',
                sender: '',
                screenshot: '',
                trx: '',
            },
            row: {},
            settings: {},
            payMethods: '',
            amount: 0,
            step: 1,
            copyMessage: '',
            rates: '',
            con: false,
        }
    },
    methods: {
        async getMethods() {
            var res = await this.callApi('get', `/api/admin/withdraw/gateway/${this.payMethods}`, []);
            // console.log(res);
            this.copyMessage = res.data.number;
            this.form.method = res.data.name;
            this.rates = res.data.rate;
        },
        copyref() {
            navigator.clipboard.writeText(this.copyMessage);
            this.popup = true
            setTimeout(() => {
                this.popup = false
            }, 1000);
        },
        FileSelected($event, parent_index) {
            let file = $event.target.files[0];
            if (file.size > 5048576) {
                Notification.image_validation();
            } else {
                let reader = new FileReader;
                reader.onload = event => {
                    this.form[parent_index] = event.target.result
                    // console.log(event.target.result);
                };
                reader.readAsDataURL(file)
            }
            //   console.log($event.target.result);
        },
        async setting() {
            var resN = await this.callApi('get', `/api/admin/setting`, [])
            this.settings = resN.data
        },
        async getData() {
            var res = await this.callApi('get', `/api/admin/withdraw/gateway`, []);
            this.row = res.data;
        },
        nextFun(step) {
            if (step == 2) {
                if (!this.form.method) {
                    Notification.customError('Method is required');
                } else {
                    if (!this.amount) {
                        Notification.customError('Amount is required');
                    } else {
                        if (this.settings.min_deposit > Number(this.amount)) {
                            Notification.customError(`Minimum deposit amount ${this.settings.min_deposit}`);
                        } else {
                            this.step = step;
                        }
                    }
                }
            } else {
                this.step = step;
            }
        },
        async onSubmit() {
            this.con = true
            if (this.settings.min_deposit > Number(this.amount)) {
                Notification.customError(`Minimum deposit amount ${this.settings.min_deposit}`);
            } else {
                // this.step = step;
                this.form.amount = this.amount * this.rates;
                var id = localStorage.getItem('userid');
                this.form['user_id'] = id;
                var res = await this.callApi('post', `/api/admin/deposit`, this.form);
                Notification.customSuccess(`Recharge Successfuly Complete`);
                this.$router.push({ name: 'rechargeHistory' });
            }
        }
    },
    mounted() {
        this.getData();
        this.setting();
    },
}
</script>
<style>
.mainitem {
    display: flex !important;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-between;
}

.instruct {
    border-radius: 10px;
    border: 2px solid var(--van-gray-4);
    padding: 10px;
}

.instruct .title {
    color: var(--van-gray-6);
    margin-bottom: 15px;
}

.instruct span {
    display: block;
    font-size: small;
    font-weight: 700;
}



.content {
    padding: 50px 10px 10px 10px;
}

.title[data-v-125b5982] {
    text-align: center;
}
.step[data-v-125b5982] {
    padding: 10px;
    background-color: #168080;
    font-weight: bolder;
    color: var(--van-button-default-background-color);
    word-wrap: break-word;
    overflow: hidden;
}

.van-cell-group[data-v-125b5982] {
    margin-bottom: 16px;
}
.van-cell-group {
    background: var(--van-cell-group-background-color);
}
.van-hairline, .van-hairline--bottom, .van-hairline--left, .van-hairline--right, .van-hairline--surround, .van-hairline--top, .van-hairline--top-bottom {
    position: relative;
}
.pic[data-v-125b5982] {
    padding: 10px 0;
}
.van-row {
    display: flex;
    flex-wrap: wrap;
}
.van-cell {
    position: relative;
    display: flex;
    justify-content: space-between;
    box-sizing: border-box;
    width: 100%;
    padding: var(--van-cell-vertical-padding) var(--van-cell-horizontal-padding);
    overflow: hidden;
    color: var(--van-cell-text-color);
    font-size: var(--van-cell-font-size);
    line-height: var(--van-cell-line-height);
    background: var(--van-cell-background-color);
}





</style>
