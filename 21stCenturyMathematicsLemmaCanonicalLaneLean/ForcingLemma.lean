import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean

structure ForcingExtensions where
  groundModel : Type u
  genericFilter : Type v
  forcingRelation : Prop
  extensionModel : Type w
  truthLemma : Prop
  definabilityLemma : Prop

structure ForcingEvidence (F : ForcingExtensions) where
  forcingRelationClosed : F.forcingRelation
  truthLemmaClosed : F.truthLemma
  definabilityLemmaClosed : F.definabilityLemma

def ForcingExtensionsClosed (F : ForcingExtensions) : Prop :=
  F.forcingRelation ∧ F.truthLemma ∧ F.definabilityLemma

theorem forcing_extensions_closed_from_evidence
    (F : ForcingExtensions) (E : ForcingEvidence F) : ForcingExtensionsClosed F := by
  exact And.intro E.forcingRelationClosed
    (And.intro E.truthLemmaClosed E.definabilityLemmaClosed)

end TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean
end HautevilleHouse