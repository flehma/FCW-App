<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Spieler</h2>
        <div class="mr-2 w-full">
            <select class="dropdown p-2 w-full" v-model="selectedSpieler">
                <option v-for="spieler in kader?.kader" :value="spieler">
                    {{ spieler.name }}
                </option>
            </select>
        </div>
        <h2 class="text-lg font-bold mt-4">Grund</h2>
        <div class="mr-2 w-full">
            <select class="dropdown p-2 w-full" v-model="selectedStrafe">
                <option v-for="strafe in strafen?.strafen" :value="strafe">
                    {{ strafe.strafe }}
                </option>
            </select>
        </div>
    </div>
    <div class="flex flex-row items-center">
        <button @click="eintragen" class="m-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
            Eintragen
        </button>
        <RouterLink to="/bier">
            <button class="inline-flex items-center border border-blue-300 px-4 py-2 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
        </RouterLink>        
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/kader-show')

    const strafen = ref<any>([]);
    strafen.value = await $fetch('/api/strafkisten-show')

    const selectedSpieler = ref('');
    const selectedStrafe = ref('');

    async function eintragen() {
        const res = await $fetch('/api/bier-eintragen', {
            method: "POST",
            body: {
                spieler: selectedSpieler.value,
                strafe: selectedStrafe.value
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }

</script>