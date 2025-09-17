<template>
    <div class="p-2 max-w-md mx-auto">
        <h2 class="text-lg font-bold mt-4">Grund</h2>
        <div class="mr-2 w-full">
            <input type="text" v-model="grundInput" class="p-2 border rounded w-full"/>
        </div>

        <!-- Radio-Buttons -->
        <div class="mt-4">
            <label class="mr-4">
                <input type="radio" value="TRUE" v-model="isOnce" class="mr-1"/>
                Einmalig
            </label>
            <label>
                <input type="radio" value="FALSE" v-model="isOnce" class="mr-1"/>
                Wiederholbar
            </label>
        </div>
        
        <div class="flex flex-row items-center mt-4">
            <button @click="eintragen" class="mr-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                Eintragen
            </button>
            <RouterLink to="/bier">
                <button class="inline-flex items-center border border-blue-300 px-4 py-2 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
            </RouterLink>        
        </div>
    </div>


    <!-- Toast -->
    <transition name="fade">
        <div v-if="toastMessage" 
             :class="['fixed bottom-4 right-4 px-4 py-2 rounded shadow text-white',
                      toastType === 'success' ? 'bg-green-500' : 'bg-red-500']">
            {{ toastMessage }}
        </div>
    </transition>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const grundInput = ref('');
const isOnce = ref("FALSE"); // Default: einmalig
const toastMessage = ref('');
const toastType = ref<'success' | 'error'>('success');
const router = useRouter();

function showToast(message: string, type: 'success' | 'error' = 'success') {
    toastMessage.value = message;
    toastType.value = type;
    setTimeout(() => {
        toastMessage.value = '';
    }, 2000);
}

async function eintragen() {
    try {
        await $fetch('/api/bier-add-strafe', {
            method: "POST",
            body: {
                grund: grundInput.value,
                once: isOnce.value
            }
        });

        showToast("Eintrag erfolgreich gespeichert!", "success");
        setTimeout(() => {
            router.push('/bier/katalog');
        }, 2000);
    } catch (error) {
        console.error(error);
        showToast("Fehler beim Speichern!", "error");
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
