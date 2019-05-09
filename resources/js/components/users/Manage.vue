<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>User Management</h1>
                 <router-link class="btn btn-primary" :to="'add'">Add User</router-link>
                <div class="row">
                    <div v-for="user in users" v-bind:key="user.id" class="col-md-3" style="padding-top: 10px">
                        <div class="card" >
                            <div class="card-header">
                                <router-link :to="'users/' + user.id">
                                    {{user.name}}
                                </router-link>
                            </div>
                            <div class="card-body">
                                <div>{{user.email}}</div>
                                <div>{{user.role}}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState } from 'vuex';
    export default {
        data() {
            return {};
        },
        mounted() {
            
        },
        computed: {
            ...mapState([
                'users'
            ])
        }
    }
</script>
