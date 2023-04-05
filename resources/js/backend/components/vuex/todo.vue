<template>
    <div>
        <h1>Todos</h1>
        <h1>Total Book : {{ this.$store.getters.totalBook }}</h1>
        <input type="text" v-model="bookName"> <button @click="addBook">Add</button>
 <ul>
    <li v-for="(book,index) in bookList" :key="index">{{ book }} <button @click="removeBook(index)">delete</button></li>
 </ul>
    </div>
</template>
<script>
import { mapState,mapActions } from 'vuex';
export default {
    data (){
        return {
        bookName:'',
        }
    },
computed:{
...mapState({
    bookList:'bookList',
}),

    // bookList(){
    //     return this.$store.state.bookList;
    // }
},
methods:{
    addBook(){
        this.$store.dispatch("addBook",this.bookName);
    },

    //method 2 direct call
    // removeBook(index){
    //     this.$store.commit("REMOVE_BOOK",index);
    // },


    ...mapActions({
    removeBook:'removeBook',

    })

},
mounted(){

}

}
</script>
