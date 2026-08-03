import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean

structure LargeCardinalAxioms where
  inaccessibleExists : Prop
  measurableExists : Prop
  strongCompactExists : Prop
  supercompactExists : Prop
  hugenessExists : Prop

structure LargeCardinalEvidence (L : LargeCardinalAxioms) where
  inaccessibleExistsClosed : L.inaccessibleExists
  measurableExistsClosed : L.measurableExists
  strongCompactExistsClosed : L.strongCompactExists
  supercompactExistsClosed : L.supercompactExists
  hugenessExistsClosed : L.hugenessExists

def LargeCardinalAxiomsClosed (L : LargeCardinalAxioms) : Prop :=
  L.inaccessibleExists ∧ L.measurableExists ∧ L.strongCompactExists ∧
  L.supercompactExists ∧ L.hugenessExists

theorem large_cardinal_axioms_closed_from_evidence
    (L : LargeCardinalAxioms) (E : LargeCardinalEvidence L) : LargeCardinalAxiomsClosed L := by
  exact And.intro E.inaccessibleExistsClosed
    (And.intro E.measurableExistsClosed
      (And.intro E.strongCompactExistsClosed
        (And.intro E.supercompactExistsClosed E.hugenessExistsClosed)))

end TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean
end HautevilleHouse