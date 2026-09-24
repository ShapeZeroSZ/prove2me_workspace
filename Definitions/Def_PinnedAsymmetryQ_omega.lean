import Mathlib

open Real BigOperators

namespace PinnedAsymmetryQ

/-- Upper-branch frequency on a uniform lattice with q axes; the gauge term acts
along axis 0. Wavevector k, stiffness K, neighbour coupling c, strength β. -/
noncomputable def omega (q : ℕ) [NeZero q] (K c β : ℝ) (k : Fin q → ℝ) : ℝ :=
  β * c * sin (k 0) +
    Real.sqrt ((β * c * sin (k 0)) ^ 2 + K + 2 * c * ∑ a : Fin q, (1 - cos (k a)))

/-- Reverse the wavevector along axis 0 only. -/
def flip0 (q : ℕ) [NeZero q] (k : Fin q → ℝ) : Fin q → ℝ :=
  Function.update k 0 (-(k 0))

end PinnedAsymmetryQ
