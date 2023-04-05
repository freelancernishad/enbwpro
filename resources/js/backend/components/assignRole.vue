<template>
    <div>
<div class="breadcrumbs-area">
    <h3>Role Manangement</h3>
    <ul>
        <li>
            <router-link :to="{name:'Dashboard'}">Home</router-link>
        </li>
        <li>Role Manangement</li>
    </ul>
</div>
<div class="card height-auto">
      <div class="card-body">

            <div class="form-group">
                <label for="">Type</label>
            <select v-model="type" placeholder="Select admin type" class="form-control" required >
               <option value="">Select</option>
               <option>Update</option>
               <option>Create</option>
             </select>
            </div>



            <div class="form-group" v-if="type=='Update'">
               <label for="">Role Name</label>
            <select v-model="Admin_id"  placeholder="Select admin type" class="form-control"  @change="changeAdmin" :required="type=='Update' ? true : false" >
                <option :value="r.id" v-for="(r, i) in getUserRoles" :key="i" v-if="getUserRoles.length">{{r.roleName}}</option>
             </select>
            </div>



            <div class="form-group" v-else-if="type=='Create'">
               <label for="">Role Name</label>
            <input type="text" v-model="Admin_id" class="form-control" :required="type=='Create' ? true : false"  @keyup="changeAdmin">

            </div>




          <div class="_overflow _table_div">
            <table class="table">
              <!-- TABLE TITLE -->
              <tr>
                <th>Resource name</th>
                <th>Read</th>
                <th>Write</th>
                <th>Update</th>
                <th>Delete</th>
              </tr>
              <!-- TABLE TITLE -->

              <!-- ITEMS -->
              <tr v-for="(r, i) in resources" :key="i">
                <td>{{r.resourceName}}</td>
                <td><div class="form-check" ><input class="form-check-input" type="checkbox" v-model="r.read" :id="r.resourceName+'read'+i" ><label :for="r.resourceName+'read'+i">{{ r.read }}</label></div></td>
                <td><div class="form-check" ><input class="form-check-input" type="checkbox" v-model="r.write" :id="r.resourceName+'write'+i" ><label :for="r.resourceName+'write'+i">{{ r.write }}</label></div></td>
                <td><div class="form-check" ><input class="form-check-input" type="checkbox" v-model="r.update" :id="r.resourceName+'update'+i" ><label :for="r.resourceName+'update'+i">{{ r.update }}</label></div></td>
                <td><div class="form-check" ><input class="form-check-input" type="checkbox" v-model="r.delete" :id="r.resourceName+'delete'+i" ><label :for="r.resourceName+'delete'+i">{{ r.delete }}</label></div></td>

              </tr>
              <!-- ITEMS -->
              <div class="center_button">
                  <Button type="primary" class="btn-fill-lg  text-light radius-4 bg-gradient-custom" :loading="isSending" :disabled="isSending" @click="assignRoles" >Assign</Button>
              </div>
            </table>


      </div>
    </div>
    </div>
    </div>
</template>
<script>

export default {
  data() {
    return {
    type: 'Update',
    Admin_id: null,
    isSending : false,
    resources: [
         {resourceName: 'Dashboard', read: false, write: false, update: false, delete: false, name: 'Dashboard'},{resourceName: 'Tags', read: false, write: false, update: false, delete: false, name: 'tags'},{resourceName: 'Category', read: false, write: false, update: false, delete: false, name: 'category'},{resourceName: 'Create blogs', read: false, write: false, update: false, delete: false, name: 'createBlog'},{resourceName: 'Blogs', read: false, write: false, update: false, delete: false, name: 'blogs'},{resourceName: 'Admin users', read: false, write: false, update: false, delete: false, name: 'adminusers'},{resourceName: 'Role', read: false, write: false, update: false, delete: false, name: 'role'},{resourceName: 'Assign Role', read: false, write: false, update: false, delete: false, name: 'assignRole'}

      ],
     defaultResourcesPermission:[{resourceName: 'Dashboard', read: false, write: false, update: false, delete: false, name: 'Dashboard'},{resourceName: 'Tags', read: false, write: false, update: false, delete: false, name: 'tags'},{resourceName: 'Category', read: false, write: false, update: false, delete: false, name: 'category'},{resourceName: 'Create blogs', read: false, write: false, update: false, delete: false, name: 'createBlog'},{resourceName: 'Blogs', read: false, write: false, update: false, delete: false, name: 'blogs'},{resourceName: 'Admin users', read: false, write: false, update: false, delete: false, name: 'adminusers'},{resourceName: 'Role', read: false, write: false, update: false, delete: false, name: 'role'},{resourceName: 'Assign Role', read: false, write: false, update: false, delete: false, name: 'assignRole'}],
    };
  },

  methods: {

     async assignRoles(){
         let data = JSON.stringify(this.resources)
         const res = await this.callApi('post','/api/role/assign', {'permission' : data, roleName: this.Admin_id, type: this.type})

         if(res.status==200){
            if(res.data=='Role Already Exists!'){

                Notification.customError(res.data);
            }else{

                Notification.customSuccess(res.data);
            }
        const roles = await this.callApi('get',`/api/get/roles?id=${this.Users.role}`);

       this.$store.commit('setUserPermission', JSON.parse(roles.data.permission))

this.changeAdmin();


         }else{
           this.swr()
         }
     },

     async changeAdmin(){

         const res = await this.callApi('get',`/api/get/roles?id=${this.Admin_id}`);

         if(res.status==200){
if(res.data==''){
 this.resources = this.defaultResourcesPermission;
}else{
   this.resources =  JSON.parse(res.data.permission);
}




         }else{
           this.resources = this.defaultResourcesPermission;
         }




    //    let index = this.roles.findIndex(role => role.id == this.Admin_id)
    //    let permission = this.roles[index].permission
    //    if(!permission){
    //        this.resources = this.defaultResourcesPermission
    //    }else{
    //      this.resources = JSON.parse(permission)
    //    }

     }



  },

  async created() {
    this.Admin_id = this.Users.role;
this.changeAdmin();
  },

};

</script>
<style lang="css" scoped>

</style>
