# 🛡️ Adaptive & Explainable Fraud Detection Framework for Real-Time BFSI Systems

An end-to-end, real-time financial fraud detection system designed for Banking, Financial Services, and Insurance (BFSI) applications. This framework combines **Ensemble Machine Learning**, **Hybrid Rule-Based Decisioning**, **Adaptive Thresholding**, and **Dual-Layer Explainable AI (SHAP + LLM)** to deliver high-accuracy, low-latency, and human-interpretable fraud prevention.

---

## 🚀 Key Features

* **Ensemble Learning Engine:** Combines **Random Forest**, **AdaBoost**, and **LightGBM** to capture complex, non-linear fraud patterns while minimizing variance and overfitting.
* **Class Imbalance Handling:** Integrates **SMOTE** (Synthetic Minority Over-sampling Technique) during training to prevent majority-class bias and significantly boost fraud recall.
* **Adaptive Threshold Mechanism:** Dynamically adjusts classification decision boundaries on the fly based on transaction context (amount, account age, KYC status)—optimizing the precision-recall trade-off without requiring model retraining.
* **Hybrid Decision Engine:** Fuses ML probability scores with domain-specific rule-based triggers (e.g., high-value transactions from newly created or unverified accounts) to reduce false positives and handle edge cases.
* **Dual-Layer Explainability (XAI + LLM):**
  * **SHAP (SHapley Additive exPlanations):** Quantifies exact feature-level contributions for every prediction.
  * **LLM Narrative Generator (Gemini):** Translates technical SHAP metrics and rule triggers into plain-English explanations tailored for both **Fraud Analysts** and **End Customers**.
* **Real-Time API & Interactive Dashboard:** Built with **FastAPI** for low-latency inference (~120 ms average) paired with a responsive web dashboard for live transaction testing, behavioral profiling, and fraud intelligence.

---

## 🏗️ System Architecture

The framework operates as a modular, stateless real-time processing pipeline:

```text
[Transaction Input] 
       │
       ▼
[FastAPI Backend] ──► [Preprocessing & Behavioral Feature Engineering]
                              │
                              ▼
                  [Ensemble ML Prediction] (Random Forest + AdaBoost + LightGBM)
                              │
        ┌─────────────────────┴─────────────────────┐
        ▼                                           ▼
[SHAP Feature Explainer]                   [Hybrid Decision Engine]
        │                                  (Adaptive Thresholds + Rule Logic)
        ▼                                           │
[LLM Narrative Insights]                            │
(Analyst & Customer Views)                          │
        │                                           │
        └─────────────────────┬─────────────────────┘
                              ▼
                 [JSON Response & Dashboard UI]
```

---

## 🛠️ Tech Stack

* **Backend & API:** Python, FastAPI, Uvicorn
* **Machine Learning & Data:** Scikit-learn, LightGBM, Imbalanced-learn (SMOTE), Pandas, NumPy
* **Explainable AI & GenAI:** SHAP (`TreeExplainer`), Google Gemini API (LLM Explanations)
* **Frontend:** HTML5, CSS3, JavaScript (Interactive Fraud Intelligence Dashboard)

---

## 📊 Performance Benchmarks

Evaluated on an 80/20 train-test split using multi-metric validation to account for class imbalance:

| Model / Approach | Accuracy | Precision | Recall | F1-Score | ROC-AUC |
| :--- | :---: | :---: | :---: | :---: | :---: |
| Logistic Regression | 83.52% | 80.10% | 85.30% | 82.62% | 0.8900 |
| Random Forest | 94.12% | 93.10% | 95.20% | 94.14% | 0.9750 |
| AdaBoost | 93.48% | 92.20% | 94.50% | 93.34% | 0.9700 |
| LightGBM | 95.15% | 93.60% | 96.80% | 95.17% | 0.9850 |
| **Proposed Hybrid Ensemble** | **95.15%** | **92.16%** | **98.70%** | **95.32%** | **0.9926** |

### System Latency Metrics
* **Average Latency:** `120 ms`
* **Minimum Latency:** `80 ms`
* **Maximum Latency:** `180 ms`

---

## 🔌 API Endpoints

| Endpoint | Method | Description |
| :--- | :---: | :--- |
| `/api/system/status` | `GET` | Monitors backend health, model readiness, and system availability. |
| `/api/predict` | `POST` | Runs real-time fraud scoring, adaptive thresholding, SHAP attribution, and LLM explanation on a transaction. |
| `/api/fraud-intelligence` | `GET` | Generates macro-level fraud pattern insights and velocity metrics. |
| `/api/customer-intelligence` | `GET` | Analyzes customer behavioral profiles, channel diversity, and spending deviations. |
| `/api/fraud-network-intelligence` | `GET` | Identifies suspicious relationships and anomalies across linked transactions. |

### Sample Prediction Payload (`/api/predict`)
```json
{
  "customer_id": "user_84920",
  "transaction_amount": 25000.00,
  "timestamp": "2026-04-26T21:41:00",
  "channel": "Mobile",
  "account_age_days": 2,
  "kyc_verified": 0
}
```

---

## ⚙️ Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/adaptive-explainable-fraud-detection.git
cd adaptive-explainable-fraud-detection
```

### 2. Install Dependencies
```bash
pip install fastapi uvicorn scikit-learn lightgbm imbalanced-learn shap pandas numpy google-generativeai
```

### 3. Configure Environment Variables
Set your LLM API key (for narrative explanations):
```bash
export GEMINI_API_KEY="your_api_key_here"
```

### 4. Run the FastAPI Server
```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### 5. Launch the Dashboard
Open `Frontend/dashboard/dashboard.html` in your browser or serve it locally to interact with the real-time transaction analyzer.

---

## 📁 Project Structure

```text
├── Backend/
│   ├── main.py                  # FastAPI application and API routes
│   ├── models/                  # Pre-trained ensemble artifacts (fraud_model_ensemble_v2.pkl)
│   ├── pipeline/
│   │   ├── preprocessing.py     # Data cleaning, encoding, and feature alignment
│   │   ├── decision_engine.py   # Adaptive thresholding & hybrid rule logic
│   │   └── explainability.py    # SHAP explainer & LLM prompt generator
├── Frontend/
│   └── dashboard/
│       └── dashboard.html       # AI Fraud Intelligence & Transaction Check UI
├── notebooks/                   # Model training, SMOTE balancing, and SHAP analysis
└── README.md
```

---

## 🔮 Future Roadmap

* **Sequence & Graph Modeling:** Integrate RNNs/Transformers for temporal transaction sequences and Graph Neural Networks (GNNs) for multi-account fraud ring detection.
* **Online Learning:** Implement automated concept drift detection and incremental learning pipelines.
* **Privacy-Preserving ML:** Explore Federated Learning for cross-institution fraud intelligence without exposing raw customer PII.