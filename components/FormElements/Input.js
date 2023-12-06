import React from "react";

const Input = ({ placeholder, type, value, setValue }) => {
  return (
    <input
      value={value}
      onChange={(e) => setValue(e.target.value)}
      className="w-1/3 h-12 px-4 outline-none border-b-2  text-md"
      type={type}
      placeholder={placeholder}
    />
  );
};

export default Input;
