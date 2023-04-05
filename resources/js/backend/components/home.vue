<template>
    <div>
  <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Admin Dashboard</h3>
                    <ul>
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>Admin</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->

<!-- Dashboard summery Start Here -->
                <div class="row gutters-20">


                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">



                                <div class="col-12">

         <div class="item-icon bg-light-green ">
                                 <i class="flaticon-multiple-users-silhouette text-blue"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Total Users</div>
                                        <div class="item-number"><span></span><span  >{{rowss.totalUser}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">



                                <div class="col-12">

         <div class="item-icon bg-light-green ">
                                 <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Total Deposit</div>
                                        <div class="item-number"><span>৳</span><span  >{{rowss.totalDeposit}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="item-icon bg-light-blue">
                                     <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Total Withdrawals</div>
                                        <div class="item-number"><span>৳</span><span  >{{rowss.totalWithdrawal}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="item-icon bg-light-yellow">
                                        <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Today Deposit</div>
                                        <div class="item-number"><span>৳</span><span  >{{rowss.todayApprovedDeposit}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="item-icon bg-light-red">
                                        <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Today Withdrawals</div>
                                        <div class="item-number"><span>৳</span><span  >{{rowss.todayApprovedWithdrawal}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="item-icon bg-light-red">
                                        <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Pending Deposit</div>
                                        <div class="item-number"><span  >{{rowss.todayPendingDepositCount}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="item-icon bg-light-red">
                                        <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Pending Withdrawals</div>
                                        <div class="item-number"><span  >{{rowss.todayPendingWithdrawalCount}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="item-icon bg-light-red">
                                        <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Pending Deposit Amount</div>
                                        <div class="item-number"><span>৳</span><span  >{{rowss.todayPendingDepositAmount}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="item-icon bg-light-red">
                                        <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">Pending Withdrawal Amount</div>
                                        <div class="item-number"><span>৳</span><span  >{{rowss.todayPendingWithdrawalAmount}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="item-icon bg-light-red">
                                        <i class="flaticon-money text-red"></i>
                                    </div>

                                    <div class="item-content">
                                        <div class="item-title">SMS BALANCE</div>
                                        <div class="item-number"><span>৳</span><span  >{{smsDetails.remaining_unit}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>







                </div>
                <!-- Dashboard summery End Here -->
                <div class="row">

                    <h3 class="text-center w-100">Deposit</h3>
                   <Bar :chart-options="chartOptions" :chart-data="chartData" :chart-id="chartId"
                    :dataset-id-key="datasetIdKey" :plugins="plugins" :css-classes="cssClasses" :styles="styles"
                    style="width:100% !important" :height="height" />

                    <h3 class="text-center w-100">Withdrawal</h3>
                   <Bar :chart-options="chartOptions" :chart-data="chartDataW" :chart-id="chartId"
                    :dataset-id-key="datasetIdKey" :plugins="plugins" :css-classes="cssClasses" :styles="styles"
                    style="width:100% !important" :height="height" />

                </div>

    </div>
</template>
<script>
// import { mapState,mapActions } from 'vuex';

export default {
      props: {
        chartId: {
            type: String,
            default: "bar-chart",
        },
        datasetIdKey: {
            type: String,
            default: "label",
        },
        width: {
            type: Number,
            default: 1200,
        },
        height: {
            type: Number,
            default: 300,
        },
        cssClasses: {
            default: "",
            type: String,
        },
        styles: {
            type: Object,
            default: () => { },
        },
        plugins: {
            type: Object,
            default: () => { },
        },
        },
        computed:{
                // users(){
                //    return this.$store.state.Users
                // }


        },
    async created() {
            //   const res = await this.callApi('POST', '/api/user', {});




        // if (!User.loggedIn()) {
        //     this.$router.push({ name: "/login" });
        // }
    },

    data() {
        return {
            rowss:{},
             chartData: {
                labels: [],
                datasets: [],
            },
             chartDataW: {
                labels: [],
                datasets: [],
            },
            chartOptions: {
                responsive: true,
                maintainAspectRatio: false,
            },
            smsDetails:{},

        };
    },
    mounted() {
        this.getdata()
        this.getSmsNoc()

    },
    methods: {


        async getSmsNoc(){
            var res = await this.callApi('get','/api/get/balance',[]);
            this.smsDetails = res.data.data;
        },

        async getdata(){
            var res = await this.callApi('get',`/api/backend/dashboard`,[]);
            this.rowss = res.data;

// console.log(res.data.dpChart.reports,res.data.dpChart.allmonth)

            this.chartData.datasets = [res.data.dpChart.reports];
            this.chartData.labels = res.data.dpChart.allmonth;
            this.chartDataW.datasets = [res.data.WChart.reports];
            this.chartDataW.labels = res.data.WChart.allmonth;
        }
    },
};





</script>
<style lang="css" scoped>

</style>
