<template>
    <div class="wrapper">

        <!-- Sidebar -->
        <nav id="sidebar">
            <ul class="list-group">
                <router-link class="list-group-item" tag="li" to="/">
                    <a>All Tasks</a>
                </router-link>
            </ul>
            <div class="report-card">
                <div class="count">
                    {{assignedToMeCountInComplete}}
                </div>
                <div class="description">
                    Open Tasks Assigned To Me
                </div>
            </div>
             <div class="report-card">
                <div class="count">
                    {{totalCountInComplete}}
                </div>
                <div class="description">
                    Total Open Tasks
                </div>
            </div>
            <div class="report-card">
                <div class="count">
                    {{totalCountComplete}}
                </div>
                <div class="description">
                    Total Completed Tasks
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div id="content">
            <router-view></router-view>    
        </div>

    </div>  
</template>
<script>
    import VueRouter from 'vue-router';
    import store from '../../stores/tasks';
    store.dispatch('init');
    import BoardView from './Board';
    import { mapActions, mapState, mapGetters } from 'vuex';
    const routes = [
        {path: '/', component: BoardView},
        {path: '/tasks/:id', component: BoardView},
    ];
    const router = new VueRouter({
        routes // short for `routes: routes`
    });
    export default {
        store,
        router,
        computed: {
            ...mapGetters([
                'assignedToMeCountInComplete',
                'totalCountInComplete',
                'totalCountComplete'
            ])
        }
    }
</script>


<style lang="scss">
    
    .wrapper {
        display: flex;
        align-items: stretch;
    }


    #sidebar.active {
        margin-left: -250px;
    }
    
    html {
        height: 100%;
    }
    body, #app, main, main > .wrapper {
        min-height: 100%;
        height: 100%;
    }

    #content {
        width: 100%;
    }

    #sidebar {
        h3 {
            padding-left: 10px;
        }
        min-width: 250px;
        max-width: 250px;
        background-color: #151b26;
        margin-top: -1.5rem;
        padding-top: 1.5rem;
        .list-group-item {
            border: none;
            background-color: #151b26;
            a {
                color: white;
            }
            &.router-link-active {
              background-color: rgba(255,255,255,.16);  
            }
        }

        .report-card {
            div {
                text-align: center;
            }
            .count {
                font-size: 32px;
            }
        }
        color: white;
    }

</style>

