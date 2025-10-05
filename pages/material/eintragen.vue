<template>
  <div class="p-4">
    <h2 class="text-2xl font-bold mb-6 text-slate-700">Materialverwaltung</h2>

    <!-- Materialgruppen dynamisch -->
    <div v-for="item in materialItems" :key="item.label" class="mb-5">
      <h3 class="text-lg font-semibold text-slate-700 mb-2">{{ item.label }}</h3>

      <div class="flex gap-2">
        <select
          v-model="item.selected"
          class="w-full px-3 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none transition"
        >
          <option disabled value="">-- Spieler auswählen --</option>
          <option v-for="spieler in kader?.kader" :key="spieler.id" :value="spieler">
            {{ spieler.name }}
          </option>
        </select>

        <button
          @click="item.action()"
          class="flex items-center justify-center w-12 h-12 bg-blue-500 text-white rounded-lg hover:bg-blue-400 transition"
        >
          <!-- dein Haken-Icon -->
          <svg
            class="w-6 h-6"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M23.228 8.01785C23.6186 7.62741 23.6187 6.99424 23.2283 6.60363L22.5213 5.89638C22.1309 5.50577 21.4977 5.50563 21.1071 5.89607L10.0862 16.9122C9.69563 17.3027 9.6955 17.9359 10.0859 18.3265L10.7929 19.0337C11.1833 19.4243 11.8165 19.4245 12.2071 19.034L23.228 8.01785Z"
              fill="#FFFFFF"
            />
            <path
              d="M17.2285 8.01777C17.619 7.62724 17.619 6.99408 17.2285 6.60356L16.5214 5.89645C16.1309 5.50592 15.4977 5.50592 15.1072 5.89645L5.54542 15.4582L2.76773 12.6805C2.37721 12.29 1.74404 12.29 1.35352 12.6805L0.646409 13.3876C0.255884 13.7782 0.255885 14.4113 0.646409 14.8019L4.83831 18.9938C5.22883 19.3843 5.862 19.3843 6.25252 18.9938L17.2285 8.01777Z"
              fill="#FFFFFF"
            />
          </svg>
        </button>
      </div>
    </div>

    <!-- Zurück Button -->
    <div class="flex justify-center mt-8">
      <RouterLink to="/material">
        <button
          class="inline-flex items-center border border-blue-300 px-4 py-2 rounded-lg text-blue-600 font-medium hover:bg-blue-50 transition"
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

// einzelne Refs für Auswahl
const selectedFlaschen = ref("");
const selectedMusikbox = ref("");
const selectedBälle = ref("");
const selectedJacken = ref("");

// dynamische Materialliste
const materialItems = [
  {
    label: "Flaschen",
    selected: selectedFlaschen,
    action: async () => {
      await $fetch("/api/material-add-flaschen", {
        method: "POST",
        body: { spieler: selectedFlaschen.value },
      });
      kader.value = await $fetch("/api/kader-show");
    },
  },
  {
    label: "Musikbox",
    selected: selectedMusikbox,
    action: async () => {
      await $fetch("/api/material-add-musikbox", {
        method: "POST",
        body: { spieler: selectedMusikbox.value },
      });
      kader.value = await $fetch("/api/kader-show");
    },
  },
  {
    label: "Bälle",
    selected: selectedBälle,
    action: async () => {
      await $fetch("/api/material-add-baelle", {
        method: "POST",
        body: { spieler: selectedBälle.value },
      });
      kader.value = await $fetch("/api/kader-show");
    },
  },
  {
    label: "Jacken",
    selected: selectedJacken,
    action: async () => {
      await $fetch("/api/material-add-jacken", {
        method: "POST",
        body: { spieler: selectedJacken.value },
      });
      kader.value = await $fetch("/api/kader-show");
    },
  },
];
</script>
