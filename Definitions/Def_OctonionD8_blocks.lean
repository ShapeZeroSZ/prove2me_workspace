import Mathlib
import Definitions.Def_OctonionD8_flow

namespace OctonionD8

/-- Reordering of the basis e₀, …, e₇ as (e₀, e₁, e₂, e₄ | e₃, e₅, e₆, e₇):
indices 0, 1, 2, 4 go to the first block, 3, 5, 6, 7 to the second, in that order. -/
def blockEquiv : Fin 8 ≃ Fin 4 ⊕ Fin 4 where
  toFun := ![Sum.inl 0, Sum.inl 1, Sum.inl 2, Sum.inr 0, Sum.inl 3, Sum.inr 1, Sum.inr 2, Sum.inr 3]
  invFun := Sum.elim ![0, 1, 2, 4] ![3, 5, 6, 7]
  left_inv := by decide
  right_inv := by decide

/-- The block of `flowMat c s` on (e₀, e₁, e₂, e₄). -/
def blockA (c s : ℝ) : Matrix (Fin 4) (Fin 4) ℝ := !![0, -c - 1, -s, 0;
    c + 1, 0, 0, s;
    s, 0, 0, 1 - c;
    0, -s, c - 1, 0]

/-- The block of `flowMat c s` on (e₃, e₅, e₆, e₇). -/
def blockB (c s : ℝ) : Matrix (Fin 4) (Fin 4) ℝ := !![0, -s, 0, 1 - c;
    s, 0, 1 - c, 0;
    0, c - 1, 0, -s;
    c - 1, 0, s, 0]

end OctonionD8
