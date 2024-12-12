import conexion from "../mysql_conector.js"

export const getEnvios = async (req, res) => {
    //get cursos
    try {
        //throw new Error();
        const [result] = await conexion.query("SELECT envios.*, usuarios.nombre AS nombre_usuario FROM envios JOIN usuarios ON envios.usuario = usuarios.id ORDER BY envios.id DESC;");
        console.log(result);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getEnvio = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT * FROM envios WHERE id = ?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getEnvioPorUsuario = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT * FROM envios WHERE usuario = ? && estado = 'Enviado' OR estado = 'Entregado' ORDER BY id DESC", [id]);
        console.log(result);
        res.status(200).json(result); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const cancelarEnvio = async (req, res) => {
    try {
        const { id } = req.params;
        const [result] = await conexion.query(
            "UPDATE envios SET estado = 'Cancelado' WHERE id = ?",[id]
        );

        console.log("Resultado de la actualización:", result);

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Envio no encontrado" });
        }

        res.status(200).json({ message: "Envio actualizado correctamente" });
    } catch (error) {
        console.error("Error en el servidor:", error);
        res.status(500).json({ message: "Error en el servidor" });
    }
}

export const delEnvio = async (req, res) => {
    try {
        const { id } = req.params
        const [result] = await conexion.query("DELETE FROM envios WHERE id=?", [id]);
        console.log(result);
        if (result.affectedRows == 0) {
            return res.status(400).json({
                message: 'no existe'
            })
        } else {
            return res.status(200).json({
                message: 'ha sido borrado'
            })
        }
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
}

export const addEnvio = async (req, res) => {
    try {
        // Validar que todos los campos requeridos estén presentes
        const { nombre, productos, direccion, usuario, estado, comunidad, codigoPostal, provincia } = req.body;
        
        if (!nombre || !productos || !direccion || !usuario || !estado || !comunidad || !codigoPostal || !provincia) {
            return res.status(400).json({
                message: "Faltan datos requeridos. Verifica el cuerpo de la solicitud."
            });
        }

        // Insertar el envío en la base de datos
        const [result] = await conexion.query(
            `INSERT INTO envios 
            (nombre, productos, direccion, usuario, estado, comunidad, codigoPostal, provincia) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
            [nombre, productos, direccion, usuario, estado, comunidad, codigoPostal, provincia]
        );

        // Responder con el ID del nuevo registro
        res.status(201).json({ id: result.insertId });

    } catch (error) {
        console.error("Error al agregar envío:", error.message);

        // Responder con un error específico
        res.status(500).json({
            message: "Error al procesar la solicitud. Intenta nuevamente."
        });
    }
};


export const updateEnvio = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, direccion, estado, comunidad, codPostal, provincia} = req.body;

        if (!nombre ||  !direccion ||  !estado || !comunidad || !codPostal || !provincia) {
            console.log("Datos recibidos:", req.body);
            return res.status(400).json({ message: "Todos los campos son requeridos" });
        }

        console.log("Datos recibidos:", { id, nombre, direccion, estado, comunidad, codPostal, provincia});


        const [result] = await conexion.query(
            "UPDATE envios SET nombre = ?, direccion = ?, estado = ?, comunidad = ?, codigoPostal = ?, provincia = ? WHERE id = ?",
            [nombre, productos, direccion, usuario, estado, comunidad, codPostal, provincia, id]
        );

        console.log("Resultado de la actualización:", result);

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Envio no encontrado" });
        }

        res.status(200).json({ message: "Envio actualizado correctamente" });
    } catch (error) {
        console.error("Error en el servidor:", error);
        res.status(500).json({ message: "Error en el servidor" });
    }
};

