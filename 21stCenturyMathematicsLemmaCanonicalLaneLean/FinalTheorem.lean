import TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean.GateLemmas

/-!
# Final Theorem for the 21st Century Mathematics Lemma

The final theorem combines the bridge and gate closures into the constrained
lemma closure.
-/

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean

/-- The constrained closure of the 21st Century Mathematics Lemma lane. -/
def ConstrainedLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

/-- The endgame theorem: every admissible class reaches constrained closure. -/
theorem constrained_lemma_endgame (A : AdmissibleClass) :
    ConstrainedLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean
end HautevilleHouse