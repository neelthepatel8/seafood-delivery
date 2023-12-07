import React from "react";
import Image from "next/image";
const CopyButton = ({ code }) => {
  const copyToClipboard = () => {
    navigator.clipboard.writeText(code);
  };

  return (
    <div
      className="flex items-center space-x-2 cursor-pointer hover:bg-gray-100 hover:opacity-50 p-2 rounded-xl active:scale-75 transition-all"
      onClick={copyToClipboard}
    >
      <Image src="/copy.png" alt="Copy" height={20} width={20} />
    </div>
  );
};

export default CopyButton;
