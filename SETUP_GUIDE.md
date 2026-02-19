# Setup Guide - Prosperity Prognosticator

Complete guide for setting up and deploying the Prosperity Prognosticator application.

## Table of Contents
1. [Local Setup](#local-setup)
2. [Virtual Environment](#virtual-environment)
3. [Dependencies Installation](#dependencies-installation)
4. [Running the Application](#running-the-application)
5. [Cloud Deployment](#cloud-deployment)
6. [Troubleshooting](#troubleshooting)

---

## Local Setup

### System Requirements
- **OS**: Windows, macOS, or Linux
- **Python**: 3.8 or higher
- **RAM**: Minimum 2GB (4GB recommended)
- **Disk Space**: 500MB
- **Internet**: Required for initial setup

### Step 1: Clone the Repository

#### Using Git (Recommended)
```bash
git clone https://github.com/rajdeepbosedgp/Prosperity-Prognosticator_Machine-Learning-for-Startup-Success-Prediction.git
cd Prosperity-Prognosticator_Machine-Learning-for-Startup-Success-Prediction
```

#### Using GitHub Desktop
1. Open GitHub Desktop
2. Click "File" → "Clone Repository"
3. Paste the repository URL
4. Choose local path
5. Click "Clone"

#### Download as ZIP
1. Visit the GitHub repository
2. Click "Code" → "Download ZIP"
3. Extract the ZIP file
4. Open terminal in extracted folder

### Step 2: Verify Python Installation

```bash
python --version
# or
python3 --version
```

Should show Python 3.8 or higher.

---

## Virtual Environment

### Why Use Virtual Environment?
- Isolates project dependencies
- Prevents version conflicts
- Makes deployment easier
- Simplifies dependency management

### Windows Setup

#### Creating Virtual Environment
```bash
python -m venv venv
```

#### Activating Virtual Environment
```bash
venv\Scripts\activate
```

You should see `(venv)` prefix in terminal.

#### Deactivating Virtual Environment
```bash
deactivate
```

### macOS/Linux Setup

#### Creating Virtual Environment
```bash
python3 -m venv venv
```

#### Activating Virtual Environment
```bash
source venv/bin/activate
```

You should see `(venv)` prefix in terminal.

#### Deactivating Virtual Environment
```bash
deactivate
```

---

## Dependencies Installation

### Step 1: Ensure Virtual Environment is Active
Check for `(venv)` prefix in your terminal.

### Step 2: Upgrade pip
```bash
pip install --upgrade pip
```

### Step 3: Install Requirements
```bash
pip install -r requirements.txt
```

This installs:
- Flask (web framework)
- scikit-learn (machine learning)
- pandas (data manipulation)
- numpy (numerical computing)
- joblib (model persistence)
- seaborn (visualization)
- matplotlib (plotting)
- jupyter (notebook)

### Step 4: Verify Installation
```bash
pip list
```

You should see all packages from requirements.txt listed.

### Troubleshooting Installation

**Issue**: `ModuleNotFoundError: No module named 'pip'`

**Solution**:
```bash
python -m pip install --upgrade pip
```

**Issue**: Permission denied errors

**Solution** (macOS/Linux):
```bash
pip install --user -r requirements.txt
```

**Issue**: Long installation time

**Solution**: Use faster PyPI mirror (China users):
```bash
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

---

## Running the Application

### Step 1: Ensure Virtual Environment is Active
```bash
# Windows
venv\Scripts\activate

# macOS/Linux
source venv/bin/activate
```

### Step 2: Navigate to Project Directory
```bash
cd Prosperity-Prognosticator_Machine-Learning-for-Startup-Success-Prediction
```

### Step 3: Verify Model File Exists
Check that `random_forest_model.pkl` is in the current directory:
```bash
# Windows
dir random_forest_model.pkl

# macOS/Linux
ls -la random_forest_model.pkl
```

### Step 4: Run Flask Application
```bash
python app.py
```

### Step 5: Access Application
Open your browser and navigate to:
```
http://127.0.0.1:5000/
```

### Expected Output
```
 * Serving Flask app 'app'
 * Debug mode: on
 * Running on http://127.0.0.1:5000
Press CTRL+C to quit
```

### Stop Application
Press `Ctrl+C` in the terminal where Flask is running.

---

## Application Routes

After starting the application, access:

| Route | Purpose |
|-------|---------|
| `/` | Home page with overview |
| `/predict` | Prediction form |
| `/api/predict` | REST API endpoint |
| `/adaptivity` | Features and info page |

---

## Running on Different Port

If port 5000 is already in use:

### Method 1: Command Line
```bash
python app.py --port 5001
```

Then access: `http://127.0.0.1:5001/`

### Method 2: Modify app.py
Edit the last line in `app.py`:
```python
if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1', port=5001)
```

---

## Cloud Deployment

### Option 1: Deploy on Render

**Prerequisites**:
- GitHub account
- Render account (free tier available)

**Steps**:

1. **Push code to GitHub**
   ```bash
   git add .
   git commit -m "Ready for deployment"
   git push origin main
   ```

2. **Create account on Render.com**

3. **Create new Web Service**
   - Click "New" → "Web Service"
   - Connect GitHub account
   - Select repository

4. **Configure Service**
   - **Name**: prosperity-prognosticator
   - **Environment**: Python 3
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app`
   - **Region**: Choose closest to users

5. **Deploy**
   - Click "Deploy"
   - Wait 5-10 minutes for deployment
   - Access via provided URL

### Option 2: Deploy on Railway

**Steps**:

1. **Sign up on Railway.app**

2. **Connect GitHub**
   - Click "Create New Project"
   - Select "Deploy from GitHub repo"

3. **Configure Variables**
   - Add environment variables if needed
   - Flask will auto-detect production environment

4. **Deploy**
   - Railway auto-detects Python/Flask
   - Deployment starts automatically

### Option 3: Deploy on Heroku

**Prerequisites**:
- Heroku CLI installed
- Heroku account

**Steps**:

1. **Install Heroku CLI**
   ```bash
   # Visit https://devcenter.heroku.com/articles/heroku-cli
   ```

2. **Create Procfile** (in project root)
   ```
   web: gunicorn app:app
   ```

3. **Create runtime.txt** (in project root)
   ```
   python-3.11.3
   ```

4. **Login to Heroku**
   ```bash
   heroku login
   ```

5. **Create Heroku App**
   ```bash
   heroku create prosperity-prognosticator
   ```

6. **Deploy**
   ```bash
   git push heroku main
   ```

7. **View Application**
   ```bash
   heroku open
   ```

### Option 4: Deploy with Docker

**Prerequisites**:
- Docker installed

**Steps**:

1. **Create Dockerfile** (in project root)
   ```dockerfile
   FROM python:3.11-slim

   WORKDIR /app

   COPY requirements.txt .
   RUN pip install -r requirements.txt

   COPY . .

   EXPOSE 5000

   CMD ["python", "app.py"]
   ```

2. **Build Docker Image**
   ```bash
   docker build -t prosperity-prognosticator .
   ```

3. **Run Docker Container**
   ```bash
   docker run -p 5000:5000 prosperity-prognosticator
   ```

4. **Access Application**
   ```
   http://localhost:5000/
   ```

---

## Database Configuration (Optional)

For production, consider adding:
- SQLite for prediction history
- PostgreSQL for scaling
- MongoDB for flexibility

Example SQLite integration:
```python
from flask_sqlalchemy import SQLAlchemy

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///predictions.db'
db = SQLAlchemy(app)
```

---

## Environment Variables

Create `.env` file for production:
```
FLASK_ENV=production
FLASK_DEBUG=False
SECRET_KEY=your-secret-key-here
DATABASE_URL=your-database-url
```

Load in app.py:
```python
import os
from dotenv import load_dotenv

load_dotenv()
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
```

---

## Performance Optimization

### Enable Caching
```python
from flask_caching import Cache

cache = Cache(app, config={'CACHE_TYPE': 'simple'})
```

### Use Gunicorn (Production)
```bash
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

### Enable Compression
```python
from flask_compress import Compress
Compress(app)
```

---

## Security Considerations

1. **Enable HTTPS**
   - Use SSL certificates
   - Redirect HTTP to HTTPS

2. **Add CORS Headers**
   ```python
   from flask_cors import CORS
   CORS(app)
   ```

3. **Rate Limiting**
   ```bash
   pip install Flask-Limiter
   ```

4. **Input Validation**
   - Validate all form inputs
   - Sanitize data

5. **CSRF Protection** (if using forms)
   ```bash
   pip install Flask-WTF
   ```

---

## Monitoring & Logging

### Setup Logging
```python
import logging

logging.basicConfig(
    filename='app.log',
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
```

### Monitor Predictions
- Track prediction volume
- Monitor API response times
- Log errors and exceptions

---

## Testing

### Install Testing Tools
```bash
pip install pytest pytest-flask
```

### Run Tests
```bash
pytest tests/
```

### Example Test
```python
def test_home_page(client):
    response = client.get('/')
    assert response.status_code == 200
```

---

## Troubleshooting

### Port Already in Use
```bash
# Find process using port 5000
# Windows
netstat -ano | findstr :5000

# macOS/Linux
lsof -i :5000

# Kill process
# Windows
taskkill /PID <PID> /F

# macOS/Linux
kill -9 <PID>
```

### Model File Not Found
```
FileNotFoundError: random_forest_model.pkl not found
```

**Solution**: Ensure model file is in project root directory.

### Import Errors
```
ModuleNotFoundError: No module named 'flask'
```

**Solution**:
```bash
pip install -r requirements.txt
# or
pip install flask
```

### Permission Denied
```
PermissionError: [Errno 13] Permission denied
```

**Solution** (macOS/Linux):
```bash
chmod +x app.py
sudo pip install -r requirements.txt
```

### Memory Issues
If running on low-memory system:
```bash
# Use a different model loading approach
# or reduce batch size
```

### Template Not Found
```
jinja2.exceptions.TemplateNotFound: home.html
```

**Solution**: Ensure `templates/` folder exists with all HTML files.

---

## Maintenance

### Update Dependencies
```bash
pip install --upgrade -r requirements.txt
```

### Check for Security Vulnerabilities
```bash
pip install safety
safety check
```

### Monitor Logs
```bash
tail -f app.log
```

### Backup Database
```bash
cp predictions.db predictions.db.backup
```

---

## Uninstall/Cleanup

### Deactivate Virtual Environment
```bash
deactivate
```

### Remove Virtual Environment
```bash
# Windows
rmdir /s venv

# macOS/Linux
rm -rf venv
```

### Remove Project
```bash
cd ..
rm -rf Prosperity-Prognosticator_Machine-Learning-for-Startup-Success-Prediction
```

---

## Getting Help

1. **Check README.md** for general information
2. **Review API_DOCUMENTATION.md** for API details
3. **Check GitHub Issues** for similar problems
4. **Create GitHub Issue** with:
   - Error message (full traceback)
   - Steps to reproduce
   - System information
   - Python version
   - Output of `pip list`

---

## Next Steps

After successful setup:
1. Explore the prediction form
2. Test API endpoints
3. Review Jupyter notebook for ML details
4. Customize styling (CSS in templates)
5. Deploy to production (choose cloud provider)

---

## Additional Resources

- **Flask Documentation**: https://flask.palletsprojects.com
- **Scikit-learn Docs**: https://scikit-learn.org
- **Python Packaging**: https://packaging.python.org
- **Virtual Environments**: https://docs.python.org/3/tutorial/venv.html
