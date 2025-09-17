<template>
  <div class="p-4 sm:p-6 max-w-md mx-auto h-screen overflow-auto">
    <h2 class="text-lg font-bold mb-4">Neue Strafe hinzufügen</h2>

    <!-- Strafe -->
    <div class="mb-3">
      <label class="block mb-1 font-medium">Strafe</label>
      <input type="text" v-model="strafe" class="w-full p-2 border rounded"/>
    </div>

    <!-- Pro-X-Text (Toggle-Buttons) -->
    <div class="mb-3">
      <label class="block mb-1 font-medium">Pro x</label>
      <div class="flex gap-3">
        <button
          v-for="option in ['Nichts', 'pro 5 min', 'pro Teil']"
          :key="option"
          @click="proXText = option === 'Nichts' ? null : option"
          :class="[
            'px-4 py-3 rounded border transition flex-1 text-center',
            proXText === (option === 'Nichts' ? null : option)
              ? 'bg-blue-500 text-white border-blue-600'
              : 'bg-white text-gray-700 border-gray-300 hover:bg-gray-100'
          ]"
        >
          {{ option }}
        </button>
      </div>
    </div>

    <!-- Wert Geld -->
    <div class="mb-3">
      <label class="block mb-1 font-medium">Geldbetrag (€)</label>
      <input type="number" inputmode="numeric" pattern="[0-9]*" v-model.number="wertGeld" class="w-full p-2 border rounded"/>
    </div>

    <!-- Wert Kiste (Toggle-Buttons) -->
    <div class="mb-3">
      <label class="block mb-1 font-medium">Kasten</label>
      <div class="flex gap-3">
        <button
          v-for="option in [0, 1]"
          :key="option"
          @click="wertKiste = option === 0 ? null : 1"
          :class="[
            'px-4 py-3 rounded border transition flex-1 text-center',
            wertKiste === (option === 0 ? null : 1)
              ? 'bg-blue-500 text-white border-blue-600'
              : 'bg-white text-gray-700 border-gray-300 hover:bg-gray-100'
          ]"
        >
          {{ option }}
        </button>
      </div>
    </div>

    <!-- Buttons -->
    <div class="flex justify-center gap-4 mt-6">
      <button @click="eintragen" class="px-4 py-3 bg-blue-500 text-white rounded hover:bg-blue-400 flex-1">
        Eintragen
      </button>
      <RouterLink to="/bier/katalog" class="flex-1">
        <button class="w-full px-4 py-3 border border-blue-300 rounded-md text-blue-500 hover:bg-blue-50">
          Zurück
        </button>
      </RouterLink>
    </div>

    <!-- Toast -->
    <transition name="fade">
      <div v-if="toastMessage"
           :class="['fixed bottom-4 left-1/2 transform -translate-x-1/2 px-4 py-2 rounded shadow text-white',
                    toastType === 'success' ? 'bg-green-500' : 'bg-red-500']">
        {{ toastMessage }}
      </div>
    </transition>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const strafe = ref('')
const proXText = ref<string|null>(null)
const wertGeld = ref<number|null>(null)
const wertKiste = ref<number|null>(null)

const toastMessage = ref('')
const toastType = ref<'success' | 'error'>('success')
const router = useRouter()

function showToast(message: string, type: 'success' | 'error' = 'success') {
  toastMessage.value = message
  toastType.value = type
  setTimeout(() => {
    toastMessage.value = ''
  }, 2000)
}

async function eintragen() {
  try {
    await $fetch('/api/strafen-add-strafe', {
      method: "POST",
      body: {
        strafe: strafe.value,
        pro_x_text: proXText.value,
        wert_geld: wertGeld.value,
        wert_kiste: wertKiste.value
      }
    })

    showToast("Strafe erfolgreich gespeichert!", "success")
    setTimeout(() => {
      router.push('/strafen/katalog')
    }, 2000)
  } catch (error) {
    console.error(error)
    showToast("Fehler beim Speichern!", "error")
  }
}
</script>

<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
}
</style>
