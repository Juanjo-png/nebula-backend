import conexion from "../mysql_conector.js"

export const getSeries = async (req, res) => {
    try {
        const { id } = req.params
        const [result] = await conexion.query("SELECT series.* ,categorias.id AS id_Categoria, categorias.nombre AS categoria FROM series LEFT JOIN categorias ON series.categoria = categorias.id WHERE categoria = ? ORDER BY id", [id]);
        console.log(result);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getTodasSeries = async (req, res) => {
    try {
        const [result] = await conexion.query("SELECT *  FROM series ORDER BY categoria");
        console.log(result);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getSerie = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT * FROM series WHERE id = ?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getImgSerie = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT portada FROM libros WHERE serie = ?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

