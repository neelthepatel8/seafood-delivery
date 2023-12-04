"use client";
import React, { useState } from "react";
import Image from "next/image";
import Card from "@/components/Navbar/Cart/Card/Card";
import { cartMock, couponMock } from "@/app/mock";
import { useRouter } from "next/navigation";

const MinimalCart = () => {
  const [cartAmount, sendUpdateCartAmount] = useState(cartMock.total_amount);
  const [cartProducts, sendUpdateCartProducts] = useState(cartMock.products);
  const [cartItemsNumber, sendUpdateCartItemsNumber] = useState(
    cartMock.total_items
  );

  const getCartTotal = () => {
    let total = 0;

    cartProducts.forEach((item) => {
      total += item.price * item.amount;
    });

    return total;
  };

  return (
    <div className="h-full w-full flex items-center justify-center">
      <div className="h-full w-full  flex flex-col items-start justify-start px-32 py-12 gap-12 ">
        <div className="text-5xl font-extrabold flex flex-row items-center justify-center gap-5">
          <Image src="/shopping-bag.png" width={35} height={35} alt="" /> Cart
        </div>
        <div className="w-full flex flex-col items-center justify-center gap-5">
          {cartProducts.length > 0 ? (
            cartProducts.map((item) => (
              <Card
                name={item.name}
                description={item.description}
                price={item.price}
                unit={item.unit}
                key={item.id}
                image={item.image}
                amount={item.amount}
                sendUpdateCartAmount={sendUpdateCartAmount}
                sendUpdateCartItemsNumber={sendUpdateCartItemsNumber}
                sendUpdateCartProducts={sendUpdateCartProducts}
              />
            ))
          ) : (
            <div className="text-2xl">No items in cart, time to shop!</div>
          )}
        </div>
        <div className="w-full border-black border-[0.5px]"></div>
        <div className="w-full flex flex-row items-center justify-between text-3xl font-bold px-20">
          <div>{cartItemsNumber} items</div>
          <div>
            <span>
              ${(Math.round(cartMock.total_amount * 100) / 100).toFixed(2)}
            </span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default MinimalCart;
