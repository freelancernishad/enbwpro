<template>

<div>

<header class="py-4 text-center">
  <h1>Welcome to Enbw</h1>
</header>

<form @submit.prevent='login' class="px-3">
  <div class="input-group mb-3">
    <span class="input-group-text py-3" id="basic-addon1"><i class="fa-solid fa-mobile-screen"></i></span>
  <input type="text" class="form-control" placeholder="Enter Your Mobile Number" v-model="form.mobile" aria-label="Username" aria-describedby="basic-addon1">
  </div>
  <div class="input-group mb-3">
    <span class="input-group-text py-3" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
    <input type="password" class="form-control" placeholder="Enter Your Password" aria-label="password" v-model="form.password" aria-describedby="basic-addon1">
  </div>
  <button class="btn btn-danger w-100 py-3" type="submit">Login</button>
 <div class="float-end m-2">
  <input class="me-1" type="checkbox">Show Password
 </div>
 <router-link :to="{name:'register'}" class="btn text-info w-100">Register</router-link>
</form>

<Preload :Isactive="isActive"/>
    <Message :Isactive="Messageactive" :Message="Message"/>
</div>

</template>

<script>
export default {

    created() {

        this.addcountry();
        this.countryList();
    },

    data() {
        return {
            isActive:false,
            PackPurchase:false,
            Messageactive:false,
            Message:'',


            emailLogin: "",
            passwordLogin: "",
            emailReg: "",
            passwordReg: "",
            confirmReg: "",
            emptyFields: false,
            form: {
                mobile: '',
                password: ''
            },
            country: '+880',
            mobileCode: '',
            errors: {},
            codes: {},
            loadLogin: false
        }
    },
    methods: {


        async countryList() {
            var res = await this.callApi('get', `${this.$asseturl}CountryCodes.json`, []);
            // console.log(res)
            this.codes = res.data
        },
        async addcountry() {
            this.mobileCode = this.country
        },

        login() {
            this.isActive =true;

            if (this.form.mobile == "" || this.form.password == "") {
                this.emptyFields = true;
            } else {

                axios.post('/login', this.form)
                    .then(res => {


                        if (res.data == 0) {
                            this.isActive = false
                            this.notifiyGlobal('Invalid credentials');
                        } else if (res.data == 422) {
                            this.isActive = false
                            this.notifiyGlobal('Banded!');
                        } else if (res.data == 444) {
                            this.isActive = false
                            this.notifiyGlobal('You Cant Login Multiple account same device!');
                            localStorage.setItem('dmdevice', 1)
                        } else {




                            localStorage.setItem('dmdevice', 1)
                            User.responseAfterLogin(res)
                            if (res.data.role == 'admin') {
                                window.location.href = '/dashboard/adddmin'
                            } else {
                                window.location.href = '/dashboard/user'
                            }
                            this.isActive = false
                            this.notifiyGlobal('Success');

                            // this.$router.push({name: 'home'})
                            // window.location.href = '/dashboard'

                        }
                    })
                    .catch(error => this.errors = error.response.data.errors)



            }





        },


        blur(id) {
            const child = document.getElementById(id);
            if (this.form[id] == '') {
                child.parentNode.classList.remove("blursuccess");
                child.parentNode.classList.add("blurerror");
            } else {
                child.parentNode.classList.remove("blurerror");
                child.parentNode.classList.add("blursuccess");
            }

        },




    }
}
</script>

<style lang="css" scoped>





.languagechange {
    width: 100px;
    float: right;
}

section.vh-100 {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
}

.blurerror input {
    border: 1px solid red !important;
}

.blurerror label {
    color: red !important;
}

.blursuccess input {
    border: 1px solid green !important;
}

.blursuccess label {
    color: green !important;
}

.divider:after,
.divider:before {
    content: "";
    flex: 1;
    height: 1px;
    background: #eee;
}

*,
*:focus {
    outline: none
}

/* .form{
  width: 500px;
  margin: 0 auto;
  margin-top: 150px;
  font-family: sans-serif;
  background: #fff
} */
.form-item {
    position: relative;
    margin-bottom: 15px
}

.form-item input {
    display: block;
    width: 100%;
    height: 40px;
    background: transparent;
    border: solid 1px #ccc;
    transition: all .3s ease;
    padding: 0 15px
}

.form-item input:focus {
    border-color: blue
}

.form-item label {
    position: absolute;
    cursor: text;
    z-index: 2;
    top: 13px;
    left: 10px;
    font-size: 12px;
    font-weight: bold;
    background: #fff;
    padding: 0 10px;
    color: #999;
    transition: all .3s ease
}

.form-item input:focus+label,
.form-item input:valid+label {
    font-size: 11px;
    top: -5px
}

.form-item input:focus+label {
    color: blue
}
</style>

