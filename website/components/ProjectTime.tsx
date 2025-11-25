"use client";

import { ChevronDown } from "lucide-react";
import { BarChart, Bar, ResponsiveContainer, XAxis, YAxis, CartesianGrid } from "recharts";

const data = [
  { day: "Sun", time: 10 },
  { day: "Mon", time: 14, striped: true },
  { day: "Tue", time: 16, striped: true },
  { day: "Wed", time: 17.5 },
  { day: "Thu", time: 15, striped: true },
];

export function ProjectTime() {
  return (
    <div className="modern-card p-6">
      <div className="flex items-center justify-between mb-6">
        <h3 className="text-lg font-semibold text-white">Project Time</h3>
        <div className="flex items-center gap-2 text-sm text-gray-300 cursor-pointer hover:text-white transition-colors">
          <span>Last Week</span>
          <ChevronDown className="w-4 h-4" />
        </div>
      </div>
      
      <div style={{ width: '100%', height: '192px', minHeight: '192px' }}>
        <ResponsiveContainer width="100%" height="100%">
          <BarChart data={data} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke="#374151" vertical={false} />
            <XAxis 
              dataKey="day" 
              stroke="#9CA3AF" 
              tick={{ fill: '#9CA3AF', fontSize: 12 }}
              axisLine={false}
              tickLine={false}
            />
            <YAxis 
              stroke="#9CA3AF" 
              tick={{ fill: '#9CA3AF', fontSize: 12 }}
              axisLine={false}
              tickLine={false}
              domain={[10, 18]}
              ticks={[10, 12, 14, 16, 18]}
              tickFormatter={(value) => `${value}:00`}
            />
            <Bar 
              dataKey="time" 
              radius={[8, 8, 0, 0]}
              fill="#8B5CF6"
            >
              {data.map((entry, index) => (
                <g key={`pattern-${index}`}>
                  {entry.striped && (
                    <defs>
                      <pattern
                        id={`stripes-${index}`}
                        x="0"
                        y="0"
                        width="10"
                        height="10"
                        patternUnits="userSpaceOnUse"
                      >
                        <rect width="10" height="10" fill="#8B5CF6" />
                        <path
                          d="M 0,10 L 10,0 M -2.5,2.5 L 2.5,7.5 M 7.5,12.5 L 12.5,17.5"
                          stroke="#A78BFA"
                          strokeWidth="1.5"
                        />
                      </pattern>
                    </defs>
                  )}
                </g>
              ))}
            </Bar>
          </BarChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
}

