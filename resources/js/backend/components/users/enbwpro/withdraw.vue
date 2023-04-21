<template>
    <div>











    <!-- <header class="header-text" style="background-color: var(--defaltColor);margin-bottom: -16px;">
        <p class="py-2 text-white">Withdrawal Account </p>
    </header> -->




    <header style=" background: var(--defaltColor);
  padding: 7px 12px;">
        <h1 class="text-white" style="height: 44px;
    font-size: 16px;
    padding-left: 15px;
    padding-right: 15px;
    font-weight: 700;
    display: flex;
    align-items: center;">
           <span v-if="!Bank_Name">Withdrawal Bank</span>
           <span v-else>Withdrawal</span>
        </h1>
    </header>



   <form @submit.stop.prevent="onSubmit" class="mt-4" v-if="!Bank_Name">



        <div class="mb-2 mt-4 mx-4 px-3 py-2">
            <div class="form-group">
                <label for="">Your Real Name</label>
                <input type="text"  v-model="row.user.name" aria-label="First name" class="form-control">
              </div>
        </div>

        <div class="mb-2 mx-4 px-3 py-2">
            <div class="form-group">
                <label for="">Please enter your card number</label>
                <input type="text"  v-model="row.user.Bank_account" aria-label="First name" class="form-control">
              </div>
        </div>

        <div class="mx-4 mb-2 px-3 py-2">
            <div class="form-group">
                <label for="">Please select the account type</label>
                <select v-model="row.user.Bank_Name" class="form-control" aria-label="Default select example">
                    <option value="">Select</option>
                    <option v-for="get in getways" :key="'pay' + get.id" :value="get.id">{{ get.name }}</option>
                </select>
              </div>
        </div>

        <div class="w-100 text-center px-4" >
            <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: var(--defaltColor);">save</button>
        </div>
   </form>



    <form @submit.stop.prevent="WithdrawonSubmit" class="" v-else>


    <main>
        <div style="padding: 0 12px;
        background: linear-gradient(1turn, rgb(241, 243, 248), rgb(151 127 247) 58%, #B000FF);">
            <div class="text-center" style="padding: 25px 2px;">

                <p class="ms-3 balance">Withdrawal amount</p>
                <p class="fs-4 text-white">{{ parseFloat(row.user.balance).toFixed(2) }}</p>

            </div>

            <div class="bg-white py-3 rounded-4 shadow-sm">


                <!-- <span>{{ Bank_account }}</span> -->
                    <input  style="width:99%;" v-model="Bank_account" readonly disabled  type="text" placeholder="" class="align-items-center border border-danger d-flex justify-content-between money-input mx-2 my-3 p-2 rounded-3 shadow-sm" />


                    <input maxlength="140" style="width:99%;" v-model="form.amount" @input="checkAmount(form.amount)"  step="0.000000000000000001" enterkeyhint="done" pattern="[0-9]*" autocomplete="off" type="number" placeholder="Please select the amount" class="align-items-center border border-danger d-flex justify-content-between money-input mx-2 my-3 p-2 rounded-3 shadow-sm" />

                    <div class="w-100 text-center px-4 mt-3" >
                        <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: var(--defaltColor);">Confirm Withdraw</button>
                    </div>
            </div>
        </div>


    </main>

    <footer class="bg-white mx-2 my-4 rounded-3 shadow-sm">
            <p class="text-start" style="font-size: 18px;
            font-weight: 500;
            color: #31323e;">Withdrawal Record</p>

        <div class=" px-4 py-2"  v-for="rech in lists" :key="'rech'+rech.id">
            <div class="d-flex justify-content-between">
                <p><i class="fa-mobile-screen-button fa-solid me-1"></i> {{ rech.status }}</p>
                <p>{{ rech.amount }}BDT</p>
            </div>
            <p class="fs-6 mb-0 time">{{ dateformatglobal(rech.created_at)[6] }}</p>
        </div>


    </footer>



    </form>





   <Preload :Isactive="isActive"/>
    <Message :Isactive="Messageactive" :Message="Message"/>


    </div>
</template>

<script>
export default {
    created() {

        var daysName = this.dayName();

        // if(daysName=='Friday' ||daysName=='Saturday'){

        // }else{
        //     alert('উত্তোলনেন সময় শুক্রবার ও শনিবার')
        //      this.$router.push({ name: 'Authuser' });
        // }

        if(User.dateformat()[9]<=16){
            if(User.dateformat()[9]>=10){
            }else{
                this.notifiy('Withdrawal Time Everyday 10am To 5pm.')
                this.$router.push({ name: 'Authuser' });
            }
        }else{
            this.notifiy('Withdrawal Time Everyday 10am To 5pm.')
            this.$router.push({ name: 'Authuser' });
        }

    },
    data(){
        return {
            isActive:true,
            Messageactive:false,
            Message:'',
            charge: 0,
            Payable: 0,
            balance: 0,
            getways: {},
            gateways: {},
            lists: {},
            Bank_Name:null,
            Bank_account:'',
            form: {
                method: '',
                amount: '',
                recieved_number: '',
                trx: '',
            },
        }
    },
    methods: {
        async getData() {


            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/admin/withdrawal?id=${id}`, []);
            this.lists = res.data;




            var getway = await this.callApi('get', `/api/admin/withdraw/gateway`, []);
            this.getways = getway.data;

            this.isActive = false
        },
        async charageCount() {
            var res = await this.callApi('get', `/api/admin/withdraw/charge/${this.form.method}`, []);
            this.gateways = res.data;
        },


        checkAmount(amount) {
            console.log(amount)
            if (Number(amount) > Number(this.row.user.balance) - Number(this.settings.new_regitration)) {
                this.notifiy(`You can't Withdraw ${amount}.Because your account balance is ${this.row.user.balance - this.settings.new_regitration}`);
                this.form.amount = '';
            } else {
                this.form.amount = amount;
            }
        },


        async onSubmit() {
            this.isActive = true
            var id = localStorage.getItem('userid');
            var res = await this.callApi('put', `/api/admin/user/${id}`, this.row.user);
            this.isActive = false
            this.getData();
            this.Messageactive = true
            this.Message = 'Success';
            setTimeout(() => {
                this.Messageactive = false
            }, 1000);
        },

        notifiy(mess){
            this.Messageactive = true
            this.Message = mess;
            setTimeout(() => {
                this.Messageactive = false
            }, 2000);
        },
        randomLetter(length) {
                let result = 'S'+this.dateformatglobal()[10]+this.dateformatglobal()[11]+this.dateformatglobal()[12]+Math.floor(Math.random() * (999999999999 - 11111111111));
                return result;
            },

        async WithdrawonSubmit() {
            this.isActive = true
            this.con = true

            if(Number(this.form.amount)<Number(this.gateways.min_amount)) {

                this.notifiy('Minimum Withdrawal Amount '+this.gateways.min_amount+' BDT');


                    }else {
                        var id = localStorage.getItem('userid');
                        var charge = ((this.form.amount * this.gateways.percent_charge) / 100);
                        this.charge = charge;
                        this.Payable = this.form.amount - charge;
                        this.balance = this.row.user.balance - this.form.amount;

                        this.form['user_id'] = id;
                        this.form['curency'] = this.gateways.currency;
                        this.form['rate'] = this.gateways.rate;
                        this.form['charge'] = this.charge;
                        this.form['final_amount'] = this.balance;
                        this.form['after_charge'] = this.Payable;
                        this.form['mer_trx'] =  this.randomLetter(20);

                        var res = await this.callApi('post', `/api/admin/withdrawal`, this.form);
                        if(res.data==422){

                            this.notifiy('Falied! withdraw cant be proccess.You must make a purchase first!');


                        }else if(res.data==445){
                            this.notifiy('Falied! You can withdraw one time in a day!.');
                        }else if(res.data==444){
                            this.notifiy('Falied! withdraw cant be proccess.');
                        }else{
                            this.notifiy(`Withdraw Successfuly Complete`);
                            this.$router.push({ name: 'WithdrawalRecord' });
                        }

                    }
                    this.isActive = false

        }




    },
    mounted() {
        this.Bank_Name = this.row.user.Bank_Name
        this.getData();
        this.form.method = this.row.user.Bank_Name
        this.form.recieved_number = this.row.user.Bank_account
        this.charageCount();

        setTimeout(() => {

            this.Bank_account = this.row.user.Bank_account.substring(0, 3)+'******'+this.row.user.Bank_account.substring(9, 11);
        }, 1000);



    },
}
</script>

<style scoped>
        body {
            background-color: #f1f1f1;
        }

        hr {
            margin-top: -12px;
        }

        i.fa-solid.fa-mobile-screen-button {
            background: #f78b21;
            color: white;
            padding: 2px;
            border-radius: 3px;
        }

        .time {
            padding: 6px 0 16px;
            font-size: 13px;
            font-family: PingFangSC-Regular, PingFang SC;
            font-weight: 400;
            color: #9899a6;
        }

        .balance {
            font-size: 16px;
            font-family: PingFangSC-Regular, PingFang SC;
            font-weight: 400;
            color: hsla(0, 0%, 100%, .7);
        }

        .ammount-select {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            text-align: center;
            gap: 15px;
        }

        .amount {
            font-size: 17px;
            font-family: PingFangSC-Medium, PingFang SC;
            font-weight: 500;
            color: #31323e;
            line-height: 66px;
            text-align: center;
            background: #f7f8fa;
            border-radius: 8px;
        }

        button.money-btn {
            padding: 0 13px;
            line-height: 39px;
            background: #ed2828;
            border-radius: 8px;
            font-size: 16px;
            font-family: PingFangSC-Regular, PingFang SC;
            font-weight: 400;
            color: #fff;
            border: 0;
        }
</style>
