<template>
    <div>


        <header class="header">
    <p class="header-text">Records</p>
        </header>
<section>

    <div class="bg-white mb-2 mx-2 p-2" v-for="(list,index) in lists" :key="index">
        <div class="border-0 d-flex description fs-6 justify-content-between mx-2 pt-3">
            <p>{{ textConvert(list.remark) }}</p>
            <p>{{ parseFloat(list.amount).toFixed(2) }} BDT</p>
        </div>
        <div class="description lh-1 px-2">
            <p> <i class="fa-solid fa-circle"></i> User ID: {{ list.users.username }}</p>
            <p> <i class="fa-solid fa-circle"></i> {{ dateformatglobal(list.created_at)[6] }}</p>
        </div>
    </div>

</section>


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

        async getData() {

            this.isActive = true;
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/get/transitions?id=${id}`, []);
            this.lists = res.data;
            this.isActive = false;
        },



    },
    mounted() {
        this.getData();
    },
}
</script>
