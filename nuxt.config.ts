// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: false },
  modules: ['@nuxtjs/tailwindcss'],
  nitro: {
    experimental: {
      database: true
    }
  },
  vite: {
    server: {
      allowedHosts: ['localhost', 'fcw-app.cloud']
    }
  }
})
