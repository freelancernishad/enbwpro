<template>
    <div>


        <main>

            <div v-for="task in tasks">


                <div class="d-flex justify-content-between mx-3 mt-3">
            <p>Balance：{{ task.packages.packagePrice }}</p>
            <p>receive：{{ task.task_comisition }}</p>
            </div>

            <div class="mx-3">
                <p>remark：Mining {{ task.task_comisition }}</p>
                <p style="font-size: 13px;color: #a4a4a4;margin-top: -14px;">{{ task.date }}</p>
            </div>
            <hr>
        </div>


        </main>

    </div>
</template>

<script>
export default {
    data(){
        return {
            tasks:{}
        }
    },
    methods: {
        async getTasks(){
            var userid = localStorage.getItem('userid');
            var res = await this.callApi('get',`/api/get/task/list/${userid}`,[]);
            this.tasks = res.data
        }
    },
    mounted() {
        this.getTasks();
    },
}
</script>
