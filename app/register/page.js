"use client";
import React, { useState } from "react";
import Input from "@/components/FormElements/Input";
import Button from "@/components/Navbar/Button/Button";
import LoadingOverlay from "@/components/Loading/LoadingOverlay";
import { useRouter } from "next/navigation";
import Swal from "sweetalert2";
import { cartMock } from "../mock";
const Page = () => {
  const router = useRouter();
  const [fname, setFName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confPassword, setConfPassword] = useState("");
  const [contact, setContact] = useState("");
  const [street, setStreet] = useState("");
  const [apartment, setApartment] = useState("");
  const [state, setState] = useState("");
  const [zip, setZip] = useState("");
  const [loading, setLoading] = useState(false);

  const Alert = ({ title, text, icon, callback }) => {
    Swal.fire({
      title: title,
      confirmButtonText: "Okay",
      text: text,
      icon: icon,
    }).then(callback);
  };
  const handleRegister = async () => {
    if (
      fname == "" ||
      email == "" ||
      password == "" ||
      confPassword == "" ||
      state == "" ||
      zip == "" ||
      street == "" ||
      contact == ""
    ) {
      Alert({
        title: "Empty Fields",
        text: "Please fill out all the mandatory fields and try again.",
        icon: "warning",
        callback: () => {},
      });
      return;
    }

    if (password.toLowerCase() != confPassword.toLowerCase()) {
      Alert({
        title: "Passwords Dont Match",
        text: "Password does not match confirm password.",
        icon: "warning",
        callback: () => {},
      });
      return;
    }
    const response = await fetch(
      `/api/register?fname=${fname}&email=${email}&password=${password}&contact=${contact}&street=${street}&apartment=${apartment}&state=${state}&zip=${zip}`
    );

    const data = await response.json();
    console.log(data);
    if (data.status == 200) {
      setLoading(true);
      setTimeout(() => {
        setLoading(false);
        cartMock.customer_email = email;
        router.push("/search");
      }, 3000);
    } else {
      Alert({
        title: "Incorrect Fields",
        text: "Please check your form data and try again.",
        icon: "error",
        callback: () => {},
      });
    }
  };
  return (
    <div className="w-screen h-screen">
      <div className="w-full h-full flex flex-col items-center justify-center gap-16 pt-16">
        <div className="text-7xl font-extrabold">Register</div>
        <div className="w-full h-full flex flex-col items-center justify-start gap-6 pb-12">
          <Input
            value={fname}
            setValue={setFName}
            placeholder={"Full Name"}
            type="text"
          />
          <Input
            value={email}
            setValue={setEmail}
            placeholder={"Email"}
            type="text"
          />
          <Input
            value={password}
            setValue={setPassword}
            placeholder={"Password"}
            type="password"
          />
          <Input
            value={confPassword}
            setValue={setConfPassword}
            placeholder={"Confirm Password"}
            type="password"
          />
          <Input
            value={contact}
            setValue={setContact}
            placeholder={"Contact Number"}
            type="text"
          />
          <span className="text-2xl font-bold pt-16">
            Primary Delivery Address
          </span>
          <Input
            value={street}
            setValue={setStreet}
            placeholder={"Street"}
            type="text"
          />
          <Input
            value={apartment}
            setValue={setApartment}
            placeholder={"Apartment Number (Optional)"}
            type="text"
          />
          <Input
            value={state}
            setValue={setState}
            placeholder={"State"}
            type="text"
          />
          <Input
            value={zip}
            setValue={setZip}
            placeholder={"Zip"}
            type="text"
          />
          <Button text={"Submit"} handler={handleRegister} />
        </div>
      </div>
      {loading && (
        <div>
          <div className=" text-black text-3xl font-bold">
            Registration Successful! Redirecting to store..
          </div>
          <LoadingOverlay />
        </div>
      )}
    </div>
  );
};

export default Page;
