import Vuex from 'vuex';

const store = new Vuex.Store({
    state: {
      users: []
    },
    mutations: {
      load (state, users) {
        state.users = users.concat([]);
      },
      update (state, user) {
        const existingUser = state.users.findIndex(oldUser => oldUser.id === user.id);
        if(existingUser >= 0) {
            const users = state.users;
            users.splice(existingUser, 1, user);
            state.users = users.concat([]);
        }
      },
      add (state, user) {
        debugger;
        state.users = state.users.concat([user]);
      }
    },
    actions: {
        init({commit}) {
            return axios.get('/api/v1/users')
                .then(({data}) => {
                    commit('load', data);
                });
        },
        save({commit}, user) {
            if(user.id) {
                return axios.post('/api/v1/users/' + user.id, user)
                    .then(response => commit('update', response.data));
            } else {
                return axios.post('/api/v1/users', user)
                    .then(response => commit('add', response.data));
            }
        },
        get({commit}, userId) {
            return axios.get('/api/v1/users/' + userId)
                .then(response => {
                    const uptoDateUser = response.data;
                    commit('update', uptoDateUser);
                    return uptoDateUser;
                });
        }
    }
  });

  export default store;