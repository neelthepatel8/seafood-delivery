"use client";
import FoodCard from "@/components/FoodCard/FoodCard";
import Search from "@/components/FormElements/Search";
import Navbar from "@/components/Navbar/Navbar";
import React from "react";
import { foodMock } from "@/app/mock";
import { useState } from "react";
const Page = () => {
  const [search, setSearch] = useState("");
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
                />
              ))}
          </div>
        ) : (
          <div>No Items found. Please modify your search</div>
        )}
      </div>
    </div>
  );
};

export default Page;
