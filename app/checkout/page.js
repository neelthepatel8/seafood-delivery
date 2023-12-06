"use client";
import React, { useEffect, useState } from "react";
import { cartMock, paymentMock } from "../mock";
import Image from "next/image";
import MinimalCart from "@/components/Navbar/Cart/MinimalCart/MinimalCart";
import { useRouter } from "next/navigation";
import LoadingOverlay from "@/components/Loading/LoadingOverlay";
import Swal from "sweetalert2";
const Page = () => {
  const router = useRouter();
  const [payment, setPayment] = useState("none");
  const [methods, setMethods] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    retrievePaymentMethods();
  }, []);

  const handlePay = async () => {
    setLoading(true);

    let error = false;
    const response = await fetch("/api/emailtoid", {
      method: "POST",
      headers: {
        ContentType: "application/json",
      },
      body: JSON.stringify({
        customerEmail: cartMock.customer_email,
      }),
    });

    const data = await response.json();
    if (data.status == 200) {
      const customerID = data.result[0][0].cid;
      const response2 = await fetch("/api/create_order", {
        method: "POST",
        headers: {
          ContentType: "application/json",
        },
        body: JSON.stringify({
          customerID: customerID,
          paymentType: payment,
          couponCode: cartMock.couponUsed ? cartMock.coupon.code : "",
        }),
      });

      const data2 = await response2.json();

      if (data2.status == 200) {
        const orderID = data2.result[0][0].order_id;
        const response3 = await fetch("/api/items_to_order", {
          method: "POST",
          headers: {
            ContentType: "application/json",
          },
          body: JSON.stringify({
            orderID: orderID,
            products: cartMock.products,
          }),
        });

        const data3 = await response3.json();
        if (data3.status == 200) {
          const response4 = await fetch("/api/remove_from_inventory", {
            method: "POST",
            headers: {
              ContentType: "application/json",
            },
            body: JSON.stringify({
              products: cartMock.products,
            }),
          });

          const data4 = await response4.json();
          if (data4.status == 200) {
            const response5 = await fetch("/api/deliver", {
              method: "POST",
              headers: {
                ContentType: "application/json",
              },
              body: JSON.stringify({
                orderID: orderID,
              }),
            });

            const data5 = await response5.json();
            console.log(data5);
            if (data5.status == 200) {
              setTimeout(() => {
                setLoading(false);
                router.push(`/postorder?order=${orderID}`);
              }, 2000);
            } else error = true;
          } else error = true;
        } else error = true;
      } else error = true;
    } else error = true;
    if (error) {
      setTimeout(() => {
        setLoading(false);

        Swal.fire({
          title: "Error",
          confirmButtonText: "Okay",
          text: "Payment Failed! Please try again.",
          icon: "error",
        });
      }, 2000);
    }
  };

  const retrievePaymentMethods = async () => {
    const response = await fetch("/api/payments");
    const data = await response.json();

    if (response.status == 200) {
      if (data.status == 200) {
        const paymentMethods = data.content[0];
        console.log(paymentMethods);
        setMethods(paymentMethods);
      } else {
        console.log("Error in Sql: ", data.error);
      }
    }
  };
  return (
    <div className="h-screen w-screen flex flex-row items-start justify-center pt-20">
      <div className="w-full flex flex-col items-start justify-start px-40  gap-12">
        <div className="text-7xl font-extrabold">Almost done!</div>
        <div className="h-full w-full flex flex-col items-start justify-center gap-4">
          <div className="text-2xl font-light">Select a Payment Method:</div>
          <div className=" flex flex-row items-center justify-center gap-5 p-2 rounded">
            {methods.map((payment) => (
              <div
                onClick={(e) => setPayment(payment.payment_type)}
                className={`flex flex-row items-center justify-center gap-2 px-3 py-1 rounded text-xl font-bold cursor-pointer hover:scale-110 transition-all active:scale-95 ${payment.bg_color} ${payment.payment_text}`}
                key={payment.payment_type}
              >
                <Image
                  src={payment.img}
                  width={20}
                  height={20}
                  alt={payment.payment_type}
                />
                {payment.payment_type}
              </div>
            ))}
          </div>
          <div className="h-full w-3/4">
            {payment == "Venmo" ? (
              <div>
                <span className="text-2xl font-thin">
                  Please send the total amount to the following QR:
                </span>
                <div>
                  <Image
                    style={{ rotate: 90 }}
                    src="/venmoqr.png"
                    width={300}
                    height={400}
                    alt="qr"
                  />
                </div>
                <div
                  onClick={handlePay}
                  className="cursor-pointer hover:scale-110 active:scale-95 transition-all mt-4 flex flex-row items-center justify-center gap-2 bg-sky-500 font-bold text-white text-xl  px-5 py-2 rounded-full"
                >
                  <Image src="/lock-white.png" width={20} height={20} alt="" />{" "}
                  Continue
                </div>
              </div>
            ) : payment == "Credit/Debit" ? (
              <div className="pt-10 w-full flex flex-col items-start justify-center gap-5">
                <span className="text-2xl font-thin">
                  Enter your Credit/Debit Information:
                </span>
                <div className="w-full flex flex-col items-start justify-center gap-4">
                  <div className="w-2/3 flex flex-row items-center justify-center gap-6">
                    <input
                      placeholder="First Name"
                      className="outline-none px-2 w-full text-xl font-light border-b-2 py-1 "
                    />
                    <input
                      placeholder="Last Name"
                      className="outline-none px-2 w-full text-xl font-light border-b-2 py-1 "
                    />
                  </div>
                  <input
                    placeholder="Card Number"
                    className="outline-none px-2 w-2/3 text-xl font-light border-b-2 py-1 "
                  />

                  <div className="w-2/3 flex flex-row items-center justify-center gap-6">
                    <input
                      placeholder="Expiration Date"
                      className="outline-none px-2 w-3/4 text-xl font-light border-b-2 py-1 "
                    />
                    <input
                      type="password"
                      placeholder="CVV"
                      className="outline-none px-2 w-1/4 text-xl font-light border-b-2 py-1 "
                    />
                  </div>
                  <div
                    onClick={handlePay}
                    className="cursor-pointer hover:scale-110 active:scale-95 transition-all mt-4 flex flex-row items-center justify-center gap-2 bg-sky-500 font-bold text-white text-xl  px-5 py-2 rounded-full"
                  >
                    <Image
                      src="/lock-white.png"
                      width={20}
                      height={20}
                      alt=""
                    />{" "}
                    Pay
                  </div>
                </div>
              </div>
            ) : payment == "Zelle" ? (
              <div className="flex flex-col items-start justify-center gap-6">
                <span className="text-2xl font-thin">
                  For Zelle, You can send your total amount to the following
                  phone number or email address:
                </span>
                <div className="text-xl font-medium flex flex-col items-start justify-center p-5 gap-4 border-2">
                  <div className="flex flex-row items-center justify-center gap-4">
                    Phone Number:{" "}
                    <span className=" bg-sky-600 px-3 py-1 rounded font-bold text-white">
                      +1 (617) 895-9539
                    </span>
                  </div>
                  <div className="flex flex-row items-center justify-center gap-4">
                    Email:{" "}
                    <span className="bg-orange-600 px-3 py-1 rounded font-bold text-white">
                      patel.neel5@northeastern.edu
                    </span>
                  </div>
                  <div
                    onClick={handlePay}
                    className="cursor-pointer hover:scale-110 active:scale-95 transition-all mt-4 flex flex-row items-center justify-center gap-2 bg-sky-500 font-bold text-white text-xl  px-5 py-2 rounded-full"
                  >
                    <Image
                      src="/lock-white.png"
                      width={20}
                      height={20}
                      alt=""
                    />{" "}
                    Continue
                  </div>
                </div>
              </div>
            ) : payment == "PayPal" ? (
              <div className="flex flex-col items-start justify-center gap-6">
                <span className="text-2xl font-thin">
                  Connect securely through PayPal Gateway:
                </span>
                <div
                  onClick={handlePay}
                  className="cursor-pointer hover:scale-110 active:scale-95 transition-all flex flex-row items-center justify-center gap-4 text-2xl font-bold bg-yellow-400 rounded-full px-5 py-2"
                >
                  <Image
                    src={"/paypal.png"}
                    width={30}
                    height={30}
                    alt={"paypal"}
                  />
                  <span>PayPal</span>
                </div>
              </div>
            ) : (
              <div></div>
            )}
          </div>
        </div>
      </div>
      <div className="w-full text-3xl font-medium ">
        <MinimalCart />
      </div>
      {loading && <LoadingOverlay />}
    </div>
  );
};

export default Page;
