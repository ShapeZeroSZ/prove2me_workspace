import Mathlib
import Definitions.Def_PinnedAsymmetryQ_omega

open Real BigOperators

namespace PinnedAsymmetryQ
theorem radicand_flip (q : ℕ) [NeZero q] (K c β : ℝ) (k : Fin q → ℝ) :
    (β * c * sin (flip0 q k 0)) ^ 2 + K + 2 * c * ∑ a : Fin q, (1 - cos (flip0 q k a))
      = (β * c * sin (k 0)) ^ 2 + K + 2 * c * ∑ a : Fin q, (1 - cos (k a)) := by sorry
end PinnedAsymmetryQ
