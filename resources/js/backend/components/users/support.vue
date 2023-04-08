<template>


        <div class="layout-contents" style="height: 100vh;background: var(--defaltColor);">
                <div class="row" style="    padding: 45px 0px;">
                    <div class="col-4" v-if="settings.telegroup">
                        <a :href="settings.telegroup" class="d-block text-center profileLinks">
                            <i class="fa fa-telegram" style="color: white;"></i> <br/>
                            <span style="color:white">টেলিগ্রাম<br/> গ্রুপ</span>
                        </a>
                    </div>


                    <div class="col-4" v-if="settings.telesupport1">
                        <a :href="settings.telesupport1" class="d-block text-center profileLinks">
                            <i class="fa fa-telegram" style="color: white;"></i> <br/>
                            <span style="color:white">টেলিগ্রাম<br/> চ্যানেল</span>
                        </a>
                    </div>


                    <div class="col-4" v-if="settings.telesupport2">
                        <a :href="settings.telesupport2" class="d-block text-center profileLinks">
                            <i class="fa fa-telegram" style="color: white;"></i> <br/>
                            <span style="color:white">টেলিগ্রাম<br/> সাপোর্ট</span>
                        </a>
                    </div>


                    <div class="col-4" v-if="settings.telesupport3">
                        <a :href="settings.telesupport3" class="d-block text-center profileLinks">
                            <i class="fa fa-telegram" style="color: white;"></i> <br/>
                            <span style="color:white">টেলিগ্রাম<br/> সাপোর্ট</span>
                        </a>
                    </div>
                </div>



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
    /* border: 2px solid style="color:white" whitewhite; */
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
