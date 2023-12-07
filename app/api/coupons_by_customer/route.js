import connectMYSQL from "@/db/db";

export async function POST(req) {
  const input = await req.json();
  const resp = { status: 500 };
  const dbconn = connectMYSQL();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(
        `CALL get_promo_codes(${input.customerID}, '');`,
        (error, result) => {
          if (error) {
            reject(error);
          } else {
            resolve(result);
          }
        }
      );
    });

    console.log("RESULT: ", result);
    resp.status = 200;
    resp.result = result;
  } catch (error) {
    console.log("ERROR: ", error);
    resp.status = 400;
  }

  return Response.json(resp);
}
