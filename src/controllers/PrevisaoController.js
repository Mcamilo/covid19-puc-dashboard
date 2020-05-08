const csv = require('csv-parser')
const fs = require('fs')

async function read_csv_previsao(){
  let promise = new Promise((resolve, reject) => {
    const results = [];
    fs.createReadStream('Covid_data/Tabela_dados_covid_forecast.csv')
      .pipe(csv())
      .on('data', (data) => results.push(data))
      .on('end', () => {
        const filtered_data = filter_csv(results)
        console.log("Done Reading Forecast Data");
        resolve(filtered_data)
      });
  })
  return promise
}

function filter_csv(dataset){
  const filtered_data = dataset.reduce((c,v)=>{
    if (v.tipo === "acumulado" && v.forecast == 0) {
      c['datas'] = c['datas'] || []
      c['datas'].push(v.data)
      c['num_casos'] = c['num_casos'] || []
      c['num_casos'].push(v.num_casos)
      c['m_erro'] = c['m_erro'] || []
      c['m_erro'].push('null')
      c['num_casos_funcao'] = c['num_casos_funcao'] || []
      c['num_casos_funcao'].push(v.num_casos_funcao)
      c['abaixo_95'] = c['abaixo_95'] || []
      c['abaixo_95'].push(v.abaixo_95)
      c['acima_95'] = c['acima_95'] || []
      c['acima_95'].push(v.acima_95)
    }else if (v.tipo === "acumulado" && v.forecast == 1) {
      c['datas'] = c['datas'] || []
      c['datas'].push(v.data)
      c['m_erro'] = c['m_erro'] || []
      c['m_erro'].push(v.num_casos)
      c['abaixo_95'] = c['abaixo_95'] || []
      c['abaixo_95'].push(v.abaixo_95)
      c['acima_95'] = c['acima_95'] || []
      c['acima_95'].push(v.acima_95)
    }
    return c;
  }, {})
  console.log("Done Filtering");
  return filtered_data
}

module.exports = {
    async previsao(req, res){
      const response = await read_csv_previsao()
      console.log("Done");
      res.json(response)
    }
};
