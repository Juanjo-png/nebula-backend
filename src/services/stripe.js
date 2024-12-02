import Stripe from 'stripe'; // Usa ES Module si tu backend soporta ES6
const stripe = new Stripe(process.env.STRIPE_SK);

/**
 * Generar intención de PAGO
 */
export const generatePaymentIntent = async ({ amount, user, payment_method }) => {
    const resPaymentIntent = await stripe.paymentIntents.create({
        amount: Math.round(parseFloat(amount) * 100), 
        currency: "EUR",
        payment_method_types: ['card'],
        payment_method,
        description: `Pago para la gente de YouTube -> ${user}: Pago`
    });

    return resPaymentIntent;
};

/**
 * Confirmar pago
 */
export const confirmPaymentIntent = async (id, token) => {
    const paymentIntent = await stripe.paymentIntents.confirm(id, {
        payment_method: token
    });

    console.log(paymentIntent);
    return paymentIntent;
};

/**
 * Crear método de pago
 */
export const generatePaymentMethod = async (token) => {
    const paymentMethod = await stripe.paymentMethods.create({
        type: 'card',
        card: { token }
    });

    return paymentMethod;
};

/**
 * Consultar detalle de orden
 */
export const getPaymentDetail = async (id) => {
    const detailOrder = await stripe.paymentIntents.retrieve(id);
    return detailOrder;
};
