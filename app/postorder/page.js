"use client";
import React from "react";
import ProgressBar from "@ramonak/react-progress-bar";

const Page = () => {
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
            <div className="font-bold text-md">SHIPPED VIA</div>
            <div className="font-light text-2xl">Neel Patel</div>
          </div>
          <div className="flex flex-col items-center justify-center">
            <div className="font-bold text-md">DRIVER CONTACT</div>
            <div className="font-light text-2xl">(617) 895-9539</div>
          </div>
          <div className="flex flex-col items-center justify-center">
            <div className="font-bold text-md">EXPECTED DELIVERY</div>
            <div className="font-light text-2xl">12 October</div>
          </div>
        </div>
        <div className=" border-teal-300 border-4 border-t-0  w-full h-full text-xl flex flex-col items-center justify-center text-black gap-4 p-5">
          <div className="flex flex-row items-center justify-center gap-4">
            <span>Your order status is: </span>
            <span className="bg-blue-500 text-white text-2xl font-bold px-4 py-1 rounded">
              In Transit
            </span>
          </div>
          <ProgressBar
            className="w-full"
            height="40px"
            completed={20}
            customLabel=" "
          />
        </div>
      </div>
    </div>
  );
};

export default Page;
