import Mathlib
import Definitions.Def_PinnedAsymmetry_omega

open Real

namespace PinnedAsymmetry

theorem radicand_even (K c β q : ℝ) :
    (β * c * sin (-q)) ^ 2 + K + 2 * c * (1 - cos (-q))
      = (β * c * sin q) ^ 2 + K + 2 * c * (1 - cos q) := by
  rw [sin_neg, cos_neg]; ring

theorem omega_is_root (K c β q : ℝ)
    (h : 0 ≤ (β * c * sin q) ^ 2 + K + 2 * c * (1 - cos q)) :
    (omega K c β q) ^ 2 - 2 * β * c * sin q * omega K c β q
      - (K + 2 * c * (1 - cos q)) = 0 := by
  unfold omega
  have hs := Real.sq_sqrt h
  nlinarith [hs]

theorem asymmetry (K c β q : ℝ) :
    omega K c β q - omega K c β (-q) = 2 * β * c * sin q := by
  unfold omega
  rw [radicand_even, sin_neg]; ring

/-- Local-only corollary (§4): the asymmetry is the same for any two stiffnesses. -/
example (K₁ K₂ c β q : ℝ) :
    omega K₁ c β q - omega K₁ c β (-q) = omega K₂ c β q - omega K₂ c β (-q) := by
  rw [asymmetry, asymmetry]

end PinnedAsymmetry
