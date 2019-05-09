<template>
    <router-view></router-view>
</template>
<script>
    import VueRouter from 'vue-router';
    import UserManagement from './Manage';
    import EditUser from './EditUser';
    import store from '../../stores/users';
    store.dispatch('init');
    const routes = [
        {path: '/', component: UserManagement},
        {path: '/add', component: EditUser},
        {path: '/users/:id', component: EditUser, props: true},
    ];

    const router = new VueRouter({
      routes // short for `routes: routes`
    });
    
    export default {
        router,
        store
    }
</script>
