<template>
    <div class="surePopup"  v-if="Isactive" >
        <div class="Preloader">
            <img width="40px" :src="$asseturl+'loading-gif.gif'"/>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        Isactive: {
            type: Boolean,
            default: false
        },

    },

}
</script>
<style>
.Preloader {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    background: #00000085;
    padding: 25px 25px;
    border-radius: 8px;
}
</style>
