<template>

<div>

    <header class="py-4 text-center">
  <h1>Welcome to Enbw</h1>
</header>

<form @submit.prevent="register" class="px-3">
  <div class="input-group mb-3">
    <span class="input-group-text py-3 py-3" id="basic-addon1"><i class="fa-solid fa-mobile-screen"></i></span>
  <input type="text" class="form-control" placeholder="Enter Your Mobile Number"  v-model="form.mobile" aria-label="Username" aria-describedby="basic-addon1">
  </div>
  <div class="input-group mb-3">
    <span class="input-group-text py-3 py-3" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
    <input type="password" class="form-control" placeholder="Enter Your Password" v-model="form.password" aria-label="Username" aria-describedby="basic-addon1">
  </div>
  <div class="input-group mb-3">
    <span class="input-group-text py-3 py-3" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
    <input type="password" class="form-control" placeholder="Confirm Password" aria-label="Username"  v-model="form.password_confirmation" aria-describedby="basic-addon1">
  </div>
  <button class="btn btn-danger w-100 py-3" type="submit">Confirm</button>
 <div class="float-end m-2">
  <input class="me-1" type="checkbox">Show Password
 </div>
 <router-link :to="{ name: '/login' }" class="btn text-info w-100" type="button" >Login</router-link>
</form>



<Preload :Isactive="isActive"/>
    <Message :Isactive="Messageactive" :Message="Message"/>


</div>

</template>
<script>
export default {
    created() {
        this.genaratedCaptcha = Math.floor(Math.random() * (9999 - 1111) + 1111);
        // if (User.loggedIn()) {
        //     this.$router.push({ name: 'home' })
        // }
        // localStorage.setItem('dmdevice',1)
        // console.log(this.$route.query.ref);
        if (this.$route.query.ref) {
            this.form.ref_by = this.$route.query.ref;
            this.refer = 1;
        } else {
            this.form.ref_by = "16346";
            this.refercheck();
        }
        this.form.country = "+880";
        this.countryList();
        this.addcountry();
    },
    data() {
        return {

            isActive:false,
            PackPurchase:false,
            Messageactive:false,
            Message:'',
            otp:'',


            btndis: true,
            captcha: "",
            otpsent: "Send",
            genaratedCaptcha: "",
            mobileCode: null,
            form: {
                country: null,
                name: "New Customer",
                username: null,
                mobile: null,
                password: null,
                password_confirmation: null,
                withdrawpass: "123456",
                ref_by: null,
            },
            usernameMatch: 1,
            refer: 0,
            errors: {},
            codes: {},
            showPassword: true,
            CshowPassword: true,
            WshowPassword: true,
        };
    },
    methods: {
        // setLang(){
        //     localStorage.setItem('language',this.$i18n.locale)
        // },


        checkstart(){
            if(this.form.mobile!=''){
                if(this.form.mobile.charAt(0)==1){
                }else{
                    this.form.mobile = '';
                    this.notifiyGlobal(`Mobile number must be start '1'`);
                }
            }
        },

        async sentOtp(){

            this.isActive = true
            if(this.form.mobile.length>10){
                this.isActive = false
                this.notifiyGlobal(`Mobile Number must be contain 10 digit`);
            }else{


                if(this.form.mobile.charAt(0)==1){
                    var res = await this.callApi('post',`/api/sent/otp?mobile=${this.form.mobile}`,[]);
                    this.isActive = false
                    this.otpsent ='Sent Again';

                    if(res.data=='cross limit'){
                        this.notifiyGlobal(`You can't sent any otp today!`);
                    }else if(res.data=='time not finished'){
                        this.notifiyGlobal(`Please Wait for sent again Otp`);
                    }else{

                        this.notifiyGlobal(`Otp Successfully sent you mobile number`);
                    }

                }else{
                    this.isActive = false
                    this.notifiyGlobal(`Mobile number must be start '1'`);
                }

        }


        },






        async usernamecheck() {
            if (this.form.username == "") {
                this.usernameMatch = 0;
            } else {
                var res = await this.callApi(
                    "get",
                    `/api/count/username/check?username=${this.form.username}`,
                    []
                );
                if (res.data == 0) {
                    this.usernameMatch = 2;
                } else {
                    this.usernameMatch = 1;
                }
            }
        },
        async countryList() {
            var res = await this.callApi(
                "get",
                `${this.$asseturl}CountryCodes.json`,
                []
            );
            // console.log(res)
            this.codes = res.data;
        },
        async addcountry() {
            // this.form.mobile = this.form.country
            this.mobileCode = this.form.country;
        },
        async refercheck() {
            if (this.form.ref_by == "") {
                this.refer = 0;
            } else {
                var res = await this.callApi(
                    "get",
                    `/api/count/username/check?username=${this.form.ref_by}`,
                    []
                );
                if (res.data == 0) {
                    this.refer = 2;
                } else {
                    this.refer = 1;
                }
            }
        },
      async  register() {
            this.isActive = true

            // var otpcheck = await this.callApi('post',`/api/check/otp?mobile=${this.form.mobile}&otp=${this.otp}`,[]);

            // if(otpcheck.data==0){
            //     this.isActive = false
            //     this.notifiyGlobal("Otp does not match!");
            // }else{





            // if(localStorage.getItem('dmdevice')){
            //     this.notifiyGlobal(`This device has already have an account!`);
            // }else{
            // if (this.genaratedCaptcha === Number(this.captcha)) {
                // if(this.usernameMatch!=2){
                // this.notifiyGlobal('please Enter deferent username');
                // }else{
                if (this.refer != 1) {
                    this.notifiyGlobal("Opps,Refer code is Invalid");
                } else {
                    if (this.form.password === this.form.password_confirmation) {
                        axios
                            .post("api/auth/register", this.form)
                            .then((res) => {
                                this.isActive = false
                                if (res.data == 422) {
                                    this.notifiyGlobal("This Phone Number Already Exist");
                                } else if (res.data == 444) {

                                    this.notifiyGlobal(
                                        `This device has already have an account!`
                                    );
                                    localStorage.setItem("dmdevice", 1);
                                } else {
                                    // console.log(res)
                                    if (res.status == 201) {
                                        this.notifiyGlobal("Registration Success");
                                        localStorage.setItem("dmdevice", 1);
                                        this.$router.push({ name: "/login" });
                                    } else {
                                        this.notifiyGlobal(
                                            "Something want wrong. Please Try again or contact with admin"
                                        );
                                    }
                                    // User.responseAfterLogin(res)
                                }
                                // console.log(res.data)
                                // User.responseAfterLogin(res)
                            })
                            .catch((error) => (this.errors = error.response.data.errors));
                    } else {
                        this.notifiyGlobal(
                            "Password and Confirm password does not match"
                        );
                    }
                }
                // }
            // } else {
            //     this.isActive = false
            //     this.notifiyGlobal("Captcha does not match!");
            // }
            // }
        // }
        },
    },
};
</script>
<style lang="css" scoped>
.languagechange {
    width: 100px;
    float: right;
}

button.button {
    padding: 7px 5px;
}
</style>
