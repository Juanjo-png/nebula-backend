"use strict"
import { Router } from 'express'
import { getSeries, getSerie, getImgSerie, getTodasSeries
    } from '../controllers/series.controllers.js';

const router = Router();
//cursos
router.get("/seriesLibros", getTodasSeries)
router.get("/seriesLibros/:id", getSeries)
router.get("/seriesLibros/serie/:id", getSerie)
router.get("/seriesLibros/img/:id", getImgSerie)

export default router; //exportamos
