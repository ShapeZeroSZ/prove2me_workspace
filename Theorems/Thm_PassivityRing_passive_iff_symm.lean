import Mathlib
import Definitions.Def_PassivityRing_power

open Matrix BigOperators

namespace PassivityRing
theorem passive_iff_symm (N d : ℕ) [NeZero N] (hN : 3 ≤ N)
    (W : Fin N → Matrix (Fin d) (Fin d) ℝ) :
    (∀ v : Fin N → (Fin d → ℝ), power N d W v = 0) ↔ ∀ i, (W i)ᵀ = W i := by sorry
end PassivityRing
