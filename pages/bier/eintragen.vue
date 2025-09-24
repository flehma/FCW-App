<template>
  <div class="p-4">
    <!-- Spieler Auswahl -->
    <h2 class="text-xl font-bold mb-2 text-slate-700">Spieler</h2>
    <div class="mb-4 w-full">
      <select
        class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:ring-2 focus:ring-blue-400 focus:outline-none transition"
        v-model="selectedSpieler"
      >
        <option disabled value="">-- Spieler auswählen --</option>
        <option v-for="spieler in kader?.kader" :key="spieler.id" :value="spieler">
          {{ spieler.name }}
        </option>
      </select>
    </div>

    <!-- Strafe Auswahl -->
    <h2 class="text-xl font-bold mb-2 text-slate-700">Grund</h2>
    <div class="mb-6 w-full">
      <select
        class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:ring-2 focus:ring-blue-400 focus:outline-none transition"
        v-model="selectedStrafe"
      >
        <option disabled value="">-- Strafe auswählen --</option>
        <option v-for="strafe in strafen?.strafen" :key="strafe.id" :value="strafe">
          {{ strafe.strafe }}
        </option>
      </select>
    </div>

    <!-- Buttons -->
    <div class="flex justify-center gap-3">
      <button
        @click="eintragen"
        class="px-5 py-2 bg-blue-500 text-white rounded-xl font-medium hover:bg-blue-400 transition"
      >
        Eintragen
      </button>

      <RouterLink to="/bier">
        <button
          class="px-5 py-2 border border-blue-300 rounded-xl text-blue-600 font-medium hover:bg-blue-50 transition"
        >
          Zurück
        </button>
      </RouterLink>
    </div>
  </div>
</template>

<script setup lang="ts">
const kader = ref<any>([]);
kader.value = await $fetch("/api/kader-show");

const strafen = ref<any>([]);
strafen.value = await $fetch("/api/bier-show");

const selectedSpieler = ref("");
const selectedStrafe = ref("");

async function eintragen() {
  await $fetch("/api/bier-eintragen", {
    method: "POST",
    body: {
      spieler: selectedSpieler.value,
      strafe: selectedStrafe.value,
    },
  });

  kader.value = await $fetch("/api/kader-show");
}
</script>
