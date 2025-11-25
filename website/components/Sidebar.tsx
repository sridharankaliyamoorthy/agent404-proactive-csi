"use client";

import { useState } from "react";
import { 
  Home, FileText, Video, Palette, Settings, 
  Library, Users, Search, Menu, X, Bell, User,
  ChevronDown, Grid, BarChart3, Zap
} from "lucide-react";

export function Sidebar() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <>
      {/* Mobile Overlay */}
      {isOpen && (
        <div 
          className="fixed inset-0 bg-black/50 z-30 lg:hidden"
          onClick={() => setIsOpen(false)}
        />
      )}

      <aside className={`
        fixed top-0 left-0 h-full w-64 sidebar z-40
        transform transition-transform duration-300 ease-in-out
        ${isOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'}
      `}>
        <div className="p-6 space-y-6 flex-1 overflow-y-auto h-full">
          {/* RETENX Logo */}
          <div className="flex flex-col items-center pb-4 border-b border-cyan/20">
            <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-cyan to-cyan-bright flex items-center justify-center shadow-glow-cyan mb-3">
              <Zap className="w-6 h-6 text-navy-dark" />
            </div>
            <div className="text-center">
              <h1 className="text-xl font-bold neon-text tracking-[0.2em]">RETENX</h1>
              <p className="text-[9px] text-gray-500 mt-0.5">[deloped by Agent404]</p>
            </div>
          </div>

          {/* Search Bar */}
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            <input
              type="text"
              placeholder="Search"
              className="w-full bg-navy-dark/50 border border-cyan/20 rounded-lg px-10 py-2 text-sm text-white placeholder:text-gray-500 focus:outline-none focus:border-cyan/50 transition-colors"
            />
            <span className="absolute right-3 top-1/2 -translate-y-1/2 text-xs text-gray-500">⌘K</span>
          </div>

          {/* MAIN MENU */}
          <div>
            <div className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3 px-2">
              MAIN MENU
            </div>
            <nav className="space-y-1">
              <div className="flex items-center gap-3 px-2 py-2 rounded-lg bg-cyan/10 text-cyan cursor-pointer hover:bg-cyan/20 transition-colors">
                <Home className="w-4 h-4" />
                <span className="text-sm">Home</span>
              </div>
              <div className="flex items-center gap-3 px-2 py-2 rounded-lg text-gray-400 cursor-pointer hover:bg-cyan/10 hover:text-cyan transition-colors">
                <BarChart3 className="w-4 h-4" />
                <span className="text-sm">Analytics</span>
              </div>
              <div className="flex items-center gap-3 px-2 py-2 rounded-lg text-gray-400 cursor-pointer hover:bg-cyan/10 hover:text-cyan transition-colors">
                <FileText className="w-4 h-4" />
                <span className="text-sm">Reports</span>
              </div>
              <div className="flex items-center gap-3 px-2 py-2 rounded-lg text-gray-400 cursor-pointer hover:bg-cyan/10 hover:text-cyan transition-colors">
                <Video className="w-4 h-4" />
                <span className="text-sm">Playbooks</span>
              </div>
            </nav>
          </div>

          {/* SETTINGS */}
          <div>
            <div className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3 px-2">
              SETTINGS
            </div>
            <nav className="space-y-1">
              <div className="flex items-center gap-3 px-2 py-2 rounded-lg text-gray-400 cursor-pointer hover:bg-cyan/10 hover:text-cyan transition-colors">
                <Palette className="w-4 h-4" />
                <span className="text-sm">Appearance</span>
              </div>
              <div className="flex items-center gap-3 px-2 py-2 rounded-lg text-gray-400 cursor-pointer hover:bg-cyan/10 hover:text-cyan transition-colors">
                <Settings className="w-4 h-4" />
                <span className="text-sm">Settings</span>
              </div>
            </nav>
          </div>

          {/* ASSETS */}
          <div>
            <div className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3 px-2">
              ASSETS
            </div>
            <nav className="space-y-1">
              <div className="flex items-center gap-3 px-2 py-2 rounded-lg text-gray-400 cursor-pointer hover:bg-cyan/10 hover:text-cyan transition-colors">
                <Library className="w-4 h-4" />
                <span className="text-sm">Library</span>
              </div>
              <div className="flex items-center gap-3 px-2 py-2 rounded-lg text-gray-400 cursor-pointer hover:bg-cyan/10 hover:text-cyan transition-colors">
                <Users className="w-4 h-4" />
                <span className="text-sm">Customers</span>
              </div>
            </nav>
          </div>
        </div>

        {/* Powered by Section */}
        <div className="p-4 border-t border-cyan/20">
          <div className="flex flex-col items-center space-y-2 mb-4">
            <div className="flex items-center gap-2">
              <div className="w-5 h-5 rounded-full bg-navy-dark border border-cyan flex items-center justify-center">
                <span className="text-cyan text-[10px] font-bold">AI</span>
              </div>
              <span className="text-gray-600 text-[10px]">Powered by</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="text-cyan font-bold text-xs tracking-wide">IBM</span>
              <span className="text-gray-500 text-xs">lalab.ai</span>
            </div>
          </div>
        </div>
      </aside>
    </>
  );
}
