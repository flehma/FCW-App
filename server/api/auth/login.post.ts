export default defineEventHandler(async (event) => {
  const { username, password } = await readBody(event);

  // Nutzer aus .env laden (kommagetrennte Liste: "user1:pass1,user2:pass2")
  const usersEnv = process.env.AUTH_USERS || '';
  const users = usersEnv.split(',').map((entry) => {
    const [u, p] = entry.trim().split(':');
    return { username: u, password: p };
  });

  const match = users.find(
    (u) => u.username === username && u.password === password
  );

  if (!match) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Ungültiger Benutzername oder Passwort.',
    });
  }

  await setUserSession(event, {
    user: { username: match.username },
  });

  return { ok: true };
});
