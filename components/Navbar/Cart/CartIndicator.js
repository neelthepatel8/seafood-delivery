"use client";
import React from "react";
import Image from "next/image";
import { cartMock } from "@/app/mock";
import { useRouter } from "next/navigation";
import { motion } from "framer-motion";
const CartIndicator = ({ len }) => {
  const router = useRouter();
  return (
    <div>
      {cartMock.products.length > 0 && (
        <div
          onClick={() => router.push("/cart")}
          className=" flex flex-row items-center justify-center gap-3 fixed bottom-10 right-10 z-20 px-6 py-3 bg-red-500 rounded-full cursor-pointer hover:scale-125 transition-all duration-300 animate-in slide-in-from-left"
        >
          <motion.div
            key={len}
            initial={{ y: -100 }}
            animate={{ y: 0 }}
            className="text-2xl text-white font-bold"
          >
            {len}
          </motion.div>
          <Image src="/shopping-bag-white.png" width={35} height={35} alt="" />
        </div>
      )}
    </div>
  );
};

export default CartIndicator;
