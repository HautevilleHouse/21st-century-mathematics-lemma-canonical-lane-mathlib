import PoincareConjectureCanonicalLaneLean.PerelmanAnalyticProof

/-!
# Perelman Analytic Evidence Terms

This module exposes the proof terms carried by each analytic certificate. The
route is term-level: every analytic field has a named Lean term, and those terms
project into the Perelman route closure.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure CurvatureAnalyticEvidenceTerms {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) where
  riemannTensorSymmetries : C.riemannTensorSymmetries
  bianchiIdentities : C.bianchiIdentities
  ricciContractionLaw : C.ricciContractionLaw
  scalarTraceLaw : C.scalarTraceLaw
  curvatureEvolutionInputs : C.curvatureEvolutionInputs
  curvatureClosed : RiemannianCurvatureClosed G

def CurvatureAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) : CurvatureAnalyticEvidenceTerms C :=
  {
    riemannTensorSymmetries := C.riemannTensorSymmetriesClosed
    bianchiIdentities := C.bianchiIdentitiesClosed
    ricciContractionLaw := C.ricciContractionLawClosed
    scalarTraceLaw := C.scalarTraceLawClosed
    curvatureEvolutionInputs := C.curvatureEvolutionInputsClosed
    curvatureClosed := riemannian_curvature_closed_from_evidence G C.curvatureEvidence
  }

structure HamiltonDeTurckEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) where
  gaugeChoice : H.gaugeChoice
  stronglyParabolicReduction : H.stronglyParabolicReduction
  deTurckVectorField : H.deTurckVectorField
  pullbackRecoversRicciFlow : H.pullbackRecoversRicciFlow
  uniquenessCompatibility : H.uniquenessCompatibility
  flowClosed : RicciFlowPDEClosed F

def HamiltonDeTurckCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) :
    HamiltonDeTurckEvidenceTerms H :=
  {
    gaugeChoice := H.gaugeChoiceClosed
    stronglyParabolicReduction := H.stronglyParabolicReductionClosed
    deTurckVectorField := H.deTurckVectorFieldClosed
    pullbackRecoversRicciFlow := H.pullbackRecoversRicciFlowClosed
    uniquenessCompatibility := H.uniquenessCompatibilityClosed
    flowClosed := ricci_flow_pde_closed_from_evidence F H.flowEvidence
  }

structure ShortTimeEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) where
  parabolicRegularity : C.parabolicRegularity
  localExistenceInterval : C.localExistenceInterval
  uniquenessOnOverlap : C.uniquenessOnOverlap
  continuationCriterion : C.continuationCriterion
  shortTimeClosed : ShortTimeExistenceClosed S

def ShortTimeAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) : ShortTimeEvidenceTerms C :=
  {
    parabolicRegularity := C.parabolicRegularityClosed
    localExistenceInterval := C.localExistenceIntervalClosed
    uniquenessOnOverlap := C.uniquenessOnOverlapClosed
    continuationCriterion := C.continuationCriterionClosed
    shortTimeClosed := short_time_existence_closed_from_evidence S C.shortTimeEvidence
  }

structure EntropyEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) where
  conjugateHeatEquation : C.conjugateHeatEquation
  wFunctionalDefined : C.wFunctionalDefined
  muFunctionalDefined : C.muFunctionalDefined
  entropyMonotonicityFormula : C.entropyMonotonicityFormula
  reducedVolumeMonotonicity : C.reducedVolumeMonotonicity
  entropyClosed : PerelmanEntropyClosed E

def EntropyAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) :
    EntropyEvidenceTerms C :=
  {
    conjugateHeatEquation := C.conjugateHeatEquationClosed
    wFunctionalDefined := C.wFunctionalDefinedClosed
    muFunctionalDefined := C.muFunctionalDefinedClosed
    entropyMonotonicityFormula := C.entropyMonotonicityFormulaClosed
    reducedVolumeMonotonicity := C.reducedVolumeMonotonicityClosed
    entropyClosed := perelman_entropy_closed_from_evidence E C.entropyEvidence
  }

structure NoncollapsingEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) where
  noLocalCollapsing : C.noLocalCollapsing
  scaleInvariantVolumeLowerBound : C.scaleInvariantVolumeLowerBound
  curvatureScaleCompatibility : C.curvatureScaleCompatibility
  ancientSolutionCompactnessInput : C.ancientSolutionCompactnessInput
  noncollapsingClosed : NoncollapsingClosed N

def NoncollapsingAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) : NoncollapsingEvidenceTerms C :=
  {
    noLocalCollapsing := C.noLocalCollapsingClosed
    scaleInvariantVolumeLowerBound := C.scaleInvariantVolumeLowerBoundClosed
    curvatureScaleCompatibility := C.curvatureScaleCompatibilityClosed
    ancientSolutionCompactnessInput := C.ancientSolutionCompactnessInputClosed
    noncollapsingClosed := noncollapsing_closed_from_evidence N C.noncollapsingEvidence
  }

/-- Aggregated analytic evidence terms for the Perelman route. -/
structure PerelmanAnalyticEvidenceTerms
    {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage E}
    (C : CurvatureAnalyticCertificate G)
    (H : HamiltonDeTurckCertificate F)
    (ST : ShortTimeAnalyticCertificate S)
    (Ent : EntropyAnalyticCertificate E)
    (Non : NoncollapsingAnalyticCertificate N) where
  curvature : CurvatureAnalyticEvidenceTerms C
  deTurck : HamiltonDeTurckEvidenceTerms H
  shortTime : ShortTimeEvidenceTerms ST
  entropy : EntropyEvidenceTerms Ent
  noncollapsing : NoncollapsingEvidenceTerms Non

/-- Construct the aggregated evidence terms from the analytic certificates. -/
def perelmanAnalyticEvidenceTerms
    {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage E}
    (C : CurvatureAnalyticCertificate G)
    (H : HamiltonDeTurckCertificate F)
    (ST : ShortTimeAnalyticCertificate S)
    (Ent : EntropyAnalyticCertificate E)
    (Non : NoncollapsingAnalyticCertificate N) :
    PerelmanAnalyticEvidenceTerms C H ST Ent Non :=
  {
    curvature := C.evidenceTerms
    deTurck := H.evidenceTerms
    shortTime := ST.evidenceTerms
    entropy := Ent.evidenceTerms
    noncollapsing := Non.evidenceTerms
  }

/-- The admissible-class bridge: each analytic certificate projects into the
closed evidence fields that define the Perelman route closure. -/
theorem admissible_class_bridge
    {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage E}
    (C : CurvatureAnalyticCertificate G)
    (H : HamiltonDeTurckCertificate F)
    (ST : ShortTimeAnalyticCertificate S)
    (Ent : EntropyAnalyticCertificate E)
    (Non : NoncollapsingAnalyticCertificate N) :
    CurvatureAnalyticEvidenceTerms C ∧
    HamiltonDeTurckEvidenceTerms H ∧
    ShortTimeEvidenceTerms ST ∧
    EntropyEvidenceTerms Ent ∧
    NoncollapsingEvidenceTerms Non :=
  ⟨C.evidenceTerms, ⟨H.evidenceTerms, ⟨ST.evidenceTerms, ⟨Ent.evidenceTerms, Non.evidenceTerms⟩⟩⟩⟩

/-- The 21st Century Mathematics Lemma: the analytic certificates carry enough
evidence to close the Perelman route. -/
theorem twenty_first_century_mathematics_lemma
    {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage E}
    (C : CurvatureAnalyticCertificate G)
    (H : HamiltonDeTurckCertificate F)
    (ST : ShortTimeAnalyticCertificate S)
    (Ent : EntropyAnalyticCertificate E)
    (Non : NoncollapsingAnalyticCertificate N) :
    PerelmanAnalyticEvidenceTerms C H ST Ent Non :=
  perelmanAnalyticEvidenceTerms C H ST Ent Non

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse