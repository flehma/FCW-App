export default defineNuxtRouteMiddleware((to) => {
  const { loggedIn } = useUserSession();

  // Login-Seite ist immer zugänglich
  if (to.path === '/login') return;

  // Nicht eingeloggt → weiterleiten zur Login-Seite
  if (!loggedIn.value) {
    return navigateTo('/login');
  }
});
