<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Katalog</h2>
        <div v-if="strafen" class="flex flex-col gap-2 mt-2">
            <div  v-for="strafe in strafen?.strafen">
                <div class="p-3 rounded bg-slate-100 flex items-center justify-between">
                    <div class="max-w-[272px]">
                        {{ strafe?.strafe }}
                    </div>
                </div>
            </div>
        </div>
        <div class="flex mt-2 flex-col items-center">
            <RouterLink to="/bier">
                <button class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
            </RouterLink>        
        </div>
    </div>
</template>

<script setup lang="ts">
    const strafen = ref<any>([]);
        strafen.value = await $fetch('/api/bier-show')
</script>
