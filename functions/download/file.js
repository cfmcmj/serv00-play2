export async function onRequestGet(context) {
  const filePath = context.env.ASSETS.fetch('files/panelweb.tar.gz');
  const file = await filePath;
  return new Response(file.body, {
    headers: {
      'Content-Type': 'application/gzip',
      'Content-Disposition': 'attachment; filename="panelweb.tar.gz"',
    },
  });
}