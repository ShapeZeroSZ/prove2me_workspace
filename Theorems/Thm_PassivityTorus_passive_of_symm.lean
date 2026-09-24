import Mathlib
import Definitions.Def_PassivityTorus_power

open Matrix BigOperators

namespace PassivityTorus
theorem passive_of_symm (q L d : ℕ) [NeZero L]
    (W : Site q L → Fin q → Matrix (Fin d) (Fin d) ℝ) (hW : ∀ x a, (W x a)ᵀ = W x a)
    (v : Site q L → (Fin d → ℝ)) : power q L d W v = 0 := by sorry
end PassivityTorus
