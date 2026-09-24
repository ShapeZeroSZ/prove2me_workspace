import Mathlib

namespace RolesForceSeven

/-- A Steiner triple system on the points `Fin n`: every line has three points,
and every pair of distinct points lies on exactly one line. -/
structure STS (n : ℕ) where
  lines : Finset (Finset (Fin n))
  card_three : ∀ l ∈ lines, l.card = 3
  pair_unique : ∀ x y : Fin n, x ≠ y → ∃! l, l ∈ lines ∧ x ∈ l ∧ y ∈ l

/-- A role colouring (C1 Definition 3.5). `role x l` is the role of point `x` on
line `l`; only its values for `x ∈ l ∈ lines` matter. -/
def RoleColouring {n : ℕ} (S : STS n) (role : Fin n → Finset (Fin n) → Fin 3) :
    Prop :=
  -- the three points of a line get different roles
  (∀ l ∈ S.lines, ∀ x ∈ l, ∀ y ∈ l, role x l = role y l → x = y) ∧
  -- completeness: every point takes every role at least once
  (∀ x : Fin n, ∀ ρ : Fin 3, ∃ l ∈ S.lines, x ∈ l ∧ role x l = ρ) ∧
  -- minimality: every point takes every role at most once
  (∀ x : Fin n, ∀ l ∈ S.lines, ∀ l' ∈ S.lines, x ∈ l → x ∈ l' →
      role x l = role x l' → l = l')

end RolesForceSeven
