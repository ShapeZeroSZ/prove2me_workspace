import Mathlib

open Real

theorem solution (K c β q : ℝ) :
    (β * c * sin (-q)) ^ 2 + K + 2 * c * (1 - cos (-q))
      = (β * c * sin q) ^ 2 + K + 2 * c * (1 - cos q) := by
  rw [sin_neg, cos_neg]; ring
