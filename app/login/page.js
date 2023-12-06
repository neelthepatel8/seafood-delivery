import React from "react";
import connectMYSQL from "@/db/db";
import Login from "@/components/Login/Login";
const Page = () => {
  return (
    <div className="w-screen h-screen">
      <div className="w-full h-full flex flex-col items-center justify-center gap-16 pt-16">
        <div className="text-7xl font-extrabold">Welcome Back!</div>
        <Login />
      </div>
    </div>
  );
};

export default Page;
