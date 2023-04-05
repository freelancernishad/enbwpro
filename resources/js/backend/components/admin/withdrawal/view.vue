<template>
    <div>
        <div class="breadcrumbs-area">
            <h3>Deposit</h3>
            <ul>
                <li>
                    <router-link to="/dashboard/adddmin">Dashboard</router-link>
                </li>
                <li>Withdrawal</li>
            </ul>
            <button @click="$router.go(-1)" class="btn-fill-md radius-4 text-light bg-orange-red">Back</button>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="mb-20 text-muted">Withdraw Via {{ rows.method.name }}</h5>
                        <div class="p-3 bg--white">
                            <div class="">
                                <img :src="rows.method.image" width="50px"
                                    alt="profile-image" class="b-radius--10 depo-img">
                            </div>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Date <span class="font-weight-bold"> {{ dateformatglobal(rows.withdrawal.created_at)[6] }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Trx Number <span class="font-weight-bold">{{ rows.withdrawal.trx }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Username <span class="font-weight-bold">
                                     <router-link :to="{name:'UsersView',params:{id:rows.user.id}}">{{ rows.user.username }}</router-link>
                                </span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Method <span class="font-weight-bold">{{ rows.method.name }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Amount <span class="font-weight-bold">{{ rows.withdrawal.amount }} {{ rows.method.currency }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Charge <span class="font-weight-bold">{{ rows.withdrawal.charge }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                After Charge <span class="font-weight-bold">{{ rows.withdrawal.after_charge }} {{ rows.method.currency }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Rate <span class="font-weight-bold">1 TAKA
                                    = {{ rows.method.rate }} {{ rows.method.symbol }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Payable <span class="font-weight-bold">{{ rows.withdrawal.after_charge }} {{ rows.method.symbol }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Status <span class="badge badge-pill bg--success">{{ rows.withdrawal.status }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-50 border-bottom pb-2">User Withdraw Information</h5>
                        <div class="row mt-4">


                            <div class="col-md-12">
                                <h6>{{ rows.method.name }} Number</h6>
                                <p>{{ rows.withdrawal.recieved_number }}</p>
                            </div>


                            <div class="col-md-8 mt-4">

                                <button type="button" class="btn-fill-lmd text-light gradient-dodger-blue" @click="action('approved',rows.withdrawal.id)">Approve</button>
                                <button type="button" class="btn-fill-lmd text-light bg-gradient-gplus" @click="action('reject',rows.withdrawal.id)">Reject</button>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    created() {
        this.getData();
    },
    data(){
        return {
            rows:{
                method:{},
                withdrawal:{},
                user:{},
            },
            status:'',
        }
    },
    methods: {
        async getData(){
            var id = this.$route.params.id;
            var res = await this.callApi('get',`/api/admin/withdrawal/${id}`,[]);
            this.rows = res.data;
            this.status = res.data.withdrawal.status;
        },


    action(status,depId){
            Swal.fire({
                title: 'Are you sure?',
                text: `${status} this data!`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: `Yes, ${status} it!`
            }).then(async (result) => {
                if (result.isConfirmed) {
                    var res = await this.callApi('get', `/api/withdraw/${status}/${depId}`, []);
                    Notification.customSuccess(`Your data has been ${status}`);
                  this.$router.push({name:'withdrawls',params:{status:'pending'}});
                }
            })
    }
    },


}
</script>
