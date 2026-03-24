export default defineEventHandler(async (event) => {
  const url = getRequestURL(event);

  // Login-Route immer erlauben
  if (url.pathname === '/api/auth/login') return;

  if (url.pathname.startsWith('/.well-known/')) return;

  // Nur API-Routen schützen
  if (!url.pathname.startsWith('/api/')) return;

  const session = await getUserSession(event);

  if (!session?.user) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Nicht autorisiert.',
    });
  }
});