"use client";

import { ChevronLeft, Search, Send, Circle } from "lucide-react";

const messages = [
  {
    name: "Alex Brown",
    title: "Topic: Motion Design",
    tag: "Work",
    message: "Hi Michael! I finished the project today. Looking forward to your feedback on the edits I made.",
    avatar: "AB",
  },
  {
    name: "Team Meeting - Liza K.",
    title: "Topic: Call about a new project",
    tag: "Meeting",
    message: "Dear colleagues! At this meeting, we'll talk about a key stage in the launch of our new project.",
    avatar: "LK",
  },
  {
    name: "Robert Johnson",
    title: "Topic: New artificial intelligence",
    tag: "Work",
    message: "Hi Michael! Today my team and I finished the updates on our artificial intelligence system.",
    avatar: "RJ",
  },
];

export function Inboxes() {
  return (
    <div className="bg-[#1E1E23] border border-white/5 rounded-xl p-6 flex flex-col h-full">
      <div className="flex items-center justify-between mb-6">
        <div className="flex items-center gap-3">
          <h3 className="text-lg font-semibold text-white">Inboxes</h3>
          <span className="px-2 py-0.5 bg-pink-500 rounded-full text-xs font-semibold text-white">16</span>
        </div>
        <button className="text-gray-400 hover:text-white transition-colors">
          <ChevronLeft className="w-5 h-5" />
        </button>
      </div>

      {/* Search */}
      <div className="relative mb-4">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
        <input
          type="text"
          placeholder="Search"
          className="w-full bg-[#25252A] border border-white/5 rounded-lg px-10 py-2 text-sm text-white placeholder:text-gray-500 focus:outline-none focus:border-purple-500/50 transition-colors"
        />
      </div>

      {/* Messages */}
      <div className="flex-1 overflow-y-auto space-y-4">
        {messages.map((msg, index) => (
          <div key={index} className="bg-[#25252A] border border-white/5 rounded-lg p-4 hover:border-purple-500/50 transition-colors">
            <div className="flex items-start gap-3 mb-3">
              <div className="w-10 h-10 rounded-full bg-gradient-to-br from-purple-400 to-pink-400 flex items-center justify-center text-white font-semibold text-sm flex-shrink-0">
                {msg.avatar}
              </div>
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-1">
                  <span className="text-sm font-semibold text-white">{msg.name}</span>
                  <span className="text-xs text-gray-400">• {msg.tag}</span>
                </div>
                <div className="text-xs font-medium text-gray-300 mb-2">{msg.title}</div>
                <p className="text-xs text-gray-400 line-clamp-2">{msg.message}</p>
              </div>
            </div>
            <button className="flex items-center gap-2 text-xs text-gray-400 hover:text-purple-400 transition-colors">
              <Send className="w-3 h-3" />
              <span>Send later</span>
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}

