'use client';

import { useState } from 'react';
import { Search, Bell, User, Settings, Menu } from 'lucide-react';

export function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <header className="h-12 bg-[#0f1620]/80 backdrop-blur-sm border-b border-cyan-500/10 flex items-center justify-between px-4 flex-shrink-0">
      <div className="flex items-center gap-4">
        <button
          onClick={() => setIsMenuOpen(!isMenuOpen)}
          className="lg:hidden text-gray-400 hover:text-white"
        >
          <Menu size={20} />
        </button>
        <div className="flex items-center gap-2">
          <h1 
            className="text-xl font-bold text-white tracking-wider"
            style={{ fontFamily: 'var(--font-space-grotesk)' }}
          >
            RETENX
          </h1>
        </div>
        <nav className="hidden lg:flex items-center gap-1">
          <a href="#" className="px-3 py-1.5 text-sm text-gray-400 hover:text-white rounded-lg hover:bg-cyan-500/10 transition-colors">
            Dashboard
          </a>
          <a href="#" className="px-3 py-1.5 text-sm text-gray-400 hover:text-white rounded-lg hover:bg-cyan-500/10 transition-colors">
            Analytics
          </a>
          <a href="#" className="px-3 py-1.5 text-sm text-gray-400 hover:text-white rounded-lg hover:bg-cyan-500/10 transition-colors">
            Risk Monitor
          </a>
          <a href="#" className="px-3 py-1.5 text-sm text-gray-400 hover:text-white rounded-lg hover:bg-cyan-500/10 transition-colors">
            Playbooks
          </a>
        </nav>
      </div>
      <div className="flex items-center gap-2">
        <div className="hidden md:flex items-center gap-2 bg-[#0f1620]/50 rounded-lg px-3 py-1.5">
          <Search size={14} className="text-gray-400" />
          <input
            type="text"
            placeholder="Search..."
            className="bg-transparent border-none outline-none text-sm text-gray-300 placeholder-gray-500 w-32"
          />
        </div>
        <button className="p-1.5 text-gray-400 hover:text-white rounded-lg hover:bg-cyan-500/10 transition-colors">
          <Bell size={18} />
        </button>
        <button className="p-1.5 text-gray-400 hover:text-white rounded-lg hover:bg-cyan-500/10 transition-colors">
          <User size={18} />
        </button>
        <button className="p-1.5 text-gray-400 hover:text-white rounded-lg hover:bg-cyan-500/10 transition-colors">
          <Settings size={18} />
        </button>
      </div>
    </header>
  );
}

