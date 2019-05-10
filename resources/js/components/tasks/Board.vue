<template>
    <div class="container">
        <div class="row">
            <div :class="'list col-md-' + (selectedTask ?  '6': '12')">

                <div class="row">
                    <div class="col-md-12 controls">
                        <button class="btn btn-primary" v-on:click="addAndSelect">Add Task</button>
                        <div style="float: right;">
                            <input type="checkbox" v-model="showComplete" />
                            <span>Show Completed Tasks</span>
                        </div>   
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" >
                        <div class="task-list-item" v-for="task in filteredTasks" v-bind:key="task.id">
                            <task-list-item v-if="selectedTask && selectedTask.id === task.id"></task-list-item>
                            <div :class="task.is_complete ? 'complete' : ''" v-else v-on:click="() => goTo(task)">{{task.title || '&nbsp;'}}</div>
                        </div>
                    </div>
                    <div class="col-md-12 empty-items" v-on:click="addIfNonSelected">
                        <div class="task-list-item">&nbsp;</div>
                        <div class="task-list-item">&nbsp;</div>
                        <div class="task-list-item">&nbsp;</div>
                        <div class="task-list-item">&nbsp;</div>
                        <div class="task-list-item">&nbsp;</div>
                        <div class="task-list-item">&nbsp;</div>
                        <div class="task-list-item">&nbsp;</div>
                        <div class="task-list-item">&nbsp;</div>
                        <div class="task-list-item">&nbsp;</div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 selected-task-form" v-if="selectedTask">
                <edit-task></edit-task>
            </div>
        </div>
    </div> 
</template>
<script>
import { mapActions, mapState, mapGetters } from 'vuex';

export default {
    data() {
        return {};
    },
    created() {
        this.init();
    },
    watch: {
    // call again the method if the route changes
    '$route': 'init'
  },
    methods: {
        init() {
            if (this.$route.params.id) {
                this.getAndSelect(this.$route.params.id);
            }
        },
        addIfNonSelected() {
            if(!this.selectedTask || (this.selectedTask.title && this.selectedTask.title.trim())) {
                this.addAndSelect();
            }
        },
        goTo(task) {
            this.$router.replace('/tasks/' + task.id);
        },
        addAndSelect() {
            this.add()
                .then(t => {
                    this.goTo(t);
                });
        },
        ...mapActions([
            'add',
            'getAndSelect',
            'select'
        ])
    },
    computed: {
        ...mapState([
            'selectedTask'
        ]),

        ...mapGetters([
            'filteredTasks',
        ]),

        showComplete: {
            get () {
                return this.$store.state.showComplete
            },
            set (value) {
                this.$store.commit('updateShowComplete', value)
            }
        }
    }
}
</script>

<style lang="scss">
    .selected-task-form, .list {
        background-color: white;
        border-radius: 4px 4px 0 0;
        background-color: #fff;
        box-shadow: 0 1px 3px 0 rgba(21,27,38,.15);
    }
    .list {
        
        .controls {
            padding-top: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e0e6e8;
        }

        .task-list-item {
            border-bottom: 1px solid #e0e6e8;
            line-height: 35px;
            &:hover {
                cursor: pointer;
            }
            .complete {
                text-decoration: line-through;
                color: gray;
            }
        }
    }
</style>


