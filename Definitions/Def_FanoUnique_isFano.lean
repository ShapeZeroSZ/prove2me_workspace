import Mathlib
import Definitions.Def_RolesForceSeven_fano

namespace FanoUnique

open RolesForceSeven

/-- S is the Fano plane up to relabelling: a bijection of points carries S's
lines exactly onto the Fano plane's lines. -/
def IsFano {n : ℕ} (S : STS n) : Prop :=
  ∃ e : Fin n ≃ Fin 7,
    S.lines.image (fun l => l.map e.toEmbedding) = fano.lines

end FanoUnique
