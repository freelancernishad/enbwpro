<template>
    <div>



        <div class="layout-content" style="    margin-bottom: 100px;">
            <div class="van-nav-bar van-nav-bar--fixed mb-5">
                <!-- <div class="van-nav-bar__content"><div class="van-nav-bar__title van-ellipsis">প্রত্যাহার </div></div> -->
            </div>

            <h4 class="mt-5 pl-3" style="padding-left: 20px;">ব্যাংক প্রত্যাহার</h4>

            <div class="bank_datails">

                <div class="bank_details_list">
                    <span>ব্যাংকের নাম</span>
                    <select  v-model="form.method"  disabled required>
                                <option value="">Select</option>
                                <option v-for="pay in row" :to="{ name: 'RechargePage', params: { method: pay.id } }"
                                    :key="'pay' + pay.id" :value="pay.id">{{  pay.name  }}</option>
                            </select>

                    <!-- <span>{{ form.method }}</span> -->
                </div>

                <div class="bank_details_list">
                    <span>কার্ড নম্বর</span>
                    <span>{{ form.recieved_number }}</span>
                </div>

            </div>
            <h4 class="pl-3" style="padding-left: 20px;">অ্যাকাউন্ট ব্যালান্সঃ {{  user.user.balance - settings.new_regitration  }}</h4>

            <div class="bank_datails" style="padding: 28px 11px;">

                <div class="form-group">
                    <label for="">প্রত্যাহারের পরিমাণ</label>
                    <input type="tel" class="form-control" @input="checkAmount(form.amount)" v-model="form.amount">
                </div>
            </div>
            <!-- প্রত্যাহার সময় সকাল ১০:০০ থেকে বিকাল ০৪:০০ টা পর্যন্ত -->
            <br>
            <button class="money-btn"  type="button" disabled v-if="con">Wait....</button>
            <button class="money-btn" type="submit" @click="nextFun(2)" v-else>Confirm Withdraw</button>

        </div>





    </div>
</template>
<script>
export default {
    data() {
        return {
            form: {
                method: '',
                amount: '',
                recieved_number: '',
                trx: '',
            },
            settings: {},
            row: {},
            user: {user:{}},
            con: false,
            step: 1,
            gateways: {},
            charge: 0,
            Payable: 0,
            balance: 0,
            copyMessage: '',
            bankcardAlert: true,
        }
    },
    methods: {

        async setting(){
            var resN = await this.callApi('get',`/api/admin/setting`,[])
              this.settings = resN.data
        },
        checkAmount(amount) {
            if (amount > this.user.user.balance - this.settings.new_regitration) {
                Notification.customError(`You can't Withdraw ${amount}.Because your account balance is ${this.user.user.balance - this.settings.new_regitration}`);
                this.form.amount = '';
            } else {
                this.form.amount = amount;
            }
        },
        async charageCount() {
            var res = await this.callApi('get', `/api/admin/withdraw/charge/${this.form.method}`, []);
            this.gateways = res.data;
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
        async getData() {
            var res = await this.callApi('get', `/api/admin/withdraw/gateway`, []);
            this.row = res.data;
            var id = localStorage.getItem('userid');
            var result = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.user = result.data;
            this.form.method = this.user.user.Bank_Name
            this.form.recieved_number = this.user.user.Bank_account
            this.charageCount()
            this.bankcardAlert = false
        },
        async nextFun(step) {
            if (step == 2) {
                if (this.form.method == '') {
                    Notification.customError('Method is required');
                } else {
                    if (this.form.amount == '') {
                        Notification.customError('Amount is required');
                    } else {

                    if(Number(this.form.amount)<Number(this.gateways.min_amount)) {
                        Notification.customError('Minimum Withdrawal Amount '+this.gateways.min_amount+' BDT');
                    }else {
                        this.step = step;
                        var charge = ((this.form.amount * this.gateways.percent_charge) / 100);
                        // console.log(charge)
                        this.charge = charge;
                        this.Payable = this.form.amount - charge;
                        this.balance = this.user.user.balance - this.form.amount;


                        this.onSubmit();

                    }


                    }
                }
            } else {
                this.step = step;
            }
        },
        async onSubmit() {
            this.con = true

            if(Number(this.form.amount)<Number(this.gateways.min_amount)) {
                        Notification.customError('Minimum Withdrawal Amount '+this.gateways.min_amount+' BDT');
                    }else {
                        var id = localStorage.getItem('userid');
                        this.form['user_id'] = id;
                        this.form['curency'] = this.gateways.currency;
                        this.form['rate'] = this.gateways.rate;
                        this.form['charge'] = this.charge;
                        this.form['final_amount'] = this.balance;
                        this.form['after_charge'] = this.Payable;
                        var res = await this.callApi('post', `/api/admin/withdrawal`, this.form);
                        if(res.data==422){
                            Notification.customError('Falied! withdraw cant be proccess.You must make a reachage first!');
                        }else if(res.data==444){
                            Notification.customError('Falied! withdraw cant be proccess.');
                        }else{
                            Notification.customSuccess(`Withdraw Successfuly Complete`);
                            this.$router.push({ name: 'WithdrawHistory' });
                        }

                    }


        }
    },
    mounted() {
        this.getData();
        this.setting();



// 10:00<10:01
// console.log(User.dateformat()[9]);




        // if(User.dateformat()[9]<=15){
        //     if(User.dateformat()[9]>=10){

        //         setTimeout(() => {
        //             if(!this.form.method){
        //                 alert('Please add Bank card first');
        //                 this.$router.push({ name: 'bankAccount' });
        //             }
        //         }, 5000);
        //     }else{
        //     alert('প্রত্যাহার সময় সকাল ১০:০০ থেকে বিকাল ০৪:০০ টা পর্যন্ত')

        //         this.$router.push({ name: 'Useraccount' });


        //     }
        // }else{
        //     alert('প্রত্যাহার সময় সকাল ১০:০০ থেকে বিকাল ০৪:০০ টা পর্যন্ত')
        //     this.$router.push({ name: 'Useraccount' });

        // }







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


.bank_details_list select {
    border: 0;
    background: transparent;
    color: white;
}
.bank_details_list {
    display: flex;
    justify-content: space-between;
    margin: 10px 23px;
    font-size: 19px;
    background: #7f0fad;
    padding: 7px 11px;
    color: white;
}

</style>
