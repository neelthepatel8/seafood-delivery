import Logo from "../Logo/Logo";
import Profile from "./Profile/Profile";
import CartLogo from "./Cart/CartLogo";

const Navbar = () => {
  return (
    <div className="w-screen flex flex-row items-center justify-between px-16 py-4">
      <Logo />
      <div className="h-full w-full flex flex-row items-center justify-end gap-8">
        <CartLogo />
        <Profile />
      </div>
    </div>
  );
};

export default Navbar;
