<template>
  <nav class="bg-blue-600 text-white shadow-md">
    <div class="flex items-center justify-between p-4">
      <!-- Logo + Titel -->
      <RouterLink to="/" class="flex items-center space-x-2">
        <img
          :src="logo"
          alt="FC Wiesharde Logo"
          class="h-10 w-auto bg-white rounded-md p-1 shadow-sm"
        />
        <span class="text-xl font-bold tracking-wide">App</span>
      </RouterLink>

      <!-- Desktop Navigation -->
      <div class="hidden md:flex flex-row items-center space-x-4">
        <RouterLink to="/kader" class="font-semibold px-1 py-1 rounded hover:bg-blue-500 transition">KADER</RouterLink>
        <RouterLink to="/spieltag" class="font-semibold px-1 py-1 rounded hover:bg-blue-500 transition">SPIELTAG</RouterLink>
        <RouterLink to="/training" class="font-semibold px-1 py-1 rounded hover:bg-blue-500 transition">TRAINING</RouterLink>
      </div>

      <!-- Desktop Logout -->
      <div class="hidden md:flex items-center space-x-3">
        <span class="text-sm text-blue-200">{{ session?.user?.username }}</span>
        <button
          class="bg-white text-blue-600 font-semibold px-3 py-1 rounded hover:bg-blue-100 transition text-sm"
          @click="logout"
        >
          Logout
        </button>
      </div>

      <!-- Hamburger Button (Mobile) -->
      <button class="md:hidden p-2 rounded hover:bg-blue-500 transition" @click="menuOpen = !menuOpen">
        <svg v-if="!menuOpen" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
        </svg>
        <svg v-else xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </div>

    <!-- Mobile Menü -->
    <div v-if="menuOpen" class="md:hidden px-4 pb-4 flex flex-col space-y-2">
      <RouterLink to="/kader" class="font-semibold px-2 py-2 rounded hover:bg-blue-500 transition" @click="menuOpen = false">KADER</RouterLink>
      <RouterLink to="/spieltag" class="font-semibold px-2 py-2 rounded hover:bg-blue-500 transition" @click="menuOpen = false">SPIELTAG</RouterLink>
      <RouterLink to="/training" class="font-semibold px-2 py-2 rounded hover:bg-blue-500 transition" @click="menuOpen = false">TRAINING</RouterLink>
      <hr class="border-blue-500" />
      <div class="flex items-center justify-between">
        <span class="text-sm text-blue-200">{{ session?.user?.username }}</span>
        <button
          class="bg-white text-blue-600 font-semibold px-3 py-1 rounded hover:bg-blue-100 transition text-sm"
          @click="logout"
        >
          Logout
        </button>
      </div>
    </div>
  </nav>
</template>

<script setup lang="ts">
const { session, clear } = useUserSession();
const logo = '/fcw_logo.PNG';
const menuOpen = ref(false);

async function logout() {
  await $fetch('/api/auth/logout', { method: 'POST' });
  await clear();
  await navigateTo('/login');
}
</script>