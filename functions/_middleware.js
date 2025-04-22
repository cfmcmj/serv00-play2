const COOKIE_NAME = 'auth_token';

export async function onRequest(context) {
  const { request, next } = context;
  const url = new URL(request.url);
  const path = url.pathname;

  if (path === '/download/file') {
    const cookie = request.headers.get('cookie');
    if (!cookie || !cookie.includes(`${COOKIE_NAME}=valid`)) {
      return new Response('未授权访问', { status: 401 });
    }
  }

  return next();
}