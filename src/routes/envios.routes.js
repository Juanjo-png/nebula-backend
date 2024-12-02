"use strict"
import { Router } from 'express'
import {
    getEnvios, getEnvio, addEnvio,
    updateEnvio,
    getEnvioPorUsuario,
    cancelarEnvio, 
} from '../controllers/envios.controllers.js';
import validateToken from './validateToken.js';

const router = Router();
//cursos
router.get("/envios", getEnvios)
router.get("/envios/:id", getEnvio)
router.get("/envios/usuario/:id", getEnvioPorUsuario)
router.post("/envios", addEnvio);
router.put("/envios/cancelar/:id", cancelarEnvio); 
router.put("/envios/:id", updateEnvio);
router.patch("/envios/:id", updateEnvio);



export default router; //exportamos
