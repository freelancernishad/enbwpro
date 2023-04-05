<template>
    <div>
        <header class="header-text defaltColorBg" style="margin-bottom: -16px;">
        <p class="py-2 text-white"> Balance Record </p>
    </header>

    <main>
        <section class="bg-white mt-4 mx-3 px-3 topp">
            <div>
                <p class="mt-2">Current Balance</p>
            </div>

            <div>
                <p class="pb-3 fs-3 fw-bold text-center w-100">৳{{ parseFloat(row.user.balance).toFixed(2) }}</p>
            </div>

        </section>
        <section class=" mt-4 mx-3">

            <div class="d-flex justify-content-around tabClass">
                <p class="fs-6 mb-2" :class="{ 'Bactive':trxType == 'increase' }" @click="getData('increase')">My income</p>
                <p class="fs-6 mb-2" :class="{ 'Bactive':trxType == 'decrease' }"  @click="getData('decrease')">Subordinate</p>
            </div>



            <div class="border-bottom d-flex justify-content-between mb-2 mt-1 pb-2" v-for="(list,index) in lists" :key="index">
                <div>
                    <p>{{ list.remark }}</p>
                    <p><span v-if="trxType=='increase'">+</span><span v-else>-</span> {{ parseFloat(list.amount).toFixed(2) }}</p>
                </div>
                <div>
                    <p>{{ dateformatglobal(list.created_at)[6] }}</p>
                    <p>Balance {{ parseFloat(list.post_balance).toFixed(2) }}</p>
                </div>

            </div>





        </section>
    </main>
    <Preload :Isactive="isActive"/>
    <Message :Isactive="Messageactive" :Message="Message" />
    </div>
</template>

<script>


export default {
    data(){
        return {
            isActive:true,
            lists:{},
            trxType:''
        }
    },
    methods: {

        async getData(trx_type='increase') {
            this.trxType = trx_type
            this.isActive = true;
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/get/transitions?id=${id}&trx_type=${trx_type}`, []);
            this.lists = res.data;
            this.isActive = false;
        },



    },
    mounted() {
        this.getData();
    },
}
</script>

<style>

.tabClass p {
    width: 50%;
    text-align: center;
    cursor: pointer;
}

.tabClass p.Bactive {
    border-bottom: 4px solid var(--defaltColor);
}
</style>
