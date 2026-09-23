import Mathlib
import Definitions.Def_PassivityRing_power

open Matrix BigOperators

open PassivityRing

theorem solution (N d : ℕ) [NeZero N]
    (W : Fin N → Matrix (Fin d) (Fin d) ℝ) (v : Fin N → (Fin d → ℝ)) :
    power N d W v = ∑ i : Fin N, v i ⬝ᵥ ((W i - (W i)ᵀ) *ᵥ v (i + 1)) := by
  unfold power
  have key : ∑ i : Fin N, v i ⬝ᵥ (W (i - 1) *ᵥ v (i - 1))
      = ∑ i : Fin N, v i ⬝ᵥ ((W i)ᵀ *ᵥ v (i + 1)) := by
    rw [← Equiv.sum_comp (Equiv.addRight (1 : Fin N))]
    refine Finset.sum_congr rfl fun j _ => ?_
    simp only [Equiv.coe_addRight, add_sub_cancel_right]
    rw [dotProduct_mulVec (v j), vecMul_transpose, dotProduct_comm]
  simp only [dotProduct_sub, Finset.sum_sub_distrib, sub_mulVec, key]
