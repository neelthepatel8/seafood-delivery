import Navbar from "@/components/Navbar/Navbar";
import React from "react";
import Input from "@/components/FormElements/Input";
import Button from "@/components/Navbar/Button/Button";
const page = () => {
  return (
    <div className="w-screen h-screen">
      <div className="w-full h-full flex flex-col items-center justify-center gap-16 pt-16">
        <div className="text-7xl font-extrabold">Welcome Back!</div>
        <div className="w-full h-full flex flex-col items-center justify-start gap-6 pb-12">
          <Input placeholder={"Email"} type="text" />
          <Input placeholder={"Password"} type="password" />
          <Button text={"Submit"} routeTo={"/search"} />
        </div>
      </div>
    </div>
  );
};

export default page;
