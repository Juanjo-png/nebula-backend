"use strict"
import { Router } from 'express'
import {
    getNoticias, getNoticia, delNoticia, updateNoticias, addNoticia
} from '../controllers/noticias.controllers.js';
import validateToken from './validateToken.js';

const router = Router();
//cursos
router.get("/noticias", getNoticias)
router.get("/noticias/:id", getNoticia)
router.post("/noticias", addNoticia);
router.delete("/noticias/:id", delNoticia);
router.put("/noticias/:id", updateNoticias);
router.patch("/noticias/:id", updateNoticias);

export default router; //exportamos
