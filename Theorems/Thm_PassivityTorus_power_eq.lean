import Mathlib
import Definitions.Def_PassivityTorus_power

open Matrix BigOperators

namespace PassivityTorus
theorem power_eq (q L d : ℕ) [NeZero L]
    (W : Site q L → Fin q → Matrix (Fin d) (Fin d) ℝ)
    (v : Site q L → (Fin d → ℝ)) :
    power q L d W v =
      ∑ x : Site q L, ∑ a : Fin q, v x ⬝ᵥ ((W x a - (W x a)ᵀ) *ᵥ v (shift x a 1)) := by sorry
end PassivityTorus
