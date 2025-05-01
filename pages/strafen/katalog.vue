<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Katalog</h2>
        <div v-if="strafen" class="flex flex-col gap-2 mt-2">
            <div  v-for="strafe in strafen?.strafen">
                <div class="p-3 rounded bg-slate-100 flex items-center justify-between">
                    <div>
                        {{ strafe?.strafe }} {{ strafe?.pro_x_text }}
                    </div>
                    <div class="font-semibold">
                        {{ strafe?.wert_geld }}€ <span v-if="strafe?.wert_kiste">und {{ strafe?.wert_kiste }}&nbsp;Kiste</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
    const strafen = ref<any>([]);
        strafen.value = await $fetch('/api/strafen-show')
</script>
