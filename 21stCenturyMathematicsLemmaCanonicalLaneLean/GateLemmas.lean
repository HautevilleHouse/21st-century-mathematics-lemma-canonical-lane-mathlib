import TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean.BridgeLemmas

/-!
# Gate Lemmas for the 21st Century Mathematics Lemma

The gate lemmas close the endpoint-or-remainder gate carried by the
admissible class.
-/

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean

/-- The gate is closed when either the endpoint is satisfied or a remainder
has been recorded. -/
def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

/-- Every admissible class supplies a gate witness. -/
theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean
end HautevilleHouse