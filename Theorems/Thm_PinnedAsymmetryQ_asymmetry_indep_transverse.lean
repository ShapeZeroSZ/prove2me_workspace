import Mathlib
import Definitions.Def_PinnedAsymmetryQ_omega

open Real BigOperators

namespace PinnedAsymmetryQ
theorem asymmetry_indep_transverse (q : ℕ) [NeZero q] (K c β : ℝ)
    (k k' : Fin q → ℝ) (h0 : k 0 = k' 0) :
    omega q K c β k - omega q K c β (flip0 q k)
      = omega q K c β k' - omega q K c β (flip0 q k') := by sorry
end PinnedAsymmetryQ
