require('dotenv').config()
const express = require('express');
const jwt = require('jsonwebtoken')

const routes = express.Router();

const ConsultaController = require('./controllers/ConsultaController')
const PrevisaoController = require('./controllers/PrevisaoController')
const RtController = require('./controllers/RtController')

const ConsultaJaraguaController = require('./controllers/ConsultaJaraguaController')
const PrevisaoJaraguaController = require('./controllers/PrevisaoJaraguaController')
const RtJaraguaController = require('./controllers/RtJaraguaController')

const AuthMiddleware = require('./middlewares/Authmiddleware')
const PerfilController = require('./controllers/PerfilController')

routes.get('/', AuthMiddleware.checkToken, (req,res)=>{
    return res.status(200).json({success:true,message:`Server in On`})
});

routes.post('/', PerfilController.createToken)
routes.post('/jaragua/', PerfilController.createToken)

routes.post('/registrar', PerfilController.store)
// Read Routes
routes.get('/consulta/:campo', AuthMiddleware.checkToken, ConsultaController.read)
routes.get('/previsao/', AuthMiddleware.checkToken, PrevisaoController.previsao)
routes.get('/previsao_diario/', AuthMiddleware.checkToken, PrevisaoController.previsao_diario)
routes.get('/consulta_rt/:tipo', AuthMiddleware.checkToken, RtController.read)

routes.get('/jaragua/consulta/:campo',ConsultaJaraguaController.read)
routes.get('/jaragua/previsao/', PrevisaoJaraguaController.previsao)
routes.get('/jaragua/previsao_diario/', PrevisaoJaraguaController.previsao_diario)
routes.get('/jaragua/consulta_rt/:tipo', RtJaraguaController.read)

module.exports = routes;
