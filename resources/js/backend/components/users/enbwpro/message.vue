<template>
    <div class="surePopup"  v-if="Isactive" >
        <div class="Preloader2">
           {{ Message }}
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
        Message: {
            type: String,
            default: ''
        },

    },

}
</script>
<style>
.Preloader2 {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    background: #000000d1;
    padding: 9px 9px;
    border-radius: 8px;
    color: white;
}
</style>
