# 🧠 AI Engineering Prompt: VA Smoking Cessation Tracker for Junior Devs

## 🎯 Objective
Help a junior developer build a working MVP for a healthcare-style app using **Python + R + Shiny**, without requiring a real SQL Server setup.

The app will simulate a **VA-funded smoking cessation program** for veterans aged 40–55, tracking progress using hardcoded JSON data.

---

## 📦 What the AI Should Generate

### 🔧 1. Prompt for Project Directory
Ask the user:
> Please provide your desired project path (e.g., `C:/Users/Veteran/Documents/VaSmokingCessationApp`).

Use this input to correctly set paths in:
- Python output file (`veterans_data.json`)
- R's working directory script (`set_wd.R`)

---

### 📂 2. Folder Structure to Generate

```
VaSmokingCessationApp/
├── data/
│   └── veterans_data.json (auto-generated)
├── python/
│   └── veterans_data_simulated.py
├── shiny/
│   ├── ui_dashboard.R
│   └── server_dashboard.R
├── app.R
├── set_wd.R
└── README.md
```

---

### 🐍 3. Python Script: `veterans_data_simulated.py`
- Creates 10+ records with these fields:
  - `id`, `name`, `age`, `enrollment_date`, `progress_score`, `smoking_status`, `coaching_notes`
- Saves JSON file to `data/veterans_data.json`
- Validates data and prints success message

---

### 📊 4. RShiny Files
- `ui_dashboard.R` displays progress using `plotly`
- `server_dashboard.R` reads and validates JSON file
- `app.R` launches the dashboard using `shiny::runApp()`

---

### 🧭 5. R Working Directory Script
`set_wd.R` should include:
```r
setwd("C:/Users/Veteran/Documents/VaSmokingCessationApp")
```
...replacing the path with the user’s provided input.

---

### ✅ 6. Run Instructions in README.md

```markdown
## VA Smoking Cessation Tracker

### 📌 Steps to Run
1. Run `set_wd.R` in RStudio
2. In terminal or CMD: `python python/veterans_data_simulated.py`
3. Run `app.R` to start the dashboard

### 🧪 Requirements
- Python: `json`, `os`, `random`
- R: `shiny`, `plotly`, `jsonlite`

### 👀 What You’ll See
- Graphs of veteran progress
- Coaching notes or smoking status
```

---

### 🔐 7. Error Handling
Ensure:
- JSON has no missing fields
- App won’t crash if data is missing — show an alert
- Clear output: `✅ JSON created at: /data/veterans_data.json`

---

## 🤝 Bonus Features (Optional)
- Toggle for filtering by age or status
- Include coaching tips pulled from a hardcoded list
- Add a simple authentication simulation (username only)

---

## 🧱 Why This Prompt Matters
It gives junior developers:
- A real-world MVP experience
- Exposure to R + Python integration
- A chance to understand data flow end-to-end

---

Let me know if you’d like a zipped folder or GitHub-ready repo structure next!
