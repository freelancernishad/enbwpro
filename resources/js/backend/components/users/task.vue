<template>
    <div>

        <div data-v-754c2e37="" v-if="!orderpage">
                            <div data-v-754c2e37="" class="container2 mt-5">

                                <div data-v-754c2e37="" class="row" style="margin-bottom: 150px;">


                                    <div data-v-754c2e37="" class="col-md-6" v-for="(product,index) in products" :key="index" >
                                                <div data-v-754c2e37="" class="product-border">
                                                    <div data-v-754c2e37="" class="single-product-item">
                                                        <a data-v-754c2e37="" href="javascript:void(0)" class="product-name">
                                                            <img data-v-754c2e37="" :src="product.Images" class="lazy" />
                                                        </a>
                                                    </div>
                                                    <div data-v-754c2e37="" class="product-details">
                                                        <a data-v-754c2e37="" href="javascript:void(0)" class="product-name">
                                                            {{ product.title }}
                                                        </a>
                                                        <p data-v-754c2e37="" style="color: rgb(1, 169, 172);">
                                                            {{ product.price }} Tk

                                                        </p>
                                                        <div data-v-754c2e37="" class="text-center"><button data-v-754c2e37="" type="button" class="btn btn-info btn-sm btn-submit" @click="recievefun(product)">Buy Now</button></div>
                                                    </div>
                                                </div>
                                    </div>



                                </div>
                            </div>
                        </div>
























<div class="container" style="padding-top: 75px !important;width: 80%;">

        <section class="text-center position-relative" v-if="orderpage">
            <img style="width:45%" :src="taskProduct" alt="">
        </section>
        <section id="taskdetails" v-if="orderpage">
            <div class="container-fluid">
                <h4>Orders</h4>
                <div class="shadow">
                    <div class="row">
                        <div class="col-6">
                            <div class="data c">
                                <p>Product Price（TK）</p>
                                <div class="tk"> TK {{ random }} </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="data">
                                <p>Commisition</p>
                                <div class="tk"> {{ form.task_comisition }} </div>
                            </div>
                        </div>
                    </div>
                    <section class="text-center">
                        <button class="btn btn-success" @click="orderSubmit">Order Submit</button>
                        <button class="btn btn-secondary" @click="TryAgain">Try Again</button>
                    </section>
                </div>
            </div>
        </section>

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
            receive: false,
            orderpage: false,
            random: 0,
            row: {
                user:{},
            },
            form: {
                task_comisition: 0
            },
            products:{},

            taskProduct:'',
        }
    },
    methods: {
        TryAgain() {
            this.receive = false;
            this.orderpage = false;
            this.getData();
        },
        recievefun(product) {
            this.receive = true
            if (Number(this.row.user.task) < 1) {
                Notification.customError(`You Can't Complete any order Today`);
                this.receive = false
            } else {

                this.taskProduct = product.Images
                this.random = product.price

                    var task_comisition = ((this.row.user.balance * this.row.plans.comission_rate) / 100);
                    this.form.task_comisition = parseFloat(task_comisition).toFixed(2)
                    this.orderpage = true;


            }
        },
        async getData() {
            var id = localStorage.getItem('userid');



            var resb = await this.callApi('get',`/api/get/blog/list`,[])
              this.products = resb.data

            var res = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.row = res.data;
        },


    async orderSubmit(){
        this.form['user_id'] = this.row.user.id;
        var res = await this.callApi('post',`/api/admin/task`,this.form);
        if(res.data==444){

            Notification.customError(`You Can't Complete any order Today`);
        }else{

            Notification.customSuccess('Task Completed');
        }
        console.log( this.balanceshow);
        this.balanceshow = false
        this.TryAgain();

    }



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
