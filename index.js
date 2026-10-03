import express from 'express'
import { buscarPacientes } from './DAO/paciente/buscar_paciente.js'
import { buscarEspecialidades } from './DAO/especialidade/buscar_especialidade.js'
import { buscarAgendamentos } from './DAO/agendamento/buscar_agendamento.js'
import { buscarMedicos } from './DAO/medico/buscar_medico.js'
import { buscarConsultas } from './DAO/consulta/buscar_consulta.js'
import { incluirPaciente } from './DAO/paciente/inserir_paciente.js'
import { incluirEspecialidade } from './DAO/especialidade/inserir_especialidade.js'
import { incluirAgendamento } from './DAO/agendamento/inserir_agendamento.js'
import { incluirMedico } from './DAO/medico/inserir_medico.js'
import { incluirConsulta } from './DAO/consulta/inserir_consulta.js'

const app = express()
app.use(express.json())

app.get('/ola', (req, res) =>{
     res.json({mensagem: 'Ola Mundo'})
})

app.post('/paciente', async (req, res) =>{

    let  { nome, endereco, telefone, doencasPrevias, remedioDeUsoContinuo} = req.body
    let infos = [ nome, endereco, telefone, doencasPrevias, remedioDeUsoContinuo]


    let resp = await incluirPaciente(infos)
    
    res.send(resp)
})

app.post('/especialidade', async (req, res) =>{

    let  { nome, publicoAlvo} = req.body
    let infos = [ nome, publicoAlvo]


    let resp = await incluirEspecialidade(infos)
    
    res.send(resp)
})

app.post('/agendamento', async (req, res) =>{
    let {data, hora, queixa, gravidade} = req.body
    let infos = [data, hora, queixa, gravidade]

    let resp = await incluirAgendamento(infos)
    res.json(resp)
})

app.post('/medico', async (req, res) =>{
    let {nome, endereco, telefone, crm, numeroRegistro} = req.body
    let infos = [nome, endereco, telefone, crm, numeroRegistro]

    let resp = await incluirMedico(infos)
    res.json(resp)
})

app.post('/consulta', async (req, res) =>{
    let {data, hora, numeroBeneficiario, crm, numeroAgendamento} = req.body
    let infos = [numeroBeneficiario, crm, data, hora, numeroAgendamento]

    let resp = await incluirConsulta(infos)
    res.json(resp)
})


app.listen(3000, () => {
  console.log('🚀 Server is running on http://localhost:3000')
})

