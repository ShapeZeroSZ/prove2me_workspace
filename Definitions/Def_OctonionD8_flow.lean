import Mathlib
import Definitions.Def_RolesForceSeven_fano

namespace OctonionD8

open Polynomial RolesForceSeven

/-- The Fano point labelling the imaginary unit `e_i` (`i = 1, …, 7` ↦ point `i - 1`). -/
def fanoPoint (i : Fin 8) : Fin 7 := ⟨(i.val + 6) % 7, Nat.mod_lt _ (by norm_num)⟩

/-- Structure constants of the octonion product on ℝ⁸ (index 0 = the real unit),
from mission 5's Fano lines {i, i+1, i+3} (mod 7), oriented cyclically:
e_{i+1} e_{i+2} = e_{i+4}, with e_k² = −1 and anticommuting distinct units.
`octTable i j k` is the coefficient of `e_k` in `e_i e_j`. -/
def octTable (i j k : Fin 8) : ℤ :=
  if i = 0 then (if j = k then 1 else 0)
  else if j = 0 then (if i = k then 1 else 0)
  else if i = j then (if k = 0 then -1 else 0)
  else if k = 0 then 0
  else if ∃ l : Fin 7, fanoLine l = {fanoPoint i, fanoPoint j, fanoPoint k} ∧
      ((fanoPoint i = l ∧ fanoPoint j = l + 1) ∨ (fanoPoint i = l + 1 ∧ fanoPoint j = l + 3) ∨
        (fanoPoint i = l + 3 ∧ fanoPoint j = l)) then 1
  else if ∃ l : Fin 7, fanoLine l = {fanoPoint i, fanoPoint j, fanoPoint k} then -1
  else 0

/-- The octonion product. -/
def omul (p q : Fin 8 → ℝ) : Fin 8 → ℝ :=
  fun k => ∑ i, ∑ j, p i * q j * (octTable i j k : ℝ)

/-- Matrix of p ↦ p · a (right multiplication by a). -/
def Rmat (a : Fin 8 → ℝ) : Matrix (Fin 8) (Fin 8) ℝ :=
  fun k j => omul (Pi.single j 1) a k

/-- Matrix of p ↦ b · p (left multiplication by b). -/
def Lmat (b : Fin 8 → ℝ) : Matrix (Fin 8) (Fin 8) ℝ :=
  fun k j => omul b (Pi.single j 1) k

/-- The two-generator flow for a = e₁, b = c·e₁ + s·e₂. -/
def flowMat (c s : ℝ) : Matrix (Fin 8) (Fin 8) ℝ :=
  Rmat (Pi.single 1 1) + Lmat (fun i => if i = 1 then c else if i = 2 then s else 0)

end OctonionD8
