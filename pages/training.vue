<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Training</h2>
        <div class="flex flex-row gap-2 mr-2">
            
            <select class="dropdown p-2" v-model="selectedSpieler">
                <option v-for="spieler in restKader?.kader" :value="spieler">
                    {{ spieler.name }}
                </option>
            </select>
            <button @click="addSpieler" class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">Hinzufügen</button>
        </div>
        <div v-if="kader" class="flex flex-col gap-2 mt-2">
            
            <div class="p-3 rounded bg-slate-100 flex items-center justify-between" v-for="row in kader?.kader" :key="row.id">
                <div class="">
                    <p class="font-semibold"> {{ row?.name }}</p>
                </div>
                <div class="justify-between">              
                    <button @click="rmSpieler(row)" class="p-2 px-4 bg-red-500 text-white rounded hover:bg-red-400">
                        <svg fill="#000000" width="24px" height="24px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M2,21h8a1,1,0,0,0,0-2H3.071A7.011,7.011,0,0,1,10,13a5.044,5.044,0,1,0-3.377-1.337A9.01,9.01,0,0,0,1,20,1,1,0,0,0,2,21ZM10,5A3,3,0,1,1,7,8,3,3,0,0,1,10,5ZM23,16a1,1,0,0,1-1,1H15a1,1,0,0,1,0-2h7A1,1,0,0,1,23,16Z"/></svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/training-show')
    const restKader = ref<any>([]);
    restKader.value = await $fetch('/api/training-show-rest-kader')

    const selectedSpieler = ref('');

    async function rmSpieler(spieler: any) {
        const res = await $fetch('/api/training-rm-spieler', {
            method: "POST",
            body: {
                spieler: spieler
            }
        }).then( async () => {
            kader.value = await $fetch('/api/training-show')
            restKader.value = await $fetch('/api/training-show-rest-kader')
        })
    }
    async function addSpieler() {
        const res = await $fetch('/api/training-add-spieler', {
            method: "POST",
            body: {
                spieler: selectedSpieler.value
            }
        }).then( async () => {
            kader.value = await $fetch('/api/training-show')
            restKader.value = await $fetch('/api/training-show-rest-kader')
        })
    }
</script>