"use client";
import React, { useState } from "react";
import Input from "../FormElements/Input";
import Button from "../Navbar/Button/Button";
import { useRouter } from "next/navigation";
import LoadingOverlay from "../Loading/LoadingOverlay";
import { cartMock } from "@/app/mock";
const Login = () => {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);

  const handleLogin = async () => {
    const response = await fetch(`/api/login`, {
      method: "POST",
      headers: {
        ContentType: "application/json",
      },
      body: JSON.stringify({ email: email, password: password }),
    });

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
      alert("Email or Password incorrect, please retry!");
    }
  };

  return (
    <div className="w-full h-full flex flex-col items-center justify-start gap-6 pb-12">
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
      <Button text={"Submit"} handler={handleLogin} />
      {loading && (
        <>
          <div className="text-black font-bold text-3xl z-50">
            Login Success! Redirecting...
          </div>
          <LoadingOverlay />
        </>
      )}
    </div>
  );
};

export default Login;
