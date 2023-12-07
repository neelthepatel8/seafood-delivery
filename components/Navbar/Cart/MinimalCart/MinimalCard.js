import Image from "next/image";
const MinimalCard = ({
  item,
  name,
  price,
  unit,
  image,
  amount,
  description,
}) => {
  return (
    <div className="w-full h-16 flex items-start justify-center">
      <div className="h-full w-full flex flex-row items-center justify-around gap-4">
        <div className="w-5/6 h-full flex flex-row items-center overflow-clip shadow-lg rounded-lg gap-6 pr-4">
          <Image src={image} width={80} height={80} alt={image} />
          <div className="w-full flex flex-row items-center justify-between gap-4">
            <div className="font-bold text-lg">{name}</div>
            <div className="font-light text-sm">{description}</div>
            <div className="text-lg flex flex-row items-center justify-center gap-2">
              {amount}{" "}
              <span className="text-sm font-light text-gray-400">{unit}</span>
            </div>
          </div>
        </div>
        <div className="text-xl font-medium">
          $ {(Math.round(amount * price * 100) / 100).toFixed(2)}
        </div>
      </div>
    </div>
  );
};

export default MinimalCard;
