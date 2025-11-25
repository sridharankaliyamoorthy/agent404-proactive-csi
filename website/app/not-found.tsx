export default function NotFound() {
  return (
    <div className="h-screen bg-[#1a2332] flex items-center justify-center p-4">
      <div className="max-w-md w-full bg-[#0f1620]/80 backdrop-blur-sm border border-cyan-500/30 rounded-lg p-6 text-center">
        <h2 className="text-2xl font-bold text-white mb-2">404</h2>
        <p className="text-gray-300 mb-4">This page could not be found.</p>
        <a
          href="/"
          className="inline-block px-4 py-2 bg-cyan-500/20 hover:bg-cyan-500/30 text-cyan-300 rounded-lg text-sm font-medium transition-colors"
        >
          Go back home
        </a>
      </div>
    </div>
  );
}

