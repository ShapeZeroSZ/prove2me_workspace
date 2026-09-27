import Mathlib

namespace QuadraticWell

theorem rescale_deriv2 (x : ℝ → ℝ) (hx : ContDiff ℝ 2 x) (m d ω : ℝ) (hω : ω ≠ 0)
    (hd : d ≠ 0) (τ : ℝ) :
    deriv (deriv (fun σ => (x (σ / ω) - m) / d)) τ = deriv (deriv x) (τ / ω) / (ω ^ 2 * d) := by
  sorry

end QuadraticWell
