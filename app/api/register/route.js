import connectMYSQL from "@/db/db";

export async function GET(req) {
  const { searchParams } = new URL(req.url);
  const fullName = searchParams.get("fname");
  const email = searchParams.get("email");
  const password = searchParams.get("password");
  const contact = searchParams.get("contact");
  const street = searchParams.get("street");
  const apartment = searchParams.get("apartment");
  const state = searchParams.get("state");
  const zip = searchParams.get("zip");

  const [firstName, lastName] = fullName.split(" ");

  const resp = { status: 500 };
  const dbconn = connectMYSQL();

  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(
        `CALL register_user('${firstName}', '${lastName}','${email}', '${password}', '${contact}', '${street}', '${apartment}', '${state}', '${zip}');`,
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
  } catch (error) {
    console.log("ERROR: ", error);
    resp.status = 400;
  }

  return Response.json(resp);
}
