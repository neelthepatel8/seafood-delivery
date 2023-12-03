import React from "react";
import Image from "next/image";
import Card from "@/components/Navbar/Cart/Card/Card";
import { cartMock } from "@/app/mock";

const Cart = () => {
  return (
    <div className="h-screen w-screen flex items-center justify-center">
      <div className="h-full w-4/5 mx-auto flex flex-col items-start justify-start px-32 pt-12 gap-12">
        <div className="text-5xl font-extrabold flex flex-row items-center justify-center gap-5">
          <Image src="/shopping-bag.png" width={35} height={35} alt="" /> Cart
        </div>
        <div className="w-full flex flex-col items-center justify-center gap-5">
          {cartMock.map((item) => (
            <Card
              name={item.name}
              description={item.description}
              price={item.price}
              unit={item.unit}
              key={item.id}
              image={item.image}
              amount={item.amount}
            />
          ))}
        </div>
      </div>
    </div>
  );
};

export default Cart;
