import Mathlib

open Real

namespace PinnedAsymmetry

/-- Upper-branch frequency on a uniform ring: stiffness K, neighbour coupling c,
gyroscopic strength β, wavenumber q. -/
noncomputable def omega (K c β q : ℝ) : ℝ :=
  β * c * sin q + Real.sqrt ((β * c * sin q) ^ 2 + K + 2 * c * (1 - cos q))

end PinnedAsymmetry
