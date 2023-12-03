import Navbar from "@/components/Navbar/Navbar";
import "./globals.css";

export const metadata = {
  title: "Seafood Ordering, at your door",
  description: "Order seafood from anywhere in Boston",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <Navbar />
        {children}
      </body>
    </html>
  );
}
