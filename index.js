import express from 'express'
import { buscarPacientes } from './DAO/paciente/buscar_paciente.js'
import { buscarEspecialidades } from './DAO/especialidade/buscar_especialidade.js'
import { buscarAgendamentos } from './DAO/agendamento/buscar_agendamento.js'
import { buscarMedicos } from './DAO/medico/buscar_medico.js'
import { buscarConsultas } from './DAO/consulta/buscar_consulta.js'

const app = express()
app.use(express.json())

app.get('/ola', (req, res) =>{
     res.json({mensagem: 'Ola Mundo'})
})

app.get('/paciente', async (req, res) =>{
    let pacientes = await buscarPacientes()
    res.json(pacientes)
})

app.get('/especialidade', async (req, res) =>{
    let especialidades = await buscarEspecialidades()
    res.json(especialidades)
})

app.get('/agendamento', async (req, res) =>{
    let agendamentos = await buscarAgendamentos()
    res.json(agendamentos)
})

app.get('/medico', async (req, res) =>{
    let medicos = await buscarMedicos()
    res.json(medicos)
})

app.get('/consulta', async (req, res) =>{
    let consultas = await buscarConsultas()
    res.json(consultas)
})


app.listen(3000, () => {
  console.log('🚀 Server is running on http://localhost:3000')
})

