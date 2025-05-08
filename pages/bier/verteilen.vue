<template>
    <div class="p-4">
        *Bier für diese Woche*<br><br>
        *Dienstag*: @{{ kisten.dienstag[0].name }}<br><br>
        *Donnerstag*: @{{ kisten.donnerstag[0].name }}<br><br>
        *Spieltag*:  @{{ kisten.spieltag[0].name }} und @{{ kisten.spieltag[1].name }}<br><br>
        
        Bitte kümmert euch selbstständig darum Ersatz zu finden, falls ihr keine Möglichkeit habt Bier zu besorgen.
    </div>
    <div class="flex mt-4 flex-col items-center">
        <RouterLink to="/bier">
            <button class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
        </RouterLink>        
    </div>
    
</template>

<script setup lang="ts">
    
const kisten = ref<any>([]);
    kisten.value = await $fetch('/api/strafkisten-generate')

</script>
