# Quick Start Guide - Prosperity Prognosticator

Get the application running in minutes!

## For Windows Users

### 1. One-Click Setup

Simply double-click **`setup.bat`** and wait for it to complete. This will:
- Check Python installation
- Create virtual environment
- Install all dependencies

### 2. Run the Application

Double-click **`run.bat`** to start the server.

### 3. Open in Browser

Navigate to: **http://127.0.0.1:5000/**

---

## For macOS/Linux Users

### 1. One-Click Setup

Open Terminal in the project folder and run:
```bash
chmod +x setup.sh
./setup.sh
```

This will:
- Check Python 3 installation
- Create virtual environment
- Install all dependencies

### 2. Run the Application

```bash
chmod +x run.sh
./run.sh
```

### 3. Open in Browser

Navigate to: **http://127.0.0.1:5000/**

---

## Manual Setup (All Platforms)

If scripts don't work, follow these commands:

### Step 1: Create Virtual Environment
```bash
# Windows
python -m venv venv
venv\Scripts\activate

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

### Step 2: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Run Application
```bash
python app.py
```

### Step 4: Access Application
Open browser and go to: **http://127.0.0.1:5000/**

---

## What You'll See

### Home Page
- Project overview
- Links to prediction form and info page

### Prediction Form (`/predict`)
- 76 input fields organized into sections
- Auto-calculation of startup age
- Form validation
- Submit button

### Results Page
- Success probability percentage
- Risk factor analysis
- AI insights and recommendations
- Input summary

### Info Page (`/adaptivity`)
- Features overview
- Technology stack
- Project capabilities

---

## Testing the API

### Using cURL

```bash
curl -X POST http://127.0.0.1:5000/api/predict \
  -H "Content-Type: application/json" \
  -d '{
    "age_first_funding_year": 1,
    "age_last_funding_year": 5,
    "age_first_milestone_year": 2,
    "age_last_milestone_year": 4,
    "funding_rounds": 3,
    "funding_total_usd": 1500000,
    "milestones": 5,
    "is_CA": 1,
    "is_software": 1,
    "has_VC": 1,
    "avg_participants": 2.5,
    "age_startup_year": 9,
    "tier_relationships": 7.5
  }'
```

### Using Python

```python
import requests

response = requests.post('http://127.0.0.1:5000/api/predict', json={
    'age_first_funding_year': 1,
    'funding_total_usd': 1500000,
    'funding_rounds': 3,
    'milestones': 5,
    'is_CA': 1,
    'is_software': 1,
    'has_VC': 1,
    'age_startup_year': 9,
    'tier_relationships': 7.5
})

print(response.json())
```

---

## Stopping the Server

Press **Ctrl+C** in the terminal where Flask is running.

---

## Common Issues

### Port 5000 Already in Use
If you get "Address already in use", modify the last line in `app.py`:
```python
app.run(debug=True, host='127.0.0.1', port=5001)  # Change 5000 to 5001
```

### Model File Not Found
Ensure `random_forest_model.pkl` is in the project root directory.

### Python Not Found
Install Python from https://www.python.org/ (make sure to add to PATH)

### Module Not Found
Run the setup script again or manually install: `pip install -r requirements.txt`

---

## Next Steps

1. **Explore the Form**: Try entering different values and see predictions
2. **Test the API**: Use the cURL or Python examples above
3. **Review Documentation**: 
   - `README.md` - Full project overview
   - `API_DOCUMENTATION.md` - Detailed API reference
   - `SETUP_GUIDE.md` - Comprehensive setup guide
4. **Deploy**: Follow deployment instructions in `SETUP_GUIDE.md`
5. **Customize**: Modify templates in `templates/` folder

---

## Project Routes

| URL | Purpose |
|-----|---------|
| `/` | Home page |
| `/predict` | Form to enter startup data |
| `/results` | Results page (shown after prediction) |
| `/adaptivity` | Features and info page |
| `/api/predict` | REST API endpoint (JSON) |

---

## File Structure

```
├── app.py                    # Main Flask application
├── random_forest_model.pkl   # Pre-trained ML model
├── requirements.txt          # Python dependencies
├── setup.bat                 # Windows setup script
├── setup.sh                  # macOS/Linux setup script
├── run.bat                   # Windows run script
├── run.sh                    # macOS/Linux run script
├── README.md                 # Full documentation
├── API_DOCUMENTATION.md      # API reference
├── SETUP_GUIDE.md            # Detailed setup
├── QUICKSTART.md             # This file
├── Startup_Success_Model.ipynb   # Jupyter notebook
└── templates/
    ├── index.html            # Home page
    ├── home.html             # Prediction form
    ├── results.html          # Results display
    └── adaptivity.html       # Info page
```

---

## Success!

Once you see the Flask server running and can access http://127.0.0.1:5000/ in your browser, the application is ready to use!

For more detailed information, see the other documentation files.
