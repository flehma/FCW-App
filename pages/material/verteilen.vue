<template>
    <div class="p-4">
        *Materialausgabe Spieltag*<br>
        *Flaschen* 🥤: {{ material.flaschen[0].name }}<br><br>
        *Bälle* ⚽: {{ material.bälle[0].name }}<br><br>
        *Musikbox* 🎵:  {{ material.musikbox[0].name }}<br><br>
        *Jacken* 🧥: {{ material.jacken[0].name }} falls wir die brauchen<br><br>
        *Kühlkoffer* 🚑: @Hauke Güntrath-Lorenzen<br><br>
        Bitte heute nach dem Training mitnehmen!<br><br>
        _Die Aufgabe zählt sowie für die Hin- und auch Abreise_<br><br>
        Bitte kümmert euch selbstständig darum Ersatz zu finden, falls ihr keine Möglichkeit habt euer Material zu transportieren.
    </div>
    <div class="flex mt-4 flex-col items-center">
        <RouterLink to="/material">
            <button class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
        </RouterLink>        
    </div>
    
</template>

<script setup lang="ts">
    
const material = ref<any>([]);
    material.value = await $fetch('/api/material-generate')

</script>
