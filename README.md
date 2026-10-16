# K19TS · Gestor de torneos Yu-Gi-Oh!

Proyecto independiente para torneos GOAT, Edison y Advanced. No es software oficial de Konami ni una implementación certificada del algoritmo KTS.

## Funciones actuales
- Inscripción de jugadores y configuración de rondas suizas.
- Emparejamiento orientativo evitando enfrentamientos repetidos cuando es posible.
- Botones WIN / DRAW / LOSE por match, puntaje 3 / 1 / 0; marcador de juegos editable.
- BYE, clasificación y porcentajes OMW, GW y OGW orientativos.
- Exportar clasificación CSV y respaldo JSON.
- Página publica `public.html?torneo=CODIGO`, refresco cada cinco segundos.
- Panel privado de resultados por login Supabase.

## Habilitar la nube (necesario para que funcione entre celulares)
1. Crear proyecto en https://supabase.com .
2. En Supabase > Authentication > Users crear el usuario organizador con email y contraseña.
3. Ejecutar `supabase.sql` en SQL Editor del proyecto.
4. En `config.js` colocar la Project URL y la clave **pública** (anon o publishable) de Supabase. Nunca colocar service_role, secret key o contraseñas.
5. GitHub: Settings > Pages > Deploy from a branch > main > /(root). Esperar URL de Pages.
6. Abrir `index.html` desde Pages. En la pestaña 'En vivo' introducir URL, clave pública, código de torneo, email y contraseña, y pulsar 'Conectar / publicar'.
7. Compartir URL de `public.html?torneo=CODIGO` que aparece en el panel. Los duelistas verán mesas y clasificación automáticamente.

**Importante:** todos los datos que se publican, incluidos los nombres de participantes, serán visibles públicamente. La sesión del administrador se mantiene en memoria de la pestaña; al cerrarla hay que iniciar sesión de nuevo. Antes de una competición real se deben validar emparejamientos, desempates y reglas de empate/tiempo con el reglamento del evento. Dos administradores editando simultáneamente pueden sobrescribir cambios. No hay Top Cut aún.
