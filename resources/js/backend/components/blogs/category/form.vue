<template>
    <div>

<div class="breadcrumbs-area">
    <h3>Category form</h3>
    <ul>
        <li>
            <router-link :to="{name:'Dashboard'}">Home</router-link>
        </li>
        <li>Category form</li>
    </ul>
</div>

   <form @submit.stop.prevent="onSubmit" class="form-horizontal">


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Category Name</label>
                                        <input type="text" class="form-control" v-model="form.name" id="name"
                                            value="">
                                        <span id="errorMessage"></span>
                                    </div>

                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Slug (English)</label>
                                        <input type="text" class="form-control" v-model="form.slug" id="name"
                                            value="">
                                        <span id="errorMessage"></span>
                                    </div>

                                </div>

                            </div>
                     <button type="submit" id="cbtn" class="btn btn-success">Submit</button>



  </form>


    </div>
</template>

<script>
export default {
    data(){
        return {
           form: {
                name:null,
                slug:null,
             },
        }
    },
    methods:{

       getunionInfo(id=''){

                axios.get(`/api/update/category/${id}`)
                .then((res)=>{

                    this.form = res.data
                })

        },


        async onSubmit() {
            var res = await this.callApi('post', '/api/update/category', this.form);

    // conseole.log(res)
    this.getunionInfo();
    this.$router.push({ name: 'category'})
    Notification.customSuccess('Category Update Successfuly Done');


        }
    },
    mounted(){
        if(this.$route.params.id){

           this.getunionInfo(this.$route.params.id);
        }
        }
}
</script>
