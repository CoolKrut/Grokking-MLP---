# Grokking в MLP — воспроизведение Gromov (2023): чекпоинт pre-registration

## 1. О проекте
- **Статья:** A. Gromov, *Grokking modular arithmetic*, [arXiv:2301.02679](https://arxiv.org/abs/2301.02679).  
- **Код авторов:** [d-doshi/Grokking](https://github.com/d-doshi/Grokking).
- **Текст pre-registration:** [`pre_registration.md`](pre_registration.md).

## 2. Быстрый старт
На этапе pre-registration в репозитории зафиксирован запуск оригинального авторского кода:

```bash
bash asis/run_asis.sh      # ≈ 2 мин на CPU, нужно ≥ 6 ГБ RAM
```

- Скрипт запуска: [`asis/run_asis.sh`](asis/run_asis.sh)
- Лог обучения: [`asis/asis_training_log.txt`](asis/asis_training_log.txt)
- Зависимости окружения: [`requirements.txt`](requirements.txt)

## 3. Раздел оригинального кода

**Итог: получилось с правками окружения, без правок кода.**

| Параметр | Значение |
| --- | --- |
| Код | [d-doshi/Grokking](https://github.com/d-doshi/Grokking) |
| Команда | `bash asis/run_asis.sh` |
| Железо | 2 vCPU, 7 ГБ RAM, без GPU |
| Окружение | Python 3.13.18, torch 2.14.1+cpu, torchvision 0.29.1+cpu, numpy 2.5.3, matplotlib 3.11.2, timm 1.0.30, ml_collections 1.1.0 |
| Время / память | 106 с на весь ноутбук / пик 5.2 ГБ RAM |

| Результат | Значение |
| --- | --- |
| Аналитическое решение ($N = 500$), точность train / test | 100% / 100% |
| 99% на train ($t_{\text{mem}}$) / на test ($t_{\text{grok}}$) | эпоха 120 / 190 |
| Точность train / test после 1000 эпох | 100% / 100% |
| Средний $\text{IPR}_2$ весов в конце | $\approx 0.75$ |

**Правки окружения:** в исходном репозитории нет requirements; `pip install timm` ставит torchvision, несовместимую с CPU-сборкой torch (`operator torchvision::nms does not exist`) — переустановлена CPU-сборка torchvision 0.29.1 (зафиксировано в [`requirements.txt`](requirements.txt)).

**Файлы запуска:**
- Лог обучения (каждые 10 эпох): [`asis/asis_training_log.txt`](asis/asis_training_log.txt)
- Графики ноутбука:
  - Точность и функция потерь: [`asis/figures/loss_accuracy.png`](asis/figures/loss_accuracy.png)
  - Динамика локализации (IPR): [`asis/figures/ipr.png`](asis/figures/ipr.png)
  - Фурье-спектр весов: [`asis/figures/analytic_fft.png`](asis/figures/analytic_fft.png)

---

Код собственных экспериментов, конфиги и логи MLflow будут добавлены после утверждения pre-registration.
