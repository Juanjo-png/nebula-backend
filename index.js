"use strict"
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

const app=express(); 

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
    console.log('Escuchando solicitud', PORT);
})