const port = 8080;
const DB_INTERNAL_SCHEMA = "globalite";
const apiPrefix = "/api";

const database = {
  username: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  port: parseInt(process.env.POSTGRES_PORT || "5432", 10),
  name: process.env.POSTGRES_DB,
  host: process.env.POSTGRES_HOST || "localhost",
  schema: DB_INTERNAL_SCHEMA,
};
const serverApiURL = process.env.SERVER_API_URL || "http://localhost:8080";
const appURL = process.env.APP_URL || "http://localhost:3000";

export const Config = {
  appURL,
  serverApiURL,
  port,
  apiPrefix,
  database,
};
