<template>
    <div>
        <div class="layout-content" style="margin-bottom: 100px;">
            <div class="van-nav-bar van-nav-bar--fixed">
                <div class="van-nav-bar__content"><div class="van-nav-bar__title van-ellipsis text-center">টপ-আপ ইতিহাস </div></div>
            </div>


        <section id="listmenus"  style="margin-top: 60px;">
            <div role="feed" class="van-list row" aria-busy="true">
                <div class="recordDiv col-md-12" v-for="rech in row" :key="'rech'+rech.id">
                    <div class="card text-white" style="background: #483b2ec7;font-size: 16px;margin-bottom: 5px;padding: 0 6px;">

                            <p style="color:white;margin: 0;">{{ dateformatglobal(rech.created_at)[6] }}</p>
                            <p style="color:white;margin: 0;">ট্রান্সিশন নম্বর  : {{ rech.trx }}</p>
                            <p style="color:white;margin: 0;">পরিমাণ  : {{ rech.amount }}</p>
                            <p style="color:white;margin: 0;">অবস্থা : {{ rech.status }}</p>

                    </div>
                </div>
            </div>
            <!-- <div class="not-found">No Data</div> -->
        </section>
    </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            row: {},
        }
    },
    methods: {
        generator() {
            return '#' + (Math.random() * 0xFFFFFF << 0).toString(16);
        },
        async getData() {
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/admin/deposit?id=${id}`, []);
            this.row = res.data;
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
<style>

.van-list.row {
    margin: 0 !important;
}
</style>
