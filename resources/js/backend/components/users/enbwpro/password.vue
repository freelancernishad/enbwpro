<template>
    <div>



<header class="header">
    <p class="header-text">Password change</p>
</header>

<form @submit.stop.prevent="accountPassChange">
    <div class="bg-white mb-2 mx-2 p-2">

        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
            <input type="password" class="form-control" placeholder="Enter Old Password" v-model="accountPass.old" aria-label="Username" aria-describedby="basic-addon1">
          </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
            <input type="password" class="form-control" placeholder="Enter new Password" v-model="accountPass.newpass"  aria-label="Username" aria-describedby="basic-addon1">
          </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
            <input type="password" class="form-control" placeholder="Enter new Password" v-model="accountPass.confirm" aria-label="Username" aria-describedby="basic-addon1">
          </div>

          <button type="submit" class="btn btn-danger mt-3 mx-1 w-100 defaltColorBg">Reset</button>


 </div>
</form>






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

            accountPass: {
                old: '',
                newpass: '',
                confirm: '',
            },


        };
    },
    methods: {


        async accountPassChange(){
            this.isActive = true;
            if(this.accountPass.newpass===this.accountPass.confirm){
                var id = localStorage.getItem('userid');
                var res = await this.callApi('post', `/api/admin/user/password/change?id=${id}&type=account`, this.accountPass);
                this.isActive = false;
                if(res.data==0){
                    this.notifiyGlobal(`Old Password cant be macth`);
                }else{
                    this.notifiyGlobal(`Password has been Updated`);
                    this.$router.push({name:'information'});
                }
            }else{
                this.isActive = false;
                this.notifiyGlobal(`New Password and confirm password cant be macth`);
            }
        },

    },
    mounted() {

    },
};
</script>
