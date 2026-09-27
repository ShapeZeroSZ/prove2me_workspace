import Mathlib

namespace QuadraticWell

theorem force_shift (a r₁ r₂ d : ℝ) (hr : r₁ ≠ r₂)
    (hd : d = (r₁ - r₂) / 2 ∨ d = (r₂ - r₁) / 2) (y : ℝ) :
    -a * (y - r₁) * (y - r₂) = -a * d ^ 2 * (((y - (r₁ + r₂) / 2) / d) ^ 2 - 1) := by
  sorry

end QuadraticWell
