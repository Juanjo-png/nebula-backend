"use strict"

//instalar el paquete expres
/**
 * El paquete Express es el framework de backend más popular de node
 * Proporciona un conjunto de herramientas para aplicaciones web, peticiones y respuestas http,
 * enrutamiento y middleware para construir y desplegar aplicaciones a gran escala
 */

import express from 'express';
import routerLibros from './src/routes/libros.routes.js' 
import routerUsuarios from './src/routes/usuarios.routes.js' 
import routerEtiquetas from './src/routes/etiquetas.routes.js' 
import routerCategorias from './src/routes/categorias.routes.js' 
import routerPagos from './src/routes/pagos.routes.js' 
import routerSeries from './src/routes/series.routes.js' 
import routerEnvios from './src/routes/envios.routes.js'
import routerAdelantos from './src/routes/adelantos.routes.js'
import routerNoticias from './src/routes/noticias.routes.js'
import cors from 'cors'; 
import {PORT}  from './src/config.js'
import bodyParser from 'body-parser';
//import './config.js'

const app=express(); //creado el objeto con la instacia de express
//configurar el puerto
//const PORT=3000;
//responder a los endpoint. Representa una acción de la API

//habilitar CORS
app.use(cors());
//middleware
app.use(express.json());


app.use(routerLibros);
app.use(routerUsuarios);
app.use(routerEtiquetas);
app.use(routerCategorias);
app.use(routerSeries);
app.use(routerPagos);
app.use(routerEnvios);
app.use(routerAdelantos);
app.use(routerNoticias);
//servidor a la escucha por el puerto 3000

//middlewarre, controlar si se pasa una ruta en la url
app.use((req, res)=>{
    res.status(404).json({
        message:"endpoint no encontrado"
    })
})
app.listen(PORT,()=>{
    console.log('escuchando solicitud');
})