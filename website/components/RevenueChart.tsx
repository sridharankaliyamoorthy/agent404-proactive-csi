'use client';

import { AreaChart, Area, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Legend } from 'recharts';
import Card, { CardHeader, CardTitle } from './Card';
import { revenueData } from '@/lib/data';

export function RevenueChart() {
  return (
    <Card className="p-3 flex flex-col h-full min-h-0">
      <CardHeader>
        <CardTitle>Revenue Protection</CardTitle>
        <p className="text-xs text-gray-400 mt-1" style={{ fontFamily: 'var(--font-inter)' }}>
          Monthly protected revenue vs at-risk
        </p>
      </CardHeader>
      <div className="flex-1 min-h-0" style={{ minHeight: '200px' }}>
        {typeof window !== 'undefined' ? (
          <ResponsiveContainer width="100%" height="100%" minHeight={200}>
            <AreaChart data={revenueData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#1e293b" />
              <XAxis dataKey="name" stroke="#94a3b8" fontSize={10} />
              <YAxis stroke="#94a3b8" fontSize={10} />
              <Tooltip contentStyle={{ backgroundColor: '#0f1620', border: '1px solid rgba(0, 217, 255, 0.3)' }} />
              <Legend />
              <Area type="monotone" dataKey="predicted" stackId="1" stroke="#00D9FF" fill="#00D9FF" fillOpacity={0.3} />
              <Area type="monotone" dataKey="actual" stackId="1" stroke="#10b981" fill="#10b981" fillOpacity={0.3} />
              <Area type="monotone" dataKey="prevented" stackId="1" stroke="#f59e0b" fill="#f59e0b" fillOpacity={0.3} />
            </AreaChart>
          </ResponsiveContainer>
        ) : (
          <div className="flex items-center justify-center h-full">
            <p className="text-gray-500 text-sm">Loading chart...</p>
          </div>
        )}
      </div>
    </Card>
  );
}

