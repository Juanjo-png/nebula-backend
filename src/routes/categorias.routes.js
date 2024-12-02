"use strict"
import { Router } from 'express'
import { getCategorias, getCategoria,
    } from '../controllers/categorias.controllers.js';

const router = Router();
//cursos
router.get("/categorias", getCategorias)
router.get("/categorias/:id", getCategoria)

export default router; //exportamos
