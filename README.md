# ReflexOps – Self-Evolving Autonomous Ops Agent

**A hackathon-grade, reproducible Agentic AI system for DevOps governance.**

ReflexOps is not just a chatbot. It is a **multi-agent open-loop system** designed to diagnose, plan, and critique remediation strategies for complex infrastructure failures. By decoupling reasoning from execution and enforcing role-based governance, ReflexOps brings "adult supervision" to AI Ops.

## 🏗 High-Level Architecture

```ascii
[ Failure Event ] ---> [ n8n Orchestrator ] <---> [ Ollama (Local LLM) ]
                           |
                           +--> 1. Core-Fast (Triage & Fact Check)
                           |
                           +--> 2. Core-Reason (Root Cause Analysis)
                           |
                           +--> 3. Core-Planner (Remediation Plan)
                           |
                           +--> 4. Core-Deep (Safety Critic/Governance)
```

## 🚀 Why This Matters?

Most AI Ops tools are either "black boxes" or simple scripts. ReflexOps introduces **Governed Autonomy**:
1.  **Multi-Perspective Intelligence**: Distinct agents for diagnosis vs. planning prevent tunnel vision.
2.  **Explicit Reasoning**: The system doesn't just "fix it"; it produces a transparent audit trail of *why* it chose a fix.
3.  **Safety First**: A dedicated "Critic" agent (Core-Deep) MUST approve any plan before execution, acting as a virtual Senior Engineer.

## 🛠 Prerequisites

- Docker & Docker Compose
- 8GB+ RAM (for running local LLMs)

## ⚡ Quick Start

### 1. Start the System
```bash
docker compose up -d
```
*Port 5678 (n8n) and 11434 (Ollama) will be exposed.*

### 2. Bootstrap Agents
Initialize the custom models (only needed once):
```bash
chmod +x scripts/bootstrap.sh
./scripts/bootstrap.sh
```
*Note: This pulls `llama3` (~4.7GB) and builds the custom agents.*

### 3. Configure n8n
1.  Open [http://localhost:5678](http://localhost:5678).
2.  Set up the owner account (first time only).
3.  The `ReflexOps – Core Reflection Loop` workflow is preloaded. Open it and ensure it is **Active**.

### 4. Run the Demo
Trigger a simulated database failure:
```bash
chmod +x scripts/demo-trigger.sh
./scripts/demo-trigger.sh
```
Go back to n8n and watch the **Executions** tab to see the agents debate and plan the fix live!

## 🧪 Hackathon Demo Script (5 Minutes)

1.  **Context**: "We just deployed v2.4.1 and the payment gateway is failing."
2.  **Trigger**: Run `./scripts/demo-trigger.sh`.
3.  **Observe**: Show n8n executing.
    -   **Core-Fast** acknowledges the alert immediately.
    -   **Core-Reason** identifies the "Connection Refused" and correlates it with the "recent deploy".
    -   **Core-Planner** suggests a rollback.
    -   **Core-Deep** validates the rollback is safe but warns about data consistency.
4.  **Result**: A structured, safe remediation plan is generated WITHOUT human intervention, but strictly following safety guardrails.

## 📂 Repository Structure

- `n8n/`: Workflow definitions.
- `ollama/`: Modelfiles defining the unique personality and constraints of each agent.
- `scripts/`: Auto-setup and demo tools.
- `docker-compose.yml`: reproducible infrastructure-as-code.

## 🌍 Use Cases
- **DevOps**: Auto-remediation of k8s crash loops.
- **FinTech**: Transaction failure analysis with strict compliance logging.
- **SecOps**: Automated threat diagnosis and containment planning.

---
*Built for the Future of Work Hackathon.*
