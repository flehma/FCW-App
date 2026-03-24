<template>
  <div class="min-h-screen bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-sm">
      <!-- Logo + Titel -->
      <div class="flex flex-col items-center mb-6">
        <img
          :src="logo"
          alt="FC Wiesharde Logo"
          class="h-16 w-auto mb-3"
        />
        <h1 class="text-2xl font-bold text-blue-600">FCW App</h1>
        <p class="text-sm text-gray-500 mt-1">Bitte anmelden</p>
      </div>

      <!-- Fehler -->
      <div
        v-if="error"
        class="bg-red-100 text-red-700 text-sm px-4 py-2 rounded mb-4 text-center"
      >
        {{ error }}
      </div>

      <!-- Formular -->
      <div class="space-y-4">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">
            Benutzername
          </label>
          <input
            v-model="username"
            type="text"
            placeholder="Benutzername"
            class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
            @keyup.enter="login"
          />
        </div>
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">
            Passwort
          </label>
          <input
            v-model="password"
            type="password"
            placeholder="Passwort"
            class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
            @keyup.enter="login"
          />
        </div>
        <button
          :disabled="loading"
          class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-lg transition disabled:opacity-50"
          @click="login"
        >
          {{ loading ? 'Anmelden...' : 'Anmelden' }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({ layout: false });

const logo = '/fcw_logo.PNG';
const username = ref('');
const password = ref('');
const error = ref('');
const loading = ref(false);

async function login() {
  error.value = '';
  loading.value = true;
  try {
    await $fetch('/api/auth/login', {
      method: 'POST',
      body: { username: username.value, password: password.value },
    });
    window.location.replace('/');
  } catch (e: any) {
    error.value = e?.data?.statusMessage || 'Anmeldung fehlgeschlagen.';
  } finally {
    loading.value = false;
  }
}
</script>
