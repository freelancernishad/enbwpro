<template>
    <div>


  <section id="topbar">
    <div class="title">
              <a href="javascript:void(0)" @click="$router.go(-1)" ><i class="fa fa-angle-left"></i></a>
        <p>Recharge</p>
        <LanguageComponent/>
    </div>
  </section>

<section id="reclist">
   <div class="details">
   <div class="container-fluid">
    <p>Recharge With {{ row.name }}</p>


    <div class="head">
        <h4>Payment Info</h4>
    </div>

    <div class="patment_info">
        <ul class="list-unstyled">
            <li class="li"><span>Bkash Account</span>
            <span>{{ copyMessage }}</span></li>
        </ul>

    </div>



    <form @submit.stop.prevent="onSubmit">
        <div class="form-group">
            <label for="">Screenshot</label>

  <input class="form-control form-control-lg" id="formFileLg" type="file">
        </div>



    </form>



   </div>
   </div>
</section>



    </div>
</template>

<script>
export default {
    data(){
        return {
              row: {},
              copyMessage:'01909756552'
        }
    },
    methods: {
          async getData() {

            var res = await this.callApi('get', `/api/admin/withdraw/gateway/1`, []);
            this.row = res.data;

        },

    copyURL() {
      var Url = this.$refs.mylink;
      Url.innerHTML = window.location.href;
      console.log(Url.innerHTML)
      Url.select();
      document.execCommand("copy");
    }

    },
    mounted() {
            this.getData();

    },
}
</script>

<style>
.li {
    display: flex;
    justify-content: space-between;
}
</style>
