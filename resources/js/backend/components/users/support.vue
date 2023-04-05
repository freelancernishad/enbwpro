<template>
    <div>


        <div class="layout-content">
              <!---->
              <div class="van-nav-bar van-nav-bar--fixed mb-5">
                  <!-- <div class="van-nav-bar__content"><div class="van-nav-bar__title van-ellipsis">সাপোর্ট </div></div> -->
                </div>

                <div data-v-baaa4d88="" style="padding: 55px 20px 70px;">






                <div class="row">

                    <div class="col-4" v-if="settings.telegroup">
                        <a :href="settings.telegroup" class="d-block text-center profileLinks">
                            <i class="fa fa-telegram" style="color: #2EA2DB;"></i> <br/>
                            <span>টেলিগ্রাম<br/> গ্রুপ</span>
                        </a>
                    </div>


                    <div class="col-4" v-if="settings.telesupport1">
                        <a :href="settings.telesupport1" class="d-block text-center profileLinks">
                            <i class="fa fa-telegram" style="color: #2EA2DB;"></i> <br/>
                            <span>টেলিগ্রাম<br/> চ্যানেল</span>
                        </a>
                    </div>


                    <div class="col-4" v-if="settings.telesupport2">
                        <a :href="settings.telesupport1" class="d-block text-center profileLinks">
                            <i class="fa fa-telegram" style="color: #2EA2DB;"></i> <br/>
                            <span>টেলিগ্রাম<br/> সাপোর্ট</span>
                        </a>
                    </div>


                    <div class="col-4" v-if="settings.telesupport3">
                        <a :href="settings.telesupport1" class="d-block text-center profileLinks">
                            <i class="fa fa-telegram" style="color: #2EA2DB;"></i> <br/>
                            <span>টেলিগ্রাম<br/> সাপোর্ট</span>
                        </a>
                    </div>


                </div>


              </div>
           </div>





<!--




        <section id="topbar">
            <div class="title">
                <a href="javascript:void(0)" @click="$router.go(-1)" ><i class="fa fa-angle-left"></i></a>
                <p>{{ $t('My_Account.value') }}</p>
                <LanguageComponent/>
            </div>
        </section>


        <section class="accontDetails">
            <div class="row">
                <div class="col-md-6">


                            <h6 class="card-title">{{ $t('Name.value') }} : {{ row.user.name }}</h6>
                            <h6 class="card-title">{{ $t('Plan.value') }} : {{ row.plans.name }}</h6>
                            <h6 class="card-title">{{ $t('Invitation_code.value') }} : {{ row.user.username }}</h6>

                </div>
                <div class="col-md-6">

                            <h6 class="card-title">{{ $t('Task_income.value') }} : {{ parseFloat(row.taskearn).toFixed(2) }}</h6>
                            <h6 class="card-title">{{ $t('Balance.value') }} : {{ parseFloat(row.user.balance).toFixed(2) }}</h6>


                </div>
            </div>
        </section>





        <section id="btn-area">

            <div class="row">
                <div class="col-6 p-0"> <router-link :to="{name:'Recharge'}">{{ $t('Recharge.value') }}</router-link></div>
                <div class="col-6 p-0"> <router-link :to="{name:'Withdraw'}">{{ $t('Withdraw.value') }}</router-link></div>
            </div>


        </section>
        <section id="accounDetlist">


                <ul>
                    <li><router-link :to="{name:'license'}" class="accountList odd listCompanny " ><img src="https://petpat.lv/wp-content/uploads/2018/12/license-icon-27934542-2.png">
                            <p>{{ $t('Company_Profile.value') }}</p></router-link>
                    </li>

                    <li><router-link :to="{name:'information'}" class="accountList even listInformaion"><img :src="$asseturl+'frontend/img/inf.png'">
                            <p>{{ $t('Information.value') }}</p>
                        </router-link></li>
                    <li><router-link :to="{name:'orders'}" class="accountList odd listorder"><img :src="$asseturl+'frontend/img/order.png'">
                            <p>{{ $t('Order_Record.value') }}</p>
                        </router-link></li>
                    <li><router-link :to="{name:'rechargeHistory'}" class="accountList even listReHis"><img :src="$asseturl+'frontend/img/rech.png'">
                            <p>{{ $t('Recharge_History.value') }}</p>
                        </router-link></li>
                    <li><router-link :to="{name:'WithdrawHistory'}" class="accountList odd listWithHis"><img :src="$asseturl+'frontend/img/with.png'">
                            <p>{{ $t('Withdraw_History.value') }}</p>
                        </router-link></li>


                    <li><router-link :to="{name:'invite'}" class="accountList even listInvite"><img :src="$asseturl+'frontend/img/5811623.png'">
                            <p>{{ $t('Invite.value') }}</p>
                        </router-link></li>

                    <li v-if="settings.telegroup"><a :href="settings.telegroup" class="accountList odd listTeleGroup" target="_blank"><img :src="$asseturl+'frontend/img/Telegram.png'">
                            <p>{{ $t('Official_Telegram_Group.value') }}</p>
                        </a></li>

                    <li v-if="settings.telesupport1"><a :href="settings.telesupport1" class="accountList even listCus1" target="_blank"><img :src="$asseturl+'frontend/img/aGroup.jpeg'">
                            <p>{{ $t('Customer_Service.value') }} 1</p></a>
                    </li>

                    <li v-if="settings.telesupport2"><a :href="settings.telesupport2" class="accountList odd listCus2" target="_blank"><img src="https://cdn5.vectorstock.com/i/1000x1000/01/69/businesswoman-character-avatar-icon-vector-12800169.jpg">
                            <p>{{ $t('Customer_Service.value') }} 2</p></a>
                    </li>

                    <li v-if="settings.telesupport3"><a :href="settings.telesupport3" class="accountList even listCus3" target="_blank"><img src="https://cdn5.vectorstock.com/i/1000x1000/01/69/businesswoman-character-avatar-icon-vector-12800169.jpg">
                            <p>{{ $t('Customer_Service.value') }} 2</p></a>
                    </li>
                </ul>
                <router-link :to="{name:'logout'}" class="logout">{{ $t('Log_out.value') }}</router-link>
        </section>

 -->








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

.profileLinks i {
    font-size: 31px;
    padding: 10px;
}
.profileLinks {
    font-size: 12px;
    color: black;
    margin: 14px 3px;
    border: 2px solid #2ea2db;
    border-radius: 5px;
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



/*
a.accountList.listCompanny {
    background: #af1616 !important;
}

a.accountList.listInformaion {}

a.accountList.listInformaion {
    background: #af165b !important;
}

a.accountList.listorder {
    background: #9516af !important;
}

a.accountList.listReHis {
    background: #5616af !important;
}

a.accountList.listWithHis {
    background: #2716af !important;
}

a.accountList.listInvite {
    background: #1653af !important;
}

a.accountList.listCus1 {
    background: #16af56 !important;
}

a.accountList.listTeleGroup {
    background: #1692af !important;
}

a.accountList.listCus2 {
    background: #82af16 !important;
}




a.accountList.listCompanny:hover {
    background: #d51919 !important;
}



a.accountList.listInformaion:hover {
    background: #d7186e !important;
}

a.accountList.listorder:hover {
    background: #bd1cde !important;
}

a.accountList.listReHis:hover {
    background: #6719d4 !important;
}

a.accountList.listWithHis:hover {
    background: #2f17e2 !important;
}

a.accountList.listInvite:hover {
    background: #1c69dc !important;
}

a.accountList.listCus1:hover {
    background: #19d969 !important;
}

a.accountList.listTeleGroup:hover {
    background: #1ab3d5 !important;
}

a.accountList.listCus2:hover {
    background: #97cc1a !important;
} */




</style>
