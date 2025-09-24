<template>
  <div class="p-4">
    <h2 class="text-xl font-bold mb-4 text-slate-700">Offene Kisten</h2>

    <div v-if="kader" class="flex flex-col gap-3">
      <div
        v-for="row in kader?.kader"
        :key="row.id"
        class="p-4 rounded-2xl bg-white shadow-sm border flex items-center justify-between transition hover:shadow-md"
      >
        <!-- Spielername -->
        <p class="font-semibold text-slate-700">{{ row?.name }}</p>

        <!-- rechte Seite -->
        <div class="flex items-center gap-3">
          <!-- Kisten-Badge -->
          <div
            class="px-3 py-2 min-w-[90px] font-semibold text-white text-center rounded-xl bg-blue-500"
          >
            {{ row?.kiste }} Kiste(n)
          </div>

          <!-- Button -1 -->
          <button
            @click="mitgenommen(row)"
            class="p-2 w-[48px] h-[48px] flex items-center justify-center rounded-xl bg-red-500 text-white transition hover:bg-red-400"
            title="Eine Kiste mitgenommen"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              class="w-6 h-6"
            >
              <line
                x1="5"
                y1="12"
                x2="11"
                y2="12"
                stroke="white"
                stroke-width="2"
                stroke-linecap="round"
              />
              <path
                d="M16 7 L14 9"
                stroke="white"
                stroke-width="2"
                stroke-linecap="round"
              />
              <path
                d="M16 7 L16 17"
                stroke="white"
                stroke-width="2"
                stroke-linecap="round"
              />
              <path
                d="M14 17 L18 17"
                stroke="white"
                stroke-width="2"
                stroke-linecap="round"
              />
            </svg>
          </button>
        </div>
      </div>

      <!-- Back Button -->
      <div class="flex justify-center mt-4">
        <RouterLink to="/bier">
          <button
            class="inline-flex items-center gap-2 border border-blue-300 px-4 py-2 rounded-xl text-blue-600 font-medium hover:bg-blue-50 transition"
          >
            ← Zurück
          </button>
        </RouterLink>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const kader = ref<any>([]);
kader.value = await $fetch("/api/bier-spieler-show");

async function mitgenommen(spieler: any) {
  await $fetch("/api/bier-mitgenommen", {
    method: "POST",
    body: {
      spieler,
    },
  });
  kader.value = await $fetch("/api/bier-spieler-show");
}
</script>
