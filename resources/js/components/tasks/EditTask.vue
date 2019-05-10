<template>
  <div class="selected-form">
    <form>
      <input
          type="text"
          class="form-control form-control-lg"
          id="text"
          placeholder="Enter Task"
          :value="selectedTask.title"
          @input="e => saveProp({id: selectedTask.id, prop: 'title', value: e.target.value})"
        >

      <div class="form-check">
        <input type="checkbox" class="form-check-input" id="isComplete" :checked="selectedTask.is_complete" @change="toggleComplete">
        <label class="form-check-label" for="isComplete">Is Complete</label>
      </div>

      <div class="form-group">
        <label for="assignedTo">Assigned To</label>
        <select class="form-control" id="assignedTo" v-model="assigned_user">
            <option v-for="user in userOptions" v-bind:key="user.id" :value="user.id">
                {{user.name}} ({{user.email}}) ({{user.role}})
            </option>
        </select>
    </div>
      
    </form>
  </div>
</template>
<script>
import { mapActions, mapState } from "vuex";
export default {
  data() {
    return {
        userOptions: []
    };
  },
  mounted() {
      axios.get('/api/v1/users')
        .then(({data}) => {
            this.userOptions = data;
        });
  },
  computed: {
    ...mapState(["selectedTask"]),
    assigned_user: {
        get () {
            return this.selectedTask.assigned_user;
        },
        set (value) {
            this.saveProp({id: this.selectedTask.id, prop: 'assigned_user', value})
        }
    }
  },
  methods: {
    ...mapActions(["saveProp"]),
    toggleComplete(e) {
      const isComplete = !this.selectedTask.is_complete;
      this.saveProp({
        id: this.selectedTask.id,
        prop: "is_complete",
        value: isComplete
      }).then(() => this.$router.replace("/"));
    }
  }
};
</script>
<style lang="scss">
</style>


