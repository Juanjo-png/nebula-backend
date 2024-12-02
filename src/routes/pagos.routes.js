"use strict"
import { Router } from 'express'
import { postItem, getItem, updateItem, checkItem
    } from '../controllers/pagos.controllers.js';

const router = Router();
//cursos
router.post("/pagos/orders", postItem);
router.get('/pagos/orders/:id', getItem);
router.patch('/pagos/orders/:id', updateItem);
router.patch('/pagos/orders/confirm/:id', checkItem);

export default router; //exportamos
