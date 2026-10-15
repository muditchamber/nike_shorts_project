# ML Benchmark — Supplied ML Dataset

Target: `trend_label`

Classes:
- stable
- rising
- declining
- seasonal

Model used in the project script:
- Random Forest Classifier
- 200 trees
- 80/20 stratified train/test split
- random_state=42
- class_weight='balanced'

Observed test accuracy on the supplied ML CSV: **81.95%**

Observed weighted F1: **0.82**
Observed macro F1: **0.78**

Important: this is a trend-label classification benchmark. The supplied ML
dataset does not contain a direct binary `viral` target, so the project should
not claim that 81.95% means "viral prediction accuracy."
