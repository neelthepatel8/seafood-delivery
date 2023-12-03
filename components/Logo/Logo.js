"use client";
import React from "react";
import Image from "next/image";
import { useRouter } from "next/navigation";
const Logo = () => {
  const router = useRouter();

  const handleClick = () => {
    router.push("/");
  };
  return (
    <Image
      onClick={handleClick}
      className="cursor-pointer hover:opacity-90"
      src="/logo.png"
      width={200}
      height={100}
      alt="logo"
    />
  );
};

export default Logo;
