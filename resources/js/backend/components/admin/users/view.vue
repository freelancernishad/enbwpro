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
        <div class="row mb-none-30">
            <div class="col-xl-3 col-lg-5 col-md-5 mb-30">
                <div class="card b-radius--10 overflow-hidden box--shadow1">
                    <div class="card-body p-0">
                        <div class="p-3 bg--white">
                            <div class="">
                                <img src="https://realearn69.com/assets/images/default.png" alt="profile-image"
                                    class="b-radius--10 w-100">
                            </div>
                            <div class="mt-15">
                                <h4 class="">{{ rows.user.name }}</h4>
                                <span class="text--small">Joined At <strong>{{ dateformatglobal(rows.user.created_at)[6] }}</strong></span>
                            </div>
                        </div>


 <h5 class="mb-20 text-muted p-3 ">User information</h5>
                        <ul class="list-group p-3 ">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Username <span class="font-weight-bold">{{ rows.user.username }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Status <span class="badge badge-pill bg--success">{{ rows.user.status }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Balance <span class="font-weight-bold">{{ rows.user.balance }} TAKA</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Referred By <span class="font-weight-bold"> <router-link :to="{name:'UsersView',params:{id:rows.referby}}">{{ rows.user.ref_by }}</router-link></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Total Referral <span class="font-weight-bold">
                                    <a href="#"> {{ rows.refercount  }} User</a>
                                </span>
                            </li>
                            <!-- <li class="list-group-item d-flex justify-content-between align-items-center">
                                Total Commissions <span class="font-weight-bold">
                                    <a href="#"> 0 TAKA</a>
                                </span>
                            </li> -->
                        </ul>


                    <h5 class="mb-20 text-muted p-3 ">User action</h5>
                    <a data-toggle="modal" href="#addSubModal" @click="addbalance?addbalance=false:addbalance=true" class="btn btn--success btn--shadow btn-block btn-lg">Add/Subtract Balance </a>

                    <div class="row mt-5" v-if="addbalance">


                        <div class="col-12 navchange">
                            <span @click="tabs('add')" :class="{ active: addbalanceTab }" >Add</span>
                            <span @click="tabs('Subtract')" >Subtract</span>
                            </div>


                        <div class="col-md-12" v-if="addbalanceTab">
                            <h3 class="text-center mt-3">Add Balance</h3>
                            <div class="form-group">
                                <label for="">Add Balance</label>
                                <input type="text" class="form-control" v-model="bb.add">
                            </div>
                            <button class="btn btn-info" @click="addbalanceFun('add')">Submit</button>
                        </div>


                        <div class="col-md-12" v-if="subtractbalanceTab">
                            <h3 class="text-center mt-3">Subtract Balance</h3>
                            <div class="form-group">
                                <label for="">Subtract Balance</label>
                                <input type="text" class="form-control" v-model="bb.add">
                            </div>
                            <button class="btn btn-info"  @click="addbalanceFun('subtract')">Submit</button>
                        </div>





                    </div>






                    </div>
                </div>

            </div>
            <div class="col-xl-9 col-lg-7 col-md-7 mb-30">
                <div class="row mb-none-30">
                    <div class="col-xl-3 col-lg-6 col-sm-6 mb-30">
                        <div class="dashboard-w1 bg--gradi-1 b-radius--10 box-shadow has--link">
                            <a href="javascript:void(0)" class="item--link"></a>
                            <div class="icon">
                                <i class="fa fa-credit-card"></i>
                            </div>
                            <div class="details">
                                <div class="numbers">
                                    <span class="amount">{{ rows.depositamount }}</span>
                                    <span class="currency-sign"> ৳</span>
                                </div>
                                <div class="desciption">
                                    <span>Total Deposit</span>
                                </div>
                            </div>
                        </div>
                    </div><!-- dashboard-w1 end -->
                    <div class="col-xl-3 col-lg-6 col-sm-6 mb-30">
                        <div class="dashboard-w1 bg--gradi-15 b-radius--10 box-shadow has--link">
                            <a href="javascript:void(0)" class="item--link"></a>
                            <div class="icon">
                                <i class="fa fa-wallet"></i>
                            </div>
                            <div class="details">
                                <div class="numbers">
                                    <span class="amount">{{ rows.withdrawamount }}</span>
                                    <span class="currency-sign">৳</span>
                                </div>
                                <div class="desciption">
                                    <span>Total Withdraw</span>
                                </div>
                            </div>
                        </div>
                    </div><!-- dashboard-w1 end -->
                    <div class="col-xl-3 col-lg-6 col-sm-6 mb-30">
                        <div class="dashboard-w1 bg--gradi-21 b-radius--10 box-shadow has--link">
                            <router-link :to="{name:'transitionslist',params:{userid:rows.user.id}}" style="color: white;
    display: block;
    height: 100%;" class="item--link">
                            <div class="icon">
                                <i class="la la-exchange-alt"></i>
                            </div>
                            <div class="details">
                                <div class="numbers">
                                    <span class="amount">{{ rows.withdraw.length+rows.deposit.length+rows.deposit_commisition }}</span>
                                </div>
                                <div class="desciption">
                                    <span>Total Transaction</span>
                                </div>
                            </div>
                        </router-link>
                        </div>
                    </div><!-- dashboard-w1 end -->
                    <div class="col-xl-3 col-lg-6 col-sm-6 mb-30">
                        <div class="dashboard-w1 bg--gradi-11 b-radius--10 box-shadow has--link">
                            <a href="javascript:void(0)" class="item--link"></a>
                            <div class="icon">
                                <i class="la la-exchange-alt"></i>
                            </div>
                            <div class="details">
                                <div class="numbers">
                                    <span class="amount">0</span>
                                </div>
                                <div class="desciption">
                                    <span>Total Clicks</span>
                                </div>
                            </div>
                        </div>
                    </div><!-- dashboard-w1 end -->
                </div>
                <div class="card mt-50">
                    <div class="card-body">
                        <h5 class="card-title mb-50 border-bottom pb-2">{{ rows.user.name }} Information</h5>
                        <form @submit.stop.prevent="onSubmit">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <label class="form-control-label font-weight-bold">Name <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control" type="text" v-model="rows.user.name" >
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <label class="form-control-label font-weight-bold">Email
                                            <span class="text-danger">*</span></label>
                                        <input class="form-control" type="email" v-model="rows.user.email"  >
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-control-label  font-weight-bold">Mobile Number <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control" type="text" v-model="rows.user.mobile" >
                                    </div>
                                </div>

                                <!--
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-control-label  font-weight-bold">Balance <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="balance" v-model="rows.user.balance" >
                                    </div>
                                </div>
                                -->


                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <label class="form-control-label font-weight-bold">Password <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control" type="password" v-model="rows.user.password" >
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <label class="form-control-label font-weight-bold">Status </label>
                                       <select class="form-control" v-model="rows.user.status" >
                                        <option value="active">Active</option>
                                        <option value="banned">Banned</option>
                                       </select>
                                    </div>
                                </div>




                                <div class="col-md-6" >
                                    <div class="form-group ">
                                        <label class="form-control-label font-weight-bold">Task <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control" @input="taskchange" type="text" v-model="rows.user.task"  >
                                    </div>
                                </div>



                                <div class="col-md-6" >
                                    <div class="form-group ">
                                        <label class="form-control-label font-weight-bold">Bank Name <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control"  type="text" v-model="rows.user.Bank_Name"  >
                                    </div>
                                </div>



                                <div class="col-md-6" >
                                    <div class="form-group ">
                                        <label class="form-control-label font-weight-bold">Bank Account <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control" type="text" v-model="rows.user.Bank_account"  >
                                    </div>
                                </div>




                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="submit" class="btn-fill-lmd text-light gradient-dodger-blue btn-block">Save Changes
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>




            <div class="col-md-12">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Refer List</h3>
                    </div>
                    <div class="card-body">
                        <table class="table">
                    <thead>
                        <tr>
                            <th>Username</th>

                            <!-- <th>Plan</th> -->
                            <th>Balance</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in rows.referList">
                            <td>{{ item.username }}</td>

                            <!-- <td>{{ item.plans.name }}</td> -->
                            <td>{{ item.balance }}</td>
                            <td>{{ item.status }}</td>
                            <td>

                                <router-link size="sm" :to="{ name: 'UsersView', params: { id: item.id } }"
                                class="btn btn-info mr-1 mt-1">
                                View
                            </router-link>
<!--

                            <span size="sm" @click="cancel(cancelRoute, item.id, 'active', $event.target)"
                                v-if="cancelRoute != '' && item.status=='banned'" class="btn btn-success mr-1 mt-1">
                                Active
                            </span>


                            <span size="sm" @click="cancel(cancelRoute, item.id, 'approved', $event.target)"
                                v-else-if="cancelRoute != '' && item.status=='reject'" class="btn btn-success mr-1 mt-1">
                                Approve
                            </span>

                            <span size="sm" @click="cancel(cancelRoute, item.id, canceltext, $event.target)"
                                v-else-if="cancelRoute != '' && item.status!='reject'" class="btn btn-danger mr-1 mt-1">
                            {{ canceltext.toUpperCase() }}
                            </span> -->


                            </td>
                        </tr>
                    </tbody>
                </table>
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
    data() {
        return {
            rows: {
                deposit:{},
                depositamount:0,
                user:{},
                withdraw:{},
                withdrawamount:0,
                refercount:0,
            },
            addbalance:false,
            addbalanceTab:true,
            subtractbalanceTab:false,
            bb:{
                add:0,
            },
            status: '',
            oldtask: 0,
            updatetask: 0,
        }
    },

    watch: {
        '$route': {
            handler(newValue, oldValue) {

                this.getData();

            },
            deep: true
        }
    },

    methods: {

        async tasklist(cc) {






            var id = this.$route.params.id;
            var res = await this.callApi('get', `/api/admin/task?user_id=${id}&count=${cc}`, []);
            // this.rows = res.data;
            this.rows.user.balance =this.rows.user.balance-res.data;


        },


        taskchange(){

        var task_comisition = ((this.rows.user.balance * this.rows.plans.comission_rate) / 100);
                    var cc = parseFloat(task_comisition).toFixed(2)
            this.updatetask =  this.oldtask - this.rows.user.task;

            this.tasklist(-this.updatetask);
        },



        async getData() {
            var id = this.$route.params.id;
            var res = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.rows = res.data;
            this.status = res.data.deposit.status;
            this.oldtask = this.rows.user.task;
        },

        action(status, depId) {
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
                    this.$router.push({ name: 'Diposit', params: { status: 'pending' } });
                }
            })
        },


        tabs(name){

            if(name=='add'){
                if(this.addbalanceTab){
                    if(!this.subtractbalanceTab){

                    }else{

                        this.addbalanceTab=false;
                    }
                    // this.subtractbalanceTab=true
                }else{

                    this.addbalanceTab=true

                }
                this.subtractbalanceTab=false
            }else

            if(name=='Subtract'){



                if(this.subtractbalanceTab){

                    if(this.subtractbalanceTab){

                    }else{
                        this.subtractbalanceTab=false

                    }

                    // this.addbalanceTab=true;
                }else{
                    this.subtractbalanceTab=true

                }
                this.addbalanceTab=false
            }

        },

        async onSubmit(){
            var id = this.$route.params.id;
            var res = await this.callApi('put', `/api/admin/user/${id}?taskcc=${-this.updatetask}`, this.rows.user);
             Notification.customSuccess(`Your data has been Updated`);
            this.getData();
            this.$router.push({name:'Userslist',params:{status:'all'}});
        },

        async addbalanceFun(name){
            var id = this.$route.params.id;
            if(name=='add'){
                var res = await this.callApi('post', `/api/admin/balance/${id}?name=${name}`, this.bb);
            }else if(name=='subtract'){
                var res = await this.callApi('post', `/api/admin/balance/${id}?name=${name}`, this.bb);
            }

            Notification.customSuccess(`Your data has been Updated`);
            this.getData();
            this.addbalance=false;
            this.addbalanceTab=true;
            this.subtractbalanceTab=false;
            this.bb.add=0
        }

    },
}
</script>

<style scoped>

.dashboard-w1 {
    background: #3f3186;
    padding: 0 10px;
    color: white;
    height: 100px;
    margin-bottom: 10px;
}

a.btn.btn--success.btn--shadow.btn-block.btn-lg {
    border: 1px solid;
}

    .col-12.navchange {
    display: flex;
    justify-content: space-around;
}

.col-12.navchange span {
    border: 1px solid #00a1ff;
    padding: 0px 38px;
    cursor: pointer;
}
</style>
