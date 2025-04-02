<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Tunnelliste</h2>
        <div v-if="kader" class="flex flex-col gap-2 mt-2">
            
            <div class="p-3 px-6 rounded bg-slate-100 flex items-center justify-between" v-for="row in kader?.kader" :key="row.id">
                <div class="">
                    <p class="font-semibold"> {{ row?.name }}</p>
                </div>

                <div class="flex flex-row justify-between">              
                    <button @click="addTunnel(row)" class="mr-2 p-2 px-4 bg-green-500 text-white rounded hover:bg-green-400">+</button>
                    <div class="font-semibold p-4"> {{ row?.tunnel }}</div>
                    <button @click="subTunnel(row)" class="mr-2 p-2 px-4 bg-green-500 text-white rounded hover:bg-green-400">-</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/kader-show')

    const spielerInput = ref('');

    async function addTunnel(spieler: any) {
        const res = await $fetch('/api/tunnel-add', {
            method: "POST",
            body: {
                spieler: spieler
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }

    async function subTunnel(spieler: any) {
        const res = await $fetch('/api/tunnel-sub', {
            method: "POST",
            body: {
                spieler: spieler
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }
    
</script>