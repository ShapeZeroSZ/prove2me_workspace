import Mathlib
import Definitions.Def_PinnedAsymmetry_omega

open Real

namespace PinnedAsymmetrySol
open PinnedAsymmetry

theorem radicand_even (K c β q : ℝ) :
    (β * c * sin (-q)) ^ 2 + K + 2 * c * (1 - cos (-q))
      = (β * c * sin q) ^ 2 + K + 2 * c * (1 - cos q) := by
  rw [sin_neg, cos_neg]; ring

theorem asymmetry (K c β q : ℝ) :
    omega K c β q - omega K c β (-q) = 2 * β * c * sin q := by
  unfold omega
  rw [radicand_even, sin_neg]; ring

end PinnedAsymmetrySol

open PinnedAsymmetry PinnedAsymmetrySol

theorem solution (K₁ K₂ c β q : ℝ) :
    omega K₁ c β q - omega K₁ c β (-q) = omega K₂ c β q - omega K₂ c β (-q) := by
  rw [asymmetry, asymmetry]
