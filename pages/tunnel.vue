<template>
  <div class="p-4">
    <h2 class="text-lg font-bold mb-4 text-slate-800">Tunnelliste</h2>

    <div v-if="kader" class="flex flex-col gap-3">
      <div
        v-for="row in kader?.kader"
        :key="row.id"
        class="flex items-center justify-between bg-slate-50 border border-slate-200 shadow-sm rounded-xl px-5 py-3 transition hover:shadow-md"
      >
        <!-- Name -->
        <p class="font-semibold text-slate-800">{{ row?.name }}</p>

        <!-- Counter + Buttons -->
        <div class="flex items-center gap-3 min-w-[200px] justify-end">
          <!-- Subtract -->
          <button
            @click="subTunnel(row)"
            class="w-10 h-10 flex items-center justify-center rounded-full bg-red-500 hover:bg-red-400 transition shadow text-white"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-6 h-6"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="5" y1="12" x2="19" y2="12" />
            </svg>
          </button>

          <!-- Tunnel Count -->
          <div
            class="min-w-[48px] text-center font-semibold text-slate-700 bg-white rounded-lg border border-slate-200 py-1 shadow-sm"
          >
            {{ row?.tunnel }}
          </div>

          <!-- Add -->
          <button
            @click="addTunnel(row)"
            class="w-10 h-10 flex items-center justify-center rounded-full bg-blue-500 hover:bg-blue-400 transition shadow text-white"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-6 h-6"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="12" y1="5" x2="12" y2="19" />
              <line x1="5" y1="12" x2="19" y2="12" />
            </svg>
          </button>
        </div>
      </div>
    </div>

    <!-- Optional: Zurück-Button -->
    <div class="flex justify-center mt-6">
      <RouterLink to="/bier">
        <button
          class="inline-flex items-center border border-blue-300 px-4 py-2 rounded-lg text-blue-600 hover:bg-blue-50 transition"
        >
          Zurück
        </button>
      </RouterLink>
    </div>
  </div>
</template>

<script setup lang="ts">
const kader = ref<any>([]);
kader.value = await $fetch("/api/tunnel-show");

async function addTunnel(spieler: any) {
  await $fetch("/api/tunnel-add", {
    method: "POST",
    body: { spieler },
  });
  kader.value = await $fetch("/api/tunnel-show");
}

async function subTunnel(spieler: any) {
  await $fetch("/api/tunnel-sub", {
    method: "POST",
    body: { spieler },
  });
  kader.value = await $fetch("/api/tunnel-show");
}
</script>
