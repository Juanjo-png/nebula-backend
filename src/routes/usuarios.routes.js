"use strict"
import { Router } from 'express'
import { getUsuario, getUsuarios, registrarUsuario, loginUsuario, updateUsuario, updateUsuContraseña, getUsuarioByID, recuperarContra
    } from '../controllers/usuarios.controllers.js';
import validateToken from './validateToken.js';

const router = Router();
//cursos
router.get("/usuarios", getUsuarios)
router.get("/usuarios/:nombre",getUsuario),
router.get("/usuarios/id/:id",getUsuarioByID),
router.get("/usuarios/recuperarContra/:nombre/:pregunta",recuperarContra),
router.post('/usuarios', registrarUsuario);
router.post('/usuarios/login', loginUsuario);
router.put("/usuarios/:id", updateUsuario);
router.put("/usuarios/recuperarContra/:id", updateUsuContraseña);

export default router; //exportamos
