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
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="mb-20 text-muted">Deposit Via {{ rows.method.name }}</h5>
                        <div class="p-3 bg--white">
                            <div class="">
                                <img :src="rows.method.image" width="50px"
                                    alt="profile-image" class="b-radius--10 depo-img">
                            </div>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Date <span class="font-weight-bold">{{ dateformatglobal(rows.deposit.created_at)[6] }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Trx Number <span class="font-weight-bold">{{ rows.deposit.trx }}</span>
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
                                Amount <span class="font-weight-bold">{{ rows.deposit.amount }} {{ rows.method.currency }}</span>
                            </li>


                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Rate <span class="font-weight-bold"> 1 TAKA
                                    = {{ rows.method.rate }} {{ rows.method.symbol }}</span>
                            </li>

                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Status <span class="badge badge-pill bg--success">{{ rows.deposit.status }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-50 border-bottom pb-2">User Deposit Information</h5>
                        <div class="row mt-4">
                            <div class="col-md-12">
                                <h6>Sender Number</h6>
                                <p>{{ rows.deposit.sender }}</p>
                            </div>
                            <div class="col-md-12">
                                <h6>Transaction id</h6>
                                <p>{{ rows.deposit.trx }}</p>
                            </div>

                            <!-- <div class="col-md-12">
                                <h6>Sender number</h6>
                                <p>01811630241</p>
                            </div> -->

                            <div class="col-md-8">
                                <h6>Upload screenshot</h6>
                                <img :src="rows.deposit.screenshot"
                                    alt="..">
                            </div>

                            <div class="col-md-8 mt-4" v-if="status=='pending' || status=='reject'">
                                <button type="button" class="btn-fill-lmd text-light gradient-dodger-blue" @click="action('approved',rows.deposit.id)">Approve</button>
                                <button type="button" v-if="status!='reject'" class="btn-fill-lmd text-light bg-gradient-gplus" @click="action('reject',rows.deposit.id)">Reject</button>
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
                deposit:{},
                user:{},
            },
            status:'',
        }
    },
    methods: {
        async getData(){
            var id = this.$route.params.id;
            var res = await this.callApi('get',`/api/admin/deposit/${id}`,[]);
            this.rows = res.data;
            this.status = res.data.deposit.status;
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
                    var res = await this.callApi('get', `/api/deposit/${status}/${depId}`, []);
                    Notification.customSuccess(`Your data has been ${status}`);
                  this.$router.push({name:'Diposit',params:{status:'pending'}});
                }
            })
    }
    },


}
</script>
