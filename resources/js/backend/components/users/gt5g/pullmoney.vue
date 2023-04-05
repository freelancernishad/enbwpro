<template>
    <div>

    <header class="header-text" style="background-color: var(--defaltColor);margin-bottom: -16px;">
        <p class="py-2 text-white">Withdrawal Account </p>
    </header>


   <form @submit.stop.prevent="onSubmit" class="mt-4 mx-2 text-center">
        <div class="bg-white border mb-2 mt-4 mx-4 px-3 py-2 shadow">
            <div class="input-group">
                <span class="bg-white border-0 input-group-text">Realname:</span>
                <input type="text"  v-model="row.user.name" :disabled="disabaled" aria-label="First name" class="form-control border-0">
              </div>
        </div>
        <div class="bg-white border d-flex mx-4 mb-2 px-3 py-2 shadow">
            <div class="">
                <span class="bg-white border-0 input-group-text">Bank Code:</span>
            </div>
            <div class="w-100">
                <select v-model="row.user.Bank_Name" :disabled="disabaled" class="form-select border-0" aria-label="Default select example">
                            <option value="">Select</option>
                            <option v-for="get in getways" :key="'pay' + get.id" :value="get.id">{{ get.name }}</option>
                        </select>

            </div>
        </div>

        <div class="bg-white border mb-2 mx-4 px-3 py-2 shadow">
            <div class="input-group">
                <span class="bg-white border-0 input-group-text">Bank Account:</span>
                <input type="number"  v-model="row.user.Bank_account" :disabled="disabaled" aria-label="First name" class="form-control border-0">
              </div>
        </div>
        <div class="w-100 text-center px-4" v-if="!disabaled" >
            <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: var(--defaltColor);">save</button>
        </div>
   </form>


   <Preload :Isactive="isActive" />
        <Message :Isactive="Messageactive" :Message="Message" />
    </div>
</template>

<script>
export default {
    data(){
        return {
            isActive:true,
            Messageactive:false,
            Message:'',

            getways: {},
            gateways: {},
            Bank_Name:null,
            disabaled:false,
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
            if(this.Bank_Name){
                this.disabaled = true
             }

        },

        notifiy(mess){
            this.Messageactive = true
            this.Message = mess;
            setTimeout(() => {
                this.Messageactive = false
            }, 1000);
        },




    },
    mounted() {

        this.Bank_Name = this.row.user.Bank_Name
        this.getData();
        this.form.method = this.row.user.Bank_Name
        this.form.recieved_number = this.row.user.Bank_account
        this.charageCount();
        if(this.Bank_Name){
                this.disabaled = true
             }


    },
}
</script>

