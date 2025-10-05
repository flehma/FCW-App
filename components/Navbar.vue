<template>
  <nav class="flex items-center justify-between p-4 bg-blue-600 text-white shadow-md">
    <!-- Logo + Titel -->
    <div class="flex items-center space-x-3">
      <RouterLink to="/" class="flex items-center space-x-2">
        <img
          src="/fcw_logo.PNG"
          alt="FC Wiesharde Logo"
          class="h-10 w-auto bg-white rounded-md p-1 shadow-sm"
        />
        <span class="text-xl font-bold tracking-wide">App</span>
      </RouterLink>
    </div>

    <!-- Navigation -->
    <div class="flex flex-row items-center space-x-4">
      <RouterLink
        to="/kader"
        class="font-semibold px-1 py-1 rounded hover:bg-blue-500 transition"
      >
        KADER
      </RouterLink>
      <RouterLink
        to="/spieltag"
        class="font-semibold px-1 py-1 rounded hover:bg-blue-500 transition"
      >
        SPIELTAG
      </RouterLink>
      <RouterLink
        to="/training"
        class="font-semibold px-1 py-1 rounded hover:bg-blue-500 transition"
      >
        TRAINING
      </RouterLink>
    </div>
  </nav>
</template>

<script setup lang="ts">
</script>
