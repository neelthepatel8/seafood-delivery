"use client";
import Logo from "../Logo/Logo";
import Profile from "./Profile/Profile";
import CartLogo from "./Cart/CartLogo";
import { cartMock } from "@/app/mock";
import { useRouter } from "next/navigation";
import AdminLogo from "./AdminLogo";
const Navbar = () => {
  const router = useRouter();
  return (
    <div className="w-screen flex flex-row items-center justify-between px-16 py-4">
      <Logo />
      <div className="h-full w-full flex flex-row items-center justify-end gap-8">
        <span
          onClick={() =>
            router.push("https://github.com/neelthepatel8/seafood-delivery")
          }
          className="text-xl font-semibold cursor-pointer hover:text-red-500 transition-all"
        >
          Documentation
        </span>
        <span
          onClick={() => router.push("/search")}
          className="text-xl font-semibold cursor-pointer hover:text-red-500 transition-all"
        >
          Go to Shop
        </span>
        {cartMock.customer_email == "admin@seafood.com" && (
          <span title="Admin Portal">
            <AdminLogo />
          </span>
        )}
        <span title="My cart">
          <CartLogo />
        </span>
        {cartMock.customer_email != "default@email.com" && (
          <span title="Go to Profile">
            <Profile />
          </span>
        )}
      </div>
    </div>
  );
};

export default Navbar;
