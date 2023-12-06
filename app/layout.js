import Navbar from "@/components/Navbar/Navbar";
import "./globals.css";
export const metadata = {
  title: "Zomato: Seafood Ordering, at your door",
  description: "Order seafood from anywhere in Boston",
  icons: {
    icon: "/favicons.png",
  },
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
