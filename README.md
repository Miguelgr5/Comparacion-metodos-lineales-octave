# Comparacion-metodos-lineales-octave
# 📊 Comparative Analysis of Numerical Methods for Solving Linear Systems in GNU Octave

This project presents an analytical comparison of multiple numerical techniques for solving linear systems of equations, developed entirely in **GNU Octave**. The focus lies in evaluating the **accuracy**, **stability**, and **computational behavior** of each method under a unified framework.

---

## 🧠 Objectives

- To implement and compare several classical and iterative methods for solving linear systems.
- To assess the performance of each approach in terms of numerical error and robustness.
- To highlight practical advantages and limitations of each method.

---

## ⚙️ Implemented Methods

The following methods are individually implemented and evaluated:

| Method Description                                 | Script/File                     |
|----------------------------------------------------|----------------------------------|
| Gaussian Elimination with Partial Pivoting         | `GaussPivotMax.m`               |
| Inverse Calculation via Maximum Pivoting           | `InversaPivotMax.m`             |
| Iterative Refinement on Gaussian Elimination       | `RefinamientoGauss.m`           |
| Iterative Refinement with Column Pivoting          | `RefinamientoPivotCol.m`        |
| Final Comparative Evaluation                       | `ComparacionFinal.m`            |
| Result Visualization and Summary                   | `ResultadosProyecto.m`          |
| Forward and Backward Substitution Utilities        | `forwardsub.m`, `backsub.m`     |

---

📈 Output
The script ComparacionFinal.m will:

Compute the inverse of a matrix using different methods.

Compare results against the identity matrix to quantify error.

Display numerical precision for each method.

Determine the most accurate inverse based on residuals.

💻 Requirements
GNU Octave (recommended version: 7.0 or later)

No additional toolboxes or dependencies required

📚 License
This project is released under the MIT License. Feel free to use, modify, and distribute it for academic or research purposes.

🙋‍♂️ Contributions
Contributions, suggestions, and improvements are welcome. Please feel free to fork the project, open pull requests, or submit issues.

📫 Contact
For questions or collaboration inquiries, you can reach out via GitHub Issues.
