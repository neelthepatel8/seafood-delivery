"use client";
import React from "react";
import Image from "next/image";
import { useRouter } from "next/navigation";
const Profile = () => {
  const router = useRouter();

  const handleClick = () => {
    router.push("/profile");
  };
  return (
    <Image
      onClick={handleClick}
      className="hover:opacity-90 cursor-pointer hover:scale-110 transition-all"
      src="/profile-user.png"
      width={30}
      height={100}
      alt="profile"
    />
  );
};

export default Profile;
