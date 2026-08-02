<template>
  <div class="p-4 sm:p-6 max-w-md mx-auto h-screen overflow-auto">
    <h2 class="text-lg font-bold mb-4">{{ editId ? 'Grund bearbeiten' : 'Neue Strafenkiste hinzufügen' }}</h2>

    <!-- Grund / Strafe -->
    <div class="mb-3">
      <label class="block mb-1 font-medium">Grund</label>
      <input type="text" v-model="grundInput" class="w-full p-2 border rounded"/>
    </div>

    <!-- Einmalig / Wiederholbar (Toggle-Buttons) -->
    <div class="mb-3">
      <div class="flex gap-3">
        <button
          @click="isOnce = 'TRUE'"
          :class="[
            'px-4 py-3 rounded border flex-1 text-center transition',
            isOnce === 'TRUE'
              ? 'bg-blue-500 text-white border-blue-600'
              : 'bg-white text-gray-700 border-gray-300 hover:bg-gray-100'
          ]"
        >
          Einmalig
        </button>
        <button
          @click="isOnce = 'FALSE'"
          :class="[
            'px-4 py-3 rounded border flex-1 text-center transition',
            isOnce === 'FALSE'
              ? 'bg-blue-500 text-white border-blue-600'
              : 'bg-white text-gray-700 border-gray-300 hover:bg-gray-100'
          ]"
        >
          Wiederholbar
        </button>
      </div>
    </div>

    <!-- Buttons -->
    <div class="flex justify-center gap-4 mt-6">
      <button @click="eintragen" class="px-4 py-3 bg-blue-500 text-white rounded hover:bg-blue-400 flex-1">
        {{ editId ? 'Speichern' : 'Eintragen' }}
      </button>
      <RouterLink to="/bier">
        <button class="w-full px-4 py-3 border border-blue-300 rounded-md text-blue-500 hover:bg-blue-50 flex-1">
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
import { useRoute, useRouter } from 'vue-router'

const route = useRoute()
const router = useRouter()

// Edit-Modus, wenn ?id=<strafkistenId> in der URL steht (gleiche Oberfläche wie beim Hinzufügen, nur vorausgefüllt)
const editId = route.query.id ? Number(route.query.id) : null

const grundInput = ref('')
const isOnce = ref<'TRUE' | 'FALSE'>('FALSE') // Default: Wiederholbar

if (editId) {
  const data = await $fetch('/api/bier-get', { query: { id: editId } })
  const s = (data as any)?.strafe
  if (s) {
    grundInput.value = s.strafe ?? ''
    isOnce.value = s.einmal === 'TRUE' ? 'TRUE' : 'FALSE'
  }
}

const toastMessage = ref('')
const toastType = ref<'success' | 'error'>('success')

function showToast(message: string, type: 'success' | 'error' = 'success') {
  toastMessage.value = message
  toastType.value = type
  setTimeout(() => {
    toastMessage.value = ''
  }, 2000)
}

async function eintragen() {
  try {
    if (editId) {
      await $fetch('/api/bier-update', {
        method: "POST",
        body: {
          id: editId,
          strafe: grundInput.value,
          einmal: isOnce.value
        }
      })
      showToast("Eintrag erfolgreich aktualisiert!", "success")
    } else {
      await $fetch('/api/bier-add-strafe', {
        method: "POST",
        body: {
          strafe: grundInput.value,
          einmal: isOnce.value
        }
      })
      showToast("Eintrag erfolgreich gespeichert!", "success")
    }

    setTimeout(() => {
      router.push('/bier/katalog')
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
