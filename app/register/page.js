import Navbar from "@/components/Navbar/Navbar";
import React from "react";
import Input from "@/components/FormElements/Input";
import Button from "@/components/Navbar/Button/Button";
const page = () => {
  return (
    <div className="w-screen h-screen">
      <div className="w-full h-full flex flex-col items-center justify-center gap-16 pt-16">
        <div className="text-7xl font-extrabold">Register</div>
        <div className="w-full h-full flex flex-col items-center justify-start gap-6 pb-12">
          <Input placeholder={"Full Name"} type="text" />
          <Input placeholder={"Email"} type="text" />
          <Input placeholder={"Password"} type="password" />
          <Input placeholder={"Confirm Password"} type="password" />
          <Input placeholder={"Contact Number"} type="text" />
          <span className="text-2xl font-bold pt-16">
            Primary Delivery Address
          </span>
          <Input placeholder={"Street"} type="text" />
          <Input placeholder={"Apartment Number (Optional)"} type="text" />
          <Input placeholder={"State"} type="text" />
          <Input placeholder={"Zip"} type="text" />
          <Button text={"Submit"} routeTo={"/search"} />
        </div>
      </div>
    </div>
  );
};

export default page;
