#!/bin/bash

# ReflexOps Demo Trigger
# Simulates a critical system failure to trigger the agentic governance loop.

WEBHOOK_URL="http://localhost:5678/webhook/reflexops-trigger"

echo "Triggering ReflexOps Failure Event..."
echo "Target: $WEBHOOK_URL"

curl -X POST $WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d '{
    "event_id": "evt-99482",
    "severity": "CRITICAL",
    "source": "payment-gateway-service",
    "timestamp": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",
    "error_log": "ConnectionRefusedError: [Errno 111] Connection refused to database:5432. Retried 5 times. Transaction ID tx_77382 failed. Downstream services affecting: checkout, subscription-renewal.",
    "context": {
        "cpu_usage": "12%",
        "memory_usage": "45%",
        "recent_deploy": "v2.4.1 (10 mins ago)"
    }
}'

echo -e "\n\nEvent sent. Check n8n interface for execution."
