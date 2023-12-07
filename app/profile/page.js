"use client";
import React, { useEffect, useState } from "react";
import Coupon from "@/components/Coupon/Coupon";
import { cartMock } from "../mock";
import Image from "next/image";
import { useRouter } from "next/navigation";
const Page = () => {
  const router = useRouter();
  const [coupons, setCoupons] = useState([]);
  const getAllCoupons = async () => {
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
      const response2 = await fetch("/api/coupons_by_customer", {
        method: "POST",
        headers: {
          ContentType: "application/json",
        },
        body: JSON.stringify({
          customerID: customerID,
        }),
      });

      const data2 = await response2.json();

      if (data2.status == 200) {
        const couponsData = await data2.result[0];
        setCoupons(couponsData);
      }
    }
  };

  useEffect(() => {
    getAllCoupons();
    router.refresh();
  }, []);
  return (
    <div className="w-screen h-screen flex flex-col items-start justify-start px-28 pt-16 gap-12">
      <div className="flex w-full justify-between pr-20 items-center">
        <div className="text-5xl font-extrabold">My Account</div>
        <div
          onClick={() => {
            cartMock.customer_email = "default@email.com";
            router.push("/");
          }}
          className="text-xl font-bold bg-red-600 text-white hover:scale-110 active:scale-75 cursor-pointer hover:opacity-80 transition-all px-3 py-2 rounded-xl flex items-center justify-center"
        >
          <Image src="/logout-white.png" width={25} height={25} alt="logout" />
        </div>
      </div>
      <div className="flex flex-col px-12 gap-8">
        <div className="text-2xl font-medium">Available Coupons:</div>
        {coupons.length > 0 ? (
          <div className="grid grid-cols-[repeat(3,1fr)] grid-rows-[repeat(5,1fr)] gap-8">
            {coupons.map((coupon) => (
              <Coupon
                code={coupon.coupon_code}
                description={coupon.coupon_description}
                discount={coupon.coupon_discount_amt}
                expiration={coupon.coupon_expiration_date}
                key={coupon.coupon_code}
              />
            ))}
          </div>
        ) : (
          <div>No Coupons Available.</div>
        )}
      </div>
    </div>
  );
};

export default Page;
