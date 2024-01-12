<template>
    <v-app v-if="displaying" style="background: transparent;">
        <v-container style="display: flex; justify-content: flex-end; align-items: flex-end; height: 100vh;">
            <v-sheet width="300" style="background: #1213148f; color: white;" class="pa-4">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <span>
                        <span style="font-size: 42px;">{{ speed }}</span> <span style="font-size: 20px;">km/h</span>
                    </span>

                    <span>
                        <v-icon :color="belt ? 'green' : 'red'" size="30">mdi-seatbelt</v-icon>
                        <v-icon class="ma-3" :color="engine <= 20 ? 'red' : 'orange' && engine >= 70 ? 'green' : 'orange'" size="30">mdi-engine</v-icon>
                    </span>
                </div>

                <div>
                    <v-progress-linear 
                        :model-value="fuel"
                        prepend-icon="mdi-gas-station"
                        height="25"
                        :color="fuel <= 20 ? 'red' : 'orange' && fuel >= 70 ? 'green' : 'orange'" size="30"
                    >
                        <template v-slot:default="{ value }">
                            <strong>{{ Math.ceil(value) }}%</strong>
                        </template>
                    </v-progress-linear>
                </div>
            </v-sheet>
        </v-container>
    </v-app>
</template>

<script>
    export default {
        name: 'App', 

        data: () => ({
            displaying: false, 

            speed: 100, 

            belt: true, 
            engine: 20, 
            fuel: 20, 
        }), 
        
        mounted() {
            this.eventListener = window.addEventListener('message', (event) => {
                const { type, data } = event.data; 

                if (type === 'display') {
                    this.displaying = true;
                    
                    this.speed = data.speed;
                    this.belt = data.belt;
                    this.engine = data.engine;
                    this.fuel = data.fuel;
                }

                if (type == 'hide') {
                    this.displaying = false;

                    this.speed = 0;
                    this.belt = false;
                    this.engine = 0;
                    this.fuel = 0;
                }
            })
        }
    }
</script>

<style>
    ::-webkit-scrollbar {
        display: none;
    }
</style>