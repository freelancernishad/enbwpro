<template>
    <div>




        <header>

       <div class="myAcc">

           <div class="align-items-center bg-white d-flex gap-3 p-3 rounded-4">
               <img src="http://m.ppppssss.com/static/hrzt/profile/avatar.png" alt="" style="width: 62px;">
               <div>
                   <p class="mb-1" style="font-size: 16px;font-weight: bold;">{{ row.user.mobile }}</p>
                 <div class="align-items-center d-flex gap-2">
                   <div>{{ row.user.username }}</div>
                   <div><img src="http://m.ppppssss.com/static/hrzt/vip/vip0.png" alt="" style="width: 50px;"></div>
                 </div>
               </div>
           </div>

<!--  -->

<div class="d-flex justify-content-between mx-2 fw-bold mt-3">

   <div>
       <p class="mb-1 text-white">{{ parseFloat(row.user.balance).toFixed(2) }}</p>
       <p class = "text-dark-emphasis">Balance</p>
   </div>
   <!-- <div>
       <p class="mb-1 text-white">00.00</p>
       <p class = "text-dark-emphasis">Balance</p>
   </div>
   <div>
       <p class="mb-1 text-white">00.00</p>
       <p class = "text-dark-emphasis">Balance</p>
   </div> -->
   <div>
       <p class="mb-1 text-white">{{ parseFloat(row.taskearn).toFixed(2) }}</p>
       <p class = "text-dark-emphasis">Earn</p>
   </div>
</div>
       </div>
   </header>
<main class="mx-3 my-4">

<div class="d-flex justify-content-between mb-4">
<!--  -->
<router-link :to="{name:'bankAccount'}"  class="card py-3 border-0 text-center accItemList" >
    <i class="fa-solid fa-building-columns"></i>
   <div class="card-body">
     <p class="card-text text-center">Bank Account </p>
   </div>
 </router-link>
<router-link :to="{name:'teamMember'}"  class="card py-3 border-0 text-center accItemList" >
    <i class="fa-solid fa-chart-pie"></i>
   <div class="card-body">
     <p class="card-text text-center">Team Report </p>
   </div>
 </router-link>
<router-link :to="{name:'invite'}"  class="card py-3 border-0 text-center accItemList" >
    <i class="fa-solid fa-share-nodes"></i>
   <div class="card-body">
     <p class="card-text text-center">Invite Friend </p>
   </div>
 </router-link>


</div>
<div class="d-flex justify-content-between mb-4">
<!--  -->
<router-link :to="{name:'orders'}"  class="card py-3 border-0 text-center accItemList" >
    <i class="fa-solid fa-list"></i>
   <div class="card-body">
     <p class="card-text text-center">Records </p>
   </div>
 </router-link>
<router-link :to="{name:'rechargeHistory'}"  class="card py-3 border-0 text-center accItemList" >
    <i class="fa-solid fa-money-bill-trend-up"></i>
   <div class="card-body">
     <p class="card-text text-center">Topup History </p>
   </div>
 </router-link>
<router-link :to="{name:'WithdrawHistory'}"  class="card py-3 border-0 text-center accItemList" >
    <i class="fa-solid fa-money-bill-wheat"></i>
   <div class="card-body">
     <p class="card-text text-center">Cash Out History </p>
   </div>
 </router-link>






</div>

</main>





    <hr/>

    <router-link :to="{name:'logout'}" class="LogoutBtn"><i class="fa-solid fa-arrow-right-from-bracket text-warning mx-2"></i> Log Out </router-link>





    </div>
</template>
<script>

import { ButtonCopy,ButtonTelegram  } from 'share-button-links/components/buttons';
export default {
    components:{
        ButtonCopy,ButtonTelegram
    },
    data(){
        return {
            settings:{},
              row: {
                plans:{},
                deposit:{},
                depositamount:0,
                user:{},
                withdraw:{},
                withdrawamount:0,
                refercount:0,
            },
        }
    },
    methods: {
          async getData() {

            var resN = await this.callApi('get',`/api/admin/setting`,[])
              this.settings = resN.data

             var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.row = res.data;

        },



    },
    mounted() {
            this.getData();

    },
}
</script>

<style scoped>
a.LogoutBtn {
    width: 100%;
    display: block;
    padding: 8px 5px;
    border: 1px solid #b3b3b3;
    text-align: center;
    background: #30CF88;
    color: white;
    text-decoration: none;
}
a.iconTex.text-center {
    border: 1px solid #b9b9b9;
    padding: 8px 6px;
    width: 85px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    color: #fb3737;
    text-decoration: none;
    font-weight: 500;
    font-size: 21px;
}
.MenuHeadLine{
    border-bottom: 1px solid #646464;
    padding: 10px 0px;
    color: #646464;
}
.inviteButton{
    border-radius: 0px 40px;
    border: 1px solid #30CF88;
    padding: 4px 17px;
    font-size: 16px;
    font-weight: 600;
    margin-top: 10px;
}
.profileLinks i {
    font-size: 31px;
    padding: 10px;
}
.profileLinks {
    font-size: 12px;
    color: white;
    margin: 14px 3px;
}
section.accontDetails {
    background: #008dff;
    color: white;
    padding: 32px 16px;
    margin-top: -40px;
}

a.accountList {
    color: white !important;
}

a.accountList.odd {
    background: #003cff !important;
}

a.accountList.even {
    background: #af5016 !important;
}




</style>
