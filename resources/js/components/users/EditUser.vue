<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 v-show="isNew">Add User</h1>
                <h1 v-show="!isNew">{{originalName}}</h1>
                <form>
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input class="form-control" id="name" aria-describedby="nameHelp" placeholder="Full Name" v-model="name">
                        <small id="nameHelp" class="form-text text-muted">First and last name.</small>
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Email" v-model="email">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group" v-show="isNew">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" v-model="password">
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <select v-model="role">
                            <option>student</option>
                            <option>employee</option>
                            <option>admin</option>
                        </select>
                    </div>
                   
                    </form>
                    <button class="btn btn-primary" v-on:click="submitUser">Save</button>
                    <button class="btn btn-danger" v-on:click="cancel">Cancel</button>
            </div>
        </div>
    </div>
</template>
<script>
import { mapActions } from 'vuex';
import _ from 'lodash';

export default {
    data() {
        return {
            name: '',
            originalName: '',
            email: '',
            password: '',
            role: 'student'
        };
    },
    mounted() {
        if (this.$route.params.id) {
            this.get(this.$route.params.id)
                .then(u => {
                    this.id = this.$route.params.id;
                    this.originalName = u.name;
                    this.name = u.name;
                    this.email = u.email;
                    this.role = u.role;
                });
        }
    },
    computed: {
        isNew() {
            return !this.$route.params.id;
        }
    },
    methods: {
        cancel() {
            this.$router.replace('/');
        },
        submitUser() {
            const newUser = {
                name: this.name,
                email: this.email,
                role: this.role
            };
            if (this.isNew) {
                newUser.password = this.password;
            } else {
                newUser.id = this.id;
                newUser._method = 'PATCH';
            }
            this.save(newUser)
                .then(u => {
                    this.$router.replace('/');
                })
                .catch(err => {
                    alert(_.get(err, 'err.response.data.message', 'Unexpected error occurred.'));
                });
            
        },
        ...mapActions([
            'save',
            'get'
        ])
    }
}
</script>
