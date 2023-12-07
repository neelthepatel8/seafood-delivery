import connectMYSQL from "@/db/db";

export async function GET() {
  const resp = { status: 500 };
  const dbconn = connectMYSQL();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(`CALL get_all_coupon_codes();`, (error, result) => {
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
