<template>
    <div>








  <header class="text-center">
    <img :src="$asseturl+'Recharge/onepayfailed.png'" alt="" style=" width: 71px;margin-top: 34px;">
</header>
<main class="container fw-bold mt-5">
   <div class="text-center">
    <p style="font-size: 20px;font-weight: 600;">অর্ডার পেমেন্ট অস্বাভাবিক</p>
   </div>
<a href="/dashboard/user" style="width: 100%;margin: 20px 0px;background: black;color: white;padding: 8px 4px;border-radius: 30px;display: block;text-align: center;">অর্ডার বন্ধ করুন</a>

</main>







    </div>
</template>

<script>
export default {
    data(){
        return {
        }
    },
    methods: {
    },
    mounted() {

    },
}
</script>

<style scoped>
body {
    background-color: #ffffff !important;
}
.li {
    display: flex;
    justify-content: space-between;
}
.onepaynumberInput:focus {
    box-shadow: 0px 0px 0px black !important;
}
.onepaynumberInput {
    border: 1px solid black !important;
    border-radius: 26px !important;
    margin: 10px 0px !important;
}
.heeeeee {
    width: 100%;
    height: 45px;
    font-size: 16px;
    color: #4a4a4a;
    text-align: center;
    padding-top: 8px;
    font-weight: 700;
}
</style>
