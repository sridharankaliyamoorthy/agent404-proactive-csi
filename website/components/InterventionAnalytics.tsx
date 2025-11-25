"use client";

import Card, { CardHeader, CardTitle, CardContent } from "./Card";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from "recharts";
import { interventionData } from "@/lib/data";

export function InterventionAnalytics() {
  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <div>
            <CardTitle className="text-base">Interventions</CardTitle>
            <p className="text-xs text-gray-500 mt-0.5">
              Success rates by strategy
            </p>
          </div>
          <div className="text-right">
            <div className="text-lg font-bold text-cyan">87%</div>
            <div className="text-[10px] text-gray-500">Success</div>
          </div>
        </div>
      </CardHeader>
      <CardContent>
        <ResponsiveContainer width="100%" height={200}>
          <BarChart data={interventionData}>
            <CartesianGrid strokeDasharray="3 3" stroke="rgba(0, 229, 255, 0.1)" opacity={0.3} />
            <XAxis 
              dataKey="name" 
              stroke="rgba(0, 229, 255, 0.4)"
              tick={{ fill: '#94a3b8', fontSize: 11 }}
              axisLine={{ stroke: 'rgba(0, 229, 255, 0.2)' }}
              angle={-15}
              textAnchor="end"
              height={80}
            />
            <YAxis 
              stroke="rgba(0, 229, 255, 0.4)"
              tick={{ fill: '#94a3b8', fontSize: 12 }}
              axisLine={{ stroke: 'rgba(0, 229, 255, 0.2)' }}
            />
            <Tooltip
              contentStyle={{
                backgroundColor: 'rgba(11, 17, 32, 0.98)',
                border: '1px solid rgba(0, 229, 255, 0.4)',
                borderRadius: '12px',
                padding: '12px',
                boxShadow: '0 0 30px rgba(0, 229, 255, 0.2), inset 0 0 20px rgba(0, 229, 255, 0.05)',
                backdropFilter: 'blur(20px)',
              }}
              labelStyle={{ color: '#ffffff', fontWeight: 600, marginBottom: '8px' }}
              itemStyle={{ color: '#ffffff', fontSize: '13px' }}
            />
            <Legend 
              wrapperStyle={{ paddingTop: '20px' }}
              iconType="circle"
              formatter={(value) => <span style={{ color: '#94a3b8', fontSize: '13px' }}>{value}</span>}
            />
            <Bar 
              dataKey="completed" 
              fill="#00E5FF" 
              radius={[8, 8, 0, 0]}
              name="Completed"
            />
            <Bar 
              dataKey="pending" 
              fill="#FFC107" 
              radius={[8, 8, 0, 0]}
              name="Pending"
            />
            <Bar 
              dataKey="failed" 
              fill="#FF0080" 
              radius={[8, 8, 0, 0]}
              name="Failed"
            />
          </BarChart>
        </ResponsiveContainer>
      </CardContent>
    </Card>
  );
}
