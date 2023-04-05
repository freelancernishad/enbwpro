<template>
    <div>




      <div data-v-8c4b8248="" id="home">

        <div data-v-890639a6="" data-v-a4cbac46="" class="title-bar wrap" style="background: linear-gradient(rgb(254, 112, 66) 0%, rgb(254, 117, 66) 100%);">
                    <span data-v-890639a6="" class="back">

                    </span>
                    <p data-v-890639a6="" class="title">Jobs</p>
                    <span data-v-890639a6="" class="right-top-btn"><span data-v-890639a6=""></span><img data-v-890639a6="" src="" alt="" style="display: none;" /></span>
                </div>



                      <div data-v-8c4b8248="" id="goods_list">


                          <div data-v-8c4b8248="" v-for="p in products" :key="p.id">
                              <div data-v-8c4b8248="" class="item" style="cursor:pointer" @click="info(p)">
                                  <div data-v-8c4b8248="" class="goods_img">
                                      <!-- <div data-v-8c4b8248="" class="before"><span data-v-8c4b8248="">+৳68.04/day</span></div> -->
                                      <img data-v-8c4b8248="" :src="p.Images"  alt="" />
                                      <!-- <div data-v-8c4b8248="" class="after">LV 1</div> -->
                                  </div>
                                  <p data-v-8c4b8248="">৳{{  p.price  }}</p>
                                  <p data-v-8c4b8248="" class="nn">{{  p.title  }}</p>
                              </div>
                          </div>




                      </div>


                      <!---->
                  </div>

                  <div data-v-132fa46a="" data-v-a06effa8="" class="alert" v-if="ordering">
                              <div data-v-132fa46a="" class="hm"></div>
                              <div data-v-132fa46a="" class="tc">
                                  <div data-v-132fa46a="" class="close" @click="cancelorder">
                                      <img
                                          data-v-132fa46a=""
                                          src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAMAAAC7IEhfAAAAqFBMVEUAAAAAAAAAAAAAAAAKCgoTExMSEhIQEBAODg4NDQ0TExMSEhIREREPDw8SEhISEhIUFBQUFBQTExMTExMSEhISEhIREREREREUFBQTExMTExMSEhISEhISEhITExMTExMTExMTExMTExMTExMTExMTExMTExMUFBQUFBQUFBQTExMTExMTExMTExMUFBQUFBQUFBQUFBQTExMTExMTExMTExMTExMUFBSwulRoAAAAN3RSTlMAAQIDGhsdICQmKCsuM0ZHTU5PUFNVWVpbXV5jcY2WnZ6gpLm8wMbR2t7f4OHk5+n2+Pn6+/z9We2H0AAAANFJREFUOMvt08cSgjAQBuDFhtg79gL2Loh5/zfTgEGzAdaDN93jP99syUwAfrpK2YiwmFMii116OEtN2bWLsjJj7DaQs7T1CE8IZs5c9qV+3LElHmN6j9QzsTsaypIdWWoz3xUiLpSkNuHukI98oLYbykQH0BKScKEknZBz0j3lBy6UpAPN9uGQdJNgstsi4NORcszNbuhS0ndbPbgoQQoHhHw5gIYTL98dQC1Wyi5ejpATsor/peIA6lzuEdQdxQU9V3h0c2Pryj6V9cKAf3217q51NGq+isQYAAAAAElFTkSuQmCC"
                                          alt=""
                                      />
                                  </div>
                                  <div data-v-132fa46a="" class="title">Order details</div>
                                  <div data-v-a06effa8="" data-v-132fa46a="" class="content details">
                                      <p data-v-a06effa8="" data-v-132fa46a=""><span data-v-a06effa8="" data-v-132fa46a="">Order number: </span><span data-v-a06effa8="" data-v-132fa46a="">{{ form.orderNumber }}</span></p>
                                      <p data-v-a06effa8="" data-v-132fa46a=""><span data-v-a06effa8="" data-v-132fa46a="">Time of receipt: </span><span data-v-a06effa8="" data-v-132fa46a="">{{ dateformatglobal()[6] }}</span></p>
                                      <p data-v-a06effa8="" data-v-132fa46a=""><span data-v-a06effa8="" data-v-132fa46a="">Total amount of orders:</span><span data-v-a06effa8="" data-v-132fa46a="">৳{{ orderDetails.price }}</span></p>
                                      <p data-v-a06effa8="" data-v-132fa46a=""><span data-v-a06effa8="" data-v-132fa46a="">Expected income: </span><span data-v-a06effa8="" data-v-132fa46a=""> ৳{{ form.task_comisition }}</span></p>

                                      <div data-v-a06effa8="" data-v-132fa46a="" class="btns">
                                          <div data-v-a06effa8="" data-v-132fa46a="" class="btn" @click="cancelorder">Cancel order</div>
                                          <div data-v-a06effa8="" data-v-132fa46a="" class="btn" v-if="loading" disabled>Wait.....</div>
                                          <div data-v-a06effa8="" data-v-132fa46a="" class="btn" v-else @click="orderSubmit">Purchase</div>
                                      </div>
                                  </div>
                              </div>
                          </div>


      <!-- <section id="slider">
          <img width="100%" :src="slideimage" alt="">
      </section>

      <section id="marquee">
        <div class="container-fluid">
          <div class="marquee-area">
            <div class="left-img">
              <img :src="$asseturl+'frontend/img/notice_icon.png'" alt="icon" />
            </div>
            <marquee>সম্মানিত গ্রাহক,
  আমাদের কোম্পানি আমেরিকান
  বাংলাদেশে এজেন্টের মাধ্যমে
  আমরা ২ বছরের জন্য বাংলাদেশে
  মার্কেট পরিদর্শন করতে আসছি,
  আমাদের এখানে অর্থ বিনিয়োগ করে
  আপনারা কাজ করে উপার্জন করতে পারেন।</marquee
            >
            <div class="button right">Notice</div>
          </div>
        </div>
      </section>

      <section id="aui">
        <div class="container-fluid">
          <div class="row">
            <div class="col-3 p-0">
              <router-link :to="{name:'Recharge'}">
                <img class="reImage" :src="$asseturl+'frontend/img/recharge.jpeg'" alt="tab" />
                <span>Recharge</span>
              </router-link>
            </div>
            <div class="col-3 p-0">
              <router-link :to="{name:'Withdraw'}">
                <img class="reImage" :src="$asseturl+'frontend/img/withdraw.jpeg'" alt="tab" />
                <span>Withdrawal</span>
              </router-link>
            </div>
            <div class="col-3 p-0">
              <router-link :to="{name:'companyPro'}">
                <img class="reImage" :src="$asseturl+'frontend/img/company.jpeg'" alt="tab" />
                <span>Company Profiles</span>
              </router-link>
            </div>
            <div class="col-3 p-0">
              <router-link :to="{name:'invite'}">
                <img class="reImage" :src="$asseturl+'frontend/img/invite.jpeg'" alt="tab" />
                <span>Invite Friends</span>
              </router-link>
            </div>
          </div>
        </div>
      </section>




      <section id="announcement">
        <div class="container-fluid">
          <div class="row">


            <div class="col-12 p-0" v-for="plan in row" :key="plan.id">
              <div class="task me-1 mb-2">
                <a href="javascript:void(0)" class="plansdesign">
                  <h4 class="planPack"  style="width:20%" >{{ plan.name }}</h4>
                  <div class="vip-area planPack" style="width:40%">

                    <img class="lock" v-if="plan.id==user.user.plan_id" :src="$asseturl + 'frontend/img/unlock.png'" alt="unlocked" />

                    <img class="lock" v-else :src="$asseturl + 'frontend/img/lock.png'" alt="unlocked" />

                    <p>{{ plan.totalorder }} Orders</p>
                    <img
                      class="vip"
                      :src="$asseturl + 'frontend/img/vipLogo.png'"
                      alt="vip"
                    />
                  </div>
                  <span class="planPack"  style="width:40%">কমিশন রেট {{ parseFloat(plan.comission_rate*plan.totalorder).toFixed(2) }}% ({{ plan.start_balance }}TK-{{ plan.end_balance }}TK)</span>
                </a>
              </div>
            </div>


            <div class="col-md-12">
              <h3 class="text-center">Our Partners</h3>
              <hr>
              <img width="100%" :src="$asseturl+'frontend/img/partners.jpeg'" alt="">
            </div>

          </div>
        </div>
      </section>


      <div class="notice" v-if="notice">

  <p> <h3>Welcome</h3>
      <br>
      <p v-html="settings.notice"></p>
  </p>

          <button class="closebtn" @click="closeNotice">Close</button>
      </div> -->




    </div>
  </template>

  <script>


  export default {
      created() {
          if(localStorage.getItem('notice')==1){
               this.notice = false
          }
          this.getplans()
          // console.log(this.slider.length)
          var indexx = 1;
          this.slideimage = this.slider[0]
          setInterval(() => {
              if(indexx===this.slider.length)indexx = 0;
              // console.log(indexx);
              this.slideimage = this.slider[indexx]
              indexx++
          }, 5000);

      },
      data(){
          return {
              products:{},
              row:{},
              notice:true,
              ordering:false,
              loading:false,
              orderDetails:{},
              slideimage:'',
              user:{
                  user:{},
                  todayearn:0,
                  taskearn:0,
              },
              form: {
                  task_comisition: 0,
                  orderNumber: 0,
              },
              slider:[
              this.$asseturl+'frontend/img/Daily-Task-Commisson-Chart.png',
              this.$asseturl+'frontend/img/Refar-Deposit-Bonus.png',
              this.$asseturl+'frontend/img/Refar-Task-income.png',
              this.$asseturl+'frontend/img/Self-Deposit.png'
              ]
          }
      },
      methods: {

          info(items){
            this.loading = true;
              this.ordering = true;
              this.orderDetails = items


              this.form.orderNumber = Math.floor(Math.random() * (1000000000000 - 1 + 1));

              if (Number(this.user.user.task) < 1) {
                  Notification.customError(`You Can't Complete any order Today`);
                  this.loading = false
              } else {
                  setTimeout(() => {
                      var task_comisition = ((this.user.user.balance * this.user.plans.comission_rate) / 100);
                      this.form.task_comisition = parseFloat(task_comisition).toFixed(2)
                      this.loading = false
                  }, 3000);
              }







          },


          cancelorder(){
              this.ordering = false;
          },

          async orderSubmit(){
              this.form['user_id'] = this.user.user.id;
              var res = await this.callApi('post',`/api/admin/task`,this.form);
            //   console.log(res)
              if(res.data==444){

                  Notification.customError(`You Can't Complete any order Today`);
              }else if(res.data==1000){

                Notification.customError(`You Can't Complete any order on Free plan.You need upgrade any plan`);
                }else{

                  Notification.customSuccess('Task Completed');
              }

              this.getplans();
              this.cancelorder();
          },




          closeNotice(){
              this.notice = false

          localStorage.setItem('notice',1)

          },

         async getplans(){

              var resb = await this.callApi('get',`/api/get/blog/list`,[])
              this.products = resb.data


              var res = await this.callApi('get',`/api/admin/plan`,[])
              this.row = res.data


               var id = localStorage.getItem('userid');
              var results = await this.callApi('get', `/api/admin/user/${id}`, []);
              this.user = results.data;


          }
      },

  }
  </script>
  <style>
  #marquee {
    margin: 24px 0;
  }

      .reImage {
          padding: 6px;
  background: #e1e1e1;
  box-shadow: 0px 0px 10px 0px #0000008c;
      }
      .notice {
      width: 340px;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%,-50%);
      background: #f0f0f0;
      padding: 52px 11px;
      z-index: 99;
      border-radius: 10px;
      text-align: center;
  }

  .closebtn {
    position: absolute;
    bottom: 7px;
    background: transparent;
    border: 2px solid #7683aa;
    border-radius: 6px;
    right: 23px;
  }
  .plansdesign{
      display: flex;
  justify-content: space-between;
  }

  /* .planPack {
    width: 30%;
  } */

  </style>
