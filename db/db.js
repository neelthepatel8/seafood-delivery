import { createConnection } from "mysql2";

const dbconn = createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
});

const connectMYSQL = () => {
  dbconn.connect(function (err) {
    if (err) {
      console.error("error connecting: " + err.stack);
      return;
    }

    console.log("connected as id " + dbconn.threadId);
  });

  return dbconn;
};

export default connectMYSQL;
