"use strict";
import express from 'express';
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
app.use((req, res) => {
    res.status(404).json({
        message: "Endpoint no encontrado"
    });
});

// Iniciar servidor
app.listen(PORT, () => {
    console.log('Escuchando solicitudes en el puerto', PORT);
});
