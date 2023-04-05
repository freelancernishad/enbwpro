<template>
    <div>
        <section id="orderpage">
            <div class="container-fluid">
                <h2></h2>
            </div>
        </section>
        <section id="topbar">
            <div class="title">
                <p>Orders</p>
                <LanguageComponent/>
                <router-link :to="{name:'orders'}"><img :src="$asseturl + 'frontend/img/tasks.png'" alt="logo"></router-link>
            </div>
        </section>



        <section>
            <div class="row">



                <div class="col-md-12" v-for="(vid,index) in products" :key="'vid'+index">
                    <router-link :to="{name:'UsertaskComplete',params:{id:vid.price}}">
                            <div class="card">
                                <div class="card-body">
                                    <img width="100%" :src="vid.Images" alt="">
                                </div>
                            </div>
                    </router-link>
                </div>




            </div>

        </section>








    </div>
</template>
<script>
export default {
    created() {
        this.getData();




        if(User.dateformat()[9]<=23){
            if(User.dateformat()[9]>=14){
                // this.$router.push({ name: 'Authuser' });
            }else{
                alert('কাজের সময় দুপূর ০২:০০ থেকে রাত ১২:০০ টা পর্যন্ত')
                this.$router.push({ name: 'Authuser' });
            }
        }else{
            alert('কাজের সময় দুপূর ০২:০০ থেকে রাত ১২:০০ টা পর্যন্ত')
            this.$router.push({ name: 'Authuser' });
        }





    },
    data() {
        return {
            videoId: 'lG0Ys-2d4MA',
            receive: false,
            orderpage: false,
            random: 0,
            row: {
                user:{},
            },
            form: {
                task_comisition: 0
            },
            products: {},
            taskProduct:'',
        }
    },

    methods: {


        async getData() {
            var resb = await this.callApi('get',`/api/get/blog/list`,[])
              this.products = resb.data



            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.row = res.data;
        },






    },
}
</script>
<style>
button.OrderReceive {
    border: 0;
    background: linear-gradient(90deg, #9b057a, #00c56a);
    color: white;
    display: block;
    width: 100%;
    font-size: 22px;
    padding: 8px 5px;
    margin: 16px 0px;
}
.orderamount {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    border: 2px solid #478fa5;
    background: #000000b8;
    font-size: 25px;
    padding: 11px 15px;
}
</style>

