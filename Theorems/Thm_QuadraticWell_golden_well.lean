import Mathlib

namespace QuadraticWell

theorem golden_well (x : ℝ → ℝ) (hx : ContDiff ℝ 2 x) :
    (∀ t, deriv (deriv x) t = -(x t ^ 2 - x t - 1)) ↔
    (∀ τ, deriv (deriv (fun σ => (x (σ / Real.sqrt (Real.sqrt 5 / 2)) - 1 / 2) /
        (Real.sqrt 5 / 2))) τ =
      -(((x (τ / Real.sqrt (Real.sqrt 5 / 2)) - 1 / 2) / (Real.sqrt 5 / 2)) ^ 2 - 1)) := by
  sorry

end QuadraticWell
