<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Tunnelliste</h2>
        <div v-if="kader" class="flex flex-col gap-2 mt-2">
            
            <div class="p-3 px-6 rounded bg-slate-100 flex items-center justify-between" v-for="row in kader?.kader" :key="row.id">
                <div class="">
                    <p class="font-semibold"> {{ row?.name }}</p>
                </div>

                <div class="flex flex-row justify-between">              
                    <button @click="addTunnel(row)" class="mr-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                        <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6 12H18M12 6V18" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </button>
                    <div class="font-semibold p-4"> {{ row?.tunnel }}</div>
                    <button @click="subTunnel(row)" class="mr-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                        <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6 12L18 12" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/tunnel-show')

    async function addTunnel(spieler: any) {
        const res = await $fetch('/api/tunnel-add', {
            method: "POST",
            body: {
                spieler: spieler
            }
        }).then( async () => {
            kader.value = await $fetch('/api/tunnel-show')
        })
    }

    async function subTunnel(spieler: any) {
        const res = await $fetch('/api/tunnel-sub', {
            method: "POST",
            body: {
                spieler: spieler
            }
        }).then( async () => {
            kader.value = await $fetch('/api/tunnel-show')
        })
    }
    
</script>