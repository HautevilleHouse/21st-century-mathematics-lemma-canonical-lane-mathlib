import PoincareConjectureCanonicalLaneLean.ShortTimeExistence

/-!
# Perelman Entropy Package
-/

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean

open PoincareConjectureCanonicalLaneLean

universe u v

structure PerelmanEntropyPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (S : ShortTimeExistencePackage F) where
  entropyFunctional : Type u
  reducedVolume : Type v
  monotonicityFormula : Prop
  entropyLowerBound : Prop
  noLocalCollapsingInput : Prop

structure PerelmanEntropyEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (Epkg : PerelmanEntropyPackage S) where
  monotonicityFormulaClosed : Epkg.monotonicityFormula
  entropyLowerBoundClosed : Epkg.entropyLowerBound
  noLocalCollapsingInputClosed : Epkg.noLocalCollapsingInput

def PerelmanEntropyClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (Epkg : PerelmanEntropyPackage S) : Prop := 
  Epkg.monotonicityFormula ∧ Epkg.entropyLowerBound ∧ Epkg.noLocalCollapsingInput

theorem perelman_entropy_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} (Epkg : PerelmanEntropyPackage S)
    (E : PerelmanEntropyEvidence Epkg) : PerelmanEntropyClosed Epkg := by
  exact And.intro E.monotonicityFormulaClosed
    (And.intro E.entropyLowerBoundClosed E.noLocalCollapsingInputClosed)

/-! ## 21st Century Mathematics Lemma bridges -/

def TwentyFirstCenturyMathematicsLemmaStatement
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} (Epkg : PerelmanEntropyPackage S) : Prop :=
  PerelmanEntropyClosed Epkg

structure AdmissibleClassBridge
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} (Epkg : PerelmanEntropyPackage S) where
  forward : PerelmanEntropyClosed Epkg → TwentyFirstCenturyMathematicsLemmaStatement Epkg
  backward : TwentyFirstCenturyMathematicsLemmaStatement Epkg → PerelmanEntropyClosed Epkg

structure TwentyFirstCenturyMathematicsLemmaPackage
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} (Epkg : PerelmanEntropyPackage S) where
  entropyClosed : PerelmanEntropyClosed Epkg
  bridge : AdmissibleClassBridge Epkg
  bridgeForward : bridge.forward entropyClosed

structure TwentyFirstCenturyMathematicsLemmaEvidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    (Mpkg : TwentyFirstCenturyMathematicsLemmaPackage Epkg) where
  entropyEvidence : PerelmanEntropyEvidence Epkg
  bridgeBackward : Mpkg.bridge.backward Mpkg.bridgeForward = Mpkg.entropyClosed

theorem twenty_first_century_mathematics_lemma_of_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    (Mpkg : TwentyFirstCenturyMathematicsLemmaPackage Epkg) : 
    TwentyFirstCenturyMathematicsLemmaStatement Epkg := by
  exact Mpkg.bridgeForward

end TwentyFirstCenturyMathematicsLemmaCanonicalLaneLean
end HautevilleHouse