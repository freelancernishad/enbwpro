<template>
    <div>





        <form @submit.stop.prevent="onSubmit" class="mt-4 mx-2 text-center">
<!--  -->

<div class="my-2">


    <div class="form-check form-check-inline" v-for="get in getways" :key="'pay' + get.id" >

        <input class="form-check-input" v-model="row.user.Bank_Name" type="radio" name="inlineRadioOptions" :id="'pay' + get.id" :value="get.id" >


        <label class="form-check-label" :for="'pay' + get.id">{{ get.name }}</label>
    </div>



</div>

<div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1 required">Account No</span>
        <input type="text" class="form-control" v-model="row.user.Bank_account" aria-describedby="basic-addon1">
      </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1" required >Real name</span>
        <input type="text" class="form-control"  v-model="row.user.name" aria-describedby="basic-addon1">
      </div>


      <button type="submit" class="border-0 btn btn-success py-2 w-75" style="background: linear-gradient(60deg,#30cf88,#1ab49e);
">Submit</button>

</div>

</form>
















        <div class="layout-content" style="margin-bottom: 100px;">
            <div class="van-nav-bar van-nav-bar--fixed mb-5">
                <!-- <div class="van-nav-bar__content"><div class="van-nav-bar__title van-ellipsis">ব্যাংক তথ্য</div></div> -->
            </div>


            <section id="account-form" style="margin-top:60px">
            <form @submit.stop.prevent="onSubmit">


                <div class="container-fluid">
                    <div class="form-group">
                        <label>{{ $t('Bank_Name.value') }}</label>
                        <select v-model="row.user.Bank_Name" class="form-control" :disabled="readonly" required>
                            <option value="">Select</option>
                            <option v-for="get in getways" :key="'pay' + get.id" :value="get.id">{{ get.name }}</option>
                        </select>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="form-group">
                        <label><span class="require">*</span> {{ $t('Bank_account.value') }} (Bkash/Nagod/Roket)</label>
                        <input type="text" v-model="row.user.Bank_account" class="form-control"
                            placeholder="Please add an account" :readonly="readonly" required>
                    </div>
                </div>

                <div class="container-fluid">


                    <p class="det">{{ $t('BW.value') }}</p>
                    <input type="submit" class="money-btn" style="padding: 8px 14px;font-size: 23px;color: white;" value="Save information">
                </div>
            </form>
        </section>







            </div>









    </div>
</template>
<script>
export default {
    created() {
    },
    data() {
        return {
            readonly: false,
            getways: {},
            row: {
                deposit: {},
                depositamount: 0,
                user: {},
                withdraw: {},
                withdrawamount: 0,
                refercount: 0,
            },
        }
    },
    methods: {
        async getData() {
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.row = res.data;
            var getway = await this.callApi('get', `/api/admin/withdraw/gateway`, []);
            this.getways = getway.data;
            if (this.row.user.Bank_account == null || this.row.user.Bank_Name == null) {
                this.readonly = false;
            } else if (this.row.user.Bank_account == '' || this.row.user.Bank_Name == '') {
                this.readonly = false;
            } else {
                this.readonly = true;
            }
        },
        async onSubmit() {
            var id = localStorage.getItem('userid');
            var res = await this.callApi('put', `/api/admin/user/${id}`, this.row.user);
            Notification.customSuccess(`Your data has been Updated`);
            this.getData();
        },


    },
    mounted() {
        this.getData();
    },
}
</script>
<style>
.long-title {
    margin-top: 22px;
}
.long-title p {
    font-size: 17px !important;
}
</style>
