"use client";
import React, { useEffect, useState } from "react";
import Image from "next/image";
import Card from "@/components/Navbar/Cart/Card/Card";
import { cartMock, couponMock } from "@/app/mock";
import { useRouter } from "next/navigation";

const Cart = () => {
  const router = useRouter();
  const [cart, updateCart] = useState(cartMock);

  const [couponCode, setCouponCode] = useState("");
  const [couponUsed, setCouponUsed] = useState(false);
  const [coupon, setCoupon] = useState({});
  const [couponSearching, setCouponSearching] = useState(false);

  useEffect(() => {
    cartMock.products = cart.products;
    cartMock.total_amount = cart.total_amount;
    cartMock.total_items = cart.total_items;
    cartMock.total_amount_with_discount = cart.total_amount_with_discount;
    cartMock.coupon = cart.coupon;
    cartMock.couponUsed = cart.couponUsed;
  }, [cart]);

  const handleRemove = (item) => {
    const prods = cart.products.filter((prod) => prod.name != item.name);
    const newTotal = cart.total_amount - item.amount * item.price;
    const newItemsNumber = cart.total_items - item.amount;
    updateCart({
      ...cart,

      total_amount: newTotal,
      total_amount_with_discount: newTotal,

      total_items: newItemsNumber,
      products: prods,
    });
  };

  const handleIncreDecre = (item, type) => {
    let newTotal = cart.total_amount;
    let newItemsNumber = cart.total_items;
    const prods = cart.products.map((prod) => {
      if (prod.name === item.name) {
        prod.amount += type;
        newTotal += type * prod.price;
        newItemsNumber += type;
      }
      return prod;
    });

    updateCart({
      ...cart,

      total_amount: newTotal,
      total_amount_with_discount: newTotal,
      total_items: newItemsNumber,
      products: prods,
    });
  };

  const handleCoupon = (e) => {
    if (cart.products.length == 0) {
      setCoupon({});
      setCouponUsed(false);
      setCoupon("");
      return;
    }

    setCoupon({});
    setCouponUsed(false);
    setCoupon("");
    const foundCoupon = couponMock.filter(
      (coupon) => coupon.code.toLowerCase() == couponCode.toLowerCase()
    );

    setCouponSearching(true);
    setTimeout(() => {
      setCouponSearching(false);
      if (foundCoupon.length == 0)
        setCoupon({
          message: `${couponCode.toUpperCase()} is not a valid coupon. Please try again.`,
          discount: 0,
        });
      else {
        setCoupon({
          message: `${couponCode.toUpperCase()} applied! Discount recieved: ${
            foundCoupon[0].discount
          }%.`,
          discount: foundCoupon[0].discount,
          applied_amount: (cart.total_amount * foundCoupon[0].discount) / 100,
        });

        setCouponUsed(true);

        const newTotal =
          cart.total_amount -
          (cart.total_amount * foundCoupon[0].discount) / 100;
        updateCart({
          ...cart,
          total_amount_with_discount: newTotal,
          coupon: foundCoupon[0],
          couponUsed: true,
        });
        console.log(cart);
      }
    }, 3000);
  };

  return (
    <div className="h-full w-full flex items-center justify-center">
      <div className="h-full w-4/5 mx-auto flex flex-col items-start justify-start px-32 py-12 gap-12 ">
        <div className="text-5xl font-extrabold flex flex-row items-center justify-center gap-5">
          <Image src="/shopping-bag.png" width={35} height={35} alt="" /> Cart
        </div>
        <div className="w-full flex flex-col items-center justify-center gap-5">
          {cart.products.length > 0 ? (
            cart.products.map((item) => (
              <Card
                item={item}
                name={item.name}
                description={item.description}
                price={item.price}
                unit={item.unit}
                key={item.id}
                image={item.image}
                amount={item.amount}
                handleRemove={handleRemove}
                handleIncreDecre={handleIncreDecre}
                handleCoupon={handleCoupon}
              />
            ))
          ) : (
            <div className="text-2xl">No items in cart, time to shop!</div>
          )}
        </div>
        <div className="w-full border-black border-[0.5px]"></div>
        <div className="w-full flex flex-row items-center justify-between text-3xl font-bold px-20">
          <div>{cart.total_items} items</div>
          <div>
            <span>
              ${(Math.round(cart.total_amount * 100) / 100).toFixed(2)}
            </span>
          </div>
        </div>
        {couponUsed == true && (
          <div className="flex flex-col gap-3 items-end justify-center ml-auto pr-20 text-3xl font-bold">
            <div>Discount: {coupon.discount}%</div>
            <div className="text-green-500">
              - ${(Math.round(coupon.applied_amount * 100) / 100).toFixed(2)}
            </div>
            <div>
              $
              {(
                Math.round(cart.total_amount_with_discount * 100) / 100
              ).toFixed(2)}
            </div>
          </div>
        )}
        <div className="flex flex-col items-start justify-center w-full gap-1 text-sm font-bold">
          <span className="">ENTER PROMO CODE</span>
          <div className="flex flex-row items-center justify-center text-2xl font-light">
            {cart.total_amount > 0 ? (
              <>
                <input
                  className=" h-12  outline-none border-2 bg-gray-100 focus:bg-white px-4"
                  type="text"
                  value={couponCode}
                  onChange={(e) => setCouponCode(e.target.value)}
                  placeholder="Promo Code"
                />
                <div
                  onClick={handleCoupon}
                  className="select-none cursor-pointer hover:opacity-75 h-12 bg-black text-white text-xl font-medium items-center justify-center flex px-5 mr-4"
                >
                  Submit
                </div>
              </>
            ) : (
              <>
                <input
                  disabled
                  className=" h-12  outline-none border-2 bg-gray-100 focus:bg-white px-4"
                  type="text"
                  value={couponCode}
                  onChange={(e) => setCouponCode(e.target.value)}
                  placeholder="Promo Code"
                />

                <div
                  onClick={handleCoupon}
                  className="select-none cursor-pointer hover:opacity-75 h-12 bg-black text-white text-xl font-medium items-center justify-center flex px-5 mr-4"
                >
                  Submit
                </div>
              </>
            )}
            {couponSearching == true ? (
              <div className="inline-block h-8 w-8 animate-spin rounded-full border-4 border-solid border-current border-r-transparent align-[-0.125em] motion-reduce:animate-[spin_1.5s_linear_infinite]"></div>
            ) : coupon != {} ? (
              <div>{coupon.message}</div>
            ) : (
              <div></div>
            )}
          </div>
        </div>
        <div className="ml-auto pb-12">
          <div
            className="flex flex-row items-center justify-center gap-2  px-8 py-3 bg-yellow-400  font-semibold text-2xl hover:scale-105 active:scale-95 transition-all transform cursor-pointer rounded-full"
            onClick={() => router.push("/checkout")}
          >
            <Image src="/lock.png" width={20} height={20} alt="" /> Checkout
          </div>
        </div>
      </div>
    </div>
  );
};

export default Cart;
