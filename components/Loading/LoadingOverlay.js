import React from "react";

const LoadingOverlay = () => {
  return (
    <div className="fixed inset-0 bg-white bg-opacity-50 flex justify-center items-center z-40">
      <div className="animate-spin rounded-full h-24 w-24 border-t-4 border-gray-900"></div>
    </div>
  );
};

export default LoadingOverlay;
