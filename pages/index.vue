<template>
    <div class="flex p-40 items-center justify-between ">
        <div @click="clear">Spieltag und Training löschen</div>
        <div>Kader verwalten</div>
    </div>
    <div class="flex p-40 items-center justify-between ">
        <div>Material verteilen</div>
        <div>Bier verteilen</div>
        <RouterLink to="/tunnel"><div>Tunnel eintragen</div></RouterLink>
    </div>
</template>

<script setup lang="ts">

async function clear() {
        const res = await $fetch('/api/clear')
    }

</script>