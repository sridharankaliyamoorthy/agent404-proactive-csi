"use client";

import { Play, FileText, Mic } from "lucide-react";

export function TopHeader() {
  return (
    <div className="mb-8">
      <h1 className="text-4xl font-semibold text-white mb-6">
        Welcome, <span className="neon-text">Admin</span>
      </h1>
      
      <div className="flex items-center gap-4 flex-wrap">
        {/* AI Video Assistant */}
        <button className="flex items-center gap-3 px-5 py-4 card-3d hover:border-cyan/50 group">
          <div className="w-12 h-12 rounded-lg bg-cyan/20 flex items-center justify-center group-hover:bg-cyan/30 transition-colors shadow-glow-cyan">
            <Play className="w-6 h-6 text-cyan" />
          </div>
          <div className="text-left">
            <div className="text-sm font-semibold text-white">AI video assistant</div>
            <div className="text-xs text-gray-400">Turn files & links into video</div>
          </div>
        </button>

        {/* Import PowerPoint */}
        <button className="flex items-center gap-3 px-5 py-4 card-3d hover:border-cyan/50 group">
          <div className="w-12 h-12 rounded-lg bg-cyan/20 flex items-center justify-center group-hover:bg-cyan/30 transition-colors shadow-glow-cyan">
            <FileText className="w-6 h-6 text-cyan" />
          </div>
          <div className="text-left">
            <div className="text-sm font-semibold text-white">Import PowerPoint</div>
            <div className="text-xs text-gray-400">Turn slides into video</div>
          </div>
        </button>

        {/* Video Dubbing */}
        <button className="flex items-center gap-3 px-5 py-4 card-3d hover:border-cyan/50 group">
          <div className="w-12 h-12 rounded-lg bg-cyan/20 flex items-center justify-center group-hover:bg-cyan/30 transition-colors shadow-glow-cyan">
            <Mic className="w-6 h-6 text-cyan" />
          </div>
          <div className="text-left">
            <div className="text-sm font-semibold text-white">Video dubbing</div>
            <div className="text-xs text-gray-400">Translate any video</div>
          </div>
        </button>
      </div>
    </div>
  );
}
