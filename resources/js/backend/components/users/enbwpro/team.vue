<template>
    <div>

        <header class="header-text" style="background-color: var(--defaltColor);margin-bottom: -16px;">
        <p class="py-2 text-white"> Team </p>
    </header>

    <main class="main-bg-absulate ">

        <div class="mx-4 px-4 text-center shadow-lg levelBg">
          <div class="d-flex gap-5 justify-content-between lh-1 py-3 text-start">
            <div class="w-50 text-start" >
                <p class="gray">Team Size</p>
                <p class="fs-5 fw-bold m-0">{{ team.total_member }}</p>
               </div>
               <div class="w-50 text-end" >
                <p class="gray">Total Income</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.ToalEarn }}</p>
               </div>
          </div>

          <div class="border-top d-flex gap-5 justify-content-between lh-1 py-3 ">
            <div class="w-50 text-start">
                <p class="gray">Purchase commission</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.ToalEarnPur }}</p>
               </div>
               <div class="w-50 text-end">
                <p class="gray">Promotion Income</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.reacharge }}</p>
               </div>

          </div>

        </div>


        <div class="d-flex justify-content-around flex-wrap" >


        <div class="px-4 shadow-lg text-center topp levelBg" style="width: 96%;margin-top: 25px;">
            <p class="border-bottom fw-bold mb-0 p-2">Level 1</p>
          <div class="border-0 d-flex gap-5 justify-content-between lh-1 mt-3 py-3 text-start topp">
            <div class="w-50 text-start" >
                <p class="gray">Team Size</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.level1.length }}</p>
               </div>
               <div class="w-50 text-end" >
                <p class="gray">Total Income</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.L1 }}</p>
               </div>
          </div>
          <router-link :to="{name:'teamdaily',query:{level:'Level1'}}" class="buttonDetails border-0">More details</router-link>
        </div>

        <div class="px-4 shadow-lg text-center topp levelBg" style="width: 96%;margin-top: 25px;">
            <p class="border-bottom fw-bold mb-0 p-2">Level 2</p>
          <div class="border-0 d-flex gap-5 justify-content-between lh-1 mt-3 py-3 text-start topp">
            <div class="w-50 text-start" >
                <p class="gray">Team Size</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.level2.length }}</p>
               </div>
               <div class="w-50 text-end" >
                <p class="gray">Total Income</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.L2 }}</p>
               </div>
          </div>
          <router-link :to="{name:'teamdaily',query:{level:'Level2'}}" class="buttonDetails border-0">More details</router-link>
        </div>

        <div class="mb-5 pb-5 px-4 shadow-lg text-center topp levelBg" style="width: 96%;margin-top: 25px;">
            <p class="border-bottom fw-bold mb-0 p-2">Level 3</p>
          <div class="border-0 d-flex gap-5 justify-content-between lh-1 mt-3 py-3 text-start topp">
            <div class="w-50 text-start" >
                <p class="gray">Team Size</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.level3.length }}</p>
               </div>
               <div class="w-50 text-end" >
                <p class="gray">Total Income</p>
                <p class="fs-5 fw-bold m-0">{{ levelTeam.L3 }}</p>
               </div>
          </div>
          <router-link :to="{name:'teamdaily',query:{level:'Level3'}}" class="buttonDetails border-0">More details</router-link>
        </div>

    </div>
    </main>

    </div>
</template>


<script>


export default {
    data(){
        return {
            team:{},
            levelTeam: {
                level1: {},
                level2: {},
                level3: {},
            },
        }
    },
    methods: {
         async getData(){
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get',`/api/front/teamdetails?id=${id}`,[]);
            this.team = res.data;

            var res = await this.callApi('get', `/api/user/multi/refer?id=${id}`, []);
            this.levelTeam = res.data;



        },
    },
    mounted() {
            this.getData();

    },
}
</script>

<style>
.levelBg {
    background: orange !important;
}
</style>
