<template>
    <div>
        <slot></slot>
    </div>
</template>
<script>
export default {
     props: ['users'],
    created() {


		if (User.loggedIn()) {
            var localRole = localStorage.getItem('role');
            console.log(localRole);
            if (localRole == 'admin') {
                window.location.href = '/dashboard/adddmin'
            } else {
                window.location.href = '/dashboard/user'
            }
			// window.location.href = '/dashboard'
		}




    },

    data() {
        return {

        }
    },
    methods: {

    },
    mounted() {

    }
}
</script>
<style>

.borderleft{
    border-top-left-radius: 20px !important;
    border-bottom-left-radius: 20px !important;
}
.borderright{
    border-top-right-radius: 20px !important;
    border-bottom-right-radius: 20px !important;
}

.surePopup {
    position: fixed;
    width: 100%;
    height: 100vh;
    background: #00000080;
    z-index: 999;
    left: 0;
    top: 0;
}
.wrap-input100.validate-input {
    border: 1px solid #0000003d;
    padding: 10px 6px;
    margin: 14px 0;
}
input.input100 {
    width: 100%;
    padding: 7px 12px;
    border: 1px solid #7474742e;
}
button.login100-form-btn {
    border: 0;
    padding: 10px;
    background: red;
    color: white;
    font-size: 13px;
    width: 100%;
    border-radius: 8px;
    margin-bottom: 10px;
}

.loginIcon {
    font-size: 21px;
    padding: 8px 10px;
    border-right: 2px solid #9b9b9b;
    margin-right: 9px;
    width: 42px;
}



</style>
