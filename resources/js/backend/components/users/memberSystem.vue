<template>
    <div>

        <div class="layout-content" style="margin-bottom: 100px;">
            <div class="van-nav-bar van-nav-bar--fixed mb-5">
                <div class="van-nav-bar__content"><div class="van-nav-bar__title van-ellipsis">প্ল্যান </div></div>
            </div>
            <div class="itemslist" style="margin-top: 100px">

            <div data-v-58cf559a="" class="item card m-3 p-3" style="background: #152a66b5;" v-for="plan in row" :key="plan.id">

                <div class="card-header d-flex justify-content-between">
                    <h4>{{ plan.name }}</h4> <h6>{{ plan.start_balance }}-{{ plan.end_balance }} ৳</h6>
                </div>
                <div class="card-body">Plan Commission: {{ parseFloat(plan.comission_rate*plan.totalorder).toFixed(2) }} <span data-v-58cf559a="">%</span></div>
                <div class="card-footer"> <router-link :to="{name:'Recharge'}" data-v-58cf559a="" class="lbtn dis" style="    display: block;
    padding: 8px 4px;
    background: #0312c1;
    color: white;
    text-align: center;">Upgrade Now</router-link></div>


                    </div>

            </div>


    </div>
    </div>
</template>

<script>
export default {
    created() {
        this.plans();
    },
    data() {
        return {
            row:{},
        }
    },
    methods: {
        async plans(){
            var res = await this.callApi('get',`/api/admin/plan`,[])
            this.row = res.data
        }
    },
}
</script>
<style>

.copyPopup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  background: #000000b5;
  padding: 27px;
}
.copyPopup span {
  display: block;
  font-size: 25px;
  color: white;
}
</style>
