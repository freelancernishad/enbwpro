<template>
    <div>
        <div data-v-d45ef96a="" class="container">
                <div data-v-890639a6="" data-v-d45ef96a="" class="title-bar wrap" style="background: linear-gradient(var(--button1) 0%, var(--button2) 100%);">
                    <span data-v-890639a6="" class="back">
                        <img
                            data-v-890639a6=""
                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAoCAMAAAC/1ZhiAAABDlBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8v3yHCAAAAWXRSTlMAAgMFBggJCwwPEBITFRYaICEnKy0xNDY6Oz1DSElSWFpbYWVpcHJzdnp8fYGCiIyTlp2fp6+ws7e4vsDFyMzP0dLT1dfb3OPk6Ons7/Hy8/T19/n6+/z9/poeTkQAAADoSURBVBgZ3cHZIkIBFAXQXbiS4eZGKJnLPCdDEhIlUyF3//+P2H9wzosXa+GfSJ/3zgJ4TNyS3IRD2KSUYcs8Uq4DmKInytUoTDMdysUITLkupToE08IrpZKEqfBBOU3AVOxTjmFb+qIcwrY6oOzDtv5DMi7DVopJxhuw7VIGa7DtUL6X4fBOWYHHHaWWgkP2mVIfg0PUptyMwyHTotxPwSFsUh5COEw2KK1pOKTrlHYEh1SN0snCIbikdGfhMFylvMzBIVmhvOXhkDih9ArwOKL0i/A4oHzm4LFN2YNLieQifOa38vhrv41dP5FpuPPwAAAAAElFTkSuQmCC"
                            alt=""
                        />
                    </span>
                    <p data-v-890639a6="" class="title">Details of invoice</p>
                    <span data-v-890639a6="" class="right-top-btn"><span data-v-890639a6=""></span><img data-v-890639a6="" src="" alt="" style="display: none;" /></span>
                </div>
                <div data-v-d45ef96a="" id="details">
                    <div data-v-d45ef96a="" class="list th"><span data-v-d45ef96a="">Type</span><span data-v-d45ef96a="">Amount</span><span data-v-d45ef96a="">Date</span></div>
                    <div data-v-d45ef96a="">


                        <div v-for="tran in row.transiton" :key="tran.id" data-v-d45ef96a="" class="list tr"><span data-v-d45ef96a="">{{ tran.remark }}</span><span data-v-d45ef96a=""><span v-if="tran.trx_type=='increase'">+</span><span v-else>-</span> ৳{{ tran.amount }}</span><span data-v-d45ef96a="">{{ dateformatglobal(tran.created_at)[6] }}</span></div>



                    </div>
                </div>

            </div>

    </div>
</template>

<script>
export default {
    created() {
        this.list();
    },
    data() {
        return {
            row:{}
        }
    },
    methods: {
        async list(){
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get',`/api/admin/transition?id=${id}`,[]);
            this.row = res.data
        }
    },
}
</script>
<style>

.copyPopup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  background: #000000b5;
  padding: 27px;
}
.copyPopup span {
  display: block;
  font-size: 25px;
  color: white;
}
</style>
