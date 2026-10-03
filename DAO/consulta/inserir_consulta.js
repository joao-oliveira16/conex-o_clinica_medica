import {conexao} from '../conexao.js'

async function incluirConsulta(infos){
    const data = [infos]
    const sql = `INSERT INTO tbl_consulta (numeroBeneficiario, crm, data, hora, numeroAgendamento) VALUES ?`
    const conn = await conexao()
    
    try {
        // Executar a consulta
        const [results] = await conn.query(sql,[data]);

        await conn.end()
        return results
      } catch (err) {
        return err.message
      }
}

export {incluirConsulta}
