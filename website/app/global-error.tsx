'use client';

export default function GlobalError({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  return (
    <html lang="en" className="dark h-full">
      <body className="h-full">
        <div className="h-screen bg-[#1a2332] flex items-center justify-center p-4">
          <div className="max-w-md w-full bg-[#0f1620]/80 backdrop-blur-sm border border-red-500/30 rounded-lg p-6">
            <h2 className="text-xl font-bold text-red-400 mb-2">Something went wrong!</h2>
            <p className="text-gray-300 text-sm mb-4">
              {error.message || 'An unexpected error occurred'}
            </p>
            <button
              onClick={reset}
              className="px-4 py-2 bg-cyan-500/20 hover:bg-cyan-500/30 text-cyan-300 rounded-lg text-sm font-medium transition-colors"
            >
              Try again
            </button>
          </div>
        </div>
      </body>
    </html>
  );
}

