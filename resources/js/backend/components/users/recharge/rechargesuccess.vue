<template>
    <div>







  <header class="text-center">
    <img :src="$asseturl+'Recharge/onepaysuccess.png'" alt="" style=" width: 71px;margin-top: 34px;">
</header>
<main class="container fw-bold mt-5">
   <div class="text-center">
    <p style="font-size: 16px;font-weight: 600;line-height: 36px;">অর্ডার পর্যালোচনা করা হচ্ছে এবং পর্যালোচনা ৩০ মিনিটের মধ্যে হবে বলে আসা করা হচ্ছে</p>
   </div>
    <p class="orderDetials mt-5">অর্ডার নাম্বর : {{ form.orderid }}</p>
    <p class="orderDetials">অর্ডারের পরিমাণ : {{ form.amount }} TK </p>
<a href="/dashboard/user" style="width: 100%;margin: 20px 0px;background: black;color: white;padding: 8px 4px;border-radius: 30px;display: block;text-align: center;">অর্ডার বন্ধ করুন</a>

</main>







    </div>
</template>

<script>
export default {
    data(){
        return {
            form:{}
        }
    },
    methods: {
    },
    mounted() {
        this.form = JSON.parse(localStorage.getItem('rechargeData'));
    },
}
</script>

<style scoped>
body {
    background-color: #ffffff !important;
}
p.orderDetials {
    font-size: 12px;
    font-weight: 500;
    margin-top: 11px;
}
</style>
