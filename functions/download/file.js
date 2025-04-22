export async function onRequestGet(context) {
  try {
    // 尝试加载文件
    const fileUrl = new URL('/files/panelweb.tar.gz', 'https://my-files.pages.dev');
    const filePath = await context.env.ASSETS.fetch(fileUrl);
    
    // 检查响应是否成功
    if (!filePath.ok) {
      return new Response(`文件未找到: ${filePath.statusText}`, { status: filePath.status });
    }

    // 获取文件内容
    const file = await filePath;
    return new Response(file.body, {
      headers: {
        'Content-Type': 'application/gzip',
        'Content-Disposition': 'attachment; filename="panelweb.tar.gz"',
        'Cache-Control': 'no-store',
      },
    });
  } catch (error) {
    // 捕获并返回详细错误
    return new Response(`下载失败: ${error.message}`, { status: 500 });
  }
}