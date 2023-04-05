<template>


<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">










        <form @submit.prevent='login'>
      <div class="form">
  <h1 class="text-center mb-5">Login</h1>
  <div class="form-item" id="inputEmail">
    <input type="text" id="email" v-model="form.email" @blur="blur('email')" @input="blur('email')" autocomplete="off" required >
    <label for="Email">Email</label>
  </div>

  <div class="form-item">
    <input type="password" id="password" v-model="form.password" @blur="blur('password')" @input="blur('password')"   autocomplete="off" required>
    <label for="password">Password</label>
  </div>

</div>





          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3">
                Remember me
              </label>
            </div>

          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-primary btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>

          </div>

        </form>
      </div>
    </div>
  </div>

</section>









</template>

<script>
export default {

	created(){
		if (User.loggedIn()) {
            if(localStorage.getItem('role')=='admin'){
             window.location.href = '/dashboard/adddmin'
            }else{
              window.location.href = '/dashboard/user'
            }
			// window.location.href = '/dashboard'
		}
	},

	data () {
		return {

            emailLogin: "",
            passwordLogin: "",
            emailReg: "",
            passwordReg: "",
            confirmReg: "",
            emptyFields: false,
			form: {
				email: '',
				password: ''
			},
			errors:{}
		}
	},
	methods:{
		login(){

         if (this.form.email == "" || this.form.password == "") {
            this.emptyFields = true;
         } else {

       		axios.post('/login', this.form)
			.then(res => {
                User.responseAfterLogin(res)
                if(res.data.role=='admin'){
                    window.location.href = '/dashboard/adddmin'
                }else{
                    window.location.href = '/dashboard/user'
                }

                Notification.customSuccess('Signed in successfully Complete');

				// this.$router.push({name: 'home'})
              	// window.location.href = '/dashboard'

                console.log(res)
			})
			.catch(error => this.errors = error.response.data.errors)



         }





		},


        blur(id){
        const child = document.getElementById(id);
            if(this.form[id]==''){
                child.parentNode.classList.remove("blursuccess");
                child.parentNode.classList.add("blurerror");
            }else{
                child.parentNode.classList.remove("blurerror");
                child.parentNode.classList.add("blursuccess");
            }

        },




	}
}
</script>

<style lang="css" scoped>

section.vh-100 {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    width: 100%;
}
.blurerror input {
    border: 1px solid red !important;
}
.blurerror label {
    color:red !important;
}
.blursuccess input {
    border: 1px solid green !important;
}
.blursuccess label {
    color:green !important;
}
.divider:after,
.divider:before {
content: "";
flex: 1;
height: 1px;
background: #eee;
}
*,
*:focus{outline: none}

/* .form{
  width: 500px;
  margin: 0 auto;
  margin-top: 150px;
  font-family: sans-serif;
  background: #fff
} */
.form-item{
  position: relative;
  margin-bottom: 15px
}
.form-item input{
  display: block;
  width: 100%;
  height: 40px;
  background: transparent;
  border: solid 1px #ccc;
  transition: all .3s ease;
  padding: 0 15px
}
.form-item input:focus{
  border-color: blue
}
.form-item label{
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
.form-item input:focus + label,
.form-item input:valid + label{
  font-size: 11px;
  top: -5px
}
.form-item input:focus + label{
  color: blue
}

</style>

