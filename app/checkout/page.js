"use client";
import React, { useState } from "react";
import { paymentMock } from "../mock";
import Image from "next/image";
import MinimalCart from "@/components/Navbar/Cart/MinimalCart/MinimalCart";
import { useRouter } from "next/navigation";
const Page = () => {
  const router = useRouter();
  const [payment, setPayment] = useState("none");
  return (
    <div className="h-screen w-screen flex flex-row items-start justify-center pt-20">
      <div className="w-full flex flex-col items-start justify-start px-40  gap-12">
        <div className="text-7xl font-extrabold">Almost done!</div>
        <div className="h-full w-full flex flex-col items-start justify-center gap-4">
          <div className="text-2xl font-light">Select a Payment Method:</div>
          <div className="border-2 flex flex-row items-center justify-center gap-5 p-6 rounded">
            {paymentMock.map((payment) => (
              <div
                onClick={(e) => setPayment(e.target.innerText)}
                className={`flex flex-row items-center justify-center gap-2 px-3 py-1 rounded text-xl font-bold cursor-pointer hover:scale-110 transition-all active:scale-95 ${payment.text} ${payment.bg}`}
                key={payment.type}
              >
                <Image
                  src={payment.image}
                  width={20}
                  height={20}
                  alt={payment.type}
                />
                {payment.type}
              </div>
            ))}
          </div>
          <div className="h-full w-1/2">
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
                  onClick={() => router.push("/postorder")}
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
                    onClick={() => router.push("/postorder")}
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
                    onClick={() => router.push("/postorder")}
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
                  onClick={() => router.push("/postorder")}
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
    </div>
  );
};

export default Page;
