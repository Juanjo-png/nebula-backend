"use strict"
import { Router } from 'express'
import {
    getLibros, getLibro, delLibro, getLibrosSerie, addLibro,
    updateLibro, getLibroPorCategoria, getNovedades, getSerie,
    getTodasNovedades, getLibroBusqueda, getLibroEditar
} from '../controllers/libros.controllers.js';
import validateToken from './validateToken.js';

const router = Router();
//cursos
router.get("/libros", getLibros)
router.get("/libros/:id", getLibro)
router.get("/libros/prueba/:id", getLibroEditar)
router.get('/libros/serie/:id', getLibrosSerie);
router.get('/libros/categoria/:id', getLibroPorCategoria);
router.get('/libros/novedades/novedadesTodas', getTodasNovedades);
router.get('/libros/novedades/:id', getNovedades);
router.get('/series/:id', getSerie);
router.get('/libros/buscar/:buscar', getLibroBusqueda);
router.post("/libros", addLibro);
router.delete("/libros/:id", delLibro); 
router.put("/libros/:id", updateLibro);
router.patch("/libros/:id", updateLibro);



export default router; //exportamos
