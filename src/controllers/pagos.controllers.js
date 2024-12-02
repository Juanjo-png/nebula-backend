import conexion from "../mysql_conector.js"
import { nanoid } from 'nanoid'; // Importa nanoid
import { generatePaymentIntent, generatePaymentMethod, getPaymentDetail } from "../services/stripe.js";


export const postItem = async (req, res) => {
    try {
        console.log(req.body);

        const { name, amount, stripeId } = req.body;

        const localizator = nanoid(21);

        // Insertar en la tabla `orders`
        const query = `INSERT INTO orders (name, amount, localizator, stripeId) VALUES (?, ?, ?, ?)`;
        const [result] = await conexion.query(query, [name, amount, localizator, stripeId || null]);

        console.log(result);

        // Responder con el registro insertado
        res.status(200).json({
            data: {
                id: result.insertId, // ID generado
                name,
                amount,
                localizator,
                stripeId: stripeId || null,
                status: 'wait',
            },
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Error en el servidor",
        });
    }
};

export const getItem = async (req, res) => {
    try {
        const { id } = req.params;
        const query = 'SELECT * FROM orders WHERE localizator = ?';
        const [result] = await conexion.query(query, [id]);

        if (result.length > 0) {
            res.status(200).json({ data: result[0] });
        } else {
            res.status(404).json({ message: 'Orden no encontrada' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error en el servidor' });
    }
}

export const updateItem = async (req, res) => {
    try {
        const { id } = req.params;
        const { token } = req.body;

        const query = 'SELECT * FROM orders WHERE localizator = ?';
        const [order] = await conexion.query(query, [id]);

        if (order.length === 0) {
            return res.status(404).json({ message: 'Orden no encontrada' });
        }

        const resOrder = order[0]; 
        const responseMethod = await generatePaymentMethod(token);

        const resPaymentIntent = await generatePaymentIntent({
            amount: resOrder.amount,
            user: resOrder.name,
            payment_method: responseMethod.id
        });

        const updateQuery = 'UPDATE orders SET stripeId = ? WHERE localizator = ?';
        await conexion.query(updateQuery, [resPaymentIntent.id, id]);

        res.status(200).json({ data: resPaymentIntent });

    } catch (e) {
        console.error(e.message);
        res.status(500).json({ error: 'Algo ocurrió' });
    }
};

export const checkItem = async (req, res) => {
    try {
        const { id } = req.params;

        const query = 'SELECT * FROM orders WHERE localizator = ?';
        const [order] = await conexion.query(query, [id]);

        if (order.length === 0) {
            return res.status(404).json({ message: 'Orden no encontrada' });
        }

        const resOrder = order[0];
        const detailStripe = await getPaymentDetail(resOrder.stripeId);
        const status = detailStripe.status.includes('succe') ? 'success' : 'fail';
        const updateQuery = 'UPDATE orders SET status = ? WHERE localizator = ?';
        await conexion.query(updateQuery, [status, id]);
        res.status(200).json({ data: detailStripe });

    } catch (e) {
        console.error(e.message);
        res.status(500).json({ error: 'Algo ocurrió' });
    }
};
