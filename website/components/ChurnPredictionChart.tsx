'use client';

import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Legend } from 'recharts';
import Card, { CardHeader, CardTitle } from './Card';
import { churnTrendData } from '@/lib/data';

export function ChurnPredictionChart() {
  return (
    <Card className="p-3 flex flex-col h-full min-h-0">
      <CardHeader>
        <CardTitle>Churn Prediction</CardTitle>
        <p className="text-xs text-gray-400 mt-1" style={{ fontFamily: 'var(--font-inter)' }}>
          AI predictions vs actual churn
        </p>
      </CardHeader>
      <div className="flex-1 min-h-0" style={{ minHeight: '200px' }}>
        {typeof window !== 'undefined' ? (
          <ResponsiveContainer width="100%" height="100%" minHeight={200}>
            <LineChart data={churnTrendData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#1e293b" />
              <XAxis dataKey="name" stroke="#94a3b8" fontSize={10} />
              <YAxis stroke="#94a3b8" fontSize={10} />
              <Tooltip contentStyle={{ backgroundColor: '#0f1620', border: '1px solid rgba(0, 217, 255, 0.3)' }} />
              <Legend />
              <Line type="monotone" dataKey="predicted" stroke="#00D9FF" strokeWidth={2} />
              <Line type="monotone" dataKey="actual" stroke="#10b981" strokeWidth={2} />
              <Line type="monotone" dataKey="prevented" stroke="#f59e0b" strokeWidth={2} />
            </LineChart>
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

