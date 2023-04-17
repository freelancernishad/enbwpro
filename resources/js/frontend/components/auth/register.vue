<template>

<div>

    <header class="py-4 text-center">
  <h1>Welcome to united-eib3s</h1>
</header>

<form @submit.prevent="register" class="px-3">
  <div class="input-group mb-3">
    <span class="input-group-text py-3" id="basic-addon1" @click="showAllCountry"><img style="    width: 20px;" :src="flags" alt="">{{ mobileCode }}</span>
  <input type="tel" class="form-control" placeholder="Enter Your Mobile Number" @click="mobileCode==''? showAllCountry():''" v-model="form.mobile" aria-label="Username" aria-describedby="basic-addon1" minlength="10" maxlength="10" required>
  </div>
  <div class="input-group mb-3">
    <span class="input-group-text py-3 py-3" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
    <input type="password" class="form-control" placeholder="Enter Your Password" v-model="form.password" aria-label="Username" aria-describedby="basic-addon1"  required>
  </div>
  <div class="input-group mb-3">
    <span class="input-group-text py-3 py-3" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
    <input type="password" class="form-control" placeholder="Confirm Password" aria-label="Username"  v-model="form.password_confirmation" aria-describedby="basic-addon1"  required>
  </div>


  <div class="input-group mb-3">
            <span class="input-group-text" style="padding: 11px 6px;"><img style="width: 26px;" :src="$asseturl+'img/download.png'"
                    class="icon"></span>
            <input type="text" class="form-control" placeholder="Invite Code" v-model="form.ref_by" aria-label="Username"
                aria-describedby="addon-wrapping">
        </div>

  <div class="input-group mb-3">

    <span class="input-group-text py-3 py-3" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
    <input type="text" class="form-control" placeholder="SMS Code" v-model="otp"  required>

    <button type="button" class="btn fw-bold  rounded-0" @click="sentOtp" style="background: #f1f1f1; color: #333; border: 2px solid var(--defaltColor);  width: 30%;">{{ otpsent }}</button>

  </div>





  <button class="btn btn-danger w-100 py-3 defaltColorBg" type="submit">Confirm</button>

 <router-link :to="{ name: '/login' }" class="btn text-info w-100" type="button" >Login</router-link>
</form>



<Preload :Isactive="isActive"/>
    <Message :Isactive="Messageactive" :Message="Message"/>

    <div class="countrycover"  v-if="showCountry">
    <div class="countrylist">
        <div class="countryHead" @click="closeAllCountry"><span>X</span></div>
        <div class="searchcountry">
            <input type="text" placeholder="input Your Country name" @keyup="searchCountry" v-model="contryname" autocomplete="off" class="form-control">
        </div>
        <ul>
            <li v-for="(code,index) in codes" :key="index" @click="addcountry(code.idd.root+removeString(code.idd.suffixes),code.flags.png)" ><span><img :src="code.flags.png" alt=""> &nbsp;{{ code.name.common }}</span><span>{{ code.idd.root }}{{ removeString(code.idd.suffixes) }}</span></li>
        </ul>
    </div>
</div>


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

        this.countryList();
        this.addcountry('+880','https://flagcdn.com/w320/bd.png');
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
            mobileCode: '',
            flags: '',
            contryname: '',
            errors: {},
            codes: {},
            counrties: {},
            showCountry: true,
            showPassword: true,
            CshowPassword: true,
            WshowPassword: true,
        };
    },
    methods: {
        // setLang(){
        //     localStorage.setItem('language',this.$i18n.locale)
        // },
        showAllCountry(){
            this.showCountry = true
        },
        closeAllCountry(){
            this.showCountry = false
            this.contryname = '';
            this.searchCountry()
        },

        removeString(str){
            // console.log(str);
            // str = str.slice(1);
            var cCode = '';
            if(str){
                if(str.length>0){
                    cCode = str[0];
                }else{
                    cCode = str;
                }
            }else{
                cCode = '';
            }
            return cCode;
        },
        searchCountry(){
           var obj =  this.counrties.filter(item => {
                    return Object.values(item).some(value => {
                        return value.toString().toLowerCase().includes(this.contryname.toLowerCase());
                    });
                });

            this.codes = obj;

            // let obj = search(this.contryname,this.codes);
            // let obj = this.codes.find(o => o.name.common === this.contryname);
            console.log(obj)
        },


        async countryList() {
            var res = await this.callApi('get', `https://restcountries.com/v3.1/all`, []);
            // console.log(res)
            this.codes = res.data
            this.counrties = res.data
        },
        async addcountry(mobileCode,flags) {

            // console.log(country.idd.root)
            this.mobileCode = mobileCode
            this.flags = flags
            this.closeAllCountry()
        },




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
            if(!this.form.mobile){
                this.isActive = false
                this.notifiyGlobal(`Mobile Number Requeired`);
            }else{


            if(this.form.mobile.length>10){
                this.isActive = false
                this.notifiyGlobal(`Mobile Number must be contain 10 digit`);
            }else if(this.form.mobile.length<10){
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

            var otpcheck = await this.callApi('post',`/api/check/otp?mobile=${this.form.mobile}&otp=${this.otp}`,[]);

            if(otpcheck.data==0){
                this.isActive = false
                this.notifiyGlobal("Otp does not match!");
            }else{





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

                        this.form['mobileCode'] = this.mobileCode
                        this.form['flags'] = this.flags


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
        }
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





.countrycover {
    width: 100%;
    height: 100%;
    position: fixed;
    background: #0000009c;
    top: 0;
    left: 0;
}

.countrylist {
    position: fixed;
    top: 39%;
    left: 0;
    width: 100%;
    /* margin: 29px; */
    background: #ffffff;
    overflow: auto;
    border-radius: 12px;
}
.countrylist ul {
    list-style: none;
    overflow: auto;
    height: 226px;
    padding:0;
}
.countrylist ul li {
    padding: 5px 27px;
    border-bottom: 1px solid #6a6a6a;
    cursor: pointer;
    display: flex;
    justify-content: space-between;
}
.countrylist ul li:hover {
 background: #c1c1c1;
}
.countrylist ul li img {
    width:20px;
}

.countryHead {
    border-bottom: 1px solid #666666;
    padding: 11px 20px;
    text-align: right;
}

.countryHead span {
    width: 10px;
    height: 10px;
    background: red;
    padding: 3px 7px;
    border-radius: 50%;
    color: white;
    cursor: pointer;
}

.searchcountry input {
    width: 95%;
    margin: 8px auto;
    border: 1px solid black;
}











</style>
