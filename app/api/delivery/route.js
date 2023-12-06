import connectMYSQL from "@/db/db";

export async function GET(req) {
  const { searchParams } = new URL(req.url);
  const searchQ = searchParams.get("order");

  const resp = { status: 500 };
  const dbconn = connectMYSQL();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(`CALL get_delivery(${searchQ});`, (error, result) => {
        if (error) {
          reject(error);
        } else {
          resolve(result);
        }
      });
    });

    resp.status = 200;
    resp.result = result;
  } catch (error) {
    resp.status = 400;
  }

  return Response.json(resp);
}
