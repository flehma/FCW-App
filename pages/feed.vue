<template>
  <div class="p-4 max-w-2xl mx-auto">
    <h1 class="text-2xl font-bold mb-6">📰 News-Feed</h1>

    <div v-if="eintraege.length === 0" class="text-center text-gray-400 mt-20">
      Noch keine Einträge vorhanden.
    </div>

    <div class="space-y-3">
      <div
        v-for="eintrag in eintraege"
        :key="eintrag.id"
        class="bg-white rounded-xl shadow-sm p-4 flex items-start space-x-4"
      >
        <!-- Icon -->
        <div
          :class="{
            'bg-red-100 text-red-500': eintrag.typ === 'strafe',
            'bg-yellow-100 text-yellow-500': eintrag.typ === 'bier',
            'bg-blue-100 text-blue-500': eintrag.typ === 'material',
          }"
          class="rounded-full p-2 text-xl flex-shrink-0"
        >
          {{ eintrag.typ === 'strafe' ? '💰' : eintrag.typ === 'bier' ? '🍺' : '🎒' }}
        </div>

        <!-- Inhalt -->
        <div class="flex-1">
          <p class="font-semibold text-gray-900">{{ eintrag.spieler_name }}</p>
          <p class="text-gray-600 text-sm">{{ eintrag.beschreibung }}</p>
          <p class="text-gray-400 text-xs mt-1">{{ formatDatum(eintrag.erstellt_am) }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const eintraege = ref<any[]>([]);

async function laden() {
  eintraege.value = await $fetch('/api/feed-show') as any[];
}

function formatDatum(datum: string) {
  return new Date(datum).toLocaleString('de-DE', {
    day: '2-digit',
    month: '2-digit',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
}

onMounted(laden);
</script>