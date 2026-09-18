# 🌾 Krishi Setu

### Cut the Chain. Connect the Farm.

**Krishi Setu** is a technology-driven agricultural marketplace concept designed to connect farmers and Farmer Producer Organisations (FPOs) with consumers, retailers, restaurants, and bulk buyers through a transparent, coordinated digital platform.

It aims to reduce dependence on fragmented intermediary layers by combining **direct market access, AI-assisted price and demand insights, smart buyer matching, aggregated logistics, and secure payment workflows**.

---

## 🎯 Problem Statement

### SIH26033
**“Multiple intermediaries reduce farmers earnings and increase consumer prices.”**

Traditional agricultural supply chains may involve multiple layers such as:

**Farmer → Trader/Arhtiya → Wholesaler → Sub-wholesaler → Retailer → Consumer**

This can create challenges such as:

- Lower farmer realization
- Limited price transparency
- Higher consumer prices
- Fragmented logistics
- Distress selling
- Delayed payments
- Post-harvest losses
- Difficulty accessing suitable buyers

---

## 💡 Proposed Solution

Krishi Setu proposes a transparent technology-managed coordination layer between fragmented farm supply and buyer demand.

### Core approach

**Farmer/FPO → Krishi Setu → Buyer**

The platform combines:

- Direct market access
- AI-assisted price recommendation
- Demand forecasting
- Smart farmer-buyer matching
- Demand aggregation
- Logistics coordination and route optimization
- Conditional payment and delivery confirmation
- Ratings and feedback
- Multilingual and low-bandwidth design

> **Krishi Setu does not assume that every intermediary disappears. Instead, it aims to replace fragmented and opaque layers with a more transparent, technology-managed coordination model.**

---

## ✨ Key Features

### 👨‍🌾 Farmer Marketplace
Farmers can list:

- Crop/produce
- Quantity
- Expected harvest date
- Expected price
- Quality information

### 🤖 AI-Assisted Price Recommendation
The proposed system can use:

- Market prices
- Historical trends
- Demand signals
- Supply information

to generate price recommendations while keeping farmer control.

### 📈 Demand Forecasting
Historical order and seasonal information can be used to estimate future demand and support better production and selling decisions.

### 🔗 Smart Buyer Matching
The platform can match available produce with buyers according to:

- Location
- Quantity
- Price
- Demand
- Delivery requirements

### 📦 Demand Aggregation
Small quantities from nearby farmers can be aggregated to fulfil larger buyer requirements.

### 🚚 Smart Logistics
The proposed logistics layer considers:

- Pickup locations
- Delivery locations
- Vehicle capacity
- Distance
- Time constraints
- Perishability requirements

for better route planning.

### 💳 Payment & Trust
The proposed workflow is:

**Payment Hold → Delivery Confirmation → Automated Settlement**

This is intended to improve payment confidence between participants.

### 🌐 Inclusive Access
The platform is designed with:

- Simple UI
- Regional-language support
- Low-bandwidth usage
- Assisted onboarding
- Future voice-assisted interaction

---

## 🔄 How Krishi Setu Works

```text
        FARMERS / FPOs
              │
              ▼
       Produce Listing
              │
              ▼
    AI Price & Demand Insights
              │
              ▼
       Smart Buyer Matching
              │
              ▼
       Order Aggregation
              │
              ▼
      Logistics Coordination
              │
              ▼
      Route Optimization
              │
              ▼
        Pickup & Delivery
              │
              ▼
    Delivery Confirmation
              │
              ▼
       Payment Settlement
              │
              ▼
      Ratings & Analytics
🏗️ System Architecture

The repository follows a modular architecture with:

User Interfaces
      │
      ▼
Frontend Application
      │
      ▼
Backend / REST APIs
      │
 ┌────┼───────────────┐
 ▼    ▼               ▼
Users Orders      Farmer Services
      │
      ▼
Database Layer
      │
 ┌────┼───────────────┐
 ▼    ▼               ▼
Market Data   ML Modules   Logistics
🤖 AI / ML Components

The project proposes multiple AI/ML components.

1. Demand Forecasting

Uses information such as:

Historical orders
Seasonal patterns
Regional demand

to estimate future demand.

2. Price Recommendation

Potential inputs include:

Market prices
Historical prices
Demand-supply signals
Market trends
3. Quality Assistance

Future image-based analysis can assist with:

Size
Ripeness
Visible defects
4. Personalization

Buyer activity can be used to provide relevant recommendations and insights.

Repository ML Modules
ml-models/
├── price_recommendation.py
└── demand_forecasting.py

Note: These modules represent the project's ML architecture/prototype direction. Production-grade model training, validation and live market-data integration require further development and testing.

🚚 Smart Logistics

Krishi Setu focuses on aggregation-based logistics instead of treating every order as an isolated trip.

The proposed optimization considers:

Multiple pickup points
Delivery locations
Vehicle capacity
Distance
Time windows
Perishability
Route efficiency
Concept
Farmer A ─┐
Farmer B ─┼──► Aggregation ──► Optimized Route ──► Buyer
Farmer C ─┘

The project proposes using OR-Tools for vehicle-routing optimization and Leaflet/OpenStreetMap/OSRM for mapping and routing.

💳 Payment & Trust

The proposed payment workflow is:

Buyer Payment
      ↓
Payment Hold
      ↓
Order Pickup / Delivery
      ↓
Delivery Confirmation
      ↓
Settlement

This workflow is intended to reduce payment-related trust issues.

Any production escrow/conditional-payment implementation would require integration with an appropriate payment provider and applicable legal/compliance arrangements.

🛠️ Technology Stack
Layer	Technology
Frontend	HTML5, CSS3, JavaScript, Bootstrap
Backend	Python, Flask, REST APIs
Database	PostgreSQL, SQLAlchemy
Data / ML	Pandas, NumPy, Scikit-learn
Maps	Leaflet, OpenStreetMap, OSRM
Optimization	Google OR-Tools
Payments	Razorpay
Deployment	Cloud hosting
Prototype vs Proposed Architecture

Working prototype:

HTML + CSS + JavaScript browser-based interface

Repository architecture:

Flask + PostgreSQL + ML + logistics modules are included as the proposed/under-development technical foundation.

📂 Project Structure
KrishiSetu/
│
├── README.md
├── LICENSE
├── .gitignore
├── .env.example
├── CONTRIBUTING.md
│
├── frontend/
│   ├── index.html
│   ├── app.js
│   ├── styles.css
│   └── assets/
│
├── backend/
│   ├── app.py
│   ├── config.py
│   ├── models.py
│   ├── requirements.txt
│   └── routes/
│
├── database/
│   ├── schema.sql
│   ├── seed.sql
│   └── README.md
│
├── ml-models/
│   ├── price_recommendation.py
│   └── demand_forecasting.py
│
├── docs/
│   ├── PROBLEM_STATEMENT.md
│   ├── architecture.svg
│   ├── workflow-flowchart.svg
│   ├── KrishiSetu_SIH_Report.docx
│   └── KrishiSetu_SIH_Presentation.pptx
│
└── screenshots/
    ├── 01-landing-page.png
    ├── 02-marketplace.png
    ├── 03-ai-demand-forecast.png
    ├── 04-login.png
    ├── 05-farmer-dashboard.png
    └── 06-buyer-dashboard.png
🖥️ Prototype Screenshots
Landing Page

Marketplace

AI Demand Forecast

Login

Farmer Dashboard

Buyer Dashboard

📊 Expected Impact
👨‍🌾 Farmers
Better access to buyers
Improved price transparency
Reduced dependence on fragmented intermediary layers
Better demand visibility
Timely digital payment workflow
🛒 Buyers / Consumers
Better access to farm produce
Transparent transaction information
Potentially shorter supply chains
Improved traceability
🌱 Agricultural Ecosystem
Better supply aggregation
More efficient logistics coordination
Reduced avoidable handling and transportation inefficiencies
Improved digital participation

Impact percentages and income improvements should be validated through pilot deployments rather than treated as guaranteed results.

💼 Business & Viability Model

Krishi Setu follows an asset-light coordination model.

Potential Revenue Streams
Transaction Commission
        +
Logistics Coordination Fee
        +
Premium Buyer / FPO Tools
        +
Future Analytics Services
Scale Strategy
More Farmers
     ↓
More Supply
     ↓
More Buyers
     ↓
More Orders
     ↓
Better Aggregation
     ↓
Better Route Utilization

The model can potentially scale across:

Regions
Crops
Buyer categories
FPO networks
⚠️ Challenges & Mitigation
Challenge	Proposed Mitigation
Digital Literacy	Simple UI + Local Language + Assisted Onboarding
Poor Connectivity	Low-Bandwidth / Offline-Friendly Design
Logistics Availability	Verified Transport Partners
Payment Trust	Payment Hold + Delivery Confirmation + Settlement
Cold-Chain Limitations	Suitable Vehicles + Priority Routing
Price Volatility	Market Data + Continuous Model Improvement
Buyer Adoption	FPO + Institutional Buyer Pilots
Data Privacy	Encryption + Role-Based Access
🔮 Future Scope

The project can be extended with:

Multi-state and multi-crop expansion
Government scheme integrations
Cold-chain and warehouse partnerships
Advanced demand forecasting
Image-based produce quality assessment
Blockchain-based traceability
Credit scoring and financial services
Satellite/IoT-based crop insights
Voice-assisted farmer interaction
⚙️ Current Prototype Status
Implemented Prototype

The current browser prototype provides the frontend/UI experience using:

HTML
CSS
JavaScript
Browser-based demo data/local storage
Under Development / Proposed

The repository also contains the architectural foundation for:

Flask backend
PostgreSQL database
REST APIs
ML modules
Logistics optimization

These components require further integration, testing and deployment before being described as a fully production-ready system.

🚀 Getting Started
1. Clone the repository
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd KrishiSetu
2. Run the frontend prototype

Open:

frontend/index.html

in a modern web browser.

For a local development server:

python -m http.server 5500

Then open:

http://localhost:5500/frontend/
3. Backend setup

Create a virtual environment:

python -m venv venv

Activate it on Windows:

venv\Scripts\activate

Install dependencies:

pip install -r backend/requirements.txt

Configure environment variables using:

.env.example

Never commit real API keys, passwords or database credentials to GitHub.

🔐 Security

Do not upload:

.env
API keys
Database passwords
Payment secrets
Private credentials

Only the example configuration file should be committed.

📚 Documentation

Detailed project documentation is available in:

docs/

Including:

Problem Statement
System Architecture
Workflow Flowchart
SIH Presentation
Project Report
🏆 Smart India Hackathon 2026

Problem Statement ID: SIH26033

Theme: Agriculture, FoodTech & Rural Development

Category: Software

Project: Krishi Setu

Tagline: Cut the Chain. Connect the Farm.

Team: Parallax

👥 Team
Member	Role
Priyanshu Singh	Team Leader
Prajjawal Mishra	Member
Krishna Sharma	Member
Ayush Mishra	Member
Alankriti Choudhary	Member
Deepali Mishra	Member

Institute: Institute of Technology and Management, GIDA, Gorakhpur

📄 References

The project report references sources including:

Government of India / Agriculture Census
TRAI
e-NAM
NABCONS / Ministry of Food Processing Industries
RBI
AgriStack
Primary survey and interviews conducted by the team

Detailed references are available in the project report.

🤝 Contributing

Contributions, suggestions and improvements are welcome.

Please read:

CONTRIBUTING.md

before submitting changes.

🌾 Krishi Setu
Cut the Chain. Connect the Farm.

Technology • Transparency • Aggregation • Trust