import { createServer } from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { extname, join, normalize } from 'node:path';

const root = process.cwd();
const types = { '.html':'text/html; charset=utf-8', '.css':'text/css; charset=utf-8', '.js':'text/javascript; charset=utf-8', '.json':'application/json', '.svg':'image/svg+xml' };
createServer(async (req,res) => {
  try {
    const path = normalize(decodeURIComponent(new URL(req.url,'http://localhost').pathname)).replace(/^([/\\]|\.\.[/\\])+/g,'');
    let file = join(root, path || 'index.html');
    if ((await stat(file)).isDirectory()) file = join(file, 'index.html');
    const body = await readFile(file);
    res.writeHead(200, { 'Content-Type': types[extname(file)] || 'application/octet-stream', 'Cache-Control':'no-store' }); res.end(body);
  } catch { res.writeHead(404); res.end('No encontrado'); }
}).listen(process.env.PORT || 3000, () => console.log(`NEXO Control disponible en http://localhost:${process.env.PORT || 3000}`));
