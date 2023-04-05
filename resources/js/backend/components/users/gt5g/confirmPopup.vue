<template>
    <div>
    <div class="surePopup" v-if="PackPurchase">
        <div class="uni-mask"></div>
        <div class="uni-modal">
            <div class="uni-modal__bd">{{ Title }}</div>
            <div class="uni-modal__ft">
                <div class="uni-modal__btn uni-modal__btn_default" style="color: rgb(0, 0, 0);" @click="$emit('event-close')"> Cancel </div>
                <div class="uni-modal__btn uni-modal__btn_primary" style="color: rgb(0, 122, 255);" @click="$emit('event-submit')"> OK </div>
            </div>
        </div>
    </div>
</div>
</template>


<script>
export default {
    props: {
        PackPurchase: {
            type: Boolean,
            default: false
        },

        Title: {
            type: String,
            default: '',
        },
    },
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

