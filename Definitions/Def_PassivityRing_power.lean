import Mathlib

open Matrix BigOperators

namespace PassivityRing

/-- Total power of the per-link neighbour coupling on a ring of N sites. -/
def power (N d : ℕ) [NeZero N] (W : Fin N → Matrix (Fin d) (Fin d) ℝ)
    (v : Fin N → (Fin d → ℝ)) : ℝ :=
  ∑ i : Fin N, v i ⬝ᵥ (W i *ᵥ v (i + 1) - W (i - 1) *ᵥ v (i - 1))

end PassivityRing
