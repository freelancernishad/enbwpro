<template>
    <div>



  <section id="topbar">
    <div class="title">
        <a href="javascript:void(0)" @click="$router.go(-1)" ><i class="fa fa-angle-left"></i></a>
        <p>Help</p>
        <LanguageComponent/>
    </div>
  </section>

 <section id="listmenu">
    <div class="container-fluid">
        <ul>
            <li><router-link :to="{name:'USDT'}">USDT Tutorial</router-link></li>
            <!-- <li><router-link :to="{name:'instraction'}">নতুন ব্যবহারকারীর নির্দেশিকা</router-link></li> -->
            <li><router-link :to="{name:'rechargeHelp'}">রিচার্জ সাহায্য</router-link></li>
            <li><router-link :to="{name:'withdrawalHelp'}">সাহায্য প্রত্যাহার করুন</router-link></li>
            <li><router-link :to="{name:'brokerHelp'}">দল সহযোগিতা</router-link></li>

        </ul>
    </div>
 </section>




    </div>
</template>
