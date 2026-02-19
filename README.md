# Prosperity Prognosticator: Machine Learning for Startup Success Prediction

Prosperity Prognosticator is a machine learning–powered web application that predicts the success probability of a startup based on 76 real-world features. It is designed to assist entrepreneurs, investors, and analysts in evaluating startup potential using data-driven insights.

## Project Overview

This project integrates the complete machine learning lifecycle with a web deployment interface:

- Data collection and cleaning
- Exploratory data analysis (univariate and multivariate)
- Feature engineering and encoding
- Model building using Random Forest Classifier
- Performance evaluation using classification metrics
- Web application development using Flask
- Frontend interface for user input and result visualization
- REST API for programmatic access
- Interactive HTML templates and a comprehensive Jupyter Notebook

## Technologies Used

- **Frontend**: HTML5, CSS3, Bootstrap, Jinja2 templates
- **Backend**: Python 3, Flask
- **Machine Learning**: Scikit-learn (RandomForestClassifier)
- **Visualization**: Seaborn, Matplotlib
- **Notebook**: Jupyter Notebook
- **Deployment**: Localhost or compatible cloud hosting (Render, Railway, etc.)

## Folder Structure

```
Prosperity-Prognosticator/
├── app.py                          # Flask backend application
├── random_forest_model.pkl         # Trained machine learning model
├── Startup_Success_Model.ipynb     # Jupyter Notebook (model building and analysis)
├── requirements.txt                # Python dependencies
├── README.md                       # Project documentation
├── API_DOCUMENTATION.md            # REST API documentation
├── SETUP_GUIDE.md                  # Detailed setup and deployment guide
└── templates/                      # Frontend templates
    ├── index.html                  # Landing page
    ├── home.html                   # Prediction form page
    ├── adaptivity.html             # Information/features page
    └── results.html                # Results visualization page
```

## Quick Start

### Prerequisites
- Python 3.8 or higher
- pip (Python package manager)
- Git

### Installation & Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/rajdeepbosedgp/Prosperity-Prognosticator_Machine-Learning-for-Startup-Success-Prediction.git
   cd Prosperity-Prognosticator_Machine-Learning-for-Startup-Success-Prediction
   ```

2. **Create a virtual environment** (recommended):
   ```bash
   python -m venv venv
   
   # On Windows:
   venv\Scripts\activate
   
   # On macOS/Linux:
   source venv/bin/activate
   ```

3. **Install required packages**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the Flask server**:
   ```bash
   python app.py
   ```

5. **Open your browser and navigate to**:
   ```
   http://127.0.0.1:5000/
   ```

## Usage

### Web Interface
1. **Home Page**: View project overview and navigate to prediction form
2. **Prediction Form**: Enter your startup details across multiple sections:
   - Company Information (founded year, age, state, category)
   - Funding Information (total funding, rounds, participant averages)
   - Milestones (count, ages, tier relationships)
   - Location (state-based flags)
   - Industry Category (industry type flags)
   - Funding Types (VC, Angel, Series A-D)
   - Special Attributes (top 500 status, validation flags)

3. **Results Page**: View:
   - Success probability percentage
   - Risk factor analysis
   - AI-based insights and recommendations
   - Input summary with key metrics

### REST API

**Endpoint**: `POST /api/predict`

**Request Body** (JSON):
```json
{
  "age_first_funding_year": 1,
  "funding_total_usd": 1000000,
  "funding_rounds": 3,
  "milestones": 5,
  "avg_participants": 2.5,
  "is_CA": 1,
  "is_software": 1,
  "has_VC": 1,
  ...
}
```

**Response**:
```json
{
  "prediction": 1,
  "success_probability": 78.45,
  "failure_probability": 21.55
}
```

## Model Performance

- **Accuracy**: 95%
- **F1 Score**: 0.95
- **ROC-AUC**: 0.94
- **Precision-Recall AUC**: 0.97

### Input Features (76 Total)

**Numerical Features**:
- age_first_funding_year
- age_last_funding_year
- age_first_milestone_year
- age_last_milestone_year
- funding_rounds
- funding_total_usd
- milestones
- avg_participants
- tier_relationships

**Binary Features**:
- Location: is_CA, is_NY, is_MA, is_TX, is_otherstate
- Category: is_software, is_web, is_mobile, is_enterprise, is_advertising, is_gamesvideo, is_ecommerce, is_biotech, is_consulting, is_othercategory
- Funding Type: has_VC, has_angel, has_roundA, has_roundB, has_roundC, has_roundD, has_RoundABCD, has_Investor, has_both
- Status: is_top500, invalid_startup

**Encoded Features**:
- State codes (State_CA, State_MA, State_NY, State_TX, State_WA, State_other)
- Category codes (category_advertising, category_biotech, etc.)
- Founded year (founded_year_1984 through founded_year_2013)

## Features

- Accepts 76 input features related to funding, milestones, geography, and startup characteristics
- Predicts startup success or failure with high confidence
- Displays probability scores and success levels
- Shows AI-based insights and personalized recommendations
- User-friendly responsive web interface with real-time feedback
- REST API endpoint for integration with external tools
- Input validation and error handling
- Interactive form with auto-calculation features

## Team Contributions

- **Rajdeep**: Team lead, model building, frontend development (`home.html`), backend development (`app.py`), final code review
- **Biswadeep**: Model evaluation, testing, result visualization (`results.html`)
- **Bhagat**: Data collection, preparation, univariate and multivariate analysis, `adaptivity.html`
- **Rajat**: Data analysis and visualization, frontend development (`index.html`), debugging

## Deployment

### Local Deployment
See Quick Start section above.

### Cloud Deployment

**Render**:
1. Push code to GitHub
2. Create new Web Service on Render.com
3. Connect GitHub repository
4. Set build command: `pip install -r requirements.txt`
5. Set start command: `gunicorn app:app`

**Heroku**:
1. Install Heroku CLI
2. Create Procfile: `web: gunicorn app:app`
3. Push to Heroku: `git push heroku main`

**Railway or Similar**:
Follow platform-specific deployment guides linking to your GitHub repository.

## Troubleshooting

**Port Already in Use**:
```bash
python app.py --port 5001
```

**Model Not Found**:
Ensure `random_forest_model.pkl` is in the project root directory.

**Module Import Errors**:
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

## Project Structure Details

### app.py
- Flask application with three main routes:
  - `/` - Landing page (index.html)
  - `/predict` - Prediction form and result processing
  - `/api/predict` - JSON REST API endpoint
  - `/adaptivity` - Information page
- Model loading and prediction logic
- Error handling and validation

### Templates
- **index.html**: Animated landing page with project overview
- **home.html**: Form with 76 input fields organized into sections
- **results.html**: Results display with AI insights
- **adaptivity.html**: Features and capabilities showcase

### Startup_Success_Model.ipynb
Complete Jupyter notebook containing:
- Data exploration and visualization
- Preprocessing pipeline
- Feature engineering
- Model training and hyperparameter tuning
- Evaluation metrics and confusion matrices
- Feature importance analysis

## License

This project is licensed under the MIT License - see LICENSE file for details.

## Acknowledgments

- Dataset source: Crunchbase and secondary resources
- Model: Random Forest with one-hot encoded categorical features
- Tools: Google Colab, VS Code, GitHub, Jupyter Notebook

## Contact & Support

For issues or questions:
1. Check existing GitHub issues
2. Create a new issue with detailed description
3. Include error messages and steps to reproduce

## References

- Scikit-learn Documentation: https://scikit-learn.org
- Flask Documentation: https://flask.palletsprojects.com
- Random Forest: https://en.wikipedia.org/wiki/Random_forest

