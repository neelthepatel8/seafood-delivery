import connectMYSQL from "@/db/db";

export async function POST(req) {
  const resp = { status: 200, result: [], error: [] };
  const dbconn = connectMYSQL();
  const input = await req.json();

  for (const product of input.products) {
    await removeProduct(product, dbconn, resp);
  }

  return Response.json(resp);
}

async function removeProduct(product, dbconn, resp) {
  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(
        `CALL remove_item_from_inventory(${product.id}, ${product.amount});`,
        (error, result) => {
          if (error) {
            reject(error);
          } else {
            resolve(result);
          }
        }
      );
    });
    resp.result.push(result);
  } catch (error) {
    resp.error.push(error);
  }
}
