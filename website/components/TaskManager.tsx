"use client";

import { ChevronLeft, ChevronRight, Plus, MessageSquare, FileText } from "lucide-react";

const timeSlots = ["10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30"];

const tasks = [
  {
    day: 0, // Monday
    time: "10:30",
    title: "Dashboard Design",
    client: "Flowio - Video App",
    description: "To design an intuitive, modern, and visually appealing interface for a web application.",
    progress: 75,
    avatars: 3,
    messages: 12,
    files: 5,
    logo: "P",
  },
  {
    day: 0,
    time: "13:00",
    title: "Topic: Interview",
    client: "Meet with HR Dep.",
    description: "Hi Michael, On this call I'd like to introduce you to our new designer, his name is Jack. We need you to evaluate his skills to accept him into our team.",
    avatars: 3,
    messages: 7,
    files: 0,
    logo: "D",
  },
  {
    day: 1, // Tuesday
    time: "11:00",
    title: "Topic: Motion Design",
    client: "Meeting - Alex B.",
    description: "On this call we will discuss the changes made to the project. We will also discuss the further action plan!",
    avatars: 2,
    messages: 8,
    files: 1,
    logo: "★",
  },
  {
    day: 1,
    time: "12:00",
    title: "Landing for Flowio",
    client: "Landing Page",
    description: "",
    checkboxes: ["Define the color palette", "Prepare a UI guide", "Connect with CRM"],
    avatars: 2,
    messages: 23,
    logo: "★",
  },
  {
    day: 1,
    time: "13:30",
    title: "Topic: New Project",
    client: "Meeting - Liza K.",
    description: "Dear colleagues! At this meeting we will discuss all important issues related to the new project!",
    avatars: 2,
    messages: 1,
    files: 0,
    logo: "N",
  },
  {
    day: 2, // Wednesday
    time: "11:00",
    title: "Topic: New AI",
    client: "Meet with PM",
    description: "",
    avatars: 2,
    messages: 7,
    files: 0,
    logo: "P",
  },
];

export function TaskManager() {
  const days = ["Mon march, 09", "Tue march, 10", "Wed march, 11"];

  const getTasksForDay = (dayIndex: number) => {
    return tasks.filter(task => task.day === dayIndex);
  };

  const getTaskPosition = (time: string) => {
    const [hours, minutes] = time.split(":").map(Number);
    const startMinutes = hours * 60 + minutes;
    const baseMinutes = 10 * 60; // 10:00
    const position = ((startMinutes - baseMinutes) / 30) * 40; // 40px per 30min slot
    return position;
  };

  const getTaskHeight = (time: string, hasDescription: boolean, hasCheckboxes: boolean) => {
    let height = 80; // Base height
    if (hasDescription) height += 60;
    if (hasCheckboxes) height += 80;
    return height;
  };

  return (
    <div className="modern-card p-6">
      <div className="flex items-center justify-between mb-6">
        <h3 className="text-lg font-semibold text-white">Task Manager</h3>
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-2">
            <button className="text-gray-400 hover:text-white transition-colors">
              <ChevronLeft className="w-5 h-5" />
            </button>
            <span className="text-sm text-gray-300">March 2025</span>
            <button className="text-gray-400 hover:text-white transition-colors">
              <ChevronRight className="w-5 h-5" />
            </button>
          </div>
          <button className="flex items-center gap-2 px-4 py-2 bg-purple-500 hover:bg-purple-600 rounded-lg text-white text-sm font-medium transition-colors">
            <Plus className="w-4 h-4" />
            <span>Add Task</span>
          </button>
        </div>
      </div>

      <div className="flex gap-4 overflow-x-auto pb-4">
        {/* Time Column */}
        <div className="flex-shrink-0 w-20 pt-8">
          {timeSlots.map((time, idx) => (
            <div key={idx} className="h-10 flex items-center text-xs text-gray-400">
              {time}
            </div>
          ))}
        </div>

        {/* Day Columns */}
        {days.map((day, dayIndex) => (
          <div key={dayIndex} className="flex-1 min-w-[280px] relative">
            <div className="mb-2 text-sm font-medium text-gray-300">{day}</div>
            <div className="relative border-l border-white/10" style={{ height: `${timeSlots.length * 40}px` }}>
              {getTasksForDay(dayIndex).map((task, taskIndex) => {
                const top = getTaskPosition(task.time);
                const height = getTaskHeight(task.time, !!task.description, !!task.checkboxes);
                
                return (
                  <div
                    key={taskIndex}
                    className="absolute left-2 right-2 bg-[#25252A] border border-white/10 rounded-lg p-3 hover:border-purple-500/50 transition-colors"
                    style={{ top: `${top}px`, height: `${height}px` }}
                  >
                    <div className="flex items-start justify-between mb-2">
                      <div className="flex-1">
                        <div className="text-xs text-gray-400 mb-1">{task.time} - {task.client}</div>
                        <div className="text-sm font-semibold text-white mb-1">{task.title}</div>
                        {task.description && (
                          <div className="text-xs text-gray-400 mt-2 line-clamp-2">{task.description}</div>
                        )}
                      </div>
                      {task.logo && (
                        <div className={`w-6 h-6 rounded flex items-center justify-center text-xs font-bold ${
                          task.logo === "P" ? "bg-purple-500 text-white" :
                          task.logo === "D" ? "bg-purple-500 text-white" :
                          task.logo === "★" ? "text-yellow-400" :
                          task.logo === "N" ? "bg-purple-500 text-white" : ""
                        }`}>
                          {task.logo}
                        </div>
                      )}
                    </div>

                    {task.progress !== undefined && (
                      <div className="mt-3 mb-3">
                        <div className="h-1.5 bg-white/10 rounded-full overflow-hidden">
                          <div 
                            className="h-full bg-purple-500 rounded-full"
                            style={{ width: `${task.progress}%` }}
                          ></div>
                        </div>
                        <div className="text-xs text-gray-400 mt-1">{task.progress}%</div>
                      </div>
                    )}

                    {task.checkboxes && (
                      <div className="mt-3 space-y-2">
                        {task.checkboxes.map((checkbox, idx) => (
                          <div key={idx} className="flex items-center gap-2">
                            <div className="w-4 h-4 border border-white/20 rounded"></div>
                            <span className="text-xs text-gray-400">{checkbox}</span>
                          </div>
                        ))}
                      </div>
                    )}

                    <div className="flex items-center gap-3 mt-3 pt-3 border-t border-white/10">
                      {/* Avatars */}
                      <div className="flex items-center -space-x-2">
                        {Array.from({ length: Math.min(task.avatars, 3) }).map((_, idx) => (
                          <div
                            key={idx}
                            className="w-6 h-6 rounded-full bg-gradient-to-br from-purple-400 to-pink-400 border-2 border-[#25252A]"
                          ></div>
                        ))}
                        {task.avatars > 3 && (
                          <div className="w-6 h-6 rounded-full bg-gray-600 border-2 border-[#25252A] flex items-center justify-center text-xs text-white">
                            +{task.avatars - 3}
                          </div>
                        )}
                      </div>

                      {task.messages !== undefined && (
                        <div className="flex items-center gap-1 text-xs text-gray-400">
                          <MessageSquare className="w-3 h-3" />
                          <span>{task.messages}</span>
                        </div>
                      )}

                      {task.files !== undefined && (
                        <div className="flex items-center gap-1 text-xs text-gray-400">
                          <FileText className="w-3 h-3" />
                          <span>{task.files}</span>
                        </div>
                      )}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

