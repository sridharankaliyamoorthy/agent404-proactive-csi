'use client';

import Card, { CardHeader, CardTitle } from './Card';
import { riskFactorsData } from '@/lib/data';

export function RiskFactors() {
  return (
    <Card className="p-3 flex flex-col h-full min-h-0 overflow-hidden">
      <CardHeader>
        <CardTitle>Risk Factors</CardTitle>
        <p className="text-xs text-gray-400 mt-1" style={{ fontFamily: 'var(--font-inter)' }}>
          Key churn indicators
        </p>
      </CardHeader>
      <div className="flex-1 overflow-y-auto space-y-2">
        {riskFactorsData.map((factor, index) => (
          <div key={index} className="space-y-1">
            <div className="flex items-center justify-between text-xs">
              <span className="text-gray-300" style={{ fontFamily: 'var(--font-inter)' }}>
                {factor.name}
              </span>
              <span className={`font-semibold ${(factor.score as number) > 70 ? 'text-red-400' : 'text-yellow-400'}`} style={{ fontFamily: 'var(--font-inter)' }}>
                {factor.score}
              </span>
            </div>
            <div className="w-full bg-gray-700 rounded-full h-1.5">
              <div
                className={`h-1.5 rounded-full ${(factor.score as number) > 70 ? 'bg-red-400' : 'bg-yellow-400'}`}
                style={{ width: `${factor.score}%` }}
              />
            </div>
          </div>
        ))}
      </div>
    </Card>
  );
}

