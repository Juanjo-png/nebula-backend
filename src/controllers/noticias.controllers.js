import conexion from "../mysql_conector.js"

export const getNoticias = async (req, res) => {
    try {
        const [result] = await conexion.query("SELECT * FROM noticias ORDER BY id DESC");
        console.log(result);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getNoticia = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT * FROM noticias WHERE id = ?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); 
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const addNoticia = async (req, res) => {
    try {
        console.log(req.body);
        const {titulo, contenido, autor, fecha, extracto, miniatura} = req.body;
        const [result] = await conexion.query("INSERT INTO noticias (titulo, contenido, autor, fecha, extracto, miniatura) VALUES ( ?, ?, ?, ?, ?, ?)", [titulo, contenido, autor, fecha, extracto, miniatura]);
        console.log(result);
        res.status(201).json({ id: result.insertId });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
};

export const updateNoticias = async (req, res) => {
    try {
        const { id } = req.params;
        const { titulo, contenido, autor, fecha, extracto, miniatura} = req.body;

        if (!titulo || !titulo || !contenido || !autor || !fecha || !extracto || !miniatura) {
            console.log("Datos recibidos:", req.body);
            return res.status(400).json({ message: "Todos los campos son requeridos" });
        }

        console.log("Datos recibidos:", { titulo, contenido, autor, fecha, extracto, miniatura});


        const [result] = await conexion.query(
            "UPDATE noticias SET titulo = ?, contenido = ?, autor = ?, fecha = ?, extracto = ?, miniatura = ? WHERE id = ?",
            [titulo, contenido, autor, fecha, extracto, miniatura, id]
        );

        console.log("Resultado de la actualización:", result);

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Noticia no encontrada" });
        }

        res.status(200).json({ message: "Noticia actualizada correctamente" });
    } catch (error) {
        console.error("Error en el servidor:", error);
        res.status(500).json({ message: "Error en el servidor" });
    }
};


export const delNoticia = async (req, res) => {
    try {
        const { id } = req.params
        const [result] = await conexion.query("DELETE FROM noticias WHERE id=?", [id]);
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
