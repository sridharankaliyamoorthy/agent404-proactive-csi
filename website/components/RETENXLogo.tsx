"use client";

interface RETENXLogoProps {
  size?: "small" | "default" | "large";
  className?: string;
}

export function RETENXLogo({ 
  size = "default",
  className = "" 
}: RETENXLogoProps) {
  const textSizes = {
    small: "text-2xl",
    default: "text-3xl",
    large: "text-4xl"
  };

  return (
    <div className={`flex items-center ${className}`}>
      <h1 
        className={`${textSizes[size]} font-bold text-white tracking-tight leading-none`}
        style={{ 
          fontFamily: 'var(--font-space-grotesk)',
          letterSpacing: '-0.02em',
          fontWeight: 700
        }}
      >
        RETENX
      </h1>
    </div>
  );
}
