"use client";
import Logo from "../Logo/Logo";
import Profile from "./Profile/Profile";
import CartLogo from "./Cart/CartLogo";
import { useRouter } from "next/navigation";
const Navbar = () => {
  const router = useRouter();
  return (
    <div className="w-screen flex flex-row items-center justify-between px-16 py-4">
      <Logo />
      <div className="h-full w-full flex flex-row items-center justify-end gap-8">
        <span
          onClick={() => router.push("/search")}
          className="text-xl font-semibold cursor-pointer hover:text-red-500 transition-all"
        >
          Go to Shop
        </span>
        <span title="My cart">
          <CartLogo />
        </span>
        <span title="Go to Profile">
          <Profile />
        </span>
      </div>
    </div>
  );
};

export default Navbar;
