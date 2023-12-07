"use client";
import FoodCard from "@/components/FoodCard/FoodCard";
import Search from "@/components/FormElements/Search";
import React, { useEffect } from "react";
import { cartMock, foodMock } from "@/app/mock";
import { useState } from "react";
import { useRouter } from "next/navigation";
import CartIndicator from "@/components/Navbar/Cart/CartIndicator";
import LoadingOverlay from "@/components/Loading/LoadingOverlay";
const Page = () => {
  const router = useRouter();
  const [search, setSearch] = useState("");
  const [cartChanged, setCartChanged] = useState(false);
  const [cartLen, setCartLen] = useState(cartMock.products.length);
  const [loading, setLoading] = useState(false);

  const [foodMockLive, setFoodMockLive] = useState([]);
  const getAllInventory = async () => {
    const response = await fetch("/api/inventory?search=");
    const data = await response.json();

    if (data.status == 200) {
      setLoading(true);
      setTimeout(() => {
        setLoading(false);
        setFoodMockLive(data.result[0]);
      }, 2000);
    } else {
      alert("Something went wrong. Please try again later.");
    }
  };

  useEffect(() => {
    router.refresh();
    getAllInventory();
  }, []);

  return (
    <>
      {cartMock.customer_email != "default@email.com" ? (
        <div className="w-screen flex flex-col items-center justify-center">
          <div className="h-auto w-full flex flex-col items-center justify-start pt-28 gap-12">
            <div className="text-8xl font-extrabold drop-shadow-2xl ">
              Start Ordering
            </div>
            <Search value={search} setValue={setSearch} />
            {foodMockLive.length > 0 ? (
              <div className="grid grid-cols-[repeat(4,1fr)] grid-rows-[repeat(5,1fr)] gap-x-8 gap-y-12">
                {foodMockLive

                  .filter((item) =>
                    item["p_name"].toLowerCase().includes(search.toLowerCase())
                  )
                  .map((item) => (
                    <FoodCard
                      name={item["p_name"]}
                      price={item["sell_price"]}
                      description={item["p_description"]}
                      unit={"lbs"}
                      shelfLife={item["category"]}
                      key={item["pid"]}
                      image={item["product_img"]}
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

          {loading && <LoadingOverlay />}
        </div>
      ) : (
        <div className="w-screen h-screen flex items-center justify-center gap-3 text-4xl font-bold">
          <span
            onClick={() => router.push("/login")}
            className="font-bold text-red-500 hover:opacity-60 cursor-pointer"
          >
            Login
          </span>{" "}
          or{" "}
          <span
            onClick={() => router.push("/register")}
            className="font-bold text-red-500 hover:opacity-60 cursor-pointer"
          >
            Register
          </span>{" "}
          to start shopping
        </div>
      )}
    </>
  );
};

export default Page;
