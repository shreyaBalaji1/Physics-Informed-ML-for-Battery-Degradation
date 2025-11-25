# Physics-Informed-ML-for-Battery-Degradation

[Project Documentation (Google Doc)](https://docs.google.com/document/d/1jGOur4e2IwV21sAL1KNxA4-3Ypq1_PdhacuI6BeJHDc/edit?usp=sharing)

---

## Overview
This project predicts **State of Health (SOH)** and **Remaining Useful Life (RUL)** of lithium-ion batteries using physics-informed machine learning.  

Key highlights:  
- Cleaned and preprocessed battery datasets to remove noise and outliers.  
- Tested multiple deep learning models: **MLP, CNN, LSTM, Attention Network, Transformer**.  
- Achieved high prediction accuracy; **CNN** performed best (R² ≈ 0.9737).

---

Model Performance
<details> <summary>Click to expand</summary>
Model	R² Score	MAE	MAPE	RMSE
CNN	0.9800	0.01495	0.02549	0.02811
LSTM	0.9239	0.01429	0.01843	0.02413
MLP	0.8030	0.03335	0.04534	0.04640
Attention	0.9302	0.02034	0.03189	0.03397
</details>

---

Methodology
<details> <summary>Click to expand</summary>
Preprocessing: Min-Max scaling; removed outliers and noisy points.
Loss function: Huber loss to handle outliers robustly.
Data split: 90/10 training/testing.
Training: Batch processing via DataLoaders; GPU-enabled.
Benchmarking: Multiple runs for consistency across datasets.
</details>

---

Conclusion
Data preprocessing improved model performance more than model complexity alone.
CNN was the most accurate and stable model.
Pipeline works for multiple datasets and architectures.
Limitations: Transformers need more tuning; performance depends on public datasets.
