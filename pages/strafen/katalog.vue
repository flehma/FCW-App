<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Katalog</h2>
        <div v-if="strafen" class="flex flex-col gap-2 mt-2">
            <div  v-for="strafe in strafen?.strafen">
                <div class="p-3 rounded bg-slate-100 flex items-center justify-between">
                    <div class="max-w-[272px]">
                        {{ strafe?.strafe }} {{ strafe?.pro_x_text }}
                    </div>
                    <div v-if="strafe?.wert_kiste" class="font-semibold text-center p-1 rounded bg-blue-500 w-[60px] h-[60px]">
                        {{ strafe?.wert_geld }}€<br>{{ strafe?.wert_kiste }}&nbsp;Kiste
                    </div>
                    <div v-if="!strafe?.wert_kiste" class="font-semibold text-center p-1 rounded bg-blue-500 w-[60px] ">
                        {{ strafe?.wert_geld }}€
                    </div>
                </div>
            </div>
        </div>
        <div class="flex mt-2 flex-row items-center">
            <RouterLink to="/strafen/add">
                <button class="mr-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">Hinzufügen</button>
            </RouterLink>
            <RouterLink to="/strafen">
                <button class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
            </RouterLink>        
        </div>
    </div>
</template>

<script setup lang="ts">
    const strafen = ref<any>([]);
        strafen.value = await $fetch('/api/strafen-show')
</script>
