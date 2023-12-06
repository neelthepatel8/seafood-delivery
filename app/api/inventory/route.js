import connectMYSQL from "@/db/db";

export async function GET(req) {
  const { searchParams } = new URL(req.url);
  const searchQ = searchParams.get("search");

  const resp = { status: 500 };
  const dbconn = connectMYSQL();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(`CALL get_all_inventory('${searchQ}');`, (error, result) => {
        if (error) {
          reject(error);
        } else {
          resolve(result);
        }
      });
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
