# Estado del proyecto NEXO Control

Última actualización: 16 de octubre de 2026

Este archivo resume el estado del prototipo y sirve para retomar el trabajo en otra sesión.

## Situación actual

NEXO Control es una aplicación web en español, adaptable a escritorio y celular. Está implementada con HTML, CSS y JavaScript sin proceso de compilación ni dependencias instaladas para ejecutarla. La versión actual es un prototipo local; todavía no se publicó en Vercel ni tiene base de datos compartida o autenticación.

La aplicación estaba abierta en `http://localhost:4173/#territorio`. Para iniciarla de nuevo, ejecutar `npm run dev` desde esta carpeta y abrir `http://localhost:3000`. El servidor admite `PORT` para elegir otro puerto, por ejemplo 4173.

## Secciones y cambios realizados

- **Mapa de ideas:** lienzo movible con zoom, nodos editables, conexiones y organización. Se eliminó el contenido de ejemplo; solo queda el nodo central NEXO. Se limpia también la nota antigua guardada en el navegador.
- **Calendario:** vistas mensual, semanal y agenda, eventos, filtros y panel del día.
- **Territorio:** mapa de Mendoza con lugares guardados, contactos, seguimiento y búsqueda de sugerencias desde OpenStreetMap/Overpass. Las sugerencias se limitan al área visible del mapa; los puntos se agrupan cuando el zoom es bajo, la consulta tiene un límite de 220 resultados y la lista muestra hasta 60. Una caché en memoria acelera repetir la misma búsqueda.
- **Territorio, visita:** cada sugerencia tiene una casilla **Ya fuimos**. Al marcarla, el lugar se guarda con estado Visitado y una anotación de fecha; al desmarcarla pasa a Pendiente de visita. Los lugares agregados quedan visibles en el mapa.
- **Territorio, carga:** Leaflet tiene un CDN alternativo y, si falla la capa de OpenStreetMap, se intenta usar una capa de CARTO. Sin conexión queda una vista esquemática. Las consultas de sugerencias prueban dos endpoints y tienen tiempos de espera acotados.
- **Finanzas:** indicadores, gráficos, filtros, movimientos, exportación CSV y carga/vista previa/descarga de Excel. La planilla cargada no se transforma automáticamente en movimientos.
- **Datos de NEXO:** pestaña final con pageviews y visitantes de Vercel Analytics a partir de un CSV, gastos y movimientos registrados en Finanzas, y acceso a Equipo y contactos. No presenta métricas inventadas.
- **Equipo y contactos:** perfiles, empresas, filtros, estado y fichas individuales como subvista de Datos de NEXO.

## Archivos principales

- `index.html`: estructura de navegación y carga de librerías externas.
- `app.js`: render de las páginas, interacciones, persistencia local y consultas del mapa.
- `styles.css`: estilos de la interfaz y marcadores.
- `server.js`: servidor local sencillo.
- `package.json`: comandos `npm run dev` y `npm start`.
- `references/fotos_adminnexo/`: los cinco bocetos de referencia.
- `.env.example`: nombres de variables de ejemplo, sin credenciales.
- `.vercelignore`: limita el despliegue directo a `index.html`, `app.js` y `styles.css`; excluye bocetos, documentos de estado y el proyecto TrucoLan.
- `.gitignore`: excluye los metadatos de Vercel, dependencias y secretos locales si luego se crea un repositorio.

## Datos y limitaciones conocidas

- Los datos se guardan en `localStorage`; viven en este navegador y dispositivo y no se comparten con el equipo. Para un uso real multiusuario hace falta integrar base de datos, autenticación y permisos en servidor. Supabase es una opción pendiente de configurar.
- No se encontró el Excel de movimientos en la carpeta del proyecto. El archivo deberá compartirse para importar y revisar sus datos.
- La importación de tráfico está preparada para CSV con fecha, pageviews y visitors. La conexión automática con Vercel no está configurada; requiere habilitar Web Analytics y guardar el token de acceso solo en el servidor. Documentación: [Vercel Web Analytics API](https://vercel.com/docs/analytics/web-analytics-api).
- OpenStreetMap y Overpass dependen de internet y de los datos aportados por la comunidad. Las fichas pueden no tener descripción, foto, teléfono o coordenadas, y los datos no indican popularidad.
- Las librerías del mapa y el libro de Excel se sirven desde CDN.
- La sintaxis de `app.js` y `server.js` se comprobó con `node --check`. La consulta de Overpass tuvo demoras en una revisión anterior; conviene volver a probar visualmente la carga del mapa, la búsqueda y la casilla **Ya fuimos** al reabrir la app.
- Esta carpeta no tenía un repositorio `.git` al actualizar este estado. No se hizo despliegue.

## Preparación para Vercel

1. Revisar el prototipo local y confirmar el diseño y las funciones del mapa.
2. Crear un repositorio privado para esta carpeta y subir el código fuente.
3. Importar el repositorio en Vercel como sitio estático, con esta carpeta como raíz y sin comando de build, o publicar una vista previa con `vercel` desde esta carpeta. El archivo `.vercelignore` deja fuera documentos y proyectos no relacionados. Probar las rutas y el comportamiento del navegador desplegado.
4. Antes de usar datos compartidos, decidir el esquema de Supabase, autenticación, permisos por rol y migración de los datos locales.
5. Conectar Vercel Analytics desde una función de servidor y configurar credenciales privadas como variables de entorno; no poner tokens en `app.js`.
6. Importar el Excel real, revisar la vista previa y confirmar el mapeo de columnas antes de incorporar movimientos.

## Próxima continuación sugerida

Probar la app en el navegador después de recargar, especialmente Territorio: mosaicos del mapa, sugerencias cercanas, carga/descarga, marcadores agrupados y marcado de visitado. Después preparar el repositorio privado y definir si se integra Supabase antes del primer despliegue público.
