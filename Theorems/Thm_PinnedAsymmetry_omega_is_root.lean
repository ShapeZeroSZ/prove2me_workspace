import Mathlib
import Definitions.Def_PinnedAsymmetry_omega

open Real

namespace PinnedAsymmetry
theorem omega_is_root (K c β q : ℝ)
    (h : 0 ≤ (β * c * sin q) ^ 2 + K + 2 * c * (1 - cos q)) :
    (omega K c β q) ^ 2 - 2 * β * c * sin q * omega K c β q
      - (K + 2 * c * (1 - cos q)) = 0 := by sorry
end PinnedAsymmetry
