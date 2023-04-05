<template>
    <div>
        <div class="breadcrumbs-area">
            <h3>Deposit</h3>
            <ul>
                <li>
                    <router-link to="/dashboard/adddmin">Dashboard</router-link>
                </li>
                <li>Deposit</li>
            </ul>
            <button @click="$router.go(-1)" class="btn-fill-md radius-4 text-light bg-orange-red">Back</button>
        </div>
        <div class="row">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-50 border-bottom pb-2">Method Information</h5>
                        <form  @submit.stop.prevent="onSubmit">
                        <div class="row mt-4">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Name</label>
                                            <input type="text" v-model="form.name" class="form-control" >
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Comission</label>
                                            <input type="tel" v-model="form.comission_rate" class="form-control" >
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Start Balance</label>
                                            <input type="tel" v-model="form.start_balance" class="form-control" >
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">End Balance</label>
                                            <input type="tel" v-model="form.end_balance" class="form-control" >
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Total Task</label>
                                            <input type="tel" v-model="form.totalorder" class="form-control" >
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                    <div class="form-group ">
                                        <label class="form-control-label font-weight-bold">Status </label>
                                       <select class="form-control" v-model="form.status" >
                                        <option value="active">Active</option>
                                        <option value="deactive">Deactive</option>
                                       </select>
                                    </div>
                                </div>
                            <div class="col-md-12 mt-4">

                                <button type="submit" class="btn-fill-lmd text-light gradient-dodger-blue">Submit</button>

                            </div>
                        </div>
                    </form>

                    </div>
                </div>
            </div>
        </div>

    </div>
</template>
<script>
export default {
    created() {
        if(this.$route.params.id){

            this.getData();
        }
    },data() {
        return {
            form:{
                name:'',
                comission_rate:'',
                start_balance:'',
                end_balance:'',
                totalorder:'',
                status:'',
            }
        }
    },
    methods: {
        async getData(){
            var id = this.$route.params.id;
            var res = await this.callApi('get',`/api/admin/plan/${id}`,[]);
            this.form = res.data;
        },

        async onSubmit(){

            if(this.$route.params.id){

                var id = this.$route.params.id;
                var res = await this.callApi('put', `/api/admin/plan/${id}`, this.form);
            }else{
                var res = await this.callApi('post', `/api/admin/plan`, this.form);

            }


             Notification.customSuccess(`Your data has been Updated`);
             this.$router.push({name:'MembersPlans'});
            // this.getData();
        }
    },
}
</script>
