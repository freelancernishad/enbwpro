<template>
    <div>

        <div class="layout-content" style="margin-bottom: 100px;">
            <div class="van-nav-bar van-nav-bar--fixed mb-5">
                <div class="van-nav-bar__content"><div class="van-nav-bar__title van-ellipsis">পাসওয়ার্ড পরিবর্তন করুন</div></div>
            </div>





            <section id="account-form"  style="margin-top:60px">



<div class="container-fluid">
     <form @submit.stop.prevent="accountPassChange">
    <label> {{ $t('Old_password.value') }}</label>
    <input type="password" class="form-control" v-model="accountPass.old" required :placeholder="$t('Please_enter_the_old_password.value')">


    <label>{{ $t('New_password.value') }}</label>
    <input type="password" class="form-control" v-model="accountPass.newpass" required :placeholder="$t('Please_enter_new_login_password.value')">


    <label>{{ $t('Confirm_password.value') }}</label>
    <input type="password" class="form-control" v-model="accountPass.confirm" required :placeholder="$t('Please_enter_new_password_again.value')">

    <input type="submit" class="money-btn" style="padding: 8px 14px;font-size: 15px;color: white;" :value="$t('Confirm_to_modify_the_login_password.value')">

</form>
</div>




</section>


            </div>







    </div>
</template>

<script>
export default {
    data() {
        return {
            accountPass: {
                old: '',
                newpass: '',
                confirm: '',
            },
            withdarawPass: {
                old: '',
                newpass: ''
            }
        }
    },
    methods: {


        async accountPassChange(){
            if(this.accountPass.newpass===this.accountPass.confirm){
                var id = localStorage.getItem('userid');
                var res = await this.callApi('post', `/api/admin/user/password/change?id=${id}&type=account`, this.accountPass);
                if(res.data==0){
                    Notification.customError(`Old Password cant be macth`);
                }else{
                    Notification.customSuccess(`Password has been Updated`);
                    this.$router.push({name:'information'});

                }


            }else{
                Notification.customError(`New Password and confirm password cant be macth`);
            }
        },


        async withdrawPassChange(){
            var id = localStorage.getItem('userid');
            var res = await this.callApi('post', `/api/admin/user/password/change?id=${id}&type=withdraw`, this.withdarawPass);

                if(res.data==0){
                    Notification.customError(`Old Password cant be macth`);
                }else{
                    Notification.customSuccess(`Password has been Updated`);
                    this.$router.push({name:'information'});

                }

        }


    },


}
</script>
