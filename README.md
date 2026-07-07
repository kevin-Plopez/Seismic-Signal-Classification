# Automatic Seismic Signal Classification Using Multidomain Feature Extraction and Ensemble Machine Learning

> **Master's Thesis**  
> **Master in Data Science**  
> **Universidad San Francisco de Quito (USFQ)**

---

## Overview

This repository contains the source code developed for the master's thesis focused on the automatic classification of seismic signals using multidomain feature extraction and machine learning.

The proposed methodology transforms raw seismic waveforms into numerical representations through handcrafted feature extraction from multiple analysis domains. These features are then used to train and evaluate several supervised machine learning algorithms for multiclass seismic signal classification.

Among the evaluated models, **XGBoost** achieved the best overall performance.

---

## Research Objective

Develop an automatic seismic signal classification system based on multidomain feature extraction and evaluate different machine learning algorithms for distinguishing among three classes of seismic signals:

| Class | Description |
|--------|-------------|
| SS | Seismic Event |
| NO | Noise |
| RO | Rockfall |

---

# Methodology

The complete workflow of the proposed methodology is illustrated below.

<p align="center">
<img src="docs/pipeline.png" width="900">
</p>

The pipeline consists of the following stages:

1. Raw seismic waveform acquisition (.mat)
2. Data conversion
3. Signal preprocessing
4. Multidomain feature extraction
5. Feature dataset construction
6. Machine learning model training
7. Model evaluation
8. Final XGBoost classifier

---

# Feature Extraction

Each seismic signal is represented through handcrafted features extracted from six complementary analysis domains.

## Temporal Domain

Characterizes the temporal behavior of the seismic waveform.

Examples:

- Zero Crossing Rate
- Duration
- Peak
- Peak-to-Peak
- RMS
- Crest Factor

---

## Statistical Domain

Describes the statistical distribution of signal amplitudes.

Examples:

- Mean
- Median
- Standard Deviation
- Variance
- Interquartile Range
- Percentiles
- Skewness
- Kurtosis

---

## Energy Domain

Measures the energy content of the seismic signal.

Examples:

- Signal Energy
- Energy Density
- Arias Intensity
- Cumulative Absolute Velocity (CAV)
- Peak Ground Acceleration (PGA)

---

## Frequency Domain (FFT-Based)

Extracts frequency-related information using the Fast Fourier Transform.

Examples:

- Dominant Frequency
- Spectral Entropy
- Spectral Centroid
- Spectral Bandwidth

---

## Spectral Domain (PSD-Based)

Analyzes the Power Spectral Density (PSD) of the signal.

Examples:

- PSD Mean
- PSD Standard Deviation
- PSD Maximum
- Dominant PSD Frequency

---

## Time-Frequency Domain (Wavelet-Based)

Represents temporal and frequency information simultaneously using Wavelet Transform.

Examples:

- Wavelet Energy
- Wavelet Entropy
- Wavelet Statistical Coefficients

---

# Machine Learning Models

The following supervised learning algorithms were evaluated:

- Logistic Regression
- Random Forest
- CatBoost
- XGBoost

---

# Experimental Design

To prevent data leakage between seismic events, dataset partitioning was performed at the **event level** rather than at the signal level.

| Dataset | Percentage |
|----------|-----------:|
| Training | 60% |
| Validation | 20% |
| Testing | 20% |

Cross-validation was performed using **GroupKFold**, ensuring that signals belonging to the same seismic event were never distributed across different folds.

---

# Evaluation Metrics

Model performance was evaluated using:

- Accuracy
- Balanced Accuracy
- Precision (Macro)
- Recall (Macro)
- F1-Score (Macro)
- Confusion Matrix

Statistical significance between classifiers was assessed using:

- Friedman Test
- Wilcoxon Signed-Rank Test

---

# Results

Ensemble learning algorithms consistently outperformed the baseline Logistic Regression model.

The best overall performance was achieved by **XGBoost**, demonstrating superior capability in distinguishing among the three seismic signal classes.

| Model | Accuracy | F1 Macro |
|--------|----------|-----------|
| Logistic Regression | 0.5022 | 0.4895 |
| Random Forest | 0.6690 | 0.6715 |
| CatBoost | 0.6915 | 0.6944 |
| **XGBoost** | **0.6986** | **0.7014** |

---

# Explainability

To improve model interpretability, two model-agnostic explainability techniques were implemented:

- LIME (Local Interpretable Model-Agnostic Explanations)
- SHAP (SHapley Additive exPlanations)

These methods were used to identify the most influential multidomain features contributing to the XGBoost classifier predictions.

---

# Dataset Availability

> **Important**

The seismic waveform dataset used in this research **is not included** in this repository.

The original dataset is managed separately in a **private Google Drive repository** due to storage limitations and research data management policies.

Researchers interested in reproducing this work may request access to the dataset by contacting the author.

After obtaining access, the dataset should be organized as follows:

```
data/
└── raw/
```

All preprocessing, feature extraction, model training, and evaluation scripts included in this repository are fully compatible with the original dataset structure.

---

# Repository Structure

```
.
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│
├── models/
│
├── results/
│   ├── figures/
│   └── tables/
│
├── docs/
│
├── requirements.txt
└── README.md
```

---

# Installation

Clone the repository

```bash
git clone https://github.com/kevin-Plopez/Seismic-Signal-Classification.git
```

Move into the project directory

```bash
cd seismic-signal-classification
```

Create a virtual environment

```bash
python -m venv venv
```

Activate the environment

Windows

```bash
venv\Scripts\activate
```

Linux / macOS

```bash
source venv/bin/activate
```

Install dependencies

```bash
pip install -r requirements.txt
```

# Technologies

- Python
- NumPy
- Pandas
- SciPy
- Scikit-Learn
- XGBoost
- CatBoost
- PyWavelets
- Matplotlib
- Seaborn
- Jupyter Notebook

---

# Citation

If you use this repository in your research, please cite:

```text
Kevin López.

Automatic Seismic Signal Classification Using Multidomain Feature Extraction and Ensemble Machine Learning

Master's Thesis.

Master in Data Science

Universidad San Francisco de Quito (USFQ)

2026
```

---

# Author

**Kevin López**

Software Engineer

Master's Student in Data Science

Universidad San Francisco de Quito (USFQ)

---

# License

This project was developed exclusively for academic and research purposes as part of a Master's Thesis at the Universidad San Francisco de Quito.
<img width="1630" height="965" alt="Diagrama de Bloques" src="https://github.com/user-attachments/assets/8775a19c-399a-464d-96a0-772053f40ad1" />

The seismic dataset is not publicly distributed and remains under separate data management.
