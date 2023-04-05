<template>
    <div>



  <header class="mb-4" style=" padding-top: 44px; height: 131px;
    background: linear-gradient(188deg,#93b9ff,#216cf7);">

    <p style="font-size: 24px;
        font-family: Futura-MediumItalic,Futura;
        font-weight: 400;
        color: #fff;
        text-align: center;
        font-style: oblique;"> FAQ</p>

  </header>

  <main>


    <div class="bg-white mx-3 px-4 py-3 rounded-4 cursor-pointer" style="margin-top: -46px;" @click="showAns(1)">
      <p class="mb-0"> <span class="fs-5 fw-bold text-primary">•</span> 1. 1. Can I withdraw funds from my wallet
        balance?</p>
    </div>

    <div class="bg-white mx-3 px-4 py-3 rounded-4 my-2" v-if="qAns==1">
      <p class="mb-0 my-2" style="color: #ce8d58;background: #fff9f3;">• Withdrawals can be made when the user balance
        reaches the minimum
        withdrawal requirement.</p>
      <p class="mb-0 my-2" style="color: #ce8d58;background: #fff9f3;">• Minimum withdrawal requirements: free EnB 920
        BDT, EnB1 230 BDT, EnB2
        575 BDT, EnB3 1725 BDT, EnB4 7475 BDT, EnB5 27600 BDT.</p>
    </div>


    <div class="bg-white mx-3 px-4 py-3 rounded-4 cursor-pointer"  @click="showAns(2)">
      <p class="mb-0"> <span class="fs-5 fw-bold text-primary">•</span> 1. 2. Can I withdraw funds from my wallet
        balance?</p>
    </div>


    <div class="bg-white mx-3 px-4 py-3 rounded-4 my-2" v-if="qAns==2">
      <p class="mb-0 my-2" style="color: #ce8d58;background: #fff9f3;">• Withdrawals can be made when the user balance
        reaches the minimum
        withdrawal requirement.</p>
      <p class="mb-0 my-2" style="color: #ce8d58;background: #fff9f3;">• Minimum withdrawal requirements: free EnB 920
        BDT, EnB1 230 BDT, EnB2
        575 BDT, EnB3 1725 BDT, EnB4 7475 BDT, EnB5 27600 BDT.</p>
    </div>
  </main>



    </div>
</template>

<script>
export default {
    data() {
        return {
            qAns:0
        }
    },
    methods: {
        showAns(id){
            if(this.qAns==id){
                this.qAns = 0;

            }else{

                this.qAns = id;
            }
        }
    },
}
</script>

<style scoped>
    .cursor-pointer{
        cursor: pointer;
    }
</style>
