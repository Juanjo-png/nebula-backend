import conexion from "../mysql_conector.js"

export const getCategorias = async (req, res) => {
    //get cursos
    try {
        //throw new Error();
        const [result] = await conexion.query("SELECT * FROM categorias ORDER BY id");
        console.log(result);
        res.status(200).json(result);
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
        const [result] = await conexion.query("SELECT nombre FROM categorias WHERE id = ?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

