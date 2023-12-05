"use client";
import React, { useEffect, useState } from "react";
import Image from "next/image";
import Swal from "sweetalert2";
import { cartMock } from "@/app/mock";
const Card = ({
  name,
  price,
  unit,
  image,
  amount,
  updateCart,
  description,
  handleCoupon,
}) => {
  const [_amount, setAmount] = useState(amount);

  useEffect(() => {
    cartMock.products = cartMock.products.forEach((i) => {
      if (i.name == name) {
        i.amount = _amount;
      }
    });
    updateCart(cartMock);
  }, [_amount]);

  const RemoveAlert = () => {
    Swal.fire({
      title: `Remove ${name}?`,
      text: "Are you sure you want to remove this item?",
      icon: "error",
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes",
    }).then(function () {
      Swal.fire({
        title: "Success",
        text: `Removed ${name}.`,
        confirmButtonText: "Okay",
      });

      cartMock.total_amount -= price * _amount;
      cartMock.total_items -= _amount;
      cartMock.products = cartMock.products.filter((i) => i.name != name);
      updateCart(cartMock);
    });
  };
  return (
    <div className="w-full h-full flex items-start justify-center">
      <div className="h-full w-full flex flex-row items-center justify-around gap-4">
        <div className="w-3/4 h-full flex flex-row items-center overflow-clip shadow-lg rounded-lg gap-8">
          <Image src={image} width={80} height={80} alt={image} />
          <div className="w-full flex flex-row items-center justify-between">
            <div className="font-bold text-xl">{name}</div>
            <div className="font-light text-xl">{description}</div>
            <div>
              {amount} <span className="font-light text-gray-400">{unit}s</span>
            </div>
            <div className="flex flex-row items-center justify-between gap-6 font-bold text-lg select-none bg-gray-50  drop-shadow-md rounded-xl px-2 py-1">
              <div
                onClick={() => setAmount((old) => old + 1)}
                className="cursor-pointer hover:opacity-70"
              >
                +
              </div>
              <div className="">{_amount}</div>
              <div
                onClick={() => (_amount == 0 ? 0 : setAmount((old) => old - 1))}
                className="cursor-pointer hover:opacity-80  rounded-full select-none"
              >
                -
              </div>
            </div>
          </div>
          <div
            onClick={RemoveAlert}
            className="cursor-pointer hover:opacity-60 transition-all font-nunito h-full flex items-center justify-center w-1/12 bg-red-500 text-white font-black text-3xl"
          >
            X
          </div>
        </div>
        <div className="text-2xl font-medium">
          $ {(Math.round(_amount * price * 100) / 100).toFixed(2)}
        </div>
      </div>
    </div>
  );
};

export default Card;
