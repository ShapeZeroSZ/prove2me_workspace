import Mathlib
import Definitions.Def_PassivityRing_power

open Matrix BigOperators

namespace PassivityRing
theorem passive_of_symm (N d : ℕ) [NeZero N]
    (W : Fin N → Matrix (Fin d) (Fin d) ℝ) (hW : ∀ i, (W i)ᵀ = W i)
    (v : Fin N → (Fin d → ℝ)) : power N d W v = 0 := by sorry
end PassivityRing
