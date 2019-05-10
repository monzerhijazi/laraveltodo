<template>
    <div class="selected-list-item">
        <input class="selected" type="checkbox" :checked="selectedTask.is_complete" @change="toggleComplete" />
        <input placeholder="Enter Task" v-focus class="title" type="text" :value="selectedTask.title" @input="e => saveProp({id: selectedTask.id, prop: 'title', value: e.target.value})" />
    </div>
</template>
<script>
import { mapActions, mapState } from 'vuex';
export default {
    data() {
        return {};
    },
    computed: {
        ...mapState([
            'selectedTask'
        ])
    },
    methods: {
        ...mapActions([
            'saveProp'
        ]),
        toggleComplete(e) {
            const isComplete = e.target.value === 'on';
            this.saveProp({id: this.selectedTask.id, prop: 'is_complete', value: isComplete})
                .then(() => this.$router.replace('/'));
        }
    }
}
</script>
<style lang="scss">
.selected-list-item {
    background-color: white;
    border-top: 1px solid #14aaf5;
    border-bottom: 1px solid #14aaf5;
    box-shadow: inset 0 2px 5px -1px #e0e6e8;
    display: flex;
    flex: 1;
    .title {
        border: none;
        &:focus{
            outline: none;
        }
        flex: 5;
        padding-left: 10px;
    }
    .selected {
        align-self: center;
    }
}
</style>


