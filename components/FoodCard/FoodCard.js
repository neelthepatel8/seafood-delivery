"use client";
import React from "react";
import Image from "next/image";
import { useState } from "react";
import { cartMock } from "@/app/mock";
const FoodCard = ({
  id,
  name,
  price,
  description,
  unit,
  shelfLife,
  image,
  setCartChanged,
  setCartLen,
  max_qty,
}) => {
  const [count, setCount] = useState(1);
  const handleAdd = (e) => {
    if (cartMock.products.filter((item) => item.name == name).length > 0) {
      cartMock.products.forEach((item) => {
        if (item.name == name) {
          item.amount += 1;
        }
      });
    } else {
      cartMock.products.push({
        id: id,
        name: name,
        price: price,
        description: description,
        shelfLife: shelfLife,
        unit: unit,
        image: image,
        amount: count,
      });
    }

    let total = 0;
    let totalItems = 0;
    cartMock.products.forEach((item) => {
      total += item.amount * item.price;
      totalItems += item.amount;
    });

    cartMock.total_amount = total;
    cartMock.total_items = totalItems;
    setCartChanged(true);
    setCartLen(totalItems);

    console.log(cartMock);
  };
  return (
    <div className=" flex flex-col items-between justify-center gap-4  w-72 rounded-xl bg-white text-black  overflow-clip drop-shadow-xl">
      <Image
        className=" w-72 h-40 object-cover "
        src={image}
        width={200}
        height={100}
        alt="FOOD"
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
        <div className="italic pt-4 font-light">{shelfLife}</div>
        <div className="mb-0 flex flex-row items-center justify-between pt-2">
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

          {count > 0 ? (
            <div
              onClick={handleAdd}
              className="select-none cursor-pointer hover:opacity-70 px-4 py-1 rounded-full font-bold bg-red-500 text-white transform active:scale-75 shadow-lg transition-transform"
            >
              Add
            </div>
          ) : (
            <div className="select-none cursor-pointer  px-4 py-1 rounded-full font-bold bg-gray-400 text-white ">
              Add
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default FoodCard;
