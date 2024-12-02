"use strict"
import { check, validationResult } from 'express-validator'

export const validacion = [
    // //validar el nombre del cliente
    // check("idCurso").exists().notEmpty() .withMessage("El id del curso no puede estar vacío."),
    // check("idModulo").exists().notEmpty(). withMessage("El id del módulo no puede estar vacío."),
    // check("idAlumno").exists().isNumeric().notEmpty() .withMessage("El id del alumno no puede estar vacío."),
    // check("calificacion").exists().notEmpty().withMessage("Las calificaciones no pueden estar vacías."),

    // (req, res, next) => {
    //     const errors = validationResult(req); //array tantas filas como campos valide
    //     if (!errors.isEmpty()) {
    //         res.status(400).json({
    //             errors: errors.array() //devolver el mensaje
    //         })
    //     } else { //todo correcto
    //         next(); //sigue la ejecución del siguiente middleware
    //     }
    // }
]
