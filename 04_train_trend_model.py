"""
Phase 3 — Trend Label Prediction

Target:
    trend_label = stable / rising / declining / seasonal

This matches the supplied ML dataset. The supplied ML dataset does not contain
a direct binary "viral" target, so this project predicts trend_label rather
than claiming a true viral/not-viral prediction.

Install:
    pip install pandas scikit-learn joblib

Run:
    python 04_train_trend_model.py
"""

import pandas as pd
import joblib
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.pipeline import Pipeline
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix

FILE = "youtube_shorts_tiktok_trends_2025.csv_ML.csv"
TARGET = "trend_label"

df = pd.read_csv(FILE)

X = df.drop(columns=[TARGET])
y = df[TARGET]

categorical = X.select_dtypes(include=["object"]).columns.tolist()
numeric = [c for c in X.columns if c not in categorical]

preprocessor = ColumnTransformer(
    transformers=[
        ("cat", OneHotEncoder(handle_unknown="ignore"), categorical)
    ],
    remainder="passthrough"
)

pipeline = Pipeline([
    ("preprocessor", preprocessor),
    ("model", RandomForestClassifier(
        n_estimators=200,
        random_state=42,
        class_weight="balanced",
        n_jobs=-1
    ))
])

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.20, random_state=42, stratify=y
)

pipeline.fit(X_train, y_train)
pred = pipeline.predict(X_test)

print("Accuracy:", round(accuracy_score(y_test, pred), 4))
print("\nClassification report:\n")
print(classification_report(y_test, pred))
print("\nConfusion matrix:\n")
print(confusion_matrix(y_test, pred))

joblib.dump(pipeline, "nike_trend_label_model.joblib")
print("\nSaved: nike_trend_label_model.joblib")
