import connectMYSQL from "@/db/db";

export async function GET(req) {
  const { searchParams } = new URL(req.url);
  const email = searchParams.get("email");
  const password = searchParams.get("password");

  const resp = { status: 500 };
  const dbconn = connectMYSQL();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(
        `CALL user_login('${email}', '${password}');`,
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
    resp.status = 400;
  }

  return Response.json(resp);
}
