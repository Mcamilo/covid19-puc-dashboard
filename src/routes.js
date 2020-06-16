require('dotenv').config()
const express = require('express');
const jwt = require('jsonwebtoken')

const routes = express.Router();

const ConsultaController = require('./controllers/ConsultaController')
const PrevisaoController = require('./controllers/PrevisaoController')
const RtController = require('./controllers/RtController')
const AuthMiddleware = require('./middlewares/Authmiddleware')
const PerfilController = require('./controllers/PerfilController')

routes.get('/', AuthMiddleware.checkToken, (req,res)=>{
    return res.status(200).json({success:true,message:`Server in On`})
});

routes.post('/', PerfilController.createToken)

// Read Routes
routes.get('/consulta/:campo', AuthMiddleware.checkToken, ConsultaController.read)
routes.get('/previsao/', AuthMiddleware.checkToken, PrevisaoController.previsao)
routes.get('/previsao_diario/', AuthMiddleware.checkToken, PrevisaoController.previsao_diario)
routes.get('/consulta_rt/:tipo', AuthMiddleware.checkToken, RtController.read)

module.exports = routes;
