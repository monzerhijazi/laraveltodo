import Vuex from 'vuex';
import _ from 'lodash';
const store = new Vuex.Store({
    state: {
      tasks: [],
      showComplete: false,
      selectedTask: null
    },
    getters: {
        filteredTasks(state, getters) {
            const showComplete = state.showComplete;
            const tasks = state.tasks;
            const filteredTasks = tasks.filter(t => t.is_complete == false || showComplete);
            return filteredTasks;
        },
        assignedToMeCountInComplete(state) {
            const tasks = state.tasks;
            const filteredTasks = tasks.filter(t => t.assigned_user === window.user.id && t.is_complete == false);
            return filteredTasks.length;
        },
        totalCountInComplete(state) {
            const tasks = state.tasks;
            const filteredTasks = tasks.filter(t => t.is_complete == false);
            return filteredTasks.length;
        },
        totalCountComplete(state, getters) {
            return state.tasks.length - getters.totalCountInComplete;
        }
    },
    mutations: {
      updateShowComplete (state, value) {
        state.showComplete = value;
      },
      load (state, tasks) {
        tasks = _.isArray(tasks) ? tasks : _.values(tasks);
        state.tasks = tasks.concat([]);
      },
      update (state, task) {
        const existingTask = state.tasks.findIndex(oldTask => oldTask.id === task.id);
        if(existingTask >= 0) {
            const tasks = state.tasks;
            tasks.splice(existingTask, 1, task);
            state.tasks = tasks.concat([]);
        }
      },
      add (state, task) {
        state.tasks = state.tasks.concat([task]);
      },
      select (state, task) {
          state.selectedTask = task;
      }
    },
    actions: {
        init({commit}) {
            return axios.get('/api/v1/tasks')
                .then(({data}) => {
                    commit('load', data);
                });
        },
        save({commit}, task) {
            if(task.id) {
                return axios.post('/api/v1/tasks/' + task.id, task)
                    .then(response => commit('update', response.data));
            }
        },
        add({commit}) {
            return axios.post('/api/v1/tasks', {})
                    .then(response => {
                        commit('add', response.data);
                        return response.data;
                    });
        },
        get({commit}, taskId) {
            return axios.get('/api/v1/tasks/' + taskId)
                .then(response => {
                    const uptoDate = response.data;
                    commit('update', uptoDate);
                    return uptoDate;
                });
        },
        getAndSelect({commit, dispatch}, taskId) {
            return dispatch('get', taskId)
                .then(task => {
                    commit('select', task);
                });
        },
        select({commit}, task) {
            commit('select', task);
        },
        saveProp({dispatch, state}, {id, prop, value}) {
            const task = state.tasks.find(t => t.id === id);
            if (task) {
                task[prop] = value;
                task._method = 'PATCH';
                dispatch('select', task);
                return dispatch('save', task);
            } 
        }
    }
  });

  export default store;