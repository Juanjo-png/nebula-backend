"use strict"

//importar el paquete mysql para realizar la conexión

import {createPool} from "mysql2/promise"; //para trabajar con promesas
import { DB_HOST,DB_DATABASE,DB_PORT,DB_USER, DB_PASSWORD } from "./config.js";

const conexion=createPool(
    { //establecer las características de la conexión
        "host":DB_HOST,
        "user": DB_USER,
        "password":DB_PASSWORD,
        "database":DB_DATABASE,
        "port":DB_PORT,
        ssl: {
            rejectUnauthorized: false, // Deshabilitar la verificación de certificados para permitir la conexión SSL
        }
    }
)

// Verificar la conexión
// Verificar la conexión
conexion.getConnection()
    .then(() => {
        console.log(`Conexión exitosa a la base de datos: ${DB_DATABASE}`);
    })
    .catch((error) => {
        console.error(`Error de conexión a la base de datos ${DB_DATABASE}:`, error);
    });

export default conexion;