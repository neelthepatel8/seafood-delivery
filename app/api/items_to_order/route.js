import connectMYSQL from "@/db/db";

export async function POST(req) {
  const resp = { status: 200, result: [], error: [] };
  const dbconn = connectMYSQL();
  const input = await req.json();

  console.log(input);

  for (const product of input.products) {
    await addProduct(product, input.orderID, dbconn, resp);
  }

  return Response.json(resp);
}

async function addProduct(product, orderID, dbconn, resp) {
  try {
    const result = await new Promise((resolve, reject) => {
      dbconn.query(
        `CALL add_item_to_order(${orderID}, '${product.name}', ${product.amount});`,
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
