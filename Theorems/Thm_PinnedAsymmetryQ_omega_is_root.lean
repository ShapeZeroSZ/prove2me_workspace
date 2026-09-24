import Mathlib
import Definitions.Def_PinnedAsymmetryQ_omega

open Real BigOperators

namespace PinnedAsymmetryQ
theorem omega_is_root (q : ℕ) [NeZero q] (K c β : ℝ) (k : Fin q → ℝ)
    (h : 0 ≤ (β * c * sin (k 0)) ^ 2 + K + 2 * c * ∑ a : Fin q, (1 - cos (k a))) :
    (omega q K c β k) ^ 2 - 2 * β * c * sin (k 0) * omega q K c β k
      - (K + 2 * c * ∑ a : Fin q, (1 - cos (k a))) = 0 := by sorry
end PinnedAsymmetryQ
