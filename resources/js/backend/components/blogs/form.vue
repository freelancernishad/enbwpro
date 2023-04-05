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
                                        <label>Title</label>
                                        <input type="text" class="form-control" v-model="form.title" id="title"
                                            value="">
                                    </div>

                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Category</label>



                                        <select v-model="form.Category" id="category" class="form-control" >

                                            <option value="">Select</option>

                                                <option v-for="cat in categorys">{{ cat.name }}</option>




                                        </select>



                                    </div>

                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input type="text" class="form-control" v-model="form.price" id="title">
                                    </div>

                                </div>


<!--
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Short Description</label>
                                        <input type="text" class="form-control" v-model="form.short_description"
                                            id="short_description" value="">
                                    </div>

                                </div>


                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Description</label>

                                        <textarea v-model="form.description" id="bio" cols="30" rows="4" class="form-control"></textarea>


                                    </div>

                                </div> -->

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-form-label">ছবি
                                        </label>

                                            <input type="file" class="form-control" id="Images"  @change="FileSelected($event, 'Images')"  />
                                            <label for="Images">
                                            <b-img thumbnail fluid :src="form.Images" alt="Image 3"></b-img>
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
                Images:null,
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



      async getCategory(){
        var res = await this.callApi('get',`/api/get/category/list`,[])


                    this.categorys = res.data


        },

        async getunionInfo(id=''){
            var res = await this.callApi('get',`/api/update/blog/${id}`,[])


                    this.form = res.data


        },


        async onSubmit() {
            var res = await this.callApi('post', '/api/update/blog', this.form);

    // conseole.log(res)
    this.getunionInfo();
    this.$router.push({ name: 'blogs'})
    Notification.customSuccess('Blog Update Successfuly Done');


        }
    },
    mounted(){
        if(this.$route.params.id){

           this.getunionInfo(this.$route.params.id);
        }
        this.getCategory();
        }
}
</script>
