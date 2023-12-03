"use client";
import React from "react";
import Image from "next/image";
import { useState } from "react";
const FoodCard = ({ name, price, description, unit, shelfLife, image }) => {
  const [count, setCount] = useState(0);

  return (
    <div className=" w-72 rounded-xl bg-white text-black  overflow-clip drop-shadow-xl">
      <Image
        className=" w-72 h-40 object-none"
        src={image}
        width={200}
        height={100}
        alt="shrimp"
      />
      <div className="p-4">
        <div className="flex flex-row items-center justify-between text-xl font-medium">
          <div className="font-bold">{name}</div>
          <div className="flex flex-row items-center justify-start gap-2">
            <div>${price}</div>
            <div className="text-sm font-thin italic text-gray-500">
              {" "}
              / {unit}
            </div>
          </div>
        </div>
        <div>{description}</div>
        <div className="italic pt-4 font-light">Shelf life: {shelfLife}</div>
        <div className="flex flex-row items-center justify-between pt-2">
          <div className="flex flex-row items-center justify-between gap-6 font-bold text-lg select-none bg-gray-50  drop-shadow-md rounded-xl px-2 py-1">
            <div
              onClick={() => setCount((old) => old + 1)}
              className="cursor-pointer hover:opacity-70"
            >
              +
            </div>
            <div className="">{count}</div>
            <div
              onClick={() => (count == 0 ? 0 : setCount((old) => old - 1))}
              className="cursor-pointer hover:opacity-80  rounded-full select-none"
            >
              -
            </div>
          </div>
          <div className="select-none cursor-pointer hover:opacity-70 px-4 py-1 rounded-full font-bold bg-red-500 text-white ">
            Add
          </div>
        </div>
      </div>
    </div>
  );
};

export default FoodCard;
