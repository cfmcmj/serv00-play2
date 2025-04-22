const COOKIE_NAME = 'auth_token';

export async function onRequestPost(context) {
  const { request, env } = context;
  const body = await request.formData();
  const enteredPassword = body.get('password');
  const PASSWORD = env.CFP_PASSWORD;

  if (enteredPassword === PASSWORD) {
    const headers = new Headers();
    headers.append('Set-Cookie', `${COOKIE_NAME}=valid; Path=/; HttpOnly; Secure; SameSite=Strict; Max-Age=3600`);
    return new Response('验证成功', { status: 200, headers });
  } else {
    return new Response('密码错误', { status: 401 });
  }
}