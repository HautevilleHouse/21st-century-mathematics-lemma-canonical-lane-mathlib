import Mathlib.Logic.Basic

/-!
# Admissible Class for 21st Century Mathematics Lemma

This module defines the admissible-class bridge for the 21st Century
Mathematics Lemma canonical lane. The admissible class packages a lemma
object together with the endpoint/remainder gate that tracks whether the
formalized statement is directly satisfied or whether an explicit remainder
has been recorded.
-/

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean

/-- A lemma object for the 21st Century Mathematics lane. -/
structure CenturyLemmaObject where
  statement : Prop
  conclusion : statement

/-- The admissible class for the canonical lane bridge. -/
structure AdmissibleClass where
  object : CenturyLemmaObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

/-- The closure of an admissible class: the lemma statement is witnessed and
the gate is closed. -/
def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.statement ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

/-- The object's own conclusion is the bridge witness. -/
def LemmaWitnessClosed (O : CenturyLemmaObject) : Prop :=
  O.statement

end TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean
end HautevilleHouse