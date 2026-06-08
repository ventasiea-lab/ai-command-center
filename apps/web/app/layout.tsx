import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "AI Command Center",
  description: "Centro operativo para agentes, tareas, memoria e integraciones."
};

export default function RootLayout({
  children
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="es">
      <body>{children}</body>
    </html>
  );
}

