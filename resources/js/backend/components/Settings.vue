<template>
    <div>
        <div class="breadcrumbs-area">
            <h3>Settings</h3>
            <ul>
                <li>
                    <router-link to="/dashboard/adddmin">Dashboard</router-link>
                </li>
                <li>Settings</li>
            </ul>
            <button @click="$router.go(-1)" class="btn-fill-md radius-4 text-light bg-orange-red">Back</button>
        </div>
        <div class="row">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-50 border-bottom pb-2">Settings Information</h5>
                        <form  @submit.stop.prevent="onSubmit">
                        <div class="row mt-4">





                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Poup Notice</label>
                                            <vue-editor v-model="form.popupNotice" />

                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Notice</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <textarea v-model="form.notice" class="form-control" style="resize:none;height:100px;border: 1px solid #262528;"> </textarea>

                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">New Registration Bonus</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.new_regitration" class="form-control"/>

                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Refer Bonus</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.refer_bonus" class="form-control"/>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Refer Limit</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.ref_count" class="form-control"/>

                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Min Deposit</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.min_deposit" class="form-control"/>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Telegram Group</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.telegroup" class="form-control"/>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Telegram channel</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.telesupport1" class="form-control"/>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Telegram Support 1</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.telesupport2" class="form-control"/>
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Whatsapp Customers Service</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.telesupport3" class="form-control"/>
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Whatsapp Group</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.telesupport4" class="form-control"/>
                                        </div>
                                    </div>


                                    <!-- <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Withdraw Text</label>
                                            <input v-model="form.withdrawtext" class="form-control"/>
                                        </div>
                                    </div> -->

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Recharge Text</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.recharagetext" class="form-control"/>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Task Time</label>
                                            <!-- <vue-editor v-model="form.notice"></vue-editor> -->
                                            <input v-model="form.worktime" class="form-control"/>

                                        </div>
                                    </div>

<!--
                                    <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-form-label">Slider 1
                                        </label>

                                            <input type="file" class="form-control" id="slide1"  @change="FileSelected($event, 'slide1')"  />
                                            <label for="slide1">
                                            <b-img thumbnail fluid :src="form.slide1" alt="Image 3"></b-img>
                                            </label>
                                    </div>
                                </div>


                                    <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-form-label">Slider 2
                                        </label>

                                            <input type="file" class="form-control" id="slide2"  @change="FileSelected($event, 'slide2')"  />
                                            <label for="slide3">
                                            <b-img thumbnail fluid :src="form.slide2" alt="Image 3"></b-img>
                                            </label>
                                    </div>
                                </div>


                                    <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-form-label">Slider 3
                                        </label>

                                            <input type="file" class="form-control" id="slide3"  @change="FileSelected($event, 'slide3')"  />
                                            <label for="slide3">
                                            <b-img thumbnail fluid :src="form.slide3" alt="Image 3"></b-img>
                                            </label>
                                    </div>
                                </div>





                                    <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-form-label">Slider 4
                                        </label>

                                            <input type="file" class="form-control" id="slide4"  @change="FileSelected($event, 'slide4')"  />
                                            <label for="slide4">
                                            <b-img thumbnail fluid :src="form.slide4" alt="Image 3"></b-img>
                                            </label>
                                    </div>
                                </div> -->


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label col-form-label">Bkash</label>
                                            <multiselect v-model="form.bkash" tag-placeholder="Add this as new tag" placeholder="Search or add a tag"   :options="BkashOptions" :multiple="true" :taggable="true" @tag="addBkash"></multiselect>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label col-form-label">Nagad</label>
                                            <multiselect v-model="form.nagad" tag-placeholder="Add this as new tag" placeholder="Search or add a tag"  :options="NagadOptions" :multiple="true" :taggable="true" @tag="addNagad"></multiselect>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label col-form-label">Rocket</label>
                                            <multiselect v-model="form.rocket" tag-placeholder="Add this as new tag" placeholder="Search or add a tag"  :options="RocketOptions" :multiple="true" :taggable="true" @tag="addRocket"></multiselect>
                                        </div>
                                    </div>


                            <div class="col-md-12 mt-4">

                                <button type="submit" class="btn-fill-lmd text-light gradient-dodger-blue">Submit</button>

                            </div>
                        </div>
                    </form>

                    </div>
                </div>
            </div>
        </div>

    </div>
</template>
<script>

export default {
    mounted() {
        this.getData();
    },data() {
        return {
            form:{
                popupNotice:'',
                notice:'',
                new_regitration:'',
                refer_bonus:'',
                min_deposit:'',
                bkash:[],
                nagad:[],
                rocket:[],

            },
            apiForm:{
                bkash:[],
                nagad:[],
                rocket:[],
            },
            BkashOptions:[],
            NagadOptions:[],
            RocketOptions:[],

        }
    },
    methods: {

        addBkash (newTag) {

            const tag = newTag
            this.BkashOptions.push(tag)
            this.form.bkash.push(tag)
            },

        addNagad (newTag) {
            const tag = newTag
            this.NagadOptions.push(tag)
            this.form.nagad.push(tag)
            },

        addRocket (newTag) {
            const tag = newTag
            this.RocketOptions.push(tag)
            this.form.rocket.push(tag)
            },



        FileSelected($event, parent_index){



let file = $event.target.files[0];
if (file.size > 5048576) {
    Notification.image_validation();
} else {
    let reader = new FileReader;
    reader.onload = event => {
        this.form[parent_index] = event.target.result
        // console.log(event.target.result);
    };
    reader.readAsDataURL(file)
}
        //   console.log($event.target.result);
},

        async getData(){

            var res = await this.callApi('get',`/api/admin/setting/1`,[]);
            this.form = res.data;
        },

        async onSubmit(){


            this.apiForm.bkash = this.form.bkash
            this.apiForm.nagad = this.form.nagad
            this.apiForm.rocket = this.form.rocket

            var res1 = await this.callApi('post', `https://onepay.bio/api/set/account/1`, this.apiForm);

            var res = await this.callApi('put', `/api/admin/setting/1`, this.form);
             Notification.customSuccess(`Your data has been Updated`);

            this.getData();
        }
    },
}
</script>
