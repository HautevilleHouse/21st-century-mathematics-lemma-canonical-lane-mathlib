import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean

structure StableEmbedding where
  sourceStructure : Type u
  targetStructure : Type v
  embeddingMap : sourceStructure → targetStructure
  elementary : Prop
  stability : Prop

structure StableEmbeddingEvidence (S : StableEmbedding) where
  elementaryClosed : S.elementary
  stabilityClosed : S.stability

def StableEmbeddingClosed (S : StableEmbedding) : Prop :=
  S.elementary ∧ S.stability

theorem stable_embedding_closed_from_evidence
    (S : StableEmbedding) (E : StableEmbeddingEvidence S) : StableEmbeddingClosed S := by
  exact And.intro E.elementaryClosed E.stabilityClosed

end TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean
end HautevilleHouse