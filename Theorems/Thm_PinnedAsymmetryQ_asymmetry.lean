import Mathlib
import Definitions.Def_PinnedAsymmetryQ_omega

open Real BigOperators

namespace PinnedAsymmetryQ
theorem asymmetry (q : ℕ) [NeZero q] (K c β : ℝ) (k : Fin q → ℝ) :
    omega q K c β k - omega q K c β (flip0 q k) = 2 * β * c * sin (k 0) := by sorry
end PinnedAsymmetryQ
