import Mathlib
import Definitions.Def_PinnedAsymmetry_omega

open Real

namespace PinnedAsymmetry
theorem asymmetry (K c β q : ℝ) :
    omega K c β q - omega K c β (-q) = 2 * β * c * sin q := by sorry
end PinnedAsymmetry
