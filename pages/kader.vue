<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Kader</h2>
        <div class="flex flex-row gap-2 mr-2">
            <input type="text" v-model="spielerInput" placeholder="Vorname Nachname" class="p-2"/>
            <button @click="addSpieler" class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">Hinzufügen</button>
        </div>
        <div v-if="kader" class="flex flex-col gap-2 mt-2">
            
            <div class="p-3 px-6 rounded bg-slate-100 flex items-center justify-between" v-for="row in kader?.kader" :key="row.id">
                <div class="">
                    <p class="font-semibold"> {{ row?.name }}</p>
                </div>

                <div class="justify-between">              
                    <button @click="trainingAddSpieler(row)" class="mr-2 p-2 px-4 bg-green-500 text-white rounded hover:bg-green-400">Zum Training hinzufügen</button>
                    <button @click="spieltagAddSpieler(row)" class="mr-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">Zum Spieltag hinzufügen</button>
                    <button @click="rmSpieler(row)" class="p-2 px-4 bg-red-500 text-white rounded hover:bg-red-400">Aus dem Kader entfernen</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/kader-show')

    const spielerInput = ref('');

    async function addSpieler() {
        const res = await $fetch('/api/kader-add-spieler', {
            method: "POST",
            body: {
            name: spielerInput.value
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }

    async function rmSpieler(spieler: any) {
        const res = await $fetch('/api/kader-rm-spieler', {
            method: "POST",
            body: {
            spieler: spieler
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }
    async function spieltagAddSpieler(spieler: any) {
        const res = await $fetch('/api/spieltag-add-spieler', {
            method: "POST",
            body: {
            spieler: spieler
            }
        })
    }
    async function trainingAddSpieler(spieler: any) {
        const res = await $fetch('/api/training-add-spieler', {
            method: "POST",
            body: {
            spieler: spieler
            }
        })
    }
</script>