import React from "react";

const Search = ({ value, setValue }) => {
  return (
    <input
      onChange={(e) => setValue(e.target.value)}
      className=" text-black text-center w-1/2 h-16 px-12 outline-none rounded-md drop-shadow-lg text-2xl"
      type="text"
      placeholder="Search for any seafood"
      text={value !== "" && value}
    />
  );
};

export default Search;
