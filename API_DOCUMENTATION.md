# API Documentation - Prosperity Prognosticator

## Overview

The Prosperity Prognosticator provides a REST API for programmatic access to startup success predictions. This document details all available endpoints, request formats, and response structures.

## Base URL

```
http://127.0.0.1:5000
```

For production deployments, replace with your deployed URL.

## Authentication

Currently, no authentication is required. For production use, consider implementing API key authentication.

## Endpoints

### 1. Home Page
**Endpoint**: `GET /`

**Description**: Returns the landing page with project overview.

**Response**: HTML page

**Example**:
```bash
curl http://127.0.0.1:5000/
```

---

### 2. Prediction Form
**Endpoint**: `GET /predict`

**Description**: Returns the prediction form page.

**Response**: HTML form with 76 input fields

**Example**:
```bash
curl http://127.0.0.1:5000/predict
```

---

### 3. Submit Prediction (Web Form)
**Endpoint**: `POST /predict`

**Description**: Processes startup data from HTML form and returns prediction results page.

**Content-Type**: `application/x-www-form-urlencoded`

**Form Parameters** (76 total):

#### Company Information
- `founded_year` (integer): Year startup was founded
- `age_startup_year` (float): Age of startup in years
- `State` (integer): State code
- `category` (integer): Category code

#### Funding Information
- `funding_total_usd` (float): Total funding amount in USD
- `funding_rounds` (integer): Number of funding rounds
- `age_first_funding_year` (float): Age when first funded
- `age_last_funding_year` (float): Age when last funded
- `avg_participants` (float): Average participants per round

#### Milestones
- `milestones` (integer): Number of milestones achieved
- `age_first_milestone_year` (float): Age at first milestone
- `age_last_milestone_year` (float): Age at last milestone
- `tier_relationships` (float): Tier relationships score (0-10)

#### Location Flags (0 or 1)
- `is_CA`: California
- `is_NY`: New York
- `is_MA`: Massachusetts
- `is_TX`: Texas
- `is_otherstate`: Other state

#### Industry Category Flags (0 or 1)
- `is_software`: Software industry
- `is_web`: Web industry
- `is_mobile`: Mobile industry
- `is_enterprise`: Enterprise software
- `is_advertising`: Advertising
- `is_gamesvideo`: Games/Video
- `is_ecommerce`: E-commerce
- `is_biotech`: Biotech
- `is_consulting`: Consulting
- `is_othercategory`: Other category

#### Funding Type Flags (0 or 1)
- `has_VC`: Venture Capital funding
- `has_angel`: Angel investment
- `has_roundA`: Series A
- `has_roundB`: Series B
- `has_roundC`: Series C
- `has_roundD`: Series D
- `has_RoundABCD`: Has Series A-D
- `has_Investor`: Has investor
- `has_both`: Has both VC and Angel

#### Status Flags (0 or 1)
- `is_top500`: Top 500 startup
- `invalid_startup`: Invalid startup flag

#### Encoded Features (0 or 1)
- State encoding: `State_CA`, `State_MA`, `State_NY`, `State_TX`, `State_WA`, `State_other`
- Category encoding: `category_advertising`, `category_biotech`, `category_enterprise`, `category_games_video`, `category_hardware`, `category_mobile`, `category_network_hosting`, `category_other`, `category_semiconductor`, `category_software`, `category_web`
- Year encoding: `founded_year_1984` through `founded_year_2013`

**Response**: HTML page with results visualization

**Example**:
```bash
curl -X POST http://127.0.0.1:5000/predict \
  -d "founded_year=2015&age_startup_year=9&funding_total_usd=2000000&funding_rounds=4&milestones=8&is_CA=1&is_software=1&has_VC=1"
```

---

### 4. REST API Prediction (JSON)
**Endpoint**: `POST /api/predict`

**Description**: Processes startup data (JSON) and returns prediction results.

**Content-Type**: `application/json`

**Request Body**:
```json
{
  "age_first_funding_year": 1,
  "age_last_funding_year": 5,
  "age_first_milestone_year": 2,
  "age_last_milestone_year": 4,
  "funding_rounds": 3,
  "funding_total_usd": 1500000,
  "milestones": 5,
  "is_CA": 1,
  "is_NY": 0,
  "is_MA": 0,
  "is_TX": 0,
  "is_otherstate": 0,
  "is_software": 1,
  "is_web": 1,
  "is_mobile": 0,
  "is_enterprise": 0,
  "is_advertising": 0,
  "is_gamesvideo": 0,
  "is_ecommerce": 0,
  "is_biotech": 0,
  "is_consulting": 0,
  "is_othercategory": 0,
  "has_VC": 1,
  "has_angel": 1,
  "has_roundA": 1,
  "has_roundB": 0,
  "has_roundC": 0,
  "has_roundD": 0,
  "avg_participants": 2.5,
  "is_top500": 1,
  "has_RoundABCD": 0,
  "has_Investor": 1,
  "has_both": 1,
  "invalid_startup": 0,
  "age_startup_year": 9,
  "tier_relationships": 7.5,
  "State_CA": 1,
  "State_MA": 0,
  "State_NY": 0,
  "State_TX": 0,
  "State_WA": 0,
  "State_other": 0,
  "category_advertising": 0,
  "category_biotech": 0,
  "category_enterprise": 0,
  "category_games_video": 0,
  "category_hardware": 0,
  "category_mobile": 0,
  "category_network_hosting": 0,
  "category_other": 0,
  "category_semiconductor": 0,
  "category_software": 1,
  "category_web": 0,
  "founded_year_1984": 0,
  "founded_year_1985": 0,
  "founded_year_1990": 0,
  "founded_year_1992": 0,
  "founded_year_1995": 0,
  "founded_year_1996": 0,
  "founded_year_1997": 0,
  "founded_year_1998": 0,
  "founded_year_1999": 0,
  "founded_year_2000": 0,
  "founded_year_2001": 0,
  "founded_year_2002": 0,
  "founded_year_2003": 0,
  "founded_year_2004": 0,
  "founded_year_2005": 0,
  "founded_year_2006": 0,
  "founded_year_2007": 0,
  "founded_year_2008": 0,
  "founded_year_2009": 0,
  "founded_year_2010": 0,
  "founded_year_2011": 0,
  "founded_year_2012": 0,
  "founded_year_2013": 1
}
```

**Response** (Success):
```json
{
  "prediction": 1,
  "success_probability": 78.45,
  "failure_probability": 21.55
}
```

**Response** (Error):
```json
{
  "error": "Missing required field: funding_rounds"
}
```

**Example**:
```bash
curl -X POST http://127.0.0.1:5000/api/predict \
  -H "Content-Type: application/json" \
  -d '{
    "age_first_funding_year": 1,
    "funding_total_usd": 1500000,
    "funding_rounds": 3,
    "milestones": 5,
    "is_CA": 1,
    "is_software": 1,
    "has_VC": 1,
    "age_startup_year": 9,
    "tier_relationships": 7.5,
    "avg_participants": 2.5,
    "is_top500": 1
  }'
```

---

### 5. Features Page
**Endpoint**: `GET /adaptivity`

**Description**: Returns information page about features and capabilities.

**Response**: HTML page

**Example**:
```bash
curl http://127.0.0.1:5000/adaptivity
```

---

## Response Format

### Successful Prediction Response
```json
{
  "prediction": 1,
  "success_probability": 78.45,
  "failure_probability": 21.55
}
```

**Fields**:
- `prediction` (integer): 0 (failure) or 1 (success)
- `success_probability` (float): Probability of success (0-100)
- `failure_probability` (float): Probability of failure (0-100)

### Error Response
```json
{
  "error": "Error message describing what went wrong"
}
```

---

## Status Codes

| Code | Meaning |
|------|---------|
| 200 | Success |
| 400 | Bad Request (invalid data or missing fields) |
| 404 | Not Found |
| 500 | Internal Server Error |

---

## Usage Examples

### Python Example
```python
import requests
import json

url = "http://127.0.0.1:5000/api/predict"

payload = {
    "age_first_funding_year": 1,
    "funding_total_usd": 1500000,
    "funding_rounds": 3,
    "milestones": 5,
    "is_CA": 1,
    "is_software": 1,
    "has_VC": 1,
    "age_startup_year": 9,
    "tier_relationships": 7.5,
    "avg_participants": 2.5,
    "is_top500": 1
    # ... include all 76 features
}

headers = {"Content-Type": "application/json"}

response = requests.post(url, json=payload, headers=headers)
result = response.json()

print(f"Success Probability: {result['success_probability']}%")
print(f"Prediction: {'Success' if result['prediction'] == 1 else 'Failure'}")
```

### JavaScript Example
```javascript
const url = "http://127.0.0.1:5000/api/predict";

const payload = {
    age_first_funding_year: 1,
    funding_total_usd: 1500000,
    funding_rounds: 3,
    milestones: 5,
    is_CA: 1,
    is_software: 1,
    has_VC: 1,
    age_startup_year: 9,
    tier_relationships: 7.5,
    avg_participants: 2.5,
    is_top500: 1
    // ... include all 76 features
};

fetch(url, {
    method: "POST",
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify(payload)
})
.then(response => response.json())
.then(data => {
    console.log(`Success Probability: ${data.success_probability}%`);
    console.log(`Prediction: ${data.prediction === 1 ? 'Success' : 'Failure'}`);
})
.catch(error => console.error("Error:", error));
```

---

## Rate Limiting

Currently no rate limiting is implemented. For production, consider adding:
- Request throttling
- IP-based limiting
- API key quotas

---

## Best Practices

1. **Always include all 76 features** - Provide values for all fields, use 0 as default
2. **Validate input ranges** - Ensure numerical values are reasonable
3. **Use appropriate data types** - Send numbers as numbers, not strings
4. **Handle errors gracefully** - Check for error responses
5. **Cache results** - Don't re-query for identical inputs

---

## Changelog

### Version 1.0.0
- Initial API release
- 76 features supported
- JSON request/response format
- Random Forest model (95% accuracy)

---

## Support

For issues or questions:
- Check GitHub repository
- Review example implementations
- Test with provided curl examples
