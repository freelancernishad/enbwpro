<template>
    <div>


  <section id="topbar">
        <div class="title">
            <a href="javascript:void(0)" @click="$router.go(-1)" ><i class="fa fa-angle-left"></i></a>
            <p>{{ $t('Company_Profile.value') }}</p>
            <LanguageComponent/>
        </div>
    </section>

    <section class="intro mb-5" >
        <div class="container-fluid">
            <pre>

Completely foreign site
JMY EARN MONEY Welcome to you

200 taka bonus if account.
You can work for free by watching work videos.
You will get 5 rupees per refer.

Minimum deposit 300 taka
Minimum withdrawal 500 taka
You will receive payment in 24 hours.
development or cash

Work time:
2PM to 12AM.
Winthdraw time is 2pm to 6pm
Deposit time is 24 hours.

We deal directly with YouTube and earn profits from them, so you can earn more by investing here.
I can work with us for 2 years. Thank you

            <img :src="$asseturl+'frontend/img/Task.png?ver=1.0'" style="width:50%" alt="">






            </pre>
        </div>
    </section>




    </div>
</template>
