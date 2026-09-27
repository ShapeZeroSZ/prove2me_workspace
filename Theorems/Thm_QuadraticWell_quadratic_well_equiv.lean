import Mathlib

namespace QuadraticWell

/-- MISSION GOAL: every quadratic-force oscillator with two distinct real roots is
the normal-form oscillator z'' = -(z² - 1) after one fixed affine change of value
and one fixed rescaling of time. -/
theorem quadratic_well_equiv (a r₁ r₂ : ℝ) (ha : a ≠ 0) (hr : r₁ ≠ r₂) :
    ∃ m d ω : ℝ, d ≠ 0 ∧ 0 < ω ∧
      ∀ x : ℝ → ℝ, ContDiff ℝ 2 x →
        ((∀ t, deriv (deriv x) t = -a * (x t - r₁) * (x t - r₂)) ↔
         (∀ τ, deriv (deriv (fun σ => (x (σ / ω) - m) / d)) τ =
                -(((x (τ / ω) - m) / d) ^ 2 - 1))) := by
  sorry

end QuadraticWell
