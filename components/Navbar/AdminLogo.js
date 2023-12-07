"use client";
import React from "react";
import Image from "next/image";
import { useRouter } from "next/navigation";
const AdminLogo = () => {
  const router = useRouter();
  return (
    <Image
      onClick={() => router.push("https://seafoodtradingco.streamlit.app/")}
      className="hover:opacity-90 cursor-pointer hover:scale-110 transition-all"
      src="/admin.png"
      width={30}
      height={100}
      alt="Admin"
    />
  );
};

export default AdminLogo;
