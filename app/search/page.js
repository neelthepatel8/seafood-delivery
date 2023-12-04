"use client";
import FoodCard from "@/components/FoodCard/FoodCard";
import Search from "@/components/FormElements/Search";
import React from "react";
import { cartMock, foodMock } from "@/app/mock";
import { useState } from "react";

import CartIndicator from "@/components/Navbar/Cart/CartIndicator";
const Page = () => {
  const [search, setSearch] = useState("");
  const [cartChanged, setCartChanged] = useState(false);
  const [cartLen, setCartLen] = useState(cartMock.products.length);
  return (
    <div className="w-screen flex flex-col items-center justify-center">
      <div className="h-auto w-full flex flex-col items-center justify-start pt-28 gap-12">
        <div className="text-8xl font-extrabold drop-shadow-2xl ">
          Start Ordering
        </div>
        <Search value={search} setValue={setSearch} />
        {foodMock.length > 0 ? (
          <div className="grid grid-cols-[repeat(4,1fr)] grid-rows-[repeat(5,1fr)] gap-x-8 gap-y-12">
            {foodMock
              .filter((item) =>
                item.name.toLowerCase().includes(search.toLowerCase())
              )
              .map((item) => (
                <FoodCard
                  name={item.name}
                  price={item.price}
                  description={item.description}
                  unit={item.unit}
                  shelfLife={item.shelfLife}
                  key={item.id}
                  image={item.image}
                  setCartChanged={setCartChanged}
                  setCartLen={setCartLen}
                />
              ))}
          </div>
        ) : (
          <div>No Items found. Please modify your search</div>
        )}
      </div>
      {cartChanged ? (
        <CartIndicator len={cartLen} />
      ) : (
        <CartIndicator len={cartLen} />
      )}
    </div>
  );
};

export default Page;
