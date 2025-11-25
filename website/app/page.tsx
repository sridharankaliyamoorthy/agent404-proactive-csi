'use client';

import { Suspense } from 'react';
import { Header } from "@/components/Header";
import { KPICard } from "@/components/KPICard";
import { RevenueChart } from "@/components/RevenueChart";
import { ChurnPredictionChart } from "@/components/ChurnPredictionChart";
import { CustomerHealth } from "@/components/CustomerHealth";
import { RiskFactors } from "@/components/RiskFactors";
import IBMAgent from "@/components/IBMAgent";
import { kpiData } from "@/lib/data";

function ChartFallback() {
  return (
    <div className="flex items-center justify-center h-full bg-[#0f1620]/50 rounded-lg">
      <p className="text-gray-500 text-sm">Loading chart...</p>
    </div>
  );
}

function ComponentWrapper({ children, fallback }: { children: React.ReactNode; fallback?: React.ReactNode }) {
  return (
    <Suspense fallback={fallback || <ChartFallback />}>
      {children}
    </Suspense>
  );
}

export default function Home() {
  return (
    <div className="h-screen bg-[#1a2332] flex flex-col overflow-hidden">
      {/* Header - Fixed */}
      <Header />

      {/* Main Content - Fits in remaining space, no scroll */}
      <main className="flex-1 ml-0 lg:ml-64 p-2 overflow-hidden">
        <div className="h-full flex flex-col">
          {/* Hero Section - Compact */}
          <div className="mb-1 flex-shrink-0">
            <h1 
              className="text-xl lg:text-2xl font-bold text-white mb-0.5 leading-tight"
              style={{ 
                fontFamily: 'var(--font-space-grotesk)',
                letterSpacing: '-0.02em',
                fontWeight: 700
              }}
            >
              Customer Success Intelligence
            </h1>
            <p 
              className="text-xs text-gray-400 leading-tight"
              style={{ fontFamily: 'var(--font-inter)' }}
            >
              Monitor, predict, and prevent customer churn
            </p>
          </div>

          {/* Content Grid - Takes remaining space */}
          <div className="flex-1 grid grid-cols-12 gap-1.5 min-h-0 overflow-hidden">
            {/* Left Column - KPI Cards */}
            <div className="col-span-12 lg:col-span-3 grid grid-cols-2 lg:grid-cols-1 gap-1.5 min-h-0">
              {kpiData.map((kpi, index) => (
                <div key={index} className="min-h-0 flex">
                  <KPICard data={kpi} />
                </div>
              ))}
            </div>

            {/* Middle Column - Charts */}
            <div className="col-span-12 lg:col-span-6 grid grid-rows-2 gap-1.5 min-h-0">
              <div className="min-h-0 flex">
                <ComponentWrapper>
                  <RevenueChart />
                </ComponentWrapper>
              </div>
              <div className="min-h-0 flex">
                <ComponentWrapper>
                  <ChurnPredictionChart />
                </ComponentWrapper>
              </div>
            </div>

            {/* Right Column - Agent & Analytics */}
            <div className="col-span-12 lg:col-span-3 grid grid-rows-3 gap-1.5 min-h-0">
              <div className="min-h-0 flex">
                <ComponentWrapper>
                  <IBMAgent />
                </ComponentWrapper>
              </div>
              <div className="min-h-0 flex">
                <ComponentWrapper>
                  <CustomerHealth />
                </ComponentWrapper>
              </div>
              <div className="min-h-0 flex">
                <ComponentWrapper>
                  <RiskFactors />
                </ComponentWrapper>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
