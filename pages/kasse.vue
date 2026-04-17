<template>
  <div class="p-4 max-w-2xl mx-auto">
    <h1 class="text-2xl font-bold mb-6">Mannschaftskasse</h1>

    <!-- Übersicht -->
    <div class="grid grid-cols-2 gap-4 mb-8">
      <div class="bg-green-100 rounded-xl p-4 text-center">
        <div class="text-3xl font-bold text-green-600">{{ bezahltGesamt }}€</div>
        <div class="text-sm text-gray-500 mt-1">Eingegangen</div>
      </div>
      <div class="bg-red-100 rounded-xl p-4 text-center">
        <div class="text-3xl font-bold text-red-500">{{ offenGesamt }}€</div>
        <div class="text-sm text-gray-500 mt-1">Ausstehend</div>
      </div>
    </div>

    <!-- Sommer-Halbjahr -->
    <div class="mb-8">
      <h2 class="text-lg font-bold mb-3">🌞 Sommer-Halbjahr (25€)</h2>
      <div class="space-y-2">
        <div
          v-for="eintrag in sommer"
          :key="eintrag.spieler_id"
          class="flex items-center justify-between bg-white rounded-lg p-3 shadow-sm"
        >
          <span class="font-medium">{{ eintrag.name }}</span>
          <button
            :class="eintrag.bezahlt
              ? 'bg-green-500 hover:bg-green-600 text-white'
              : 'bg-gray-200 hover:bg-gray-300 text-gray-700'"
            class="px-4 py-1 rounded-full text-sm font-semibold transition"
            @click="toggle(eintrag.spieler_id, 'sommer')"
          >
            {{ eintrag.bezahlt ? '✓ Bezahlt' : 'Offen' }}
          </button>
        </div>
      </div>
    </div>

    <!-- Winter-Halbjahr -->
    <div>
      <h2 class="text-lg font-bold mb-3">❄️ Winter-Halbjahr (25€)</h2>
      <div class="space-y-2">
        <div
          v-for="eintrag in winter"
          :key="eintrag.spieler_id"
          class="flex items-center justify-between bg-white rounded-lg p-3 shadow-sm"
        >
          <span class="font-medium">{{ eintrag.name }}</span>
          <button
            :class="eintrag.bezahlt
              ? 'bg-green-500 hover:bg-green-600 text-white'
              : 'bg-gray-200 hover:bg-gray-300 text-gray-700'"
            class="px-4 py-1 rounded-full text-sm font-semibold transition"
            @click="toggle(eintrag.spieler_id, 'winter')"
          >
            {{ eintrag.bezahlt ? '✓ Bezahlt' : 'Offen' }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const eintraege = ref<any[]>([]);

const sommer = computed(() => eintraege.value.filter(e => e.halbjahr === 'sommer'));
const winter = computed(() => eintraege.value.filter(e => e.halbjahr === 'winter'));

const bezahltGesamt = computed(() =>
  eintraege.value.filter(e => e.bezahlt).length * 25
);
const offenGesamt = computed(() =>
  eintraege.value.filter(e => !e.bezahlt).length * 25
);

async function laden() {
  await $fetch('/api/kasse-init');
  eintraege.value = await $fetch('/api/kasse-show') as any[];
}

async function toggle(spieler_id: number, halbjahr: string) {
  await $fetch('/api/kasse-toggle', {
    method: 'POST',
    body: { spieler_id, halbjahr }
  });
  await laden();
}

onMounted(laden);
</script>