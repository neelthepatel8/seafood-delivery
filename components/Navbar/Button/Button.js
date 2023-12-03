"use client";
import { useRouter } from "next/navigation";
import React from "react";

const Button = ({ text, routeTo }) => {
  const router = useRouter();

  const handleClick = () => {
    router.push(routeTo);
  };
  return (
    <button
      onClick={handleClick}
      className="text-2xl font-medium bg-red-500 text-white rounded-full py-3 px-7 hover:opacity-70 cursor-pointer transition-all"
    >
      {text}
    </button>
  );
};

export default Button;
