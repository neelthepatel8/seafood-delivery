"use client";
import React from "react";
import Image from "next/image";
import { useRouter } from "next/navigation";
const CartLogo = () => {
  const router = useRouter();
  return (
    <Image
      onClick={() => router.push("/cart")}
      className="hover:opacity-90 cursor-pointer hover:scale-110 transition-all"
      src="/cart.png"
      width={30}
      height={100}
      alt="cart"
    />
  );
};

export default CartLogo;
