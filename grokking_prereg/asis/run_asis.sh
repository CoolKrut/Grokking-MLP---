#!/usr/bin/env bash
# Запуск оригинального ноутбука авторов из корня репозитория.
set -euo pipefail
[ -d original ] || git clone https://github.com/d-doshi/Grokking.git original
git -C original checkout 0b4335f7b64d1417e27968f02ed9b50e9ef3581f
pip install -r requirements.txt
# timm тянет torchvision, несовместимую с CPU-сборкой torch -> ставим CPU-сборку явно
pip install --force-reinstall --no-deps --index-url https://download.pytorch.org/whl/cpu torchvision==0.29.1
cd original/Notebooks
time jupyter nbconvert --to notebook --execute --ExecutePreprocessor.timeout=-1 \
  --output Grokking_modular_arithmetic_executed.ipynb Grokking_modular_arithmetic.ipynb
