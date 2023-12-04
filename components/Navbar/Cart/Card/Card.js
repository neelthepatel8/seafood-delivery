"use client";
import React, { useState } from "react";
import Image from "next/image";

const Card = ({ name, price, unit, image, amount }) => {
  const [_amount, setAmount] = useState(amount);

  return (
    <div className="w-full h-full flex items-start justify-center">
      <div className="h-full w-full flex flex-row items-center justify-between gap-4">
        <div className="w-full h-full flex flex-row items-center overflow-clip shadow-lg rounded-lg gap-8">
          <Image src={image} width={80} height={80} alt={image} />
          <div className="w-full flex flex-row items-center justify-between mr-auto">
            <div className="font-bold text-lg">{name}</div>
            <div className="font-extrathin text-sm text-gray-500 pr-12">
              {price} / {unit}
            </div>
          </div>
        </div>
        <div className="text-xl font-medium pr-28">
          ${(Math.round(price * _amount * 100) / 100).toFixed(2)}
        </div>
      </div>
    </div>
  );
};

export default Card;
