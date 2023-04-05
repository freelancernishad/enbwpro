<template>
    <div>


        <section id="topbar">
            <div class="title">
                <a href="javascript:void(0)" @click="$router.go(-1)"><i class="fa fa-angle-left"></i></a>
                <p>{{ $t('Team_Report.value') }}</p>
                <LanguageComponent/>
            </div>
        </section>

        <section id="listmenus">
            <div class="container-fluid">
                <div class="row mt-5">
                    <div class="col-md-6">


                        <router-link :to="{ name: 'teamdetails' }">
                            <div class="card text-center"  style="    background: #d10069; margin-bottom: 22px;">
                                <div class="card-body">
                                    <img width="100px" :src="$asseturl+'frontend/img/Team_details.png'" alt="tab" />
                                    <h5 class="card-title text-white">{{ $t('Team_details.value') }}</h5>

                                </div>
                            </div>
                        </router-link>


                    </div>

                    <div class="col-md-6">


                        <router-link :to="{ name: 'teamMember' }">
                            <div class="card text-center"  style="    background: #ff8500; margin-bottom: 22px;">
                                <div class="card-body">
                                    <img width="100px" :src="$asseturl+'frontend/img/teamMember.png'" alt="tab" />
                                    <h5 class="card-title text-white">{{ $t('Team_members.value') }}</h5>

                                </div>
                            </div>
                        </router-link>


                    </div>

                    <!-- <li><router-link :to="{name:'teamIntro'}">Team Introduction</router-link></li> -->
                </div>
            </div>
        </section>


    </div>
</template>
