"use client";
import React, { useEffect, useState } from "react";
import ProgressBar from "@ramonak/react-progress-bar";
import { useSearchParams } from "next/navigation";
import LoadingOverlay from "@/components/Loading/LoadingOverlay";

const Page = () => {
  const [delivery, setDelivery] = useState({});
  const [loading, setLoading] = useState(false);

  const params = useSearchParams();
  const getDelivery = async () => {
    setLoading(true);

    const response = await fetch(`/api/delivery?order=${params.get("order")}`);
    const data = await response.json();

    if (data.status == 200) {
      const delivery_info = data.result[0][0];
      const response2 = await fetch(
        `/api/partner?id=${delivery_info.delivery_partner_id}`
      );

      const data2 = await response2.json();

      if (data2.status == 200) {
        const partner_info = data2.result[0][0];
        setTimeout(() => {
          setLoading(false);
          setDelivery({ ...delivery_info, ...partner_info });
        }, 1000);
      } else {
        setLoading(false);
        alert("Something went wrong. Please try again later.");
      }
    } else {
      setLoading(false);

      alert("Something went wrong. Please try again later.");
    }
  };

  function formatDateString(isoString) {
    if (!isoString) return;

    const date = new Date(isoString);

    const options = { day: "numeric", month: "long", weekday: "long" };
    return new Intl.DateTimeFormat("en-US", options).format(date);
  }

  useEffect(() => {
    getDelivery();
  }, []);

  return (
    <div className="flex flex-col items-center justify-start pt-12 gap-12 w-screen h-screen">
      <div className="text-5xl font-bold flex flex-col items-center justify-center gap-5">
        <span className="text-7xl font-extrabold">Congratulations!</span>
        <span>Your order has been placed.</span>
      </div>
      <div className="text-white font-medium w-1/2 flex flex-col items-center justify-center rounded-lg overflow-clip">
        <div className="text-3xl py-3 flex font-bold items-center justify-center w-full bg-teal-500">
          Order Tracking
        </div>
        <div className="py-4 w-full px-6 bg-teal-400 flex flex-row items-center justify-between">
          <div className="flex flex-col items-center justify-center">
            <div className="font-light text-md">SHIPPED VIA</div>
            <div className="font-medium text-2xl">
              {delivery.first_name + " " + delivery.last_name}
            </div>
          </div>
          <div className="flex flex-col items-center justify-center">
            <div className="font-light text-md">DRIVER CONTACT</div>
            <div className="font-medium text-2xl">{delivery.phone}</div>
          </div>
          <div className="flex flex-col items-center justify-center">
            <div className="font-light text-ms">EXPECTED DELIVERY</div>
            <div className="font-medium text-2xl">
              {formatDateString(delivery.expected_delivery_date)}
            </div>
          </div>
        </div>
        <div className=" border-teal-300 border-4 border-t-0  w-full h-full text-xl flex flex-col items-center justify-center text-black gap-4 p-5">
          <div className="flex flex-row items-center justify-center gap-4">
            <span>Your order status is: </span>
            {delivery.delivery_status == "placed" ? (
              <span className="bg-yellow-500 text-white text-2xl font-bold px-4 py-1 rounded">
                {delivery.delivery_status &&
                  delivery.delivery_status[0].toUpperCase() +
                    delivery.delivery_status.slice(1)}
              </span>
            ) : delivery.delivery_status == "in-transit" ? (
              <span className="bg-orange-500 text-white text-2xl font-bold px-4 py-1 rounded">
                {delivery.delivery_status &&
                  delivery.delivery_status[0].toUpperCase() +
                    delivery.delivery_status.slice(1)}
              </span>
            ) : (
              <span className="bg-green-500 text-white text-2xl font-bold px-4 py-1 rounded">
                {delivery.delivery_status &&
                  delivery.delivery_status[0].toUpperCase() +
                    delivery.delivery_status.slice(1)}
              </span>
            )}
          </div>
          <ProgressBar
            className="w-full"
            height="35px"
            completed={
              delivery.delivery_status == "placed"
                ? 20
                : delivery.delivery_status == "in-transit"
                ? 55
                : 95
            }
            customLabel=" "
          />
        </div>
      </div>
      {loading && <LoadingOverlay />}
    </div>
  );
};

export default Page;
