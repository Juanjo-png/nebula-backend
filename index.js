"use strict";
import express from 'express';
import conexion from './src/mysql_conector.js';  // Asegúrate de que la ruta sea correcta
import routerLibros from './src/routes/libros.routes.js';
import routerUsuarios from './src/routes/usuarios.routes.js';
import routerEtiquetas from './src/routes/etiquetas.routes.js';
import routerCategorias from './src/routes/categorias.routes.js';
import routerPagos from './src/routes/pagos.routes.js';
import routerSeries from './src/routes/series.routes.js';
import routerEnvios from './src/routes/envios.routes.js';
import routerAdelantos from './src/routes/adelantos.routes.js';
import routerNoticias from './src/routes/noticias.routes.js';
import cors from 'cors';
import { PORT } from './src/config.js';

const app = express();

// Habilitar CORS
app.use(cors());

// Usar middleware para parsear el cuerpo de las solicitudes antes de las rutas
app.use(express.json()); // Puedes quitar bodyParser si usas express.json()

// Rutas
app.use(routerLibros);
app.use(routerUsuarios);
app.use(routerEtiquetas);
app.use(routerCategorias);
app.use(routerSeries);
app.use(routerPagos);
app.use(routerEnvios);
app.use(routerAdelantos);
app.use(routerNoticias);

// Middleware para manejar endpoints no encontrados (404)
app.get('/test-libros', async (req, res) => {
    try {
      const [rows] = await conexion.query('SELECT * FROM libros');  // Realizar consulta a la tabla libros
      if (rows.length > 0) {
        console.log('Datos obtenidos de la tabla libros:', rows);  // Mostrar datos en la consola
        res.json({ message: 'Datos obtenidos correctamente', data: rows });  // Enviar los datos como respuesta
      } else {
        res.status(404).json({ message: 'No se encontraron libros en la base de datos' });
      }
    } catch (error) {
      console.error('Error al obtener los datos de la base de datos:', error);  // Mostrar el error en la consola
      res.status(500).json({ message: 'Error al obtener los datos', error: error.message });
    }
  });

// Iniciar servidor
app.listen(PORT, () => {
    console.log('Escuchando solicitudes en el puerto', PORT);
});
