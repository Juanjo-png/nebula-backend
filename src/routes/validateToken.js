import pkg from 'express'
import jwt from 'jsonwebtoken';

const validateToken = (req, res, next) =>{
    const headerToken = req.headers['authorization']
    if (headerToken != undefined && headerToken.startsWith("Bearer ")) {
        try {
            const bearerToken = headerToken.slice(7);
            jwt.verify(bearerToken, process.env.SECRET_KEY || "pepito123")
            next()
        } catch (error) {
            res.status(401).json({
                msg: "token no valido"
            })
        }       
    }
    else{
        res.status(401).json({
            msg: "acceso denegado"
        })
    }
}

export default validateToken;