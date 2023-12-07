import React from "react";
import Image from "next/image";
import { cartMock } from "@/app/mock";
import MinimalCard from "./MinimalCard";

const MinimalCart = () => {
  return (
    <div className="h-full w-full flex items-center justify-center">
      <div className="h-full w-full  flex flex-col items-start justify-start px-10 py-10 gap-12 ">
        <div className="text-5xl font-extrabold flex flex-row items-center justify-center gap-5">
          <Image src="/shopping-bag.png" width={35} height={35} alt="" /> Cart
        </div>
        <div className="w-full flex flex-col items-center justify-center gap-5">
          {cartMock.products.length > 0 ? (
            cartMock.products.map((item) => (
              <MinimalCard
                name={item.name}
                description={item.description}
                price={item.price}
                unit={item.unit}
                key={item.id}
                image={item.image}
                amount={item.amount}
              />
            ))
          ) : (
            <div className="text-2xl">No items in cart, time to shop!</div>
          )}
        </div>
        <div className="w-full border-black border-[0.5px]"></div>
        <div className="w-full flex flex-row items-center justify-between text-3xl font-bold px-7">
          <div>{cartMock.total_items} items</div>
          <div>
            {cartMock.couponUsed == true ? (
              <div className="flex flex-col gap-3 items-end justify-center ml-auto  text-xl font-medium">
                <span>
                  Total: $
                  {(Math.round(cartMock.total_amount * 100) / 100).toFixed(2)}
                </span>
                <div className="text-3xl font-bold">
                  Amount Due: $
                  {(
                    Math.round(cartMock.total_amount_with_discount * 100) / 100
                  ).toFixed(2)}
                </div>
              </div>
            ) : (
              <span>
                ${(Math.round(cartMock.total_amount * 100) / 100).toFixed(2)}
              </span>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default MinimalCart;
