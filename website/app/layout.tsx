import type { Metadata } from "next";
import { Inter, Space_Grotesk } from "next/font/google";
import "./globals.css";

const inter = Inter({ 
  subsets: ["latin"],
  variable: '--font-inter',
});

const spaceGrotesk = Space_Grotesk({ 
  subsets: ["latin"],
  variable: '--font-space-grotesk',
});

export const metadata: Metadata = {
  title: "RETENX - Predict Risk. Prevent Churn. Protect Revenue.",
  description: "AI-powered customer success intelligence platform by Agent404. Predict churn risk, prevent customer loss, and protect revenue with advanced analytics and proactive interventions.",
  keywords: "churn prediction, customer success, revenue protection, AI analytics, risk monitoring, customer retention, SaaS metrics, Agent404, IBM lalab.ai",
  authors: [{ name: "Agent404 Team" }],
  openGraph: {
    title: "RETENX - AI-Powered Customer Success Intelligence",
    description: "Predict Risk. Prevent Churn. Protect Revenue.",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="dark h-full" suppressHydrationWarning>
      <head>
        <meta name="theme-color" content="#1a2332" />
      </head>
      <body className={`${inter.variable} ${spaceGrotesk.variable} font-sans antialiased h-full overflow-hidden`}>
        {children}
      </body>
    </html>
  );
}

