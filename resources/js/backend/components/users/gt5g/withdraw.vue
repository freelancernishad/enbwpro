<template>
    <div>


    <header class="header-text" style="background-color: var(--defaltColor);margin-bottom: -16px;">
        <p class="py-2 text-white">Withdrawal Account </p>
    </header>


   <form @submit.stop.prevent="onSubmit" class="mt-4 mx-2 text-center" v-if="!Bank_Name">
        <div class="bg-white border mb-2 mt-4 mx-4 px-3 py-2 shadow">
            <div class="input-group">
                <span class="bg-white border-0 input-group-text">Realname:</span>
                <input type="text"  v-model="row.user.name" aria-label="First name" class="form-control border-0">
              </div>
        </div>
        <div class="bg-white border d-flex mx-4 mb-2 px-3 py-2 shadow">
            <div class="w-100">
                <span class="bg-white border-0 input-group-text">Bank Code:</span>
            </div>
            <div class="w-100">
                <select v-model="row.user.Bank_Name" class="form-select border-0" aria-label="Default select example">
                            <option value="">Select</option>
                            <option v-for="get in getways" :key="'pay' + get.id" :value="get.id">{{ get.name }}</option>
                        </select>

            </div>
        </div>

        <div class="bg-white border mb-2 mx-4 px-3 py-2 shadow">
            <div class="input-group">
                <span class="bg-white border-0 input-group-text">Bank Account:</span>
                <input type="text"  v-model="row.user.Bank_account" aria-label="First name" class="form-control border-0">
              </div>
        </div>
        <div class="w-100 text-center px-4" >
            <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: var(--defaltColor);">save</button>
        </div>
   </form>



    <form @submit.stop.prevent="WithdrawonSubmit" class="mx-3" v-else>
        <div class="bg-white lh-1 mt-4 py-3 topp w-100 shadow">
            <p class="ms-2">Current Balance</p>
            <p class="fs-1 fw-bold py-1 text-center">৳{{ parseFloat(row.user.balance).toFixed(2) }}</p>
        </div>
        <div class="border border-danger input-group mt-2">
            <span class="bg-white border-0 fw-bold input-group-text py-3 rounded-0 defaltColor">৳:</span>
            <input type="number" v-model="form.amount" placeholder="Withdrawal Amount" class="form-control border-0 rounded-0">
        </div>
        <div class="border border-danger input-group mt-2">
            <span class="bg-white border-0 input-group-text py-3 rounded-0">Realname:</span>
            <input type="text" v-model="row.user.name" readonly disabled  class="form-control border-0 rounded-0">
        </div>
        <div class="border border-danger input-group mt-2">
            <span class="bg-white border-0 input-group-text py-3 rounded-0">Account:</span>
            <input type="number"  v-model="row.user.Bank_account" readonly disabled  class="form-control border-0 rounded-0">
        </div>

        <div class="w-100 text-center px-4 mt-3" >
            <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: var(--defaltColor);">Confirm Withdraw</button>
        </div>


        <p>You can withdraw daily</p>
        <p>Minimum withdrawal is Rs.300</p>
        <p>Withdrawal Charge 10%</p>
        <p>Deposit and withdrawal can be Done at any time of 24 hours. Thank you</p>







    </form>





   <Preload :Isactive="isActive"/>
    <Message :Isactive="Messageactive" :Message="Message"/>


    </div>
</template>

<script>
export default {
    created() {

        var daysName = this.dayName();

        if(daysName=='Friday' ||daysName=='Saturday'){

        }else{
            alert('উত্তোলনেন সময় শুক্রবার ও শনিবার')
             this.$router.push({ name: 'Authuser' });
        }

        // if(User.dateformat()[9]<=15){
        //     if(User.dateformat()[9]>=10){


        //     }else{
        //         this.notifiy('প্রত্যাহার সময় সকাল ১০:০০ থেকে বিকাল ০৪:০০ টা পর্যন্ত')

        //         this.$router.push({ name: 'Useraccount' });


        //     }
        // }else{
        //     this.notifiy('প্রত্যাহার সময় সকাল ১০:০০ থেকে বিকাল ০৪:০০ টা পর্যন্ত')
        //     this.$router.push({ name: 'Useraccount' });

        // }
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
            Bank_Name:null,
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
            var getway = await this.callApi('get', `/api/admin/withdraw/gateway`, []);
            this.getways = getway.data;

            this.isActive = false
        },
        async charageCount() {
            var res = await this.callApi('get', `/api/admin/withdraw/charge/${this.form.method}`, []);
            this.gateways = res.data;
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
                            this.notifiy('Falied! You can windraw one time in a day!.');
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


    },
}
</script>

