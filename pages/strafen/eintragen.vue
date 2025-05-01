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
        <h2 class="text-lg font-bold mt-4">Strafe</h2>
        <div class="mr-2 w-full">
            <select class="dropdown p-2 w-full" v-model="selectedStrafe" @change="calculate">
                <option v-for="strafe in strafen?.strafen" :value="strafe">
                    {{ strafe.strafe }}
                </option>
            </select>
        </div>
        <div>
            <table class="mt-2">
                <tbody>
                    <tr>
                        <td class="font-bold">Anzahl</td>
                        <td class="font-bold">Strafe</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" v-model="anzahl" @change="calculate" :disabled="!selectedStrafe.pro_x_text" class="p-2"/>
                        </td>
                        <td>
                            {{ betrag }} € <span v-if="selectedStrafe.wert_kiste"> und {{ selectedStrafe.wert_kiste }} Kiste(n)</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="flex flex-row items-center">
        <button @click="eintragen" class="m-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
            Eintragen
        </button>
        <RouterLink to="/material">
            <button class="inline-flex items-center border border-blue-300 px-4 py-2 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
        </RouterLink>        
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/kader-show')

    const strafen = ref<any>([]);
    strafen.value = await $fetch('/api/strafen-show')

    const betrag = ref(0);

    const selectedSpieler = ref('');
    const selectedStrafe = ref('');

    let anzahl = 1;
    async function eintragen() {
        const res = await $fetch('/api/strafen-eintragen', {
            method: "POST",
            body: {
                spieler: selectedSpieler.value,
                geld: betrag.value,
                kiste: selectedStrafe.value.wert_kiste
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }

    async function calculate() {
        if(selectedStrafe.value.pro_x_text && selectedStrafe.value.pro_x_text == 'pro 5 min') {
            betrag.value = selectedStrafe.value.wert_geld * anzahl / 5;
        } else if (selectedStrafe.value.pro_x_text && selectedStrafe.value.pro_x_text == 'pro Teil') {
            betrag.value = selectedStrafe.value.wert_geld * anzahl
        } else {
            betrag.value = selectedStrafe.value.wert_geld
        }
        
    }

</script>