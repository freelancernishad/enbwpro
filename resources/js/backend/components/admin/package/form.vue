<template>
    <div>

<div class="breadcrumbs-area">
    <h3>Blog form</h3>
    <ul>
        <li>
            <router-link :to="{name:'Dashboard'}">Home</router-link>
        </li>
        <li>Blog form</li>
    </ul>
</div>

   <form @submit.stop.prevent="onSubmit" class="form-horizontal">


                            <div class="row">













                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input type="text" class="form-control" v-model="form.name" id="title"
                                            value="">
                                    </div>

                                </div>




                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input type="text" class="form-control" v-model="form.packagePrice" id="title">
                                    </div>

                                </div>




                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input type="text" class="form-control" v-model="form.packageEarn" id="title">
                                    </div>

                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Duration</label>
                                        <input type="text" class="form-control" v-model="form.packageDuration" id="title">
                                    </div>

                                </div>


                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-form-label">ছবি
                                        </label>

                                            <input type="file" class="form-control" id="image"  @change="FileSelected($event, 'image')"  />
                                            <label for="image">
                                            <b-img thumbnail fluid :src="form.image" alt="Image 3"></b-img>
                                            </label>
                                    </div>
                                </div>





                            </div>











                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <div class="col-md-6 col-sm-6 offset-md-3">

                                    <button type="submit" class="btn btn-success">Submit</button>
                                </div>
                            </div>



  </form>


    </div>
</template>

<script>
export default {
    data(){
        return {
           form: {
                title:null,
                Category:null,
                price:null,
                short_description:null,
                description:null,
                image:null,
             },
             categorys:{},
        }
    },
    methods:{



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





        async getunionInfo(id=''){
            var res = await this.callApi('get',`/api/update/packages/${id}`,[])


                    this.form = res.data


        },


        async onSubmit() {
            var res = await this.callApi('post', '/api/update/packages', this.form);

    // conseole.log(res)
    this.getunionInfo();
    this.$router.push({ name: 'packages'})
    Notification.customSuccess('packages Update Successfuly Done');


        }
    },
    mounted(){
        if(this.$route.params.id){

           this.getunionInfo(this.$route.params.id);
        }

        }
}
</script>
