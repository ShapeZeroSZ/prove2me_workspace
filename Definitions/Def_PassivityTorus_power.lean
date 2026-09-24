import Mathlib

open Matrix BigOperators

namespace PassivityTorus

/-- Sites of a periodic cubic lattice with q axes and L sites along each. -/
abbrev Site (q L : ℕ) := Fin q → Fin L

/-- Move s steps along axis a, wrapping around. -/
def shift {q L : ℕ} (x : Site q L) (a : Fin q) (s : Fin L) : Site q L :=
  Function.update x a (x a + s)

/-- Total power of the per-link neighbour coupling. -/
def power (q L d : ℕ) [NeZero L]
    (W : Site q L → Fin q → Matrix (Fin d) (Fin d) ℝ)
    (v : Site q L → (Fin d → ℝ)) : ℝ :=
  ∑ x : Site q L, ∑ a : Fin q,
    v x ⬝ᵥ (W x a *ᵥ v (shift x a 1) - W (shift x a (-1)) a *ᵥ v (shift x a (-1)))

end PassivityTorus
