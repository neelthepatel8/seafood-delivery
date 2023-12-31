import connectMYSQL from "@/db/db";

export async function POST(req) {
  const input = await req.json();

  const resp = { status: 500 };
  const dbconn = connectMYSQL();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(
        `CALL user_login('${input.email}', '${input.password}');`,
        (error, result) => {
          if (error) {
            reject(error);
          } else {
            resolve(result);
          }
        }
      );
    });

    console.log(result);
    resp.status = 200;
  } catch (error) {
    console.log(error);
    resp.status = 400;
  }

  return Response.json(resp);
}
