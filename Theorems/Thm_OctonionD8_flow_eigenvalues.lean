import Mathlib
import Definitions.Def_OctonionD8_flow

namespace OctonionD8

open Polynomial

theorem flow_eigenvalues (θ : ℝ) (hθ₀ : 0 < θ) (hθ₁ : θ < Real.pi) :
    ((flowMat (Real.cos θ) (Real.sin θ)).charpoly.map (algebraMap ℝ ℂ)).roots =
      {0, 0, 2 * Complex.I, -(2 * Complex.I),
        2 * Complex.I * (Real.sin (θ / 2) : ℂ), 2 * Complex.I * (Real.sin (θ / 2) : ℂ),
        -(2 * Complex.I * (Real.sin (θ / 2) : ℂ)), -(2 * Complex.I * (Real.sin (θ / 2) : ℂ))} ∧
      0 < Real.sin (θ / 2) ∧ Real.sin (θ / 2) < 1 := by
  sorry

end OctonionD8
