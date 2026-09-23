import Mathlib

open Real

namespace PinnedAsymmetry
theorem radicand_even (K c β q : ℝ) :
    (β * c * sin (-q)) ^ 2 + K + 2 * c * (1 - cos (-q))
      = (β * c * sin q) ^ 2 + K + 2 * c * (1 - cos q) := by sorry
end PinnedAsymmetry
