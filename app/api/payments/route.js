import connectMYSQL from "@/db/db";

export async function GET() {
  const resp = { status: 500 };
  const dbconn = connectMYSQL();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(`CALL get_payment_methods();`, (error, result) => {
        if (error) {
          reject(error);
        } else {
          resolve(result);
        }
      });
    });

    resp.status = 200;
    resp.content = result;
  } catch (error) {
    resp.status = 400;
    resp.error = error;
  }

  return Response.json(resp);
}
