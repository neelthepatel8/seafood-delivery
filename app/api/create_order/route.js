import connectMYSQL from "@/db/db";

export async function POST(req) {
  const resp = { status: 500 };
  const dbconn = connectMYSQL();
  const input = await req.json();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(
        `CALL place_order(${input.customerID}, '${input.paymentType}', '${input.couponCode}');`,
        (error, result) => {
          if (error) {
            reject(error);
          } else {
            resolve(result);
          }
        }
      );
    });
    resp.result = result;
    resp.status = 200;
  } catch (error) {
    resp.status = 500;
    resp.error = error;
  }
  console.log(resp);
  return Response.json(resp);
}
