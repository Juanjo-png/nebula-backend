import conexion from "../mysql_conector.js"

export const getAdelantos = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT * FROM avances WHERE id_libro = ? ORDER BY pagina", [id]);
        console.log(result);
        res.status(200).json(result); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

