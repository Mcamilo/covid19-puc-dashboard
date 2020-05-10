const express = require('express');

const routes = express.Router();

const ConsultaController = require('./controllers/ConsultaController')
const PrevisaoController = require('./controllers/PrevisaoController')
const RtController = require('./controllers/RtController')

routes.get('/',(req,res)=>{
    return res.status(200).json({message:`Server in On`})
});

// Read Routes
routes.get('/consulta/:campo', ConsultaController.read)
routes.get('/previsao/', PrevisaoController.previsao)
routes.get('/previsao_diario/', PrevisaoController.previsao_diario)
routes.get('/consulta_rt/:tipo', RtController.read)

module.exports = routes;
