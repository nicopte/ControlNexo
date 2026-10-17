# NEXO Control

Aplicación privada e independiente para organizar NEXO. Interfaz en español y adaptable a escritorio y celular.

## Ejecutar

Requiere Node.js 20 o posterior. No necesita instalar dependencias:

```sh
npm run dev
```

Abrí http://localhost:3000. `npm start` usa el mismo servidor. La aplicación es estática y puede publicarse en Vercel como sitio estático.

## Secciones

- **Ideas:** lienzo con nodos movibles, ramas, edición, colores por horizonte y conexiones.
- **Calentarlo:** calendario mensual/semanal/agenda, gestión de eventos, categorías, estados y filtros.
- **Territorio:** mapa interactivo de Mendoza, sugerencias, fichas editables, notas, filtros y registro de visitas/seguimiento.
- **Finanzas:** indicadores y gráficos calculados desde movimientos ingresados; filtros y exportación CSV; carga, vista previa y descarga del archivo Excel original.
- **Equipo:** perfiles y contactos de organizaciones con búsqueda, edición, estado y tipo.
- **Contactos:** directorio dedicado de personas, empresas y organizaciones relevantes para NEXO.
- **Objetivos:** metas medibles con unidad, fecha límite, progreso incremental, porcentaje y estado de cumplimiento.

## Datos y sincronización compartida

La aplicación conserva una copia local y puede sincronizar los registros con Supabase. Para habilitarla, crea un proyecto Supabase, ejecuta `supabase/schema.sql` en su SQL Editor y configura `SUPABASE_URL` y `SUPABASE_ANON_KEY` en las variables de entorno de Vercel. Para desarrollo local, copia esos dos valores a `.env.local`; `server.js` solo expone esas variables desde `/api/config`. La clave usada en el navegador debe ser la publishable/anon key, nunca la `service_role` o secret key.

**Acceso público aceptado:** la tabla permite lectura, alta, edición y eliminación a cualquiera que tenga la URL de la app. El selector de integrantes es un nombre elegido, no verifica identidad; los nombres del historial son atribuciones declaradas por cada visitante. No guardes información confidencial, personal o financiera que no deba ser pública. La sincronización busca cambios cada cinco segundos; si dos personas editan el mismo registro a la vez, prevalece la última escritura.

La sección Excel conserva el archivo cargado en el mismo navegador; muestra una vista previa del CSV o de la primera hoja XLSX y la cantidad de hojas encontradas. No incorpora filas a los movimientos financieros: revisá la planilla y cargá los movimientos que correspondan. Reemplazar un archivo existente requiere confirmación.

El mapa usa Leaflet y mosaicos de OpenStreetMap; la planilla Excel usa SheetJS. Ambos se cargan desde CDN y el mapa requiere internet. Los lugares sin coordenadas siguen apareciendo en la lista, pero necesitan coordenadas para mostrarse como marcadores.

El esquema SQL deja deliberadamente habilitado el acceso público porque el equipo eligió usar selección de nombre sin verificación. Se puede cambiar a enlaces por email y políticas con identidad verificada más adelante.

## GitHub y Vercel

El código se publica en `https://github.com/nicopte/ControlNexo.git`, rama `main`. El archivo `vercel.json` configura la carpeta raíz como salida estática, sin comando de build. `.vercelignore` limita los despliegues directos por CLI a los archivos necesarios para servir la interfaz.

Para desplegar desde una sesión autenticada de Vercel CLI: ejecutar `vercel` desde esta carpeta. La URL y la clave publicable de Supabase se configuran en Settings → Environment Variables; nunca agregues claves de servicio al repositorio.

Los cinco bocetos recibidos se guardan en `references/fotos_adminnexo/` como referencia de distribución.
