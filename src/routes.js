require('dotenv').config()
const express = require('express');
const jwt = require('jsonwebtoken')

const routes = express.Router();

const ConsultaController = require('./controllers/ConsultaController')
const PrevisaoController = require('./controllers/PrevisaoController')
const RtController = require('./controllers/RtController')
const ObitosController = require('./controllers/ObitosController')
const AuthMiddleware = require('./middlewares/Authmiddleware')

routes.get('/',(req,res)=>{
    return res.status(200).json({message:`Server in On`})
});

routes.post('/', (req,res)=>{
    const {email, senha} = req.body
    const mockUsername = "admin"
    const mockPassword = "admin"
    if (mockUsername === email && mockPassword === mockPassword) {
      const secret = process.env.JWT_SECRET
      const token = jwt.sign({email},secret,{
            expiresIn: 86400
        })
      return res.send({token})
    }
    return res.status(500).send("error")
})

// Read Routes
routes.get('/consulta/:campo', ConsultaController.read)
routes.get('/previsao/', PrevisaoController.previsao)
routes.get('/previsao_diario/', PrevisaoController.previsao_diario)
routes.get('/consulta_rt/:tipo', RtController.read)
routes.get('/obitos/', ObitosController.read)

module.exports = routes;
