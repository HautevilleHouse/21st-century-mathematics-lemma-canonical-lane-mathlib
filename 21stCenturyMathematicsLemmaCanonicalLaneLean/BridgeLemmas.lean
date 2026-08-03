import TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Bridge Lemmas for the 21st Century Mathematics Lemma

The bridge lemmas connect the admissible class to the lemma-object witness.
-/

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean

/-- The bridge is closed when the lemma object's statement is witnessed. -/
def bridgeClosed (A : AdmissibleClass) : Prop :=
  LemmaWitnessClosed A.object

/-- Every admissible class supplies the bridge closure from its object's conclusion. -/
theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean
end HautevilleHouse