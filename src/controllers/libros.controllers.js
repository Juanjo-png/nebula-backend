import conexion from "../mysql_conector.js"

export const getLibros = async (req, res) => {
    //get cursos
    try {
        //throw new Error();
        const [result] = await conexion.query("SELECT libros.* ,categorias.id AS id_Categoria, categorias.nombre AS categoria, etiquetas.id AS id_Etiqueta ,etiquetas.nombre AS etiqueta, series.id AS id_Serie, series.nombre as serie FROM libros LEFT JOIN categorias ON libros.categoria = categorias.id LEFT JOIN etiquetas ON libros.etiqueta = etiquetas.id LEFT JOIN series ON libros.serie = series.id");
        console.log(result);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getLibro = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query("SELECT libros.* ,categorias.id AS id_Categoria, categorias.nombre AS categoria, etiquetas.id AS id_Etiqueta ,etiquetas.nombre AS etiqueta FROM libros LEFT JOIN categorias ON libros.categoria = categorias.id LEFT JOIN etiquetas ON libros.etiqueta = etiquetas.id WHERE libros.id = ?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getLibroEditar = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params
        const [result] = await conexion.query(" SELECT * FROM libros WHERE id = ?", [id]);
        console.log(result[0]);
        res.status(200).json(result[0]); //la  respuesta que devuelve el servidor
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        })
    }
};

export const getLibrosSerie = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params;
        const result = await conexion.query("SELECT * FROM libros WHERE serie=?", [id]);
        console.log(result[0]);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
};

export const getLibroPorCategoria = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params;
        const result = await conexion.query("SELECT * FROM libros WHERE categoria=?", [id]);
        console.log(result[0]);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
};

export const getLibroPorEtiqueta = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params;
        const result = await conexion.query("SELECT * FROM libros WHERE etiqueta=?", [id]);
        console.log(result[0]);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
};

export const getNovedades = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params;
        const result = await conexion.query("SELECT * FROM libros WHERE categoria=? ORDER BY fechaPublicacion DESC", [id]);
        console.log(result[0]);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
};

export const getLibroBusqueda = async (req, res) => {
    try {
        const { buscar } = req.params;
        // Agregar los comodines '%' antes y después de la palabra clave.
        const searchPattern = `%${buscar}%`;

        // Buscar libros por título
        let [result] = await conexion.query(
            "SELECT * FROM libros WHERE titulo LIKE ? ORDER BY titulo;", [searchPattern]
        );

        // Si no se encuentran resultados por título, buscar por ISBN
        if (result.length === 0) {
            [result] = await conexion.query(
                "SELECT * FROM libros WHERE ISBN LIKE ? ORDER BY titulo;", [searchPattern]
            );
        }

        // Retornar los resultados encontrados
        res.status(200).json(result);

    } catch (error) {
        console.error(error); // Para depuración
        res.status(500).json({
            message: "Error en el servidor",
        });
    }
};


export const getSerie = async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params;
        const result = await conexion.query("SELECT series.* ,categorias.id AS id_Categoria, categorias.nombre AS categoria FROM series LEFT JOIN categorias ON series.categoria = categorias.id WHERE series.id = ?", [id]);
        console.log(result[0]);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
};

export const delLibro = async (req, res) => {
    try {
        const { id } = req.params
        const [result] = await conexion.query("DELETE FROM libros WHERE id=?", [id]);
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

export const addLibro = async (req, res) => {
    try {
        console.log(req.body);
        const {titulo, categoria, etiqueta, precio, ISBN, formato, paginas,color,autor,sinopsis,serie,portada} = req.body;
        const [result] = await conexion.query("INSERT INTO libros (titulo, categoria, etiqueta, precio, ISBN , formato, paginas, color, autor, sinopsis, serie, portada) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ?)", [titulo, categoria, etiqueta, precio, ISBN, formato, paginas,color,autor,sinopsis,serie,portada]);
        console.log(result);
        res.status(201).json({ id: result.insertId });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
};

export const updateLibro = async (req, res) => {
    try {
        const { id } = req.params;
        const { titulo, categoria, etiqueta, precio, ISBN, formato, paginas,color,autor,sinopsis,serie,portada} = req.body;

        if (!titulo || !categoria || !etiqueta || !precio || !ISBN || !formato || !paginas || !color || !autor || !sinopsis || !serie || !portada) {
            console.log("Datos recibidos:", req.body);
            return res.status(400).json({ message: "Todos los campos son requeridos" });
        }

        console.log("Datos recibidos:", { id, titulo, categoria, etiqueta, precio, ISBN, formato, paginas,color,autor,sinopsis,serie,portada});


        const [result] = await conexion.query(
            "UPDATE libros SET titulo = ?, categoria = ?, etiqueta = ?, precio = ?, ISBN = ?, formato = ?, paginas = ?, color = ?, autor = ?, sinopsis = ? , serie = ?, portada = ? WHERE id = ?",
            [titulo,categoria,etiqueta,precio,ISBN,formato,paginas,color,autor,sinopsis,serie,portada, id]
        );

        console.log("Resultado de la actualización:", result);

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Libro no encontrado" });
        }

        res.status(200).json({ message: "Libro actualizado correctamente" });
    } catch (error) {
        console.error("Error en el servidor:", error);
        res.status(500).json({ message: "Error en el servidor" });
    }
};

export const getTodasNovedades = async (req, res) => {
    try {
        const [result] = await conexion.query("SELECT * FROM libros ORDER BY id DESC");
        console.log("Resultado de la consulta:", result); // Este log es clave
        res.status(200).json(result);
    } catch (error) {
        console.error("Error en el servidor:", error); // Muestra el error completo
        res.status(500).json({
            message: "Error en el servidor"
        });
    }
};

