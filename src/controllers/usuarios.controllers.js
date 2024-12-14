import { body } from "express-validator";
import conexion from "../mysql_conector.js";
import bcrypt from "bcryptjs"; 
import jwt from "jsonwebtoken";

export const getUsuarios = async (req, res) => {
    //get cursos
    try {
        //throw new Error();
        const [result] = await conexion.query("SELECT * FROM usuarios");
        console.log(result);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getUsuario = async (req, res) => {
    try {
        console.log(req.params);
        const { nombre} = req.params
        const [result] = await conexion.query("SELECT * FROM usuarios WHERE nombre=?", [nombre]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getUsuarioByID = async (req, res) => {
    try {
        console.log(req.params);
        const {id} = req.params
        const [result] = await conexion.query("SELECT * FROM usuarios WHERE id=?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const recuperarContra = async (req, res) => {
    try {
        console.log(req.params);
        const {nombre, pregunta} = req.params
        const [result] = await conexion.query("SELECT * FROM usuarios WHERE nombre=? AND Pregunta=?", [nombre,pregunta]);
        console.log(result);
        res.status(200).json(result); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getCategoria = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT nombre FROM categorias WHERE id=?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getEtiqueta = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT nombre FROM etiquetas WHERE id=?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const registrarUsuario = async (req, res) => {
    try {
        console.log(req.body);
        const {nombre, correo, contraseña, admin, pregunta} = req.body;
        const hashedPassword = await bcrypt.hash(contraseña, 10);
        const hashedPregunta = await bcrypt.hash(pregunta, 10);
        
        const [existeUsuario] = await conexion.query("SELECT * FROM usuarios WHERE nombre = ? AND contraseña = ?", [nombre, hashedPassword]);
        console.log(existeUsuario.length);

        if (existeUsuario.length > 0) {
            return res.status(400).json({
                message: "El usuario ya existe en la BD"
            });
        }

        const [result] = await conexion.query("INSERT INTO usuarios (nombre, correo, contraseña, admin, Pregunta) VALUES (?, ?, ?, ?, ?)", [nombre, correo, hashedPassword, admin, hashedPregunta]);
        console.log(result);
        res.status(201).json({ id: result.insertId });

       
    } catch (error) {
        console.error(error.message);
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
}

export const loginUsuario = async (req, res) => {
    try {
        console.log(req.body);
        const {nombre, contraseña} = req.body;
        const [contraseñaUsu] = await conexion.query("SELECT contraseña FROM usuarios WHERE nombre = ?", [nombre]);
        if(contraseñaUsu.length < 0){
            return res.status(400).json({
                message: "El usuario no existe en la BD"
            });
        }

        const validarContraseña = await bcrypt.compare(contraseña, String(contraseñaUsu[0].contraseña));
        
        if (!validarContraseña) {
            return res.status(400).json({
                message: "Contraseña Incorrecta"
            });
        }

        const [idUsu] = await conexion.query("SELECT id FROM usuarios WHERE nombre = ?", [nombre]);
        const [admin] = await conexion.query("SELECT admin FROM usuarios WHERE nombre = ?", [nombre]);
        
        const token = jwt.sign({
            idUsuario: idUsu,
            nombreUsuario: nombre,
            admin: admin,
        }, process.env.SECRET_KEY || "pepito133")

        res.json({token});

       
    } catch (error) {
        console.error(error.message);
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
}

export const updateUsuario = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, correo} = req.body;

        if (!nombre || !correo) {
            console.log("Datos recibidos:", req.body);
            return res.status(400).json({ message: "Todos los campos son requeridos" });
        }

        console.log("Datos recibidos:", { id, nombre, correo});


        const [result] = await conexion.query(
            "UPDATE usuarios SET nombre = ?, correo = ? WHERE id = ?",
            [nombre,correo,id]
        );

        console.log("Resultado de la actualización:", result);

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Usuario no encontrado" });
        }

        res.status(200).json({ message: "Usuario actualizado correctamente" });
    } catch (error) {
        console.error("Error en el servidor:", error);
        res.status(500).json({ message: "Error en el servidor" });
    }
};

export const updateUsuContraseña = async (req, res) => {
    try {
        const { id } = req.params;
        const { contraseña } = req.body; // Asegúrate de incluir la contraseña

        if (!contraseña) {
            return res.status(400).json({ message: "La contraseña es requerida" });
        }

        const hashedPassword = await bcrypt.hash(contraseña, 10); // Usando bcryptjs
        const [result] = await conexion.query(
            "UPDATE usuarios SET contraseña = ? WHERE id = ?",
            [hashedPassword, id]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Usuario no encontrado" });
        }

        res.status(200).json({ message: "Contraseña actualizada correctamente" });
    } catch (error) {
        console.error("Error en el servidor:", error);
        res.status(500).json({ message: "Error en el servidor" });
    }
};



