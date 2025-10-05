<template>
  <div class="p-4">
    <!-- Fehlerausgabe -->
    <div
      v-if="material.response === 'error'"
      class="bg-red-50 text-red-700 p-4 rounded-lg border border-red-200"
    >
      Es müssen zuerst Spieler zum Training/Spieltag hinzugefügt werden.
    </div>

    <!-- Materialausgabe -->
    <div
      v-else
      class="relative bg-slate-50 border border-slate-200 rounded-xl shadow-sm p-5 text-slate-800"
    >
      <!-- Copy Button -->
      <button
        @click="copyToClipboard"
        class="absolute top-3 right-3 flex items-center gap-1 text-sm text-blue-600 hover:text-blue-800 transition"
      >
        <svg
          v-if="!copied"
          xmlns="http://www.w3.org/2000/svg"
          class="w-5 h-5"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          stroke-width="2"
        >
          <rect x="9" y="9" width="13" height="13" rx="2" ry="2" />
          <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1" />
        </svg>
        <svg
          v-else
          xmlns="http://www.w3.org/2000/svg"
          class="w-5 h-5 text-green-600"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          stroke-width="2"
        >
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
        <span v-if="!copied">Kopieren</span>
        <span v-else>✓ Kopiert!</span>
      </button>

      <!-- Textinhalt -->
      <div ref="textRef" class="whitespace-pre-line leading-relaxed">
        *Materialausgabe Spieltag*  
        <br><br>
        *Flaschen* 🥤: @{{ material.flaschen[0].name }}  
        <br><br>
        *Bälle* ⚽: @{{ material.bälle[0].name }}  
        <br><br>
        *Musikbox* 🎵: @{{ material.musikbox[0].name }}  
        <br><br>
        *Jacken* 🧥: @{{ material.jacken[0].name }} falls wir die brauchen  
        <br><br>
        *Kühlkoffer* 🚑: @Hauke Güntrath-Lorenzen  
        <br><br>
        Bitte heute nach dem Training mitnehmen!  
        <br><br>
        _Die Aufgabe zählt sowohl für die Hin- als auch die Abreise_  
        <br><br>
        Bitte kümmert euch selbstständig darum, Ersatz zu finden, falls ihr keine Möglichkeit habt, euer Material zu transportieren.
      </div>
    </div>

    <!-- Zurück Button -->
    <div class="flex mt-6 justify-center">
      <RouterLink to="/material">
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
const material = ref<any>([]);
material.value = await $fetch("/api/material-generate");

const textRef = ref<HTMLElement | null>(null);
const copied = ref(false);

function copyToClipboard() {
  const text = textRef.value?.innerText || "";
  navigator.clipboard.writeText(text);
  copied.value = true;

  setTimeout(() => {
    copied.value = false;
  }, 2000);
}
</script>
