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
- **Territorio:** mapa interactivo de Mendoza, contactos editables, filtros, búsqueda y registro de visitas/seguimiento.
- **Finanzas:** indicadores y gráficos calculados desde movimientos ingresados; filtros y exportación CSV; carga, vista previa y descarga del archivo Excel original.
- **Equipo:** perfiles y contactos de organizaciones con búsqueda, edición, estado y tipo.
- **Contactos:** directorio dedicado de personas, empresas y organizaciones relevantes para NEXO.
- **Objetivos:** metas medibles con unidad, fecha límite, progreso incremental, porcentaje y estado de cumplimiento.

## Datos y privacidad

Los datos de la aplicación se guardan en `localStorage` del navegador. Permanecen al recargar, pero solo están disponibles en ese navegador y dispositivo. No hay sincronización multiusuario, base de datos ni autenticación compartida en esta versión. Por eso todavía no se aplican permisos por rol; no cargues información sensible hasta configurar autenticación, autorización y almacenamiento de servidor.

La sección Excel conserva el archivo cargado en el mismo navegador; muestra una vista previa del CSV o de la primera hoja XLSX y la cantidad de hojas encontradas. No incorpora filas a los movimientos financieros: revisá la planilla y cargá los movimientos que correspondan. Reemplazar un archivo existente requiere confirmación.

El mapa usa Leaflet y mosaicos de OpenStreetMap; la planilla Excel usa SheetJS. Ambos se cargan desde CDN y el mapa requiere internet. Los lugares sin coordenadas siguen apareciendo en la lista, pero necesitan coordenadas para mostrarse como marcadores.

## Próximos pasos para colaboración

Para que el equipo comparta cambios, agregar una base de datos (por ejemplo PostgreSQL administrado) y autenticación, mover las operaciones de lectura/escritura a rutas de servidor y validar permisos por rol. Configurar las variables privadas en el proveedor de despliegue; nunca exponer claves en el navegador. Los costos dependen del proveedor, plan y uso. `.env.example` reserva nombres, no contiene credenciales.

## GitHub y Vercel

El código se publica en `https://github.com/nicopte/ControlNexo.git`, rama `main`. El archivo `vercel.json` configura la carpeta raíz como salida estática, sin comando de build. `.vercelignore` limita los despliegues directos por CLI a los archivos necesarios para servir la interfaz.

Para crear una vista previa desde una sesión autenticada de Vercel CLI: ejecutar `vercel` desde esta carpeta. La app no necesita variables de entorno para funcionar en modo local; no agregues secretos al repositorio.

Los cinco bocetos recibidos se guardan en `references/fotos_adminnexo/` como referencia de distribución.
