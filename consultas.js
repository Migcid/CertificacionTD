const { Pool } = require('pg')

const host = process.env.DB_HOST || "localhost";
const user = process.env.DB_USER || "postgres";
const password = process.env.DB_PASSWORD || "123456"


 
const pool = new Pool({
  host,
  user,
  password,
  max: 5,
  port: 5432,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
})

