import React from "react";
import CopyButton from "./CopyButton";
import Tilt from "react-parallax-tilt";
const Coupon = ({ code, discount, expiration, description }) => {
  console.log(code, discount, expiration, description);
  function formatDateString(isoString) {
    if (!isoString) return;

    const date = new Date(isoString);

    const options = { day: "numeric", month: "long", year: "numeric" };
    return new Intl.DateTimeFormat("en-US", options).format(date);
  }
  return (
    <>
      {code != "" && (
        <Tilt perspective={10000}>
          <div className=" rounded-lg flex flex-col items-start justify-center p-4 bg-gradient-to-r from-red-200 to-orange-200 via-green-100 drop-shadow-2xl">
            <div className="w-full flex flex-row items-center justify-between">
              <div className="flex flex-row items-center justify-center gap-2">
                <div className="font-mono text-2xl font-bold">{code}</div>
                <CopyButton code={code} />
              </div>
              <div className="bg-lime-500 text-white px-2 py-1 font-bold rounded-xl text-xl">
                {discount}%
              </div>
            </div>
            <div className="text-lg font-medium pt-4 pb-2">{description}</div>
            <div className="font-thin text-sm italic">
              Expires: {formatDateString(expiration)}
            </div>
          </div>
        </Tilt>
      )}
    </>
  );
};

export default Coupon;
