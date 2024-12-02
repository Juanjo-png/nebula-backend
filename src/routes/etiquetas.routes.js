"use strict"
import { Router } from 'express'
import { getEtiquetas, getEtiqueta,
    } from '../controllers/etiquetas.controllers.js';

const router = Router();
//cursos
router.get("/etiquetas", getEtiquetas)
router.get("/etiquetas/:id", getEtiqueta)

export default router; //exportamos
