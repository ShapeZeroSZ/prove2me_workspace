import Mathlib
import Definitions.Def_PassivityTorus_power

open Matrix BigOperators

namespace PassivityTorus
theorem passive_iff_symm (q L d : ℕ) [NeZero L] (hL : 3 ≤ L)
    (W : Site q L → Fin q → Matrix (Fin d) (Fin d) ℝ) :
    (∀ v : Site q L → (Fin d → ℝ), power q L d W v = 0)
      ↔ ∀ x a, (W x a)ᵀ = W x a := by sorry
end PassivityTorus
