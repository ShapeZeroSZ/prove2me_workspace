import Mathlib
import Definitions.Def_PinnedAsymmetryQ_omega

open Real BigOperators

namespace PinnedAsymmetryQ
theorem asymmetry_indep_K (q : ℕ) [NeZero q] (K₁ K₂ c β : ℝ) (k : Fin q → ℝ) :
    omega q K₁ c β k - omega q K₁ c β (flip0 q k)
      = omega q K₂ c β k - omega q K₂ c β (flip0 q k) := by sorry
end PinnedAsymmetryQ
