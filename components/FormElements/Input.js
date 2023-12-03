import React from "react";

const Input = ({ placeholder, type }) => {
  return (
    <input
      className="w-1/3 h-12 px-4 outline-none border-b-2  text-md"
      type={type}
      placeholder={placeholder}
    />
  );
};

export default Input;
