import connectMYSQL from "@/db/db";

export async function POST(req) {
  const resp = { status: 500 };
  const dbconn = connectMYSQL();
  const input = await req.json();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(
        `CALL begin_delivery(${input.orderID});`,
        (error, result) => {
          if (error) {
            reject(error);
          } else {
            resolve(result);
          }
        }
      );
    });
    resp.status = 200;
  } catch (error) {
    resp.status = 500;
    resp.error = error;
  }
  return Response.json(resp);
}
