import Card from './Card';

export function AIReports() {
  return (
    <Card className="p-3">
      <h3 className="text-base font-semibold text-white mb-2" style={{ fontFamily: 'var(--font-space-grotesk)' }}>
        AI Reports
      </h3>
      <p className="text-xs text-gray-400" style={{ fontFamily: 'var(--font-inter)' }}>
        Automated insights
      </p>
    </Card>
  );
}

