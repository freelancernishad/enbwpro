<template>
    <div>



  <section id="topbar">
    <div class="title">
       <a href="javascript:void(0)" @click="$router.go(-1)" ><i class="fa fa-angle-left"></i></a>
        <p>Announcement</p>
    </div>
  </section>

 <section id="listmenu">
    <div class="container-fluid">
        <ul>
            <li><router-link :to="{name:'help'}">Help</router-link></li>
            <!-- <li><router-link :to="{name:'promotion'}">Promotions</router-link></li> -->

        </ul>
    </div>
 </section>



    </div>
</template>
