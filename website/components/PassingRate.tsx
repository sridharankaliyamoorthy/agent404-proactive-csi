"use client";

import { Eye } from "lucide-react";
import { LineChart, Line, AreaChart, Area, ResponsiveContainer, XAxis, YAxis, CartesianGrid } from "recharts";

const waveformData = [
  { value: 20 }, { value: 45 }, { value: 30 }, { value: 60 },
  { value: 40 }, { value: 75 }, { value: 55 }, { value: 80 },
  { value: 65 }, { value: 50 }, { value: 70 }, { value: 85 },
  { value: 60 }, { value: 45 }, { value: 55 }, { value: 65 },
  { value: 75 }, { value: 60 }, { value: 80 }, { value: 70 },
];

export function PassingRate() {
  return (
    <div className="modern-card p-6">
      <div className="flex items-center justify-between mb-6">
        <h3 className="text-lg font-semibold text-white">Passing Rate</h3>
        <button className="text-gray-400 hover:text-white transition-colors">
          <Eye className="w-5 h-5" />
        </button>
      </div>
      
      <div className="flex items-start justify-between mb-4">
        <div></div>
        <div className="text-right">
          <span className="text-pink-500 text-sm font-semibold">28% Failed</span>
        </div>
      </div>

      {/* Waveform Chart */}
      <div className="mb-4" style={{ width: '100%', height: '128px', minHeight: '128px' }}>
        <ResponsiveContainer width="100%" height="100%">
          <AreaChart data={waveformData} margin={{ top: 0, right: 0, left: 0, bottom: 0 }}>
            <defs>
              <linearGradient id="waveGradient" x1="0" y1="0" x2="0" y2="1">
                <stop offset="0%" stopColor="#8B5CF6" stopOpacity={0.3} />
                <stop offset="100%" stopColor="#8B5CF6" stopOpacity={0} />
              </linearGradient>
            </defs>
            <Area
              type="monotone"
              dataKey="value"
              stroke="#8B5CF6"
              strokeWidth={2}
              fill="url(#waveGradient)"
              dot={false}
            />
          </AreaChart>
        </ResponsiveContainer>
      </div>

      {/* Stats */}
      <div className="flex items-center justify-between">
        <span className="text-white text-sm font-semibold">61% Complete</span>
        <span className="text-gray-300 text-sm">11% Partial</span>
      </div>
    </div>
  );
}

