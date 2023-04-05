<template>
    <div>



    <header class="header-text" style="background-color: var(--defaltColor);margin-bottom: -16px;">
        <p class="py-2 text-white"> Change Password </p>
    </header>

    <form @submit.stop.prevent="accountPassChange">
        <div class="bg-white border mb-2 mt-4 mx-4 px-3 py-1 shadow">
            <div class="input-group">
                <span class="bg-white border-0 input-group-text">Old Password :</span>
                <input type="password" v-model="accountPass.old" aria-label="First name" class="form-control border-0">
            </div>
        </div>
        <div class="bg-white border d-flex mx-4 mb-2 px-3 py-1 shadow">
            <div class="input-group">
                <span class="bg-white border-0 input-group-text">New Password :</span>
                <input type="password" v-model="accountPass.newpass"  aria-label="First name" class="form-control border-0">
            </div>
        </div>

        <div class="bg-white border mb-2 mx-4 px-3 py-1 shadow">

            <div class="input-group">
                <span class="bg-white border-0 input-group-text">Re-Password :</span>
                <input type="password" v-model="accountPass.confirm"  aria-label="First name" class="form-control border-0">
            </div>

        </div>
        <div class="w-100 text-center px-4">
            <button class="btn fw-bold rounded-0 text-white w-100" style="background-color: var(--defaltColor);">save</button>
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
