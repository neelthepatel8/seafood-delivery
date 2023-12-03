"use client";
import Button from "@/components/Navbar/Button/Button";
import Navbar from "@/components/Navbar/Navbar";
import { useRouter } from "next/navigation";
export default function Home() {
  const router = useRouter();

  const handleLogin = () => {
    router.push("/login");
  };

  return (
    <div className="font-main w-screen h-screen">
      <div className="w-full h-full flex flex-col items-center justify-start pt-28 gap-16">
        <div className="flex flex-col items-start justify-center text-8xl font-extrabold drop-shadow-2xl">
          <div>Fresh or Frozen,</div>
          <div>
            <span className="text-red-500">Seafood</span> at
          </div>
          <div>your door.</div>
        </div>
        <div className="flex flex-col items-center justify-center gap-4">
          <Button routeTo={"/register"} text="Register today!" />
          <span className=" font-light text-lg ">
            Already a customer?{" "}
            <span
              onClick={handleLogin}
              className="font-medium text-red-600 hover:opacity-60 cursor-pointer"
            >
              Login
            </span>
          </span>
        </div>
      </div>
    </div>
  );
}
