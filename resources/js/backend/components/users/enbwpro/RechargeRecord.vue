<template>
    <div>

    <header class="header-text mb-5" style="background-color: var(--defaltColor);margin-bottom: -16px;">
        <p class="py-2 text-white">Recharge Record </p>
    </header>
<main>





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



</main>
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
            var res = await this.callApi('get', `/api/admin/deposit?id=${id}`, []);
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



<style>

.box {
    width: 349px;
    height: 175px;
    background-color: #fff;
    box-sizing: border-box;
    border-bottom-right-radius: .3rem;
    margin: auto;
    box-shadow: 0 1px 2px #ccc;
}

.box .top {
    margin-top: 15px;
    text-align: center;
    font-size: 15px;
    color: #333;
    height: 50px;
    line-height: 50px;
    border-top: 4px solid var(--defaltColor);
    border-bottom: 1px dashed #ddd;
}
.box .num {
    margin-top: 10px;
    display: flex;
}
.box .num .left {
    color: #b9b9b9;
    width: 30%;
    margin-left: 25px;
    line-height: 35px;
}
.box .num .right {
    width: 70%;
    line-height: 35px;
}
.box .num .right .ro {
    color: #e43d33;
    margin-bottom: 5px;
}
.box .num .right .rt {
    width: 80%;
    height: 25px;
    background: #f1f1f1;
    line-height: 25px;
    text-align: center;
    color: #333;
    margin-bottom: 10px;
}
.box .num .right .rth {
    color: silver;
}



</style>

