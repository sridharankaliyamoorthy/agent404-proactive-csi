import { Header } from "@/components/Header";
import { KPICard } from "@/components/KPICard";
import { RevenueChart } from "@/components/RevenueChart";
import { ChurnPredictionChart } from "@/components/ChurnPredictionChart";
import { RiskMonitor } from "@/components/RiskMonitor";
import { CustomerHealth } from "@/components/CustomerHealth";
import { RiskFactors } from "@/components/RiskFactors";
import { AIReports } from "@/components/AIReports";
import { InterventionAnalytics } from "@/components/InterventionAnalytics";
import { kpiData } from "@/lib/data";

export default function HomeFirstDesign() {
  return (
    <div className="min-h-screen bg-[#1a2332]">
      {/* Header */}
      <Header />

      {/* Main Content */}
      <main className="ml-0 lg:ml-64 p-6 lg:p-8">
        {/* Hero Section */}
        <div className="mb-8">
          <h1 className="text-4xl font-bold text-white mb-2">
            Customer Success Intelligence
          </h1>
          <p className="text-gray-400">
            Monitor, predict, and prevent customer churn in real-time
          </p>
        </div>

        {/* KPI Cards - Top Row */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          {kpiData.map((kpi, index) => (
            <KPICard key={index} data={kpi} />
          ))}
        </div>

        {/* Charts Row */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
          <RevenueChart />
          <ChurnPredictionChart />
        </div>

        {/* Risk Monitor - Full Width */}
        <div className="mb-8">
          <RiskMonitor />
        </div>

        {/* Analytics Row - 3 Columns */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
          <CustomerHealth />
          <RiskFactors />
          <AIReports />
        </div>

        {/* Intervention Analytics - Full Width */}
        <div className="mb-8">
          <InterventionAnalytics />
        </div>
      </main>
    </div>
  );
}

