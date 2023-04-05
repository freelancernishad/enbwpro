<template>
<span>{{ Amount }}</span>
</template>
<script>
export default {
    props: {
        MemberId: {
            type: Number,
            default:0
        },
        MemberType: {
            type: String,
            default:''
        }
    },
    data() {
        return {
            Amount:0
        }
    },
    methods: {
      async  getRecharge(){


            var res = await this.callApi('get',`/api/user/member/list/count?id=${this.MemberId}&type=${this.MemberType}`,[]);
            // console.log(res)
            this.Amount =    res.data;



        },
    },created() {
        this.getRecharge();
    },
}
</script>
