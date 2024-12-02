"use strict"
import { Router } from 'express'
import { getAdelantos
    } from '../controllers/adelanto.controllers.js';

const router = Router();
//cursos
router.get("/adelantos/:id", getAdelantos)

export default router; //exportamos
