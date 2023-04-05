<template>
    <div>

        <header class="header-text mb-5" style="background-color: var(--defaltColor);margin-bottom: -16px;">
        <p class="py-2 text-white">  Withdrawal Record   </p>
    </header>

    <div class="box"  v-for="rech in lists" :key="'rech'+rech.id">
        <div class="top">Order number: {{ rech.mer_trx }}</div>
        <div class="num">

            <div class="left">
                <div class="lo">Amount</div>
                <div class="lt">State</div>
                <div class="lth">Date</div>
            </div>
            <div class="right">
                <div class="ro">{{ rech.amount }}</div>
                <div class="rt" style="flex-wrap: nowrap;">{{ rech.status }}</div>
                <div  class="rth">{{ dateformatglobal(rech.created_at)[6] }}</div>
            </div>
        </div>
    </div>

    <Preload :Isactive="isActive"/>


    </div>
</template>

<script>
export default {
    data() {
        return {
            isActive:true,
            Messageactive:false,
            Message:'',
            lists: {},
        }
    },
    methods: {

        notifiy(mess){
            this.Messageactive = true
            this.Message = mess;
            setTimeout(() => {
                this.Messageactive = false
            }, 1000);
        },


        generator() {
            return '#' + (Math.random() * 0xFFFFFF << 0).toString(16);
        },
        async getData() {
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/admin/withdrawal?id=${id}`, []);
            this.lists = res.data;
            this.isActive = false
        },
        copyURL() {
            var Url = this.$refs.mylink;
            Url.innerHTML = window.location.href;
            console.log(Url.innerHTML)
            Url.select();
            document.execCommand("copy");
        }
    },
    mounted() {
        this.getData();
    },
}
</script>
