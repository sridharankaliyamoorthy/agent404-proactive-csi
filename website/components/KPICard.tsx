import Card from './Card';
import { TrendingUp, TrendingDown } from 'lucide-react';
import { KPI } from '@/lib/data';

interface KPICardProps {
  data: KPI;
}

export function KPICard({ data }: KPICardProps) {
  return (
    <Card className="p-3">
      <div className="flex items-start justify-between mb-2">
        <h4 className="text-xs text-gray-400 font-medium" style={{ fontFamily: 'var(--font-inter)' }}>
          {data.title}
        </h4>
        {data.trend === 'up' ? (
          <TrendingUp size={14} className={data.color} />
        ) : (
          <TrendingDown size={14} className={data.color} />
        )}
      </div>
      <div className="flex items-baseline gap-2 mb-1">
        <span className="text-lg font-bold text-white" style={{ fontFamily: 'var(--font-space-grotesk)' }}>
          {data.value}
        </span>
        <span className={`text-xs ${data.color}`} style={{ fontFamily: 'var(--font-inter)' }}>
          {data.change}
        </span>
      </div>
      <p className="text-xs text-gray-500" style={{ fontFamily: 'var(--font-inter)' }}>
        vs last month
      </p>
    </Card>
  );
}

