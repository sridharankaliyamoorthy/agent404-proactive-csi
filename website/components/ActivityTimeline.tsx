"use client";

import Card, { CardHeader, CardTitle, CardContent } from "./Card";
import { CheckCircle, AlertCircle, Info, Zap } from "lucide-react";
import { activityTimeline } from "@/lib/data";

const typeStyles = {
  success: {
    bg: "bg-cyan/10",
    border: "border-cyan/30",
    text: "text-cyan",
    icon: CheckCircle,
    iconBg: "bg-cyan/20",
  },
  info: {
    bg: "bg-teal/10",
    border: "border-teal/30",
    text: "text-teal",
    icon: Info,
    iconBg: "bg-teal/20",
  },
  warning: {
    bg: "bg-magenta/10",
    border: "border-magenta/30",
    text: "text-magenta",
    icon: AlertCircle,
    iconBg: "bg-magenta/20",
  },
};

export function ActivityTimeline() {
  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <div>
            <CardTitle className="flex items-center gap-2 neon-text">
              <Zap className="w-5 h-5 text-cyan" />
              AI Insights
            </CardTitle>
            <p className="text-sm text-gray-500 mt-2">
              Real-time alerts and system updates
            </p>
          </div>
          <div className="flex items-center gap-2 px-3 py-1 rounded-lg bg-cyan/10 border border-cyan/30">
            <div className="w-2 h-2 rounded-full bg-cyan animate-pulse shadow-glow-cyan" />
            <span className="text-xs text-cyan font-medium">Live</span>
          </div>
        </div>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          {activityTimeline.map((activity, index) => {
            const styles = typeStyles[activity.type as keyof typeof typeStyles];
            const Icon = styles.icon;
            
            return (
              <div
                key={activity.id}
                className={`
                  relative pl-8 pb-4
                  ${index !== activityTimeline.length - 1 ? 'border-l-2 border-cyan/20' : ''}
                `}
              >
                {/* Icon */}
                <div className={`
                  absolute left-0 -translate-x-1/2 top-0
                  w-8 h-8 rounded-lg ${styles.iconBg} border ${styles.border}
                  flex items-center justify-center
                  ${styles.text}
                `}>
                  <Icon className="w-4 h-4" />
                </div>

                {/* Content */}
                <div className={`
                  p-4 rounded-xl border ${styles.border} ${styles.bg}
                  transition-all duration-200 hover:scale-[1.02] cursor-pointer card-3d
                `}>
                  <div className="flex items-start justify-between gap-2">
                    <div className="flex-1">
                      <h4 className="font-semibold text-white text-sm mb-1">
                        {activity.title}
                      </h4>
                      <p className="text-sm text-gray-400">
                        {activity.description}
                      </p>
                    </div>
                  </div>
                  <div className="mt-3 flex items-center justify-between">
                    <span className="text-xs text-gray-600">{activity.time}</span>
                    <button className={`text-xs ${styles.text} hover:underline font-medium`}>
                      View Details →
                    </button>
                  </div>
                </div>
              </div>
            );
          })}
        </div>

        {/* View All */}
        <button className="w-full mt-4 py-3 px-4 rounded-xl bg-gradient-to-r from-cyan/10 to-cyan/5 border border-cyan/30 text-cyan text-sm font-medium hover:border-cyan/50 hover:bg-cyan/20 transition-all duration-200 shadow-glow-cyan">
          View All Activities
        </button>
      </CardContent>
    </Card>
  );
}
