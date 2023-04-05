<template>
    <div>
        <div data-v-12a91c7f="" class="lastbox">
            <router-link :to="{name:'pullmoney'}" data-v-12a91c7f="" class="boxOwn">
                <div data-v-12a91c7f="" class="le">Account</div>
                <div data-v-12a91c7f="" class="big">&gt;</div>
            </router-link>
            <router-link :to="{name:'password'}" data-v-12a91c7f="" class="boxOwn">
                <div data-v-12a91c7f="" class="le">Password</div>
                <div data-v-12a91c7f="" class="big">&gt;</div>
            </router-link>
        </div>


        <Preload :Isactive="isActive" />
        <Message :Isactive="Messageactive" :Message="Message" />
    </div>
</template>

<script>
export default {
    data() {
        return {
            isActive: false,
            Messageactive: false,
            Message: "",

        };
    },
    methods: {


    },
    mounted() {

    },
};
</script>

<style scoped>
.lastbox {
    background: #fff;
    margin: 21px;
    box-shadow: 0 1px 2px #ccc;
    padding: 1rem;
}
.lastbox .boxOwn {
    display: flex;
    justify-content: space-between;
    padding: 1rem .5rem;
    box-sizing: border-box;
    border-bottom: 1px solid #eee;
}

.lastbox .boxOwn .le {
    font-size: 15px;
    font-family: PingFang SC;
    font-weight: 700;
    color: #333;
}
.lastbox .boxOwn .big {
    font-weight: 700;
    color: #ccc;
    font-size: 20px;
}


</style>
