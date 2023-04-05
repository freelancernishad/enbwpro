<template>
  <div>


    <div class="layout-content" style="margin-bottom: 100px;">
            <!-- <div class="van-nav-bar van-nav-bar--fixed mb-5">
                <div class="van-nav-bar__content"><div class="van-nav-bar__title van-ellipsis">দল</div></div>
            </div> -->


            <div class="bank_datails" style="    margin-top: 60px;    padding: 32px 19px; ">

                <div class="row">

                    <div class="col-md-6 col-6 mt-4 text-center" style="font-size: 20px;">

                        <div class="d-flex teamborder">
                            <span>{{ parseFloat(teamdetails.refer_commisition).toFixed(2)  }}</span>
                            <span>বন্টন কমিশন</span>
                        </div>

                    </div>

                    <div class="col-md-6 col-6 mt-4 text-center" style="font-size: 20px;">
                        <div class="d-flex teamborder">
                        <span>{{ parseFloat(teamdetails.refer_task_bonus+teamdetails.refer_commisition).toFixed(2)  }}</span>
                        <span>মোট কমিশন</span>
                    </div>
                    </div>

                    <div class="col-md-6 col-6 mt-4 text-center" style="font-size: 20px;">
                        <div class="d-flex teamborder">
                        <span>{{ teamdetails.Direct_Invites }}</span>
                        <span>প্রথম শ্রেণির সদস্য</span>

                    </div>
                    </div>

                    <div class="col-md-6 col-6 mt-4 text-center" style="font-size: 20px;">
                        <div class="d-flex teamborder">
                        <span>{{ teamdetails.total_member }}</span>
                        <span>দলের আকার</span>
                    </div>
                    </div>


                </div>





            </div>






            <section id="listmenus">
      <div id="level">
        <div class="container-fluid">
          <div class="containerBorder">
            <ul class="nav nav-pills mb-3 nav-fill" id="pills-tab" style="background: #646567;" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link navlinks active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
                  type="button" role="tab" aria-controls="pills-home" aria-selected="true">Level 1</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link navlinks" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile"
                  type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Level 2</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link navlinks" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact"
                  type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Level 3</button>
              </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">




                <div class="row">
                  <div class="col-md-6" v-for="member in row.level1" :key="'level1'+member.id">
                    <div class="card text-dark"  style="margin-bottom:20px;background:transparent">
                      <div class="card-body">
                          <span style="font-size: 21px;"> ব্যবহারকারীর নাম : {{ member.username }} </span> <br />
                          <span> রিচার্জ  : <Counting :member-id="member.id" member-type="Recharge"></Counting> </span> <br />
                          <span> প্রত্যাহার  : <Counting :member-id="member.id" member-type="withdraw"></Counting> </span> <br />
                          <span> কাজের অগ্রগতি : <Counting :member-id="member.id" member-type="task"></Counting> </span>
                          <br />
                          <span> নিবন্ধনের তারিখ : {{ dateformatglobal(member.created_at)[6] }} </span>
                      </div>
                    </div>

                  </div>
                </div>



              </div>
              <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                <div class="row">
                  <div class="col-md-6" v-for="member in row.level2[0]" :key="'level12'+member.id">
                    <div class="card"  style="margin-bottom:20px">
                      <div class="card-body">
                    <span style="font-size: 21px;"> ব্যবহারকারীর নাম : {{ member.username }} </span> <br />
                    <span> রিচার্জ  : <Counting :member-id="member.id" member-type="Recharge"></Counting> </span> <br />
                    <span> প্রত্যাহার  : <Counting :member-id="member.id" member-type="withdraw"></Counting> </span> <br />
                    <span> কাজের অগ্রগতি : <Counting :member-id="member.id" member-type="task"></Counting> </span>
                    <br />
                    <span> নিবন্ধনের তারিখ : {{ dateformatglobal(member.created_at)[6] }} </span>
                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                <div class="row">
                  <div class="col-md-6" v-for="member in row.level3[0]" :key="'level3'+member.id">
                    <div class="card"  style="margin-bottom:20px">
                      <div class="card-body">
                    <span style="font-size: 21px;">  ব্যবহারকারীর নাম : {{ member.username }} </span> <br />
                    <span> রিচার্জ  : <Counting :member-id="member.id" member-type="Recharge"></Counting> </span> <br />
                    <span> প্রত্যাহার  : <Counting :member-id="member.id" member-type="withdraw"></Counting> </span> <br />
                    <span> কাজের অগ্রগতি : <Counting :member-id="member.id" member-type="task"></Counting> </span>
                    <br />
                    <span> নিবন্ধনের তারিখ : {{ dateformatglobal(member.created_at)[6] }} </span>
                  </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>












            </div>





















  </div>
</template>
<script>
import Counting from './counting.vue';
export default {
  components: {
    Counting
  },
  data() {
    return {
      row: {
        level1: {},
        level2: {},
        level3: {},
      },
      teamdetails:{},
      datas: {
        Recharge: 0,
        withdraw: 0,
        task: 0,
      }
    }
  },
  methods: {
    async getData() {


        var id = localStorage.getItem('userid');
            var teamdetailsres = await this.callApi('get',`/api/front/teamdetails?id=${id}`,[]);
            this.teamdetails = teamdetailsres.data;



      var id = localStorage.getItem('userid');
      var res = await this.callApi('get', `/api/user/multi/refer?id=${id}`, []);
      this.row = res.data;
    },

    generator(){
        return '#'+(Math.random()*0xFFFFFF<<0).toString(16);
      }

  },
  mounted() {
    this.getData();
    // console.log(this.getRecharge(3,'Recharge'));
    // this.getRecharge(member.id,'Recharge');
    // this.getRecharge(member.id,'withdraw');
    // this.getRecharge(member.id,'task');
  },
}
</script>
<style >
.li1 {
  border-bottom: 2px solid black;
}
.navlinks {
  border: 1px solid black !important;
  border-radius: 0 !important;
}
.navlinks.active {
  border-bottom: 0px !important;
}
.containerBorder {
    border: 1px solid #ff0c0c !important;
}
.d-flex.teamborder {
    flex-direction: column;
    font-size: 15px;
    border: 1px solid black;
    width: 115px;
    height: 85px;
    justify-content: center;
    background: #27d97638;
    box-shadow: 2px 4px 10px 0px #000000;
}
li.nav-item:last-child button {
    border-right: 0px !important;
}
li.nav-item button {
    background: #ffffffe6 !important;
    color: #ff0707;
    padding: 2px 4px;
    border: 0 !important;
    border-right: 1px solid #ff0303 !important;
    border-bottom: 1px solid red !important;
}
li.nav-item button.active {
    background: red !important;
}
</style>
