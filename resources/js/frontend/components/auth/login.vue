<template>

<div>

<header class="py-4 text-center">
  <h1>Welcome to Enbw</h1>
</header>

<form @submit.prevent='login' class="px-3">
  <div class="input-group mb-3">
    <!-- <span class="input-group-text py-3" id="basic-addon1"><i class="fa-solid fa-mobile-screen"></i></span> -->

    <span class="input-group-text py-3" id="basic-addon1" @click="showAllCountry"><img style="    width: 20px;" :src="flags" alt="">{{ mobileCode }}</span>

  <input type="text" class="form-control" placeholder="Enter Your Mobile Number" @click="mobileCode==''? showAllCountry():''" v-model="form.mobile" aria-label="Username" aria-describedby="basic-addon1">
  </div>
  <div class="input-group mb-3">
    <span class="input-group-text py-3" id="basic-addon1"><i class="fa-solid fa-lock"></i></span>
    <input type="password" class="form-control" placeholder="Enter Your Password" aria-label="password" v-model="form.password" aria-describedby="basic-addon1">
  </div>
  <button class="btn btn-danger w-100 py-3 defaltColorBg" type="submit">Login</button>

 <router-link :to="{name:'register'}" class="btn text-info w-100">Register</router-link>
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


        this.countryList();
        this.addcountry('+880','https://flagcdn.com/w320/bd.png');

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
            mobileCode: '',
            flags: '',
            contryname: '',
            errors: {},
            codes: {},
            counrties: {},
            showCountry: true,
            loadLogin: false
        }
    },
    methods: {

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

