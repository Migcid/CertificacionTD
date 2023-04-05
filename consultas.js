const { Pool } = require('pg')

const host = process.env.DB_HOST || "localhost";
const user = process.env.DB_USER || "postgres";
const password = process.env.DB_PASSWORD || "123456"
const database = process.env.DB_DATABASE || "certificacion_TD"

 
const pool = new Pool({
  host,
  user,
  password,
  database,
  max: 5,
  port: 5432,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
})

// PUBLICACIONES

const getPublicaciones = async () => {
    let consulta = `SELECT titulo, contenido, fecha, imagen FROM publicaciones_noticias order by fecha`
    let resultado = await pool.query(consulta);
        return resultado.rows;
}



module.exports = {
    getPublicaciones
}