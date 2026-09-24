import Mathlib
import Definitions.Def_RolesForceSeven_sts

namespace RolesForceSeven

/-- The Fano plane: lines {i, i+1, i+3} mod 7. -/
def fanoLine (i : Fin 7) : Finset (Fin 7) := {i, i + 1, i + 3}

set_option maxRecDepth 100000 in
def fano : STS 7 where
  lines := Finset.univ.image fanoLine
  card_three := by decide
  pair_unique := by
    have hex : ∀ x y : Fin 7, x ≠ y → ∃ i, x ∈ fanoLine i ∧ y ∈ fanoLine i := by decide
    have huniq : ∀ x y : Fin 7, x ≠ y → ∀ i j, x ∈ fanoLine i → y ∈ fanoLine i →
        x ∈ fanoLine j → y ∈ fanoLine j → fanoLine i = fanoLine j := by decide
    intro x y hxy
    obtain ⟨i, hxi, hyi⟩ := hex x y hxy
    refine ⟨fanoLine i, ⟨Finset.mem_image_of_mem _ (Finset.mem_univ i), hxi, hyi⟩, ?_⟩
    rintro l ⟨hl, hxl, hyl⟩
    obtain ⟨j, -, rfl⟩ := Finset.mem_image.1 hl
    exact huniq x y hxy j i hxl hyl hxi hyi

end RolesForceSeven
