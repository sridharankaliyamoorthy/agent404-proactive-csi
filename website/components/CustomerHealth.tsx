'use client';

import { PieChart, Pie, Cell, ResponsiveContainer, Legend, Tooltip } from 'recharts';
import Card, { CardHeader, CardTitle } from './Card';
import { customerHealthData } from '@/lib/data';

export function CustomerHealth() {
  const total = customerHealthData.reduce((sum, item) => sum + (item.value || 0), 0);

  return (
    <Card className="p-3 flex flex-col h-full min-h-0">
      <CardHeader>
        <CardTitle>Customer Health</CardTitle>
        <p className="text-xs text-gray-400 mt-1" style={{ fontFamily: 'var(--font-inter)' }}>
          Account status breakdown
        </p>
      </CardHeader>
      <div className="flex-1 min-h-0" style={{ minHeight: '200px' }}>
        {typeof window !== 'undefined' ? (
          <ResponsiveContainer width="100%" height="100%" minHeight={200}>
            <PieChart>
            <Pie
              data={customerHealthData}
              cx="50%"
              cy="50%"
              labelLine={false}
              label={({ name, value }) => `${name}\n${((value || 0) / total * 100).toFixed(1)}%`}
              outerRadius={60}
              fill="#8884d8"
              dataKey="value"
            >
              {customerHealthData.map((entry, index) => (
                <Cell key={`cell-${index}`} fill={entry.color} />
              ))}
            </Pie>
            <Tooltip contentStyle={{ backgroundColor: '#0f1620', border: '1px solid rgba(0, 217, 255, 0.3)' }} />
          </PieChart>
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

