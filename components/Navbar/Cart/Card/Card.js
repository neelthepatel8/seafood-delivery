import React from "react";
import Image from "next/image";
const Card = ({ name, price, unit, image, amount, description }) => {
  return (
    <div className="w-full h-full flex items-start justify-center">
      <div className="h-full w-full flex flex-row items-center justify-around gap-4">
        <div className="w-3/4 h-full flex flex-row items-center overflow-clip shadow-lg rounded-lg gap-8">
          <Image src={image} width={80} height={80} alt={image} />
          <div className="flex flex-col items-start justify-center mr-auto">
            <div className="font-bold text-xl">{name}</div>
            <div>
              {amount} <span className="font-light text-gray-400">{unit}s</span>
            </div>
          </div>
          <div className="cursor-pointer hover:opacity-60 transition-all font-nunito h-full flex items-center justify-center w-1/12 bg-red-500 text-white font-black text-3xl">
            X
          </div>
        </div>
        <div className="text-2xl font-medium">
          $ {(Math.round(price * amount * 100) / 100).toFixed(2)}
        </div>
      </div>
    </div>
  );
};

export default Card;
