'use client';

import { useEffect, useRef } from 'react';
import Card from './Card';

const CONTAINER_ID = "root";

export default function IBMAgent() {
  const containerRef = useRef<HTMLDivElement>(null);
  const scriptLoadedRef = useRef(false);

  useEffect(() => {
    // Prevent duplicate initialization
    if (scriptLoadedRef.current) return;
    if (!containerRef.current) return;

    try {
      // Check if script already exists
      const existingScript = document.querySelector(`script[src*="wxoLoader.js"]`);
      if (existingScript) {
        scriptLoadedRef.current = true;
        return;
      }

      // Set the container ID
      if (containerRef.current) {
        containerRef.current.id = CONTAINER_ID;
      }

      // Configure IBM Watson Orchestrate BEFORE loading script (exact match to provided script)
      (window as any).wxOConfiguration = {
        orchestrationID: "90617243ca96455f9e4610076177cbe8_f16c2181-a811-4d84-8e15-33cfebe50928",
        hostURL: "https://au-syd.watson-orchestrate.cloud.ibm.com",
        rootElementID: "root",
        deploymentPlatform: "ibmcloud",
        crn: "crn:v1:bluemix:public:watsonx-orchestrate:au-syd:a/90617243ca96455f9e4610076177cbe8:f16c2181-a811-4d84-8e15-33cfebe50928::",
        chatOptions: {
          agentId: "7354b87c-d536-491d-83f5-c49ee5e93d30",
          agentEnvironmentId: "d641c6ec-003d-4de6-99f9-3e70f6a2dd44",
        },
      };

      // Load IBM script with setTimeout(0) as per provided script
      setTimeout(function () {
        try {
          const script = document.createElement('script');
          script.src = `${(window as any).wxOConfiguration.hostURL}/wxochat/wxoLoader.js?embed=true`;
          script.addEventListener('load', function () {
            try {
              if ((window as any).wxoLoader) {
                (window as any).wxoLoader.init();
                scriptLoadedRef.current = true;
              }
            } catch (error) {
              console.error('Error initializing IBM Watson Orchestrate:', error);
            }
          });
          script.addEventListener('error', function () {
            console.error('Failed to load IBM Watson Orchestrate script');
          });
          document.head.appendChild(script);
        } catch (error) {
          console.error('Error creating IBM script:', error);
        }
      }, 0);
    } catch (error) {
      console.error('Error in IBMAgent useEffect:', error);
    }
  }, []);

  return (
    <Card className="flex flex-col h-full min-h-0 overflow-hidden">
      <div className="flex-shrink-0 mb-1">
        <h3 className="text-sm font-semibold text-white" style={{ fontFamily: 'var(--font-space-grotesk)' }}>
          IBM AI Agent
        </h3>
        <p className="text-xs text-gray-400" style={{ fontFamily: 'var(--font-inter)' }}>
          watsonx Orchestrate
        </p>
      </div>
      <div 
        ref={containerRef}
        id={CONTAINER_ID}
        className="flex-1 w-full rounded-lg overflow-hidden bg-[#0f1620]/50 min-h-0"
        style={{ minHeight: '120px', maxHeight: '140px', height: '100%' }}
      />
    </Card>
  );
}

