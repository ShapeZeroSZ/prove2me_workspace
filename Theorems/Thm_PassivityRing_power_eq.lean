import Mathlib
import Definitions.Def_PassivityRing_power

open Matrix BigOperators

namespace PassivityRing
theorem power_eq (N d : ℕ) [NeZero N]
    (W : Fin N → Matrix (Fin d) (Fin d) ℝ) (v : Fin N → (Fin d → ℝ)) :
    power N d W v = ∑ i : Fin N, v i ⬝ᵥ ((W i - (W i)ᵀ) *ᵥ v (i + 1)) := by sorry
end PassivityRing
