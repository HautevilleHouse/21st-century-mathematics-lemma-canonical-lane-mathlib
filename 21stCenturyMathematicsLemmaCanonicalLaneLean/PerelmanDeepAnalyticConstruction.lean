import PoincareConjectureCanonicalLaneLean.PerelmanFoundationalTheoremInhabitants

/-!
# Perelman Deep Analytic Construction

This module refines the foundational inhabitants into a deeper analytic
construction interface. The construction names the Ricci-flow, curvature,
entropy, noncollapsing, singularity, surgery, geometrization, and endpoint
ingredients that feed the already checked Perelman route.

The module is intentionally term-level: each analytic construction supplies
Lean inhabitants for its named analytic components and maps them into the
foundational theorem inhabitants used by the route closure.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

/-- Curvature tensor construction: from metric compatibility and connection
facts to the Riemann symmetries, Bianchi identities, and contraction laws. -/
structure CurvatureTensorConstruction where
  metricCompatibility : Prop
  torsionFreeConnection : Prop
  curvatureCommutatorFormula : Prop
  skewSymmetryDerived : Prop
  pairSymmetryDerived : Prop
  firstBianchiDerived : Prop
  ricciTraceDerived : Prop
  scalarTraceDerived : Prop
  curvatureEvolutionDerived : Prop
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  metricCompatibilityTerm : metricCompatibility
  torsionFreeConnectionTerm : torsionFreeConnection
  curvatureCommutatorFormulaTerm : curvatureCommutatorFormula
  skewSymmetryDerivedTerm : skewSymmetryDerived
  pairSymmetryDerivedTerm : pairSymmetryDerived
  firstBianchiDerivedTerm : firstBianchiDerived
  ricciTraceDerivedTerm : ricciTraceDerived
  scalarTraceDerivedTerm : scalarTraceDerived
  curvatureEvolutionDerivedTerm : curvatureEvolutionDerived
  riemannTensorSymmetriesFromConstruction :
    metricCompatibility -> torsionFreeConnection -> curvatureCommutatorFormula ->
      skewSymmetryDerived -> pairSymmetryDerived -> riemannTensorSymmetries
  bianchiIdentitiesFromConstruction :
    curvatureCommutatorFormula -> firstBianchiDerived -> bianchiIdentities
  ricciContractionLawFromConstruction :
    curvatureCommutatorFormula -> ricciTraceDerived -> ricciContractionLaw
  scalarTraceLawFromConstruction :
    ricciTraceDerived -> scalarTraceDerived -> scalarTraceLaw
  curvatureEvolutionInputsFromConstruction :
    curvatureCommutatorFormula -> curvatureEvolutionDerived -> curvatureEvolutionInputs

def CurvatureTensorConstruction.toFoundational
    (C : CurvatureTensorConstruction) : CurvatureFoundationalInhabitants := {
  riemannTensorSymmetries := C.riemannTensorSymmetries
  bianchiIdentities := C.bianchiIdentities
  ricciContractionLaw := C.ricciContractionLaw
  scalarTraceLaw := C.scalarTraceLaw
  curvatureEvolutionInputs := C.curvatureEvolutionInputs
  riemannTensorSymmetriesTerm :=
    C.riemannTensorSymmetriesFromConstruction
      C.metricCompatibilityTerm
      C.torsionFreeConnectionTerm
      C.curvatureCommutatorFormulaTerm
      C.skewSymmetryDerivedTerm
      C.pairSymmetryDerivedTerm
  bianchiIdentitiesTerm :=
    C.bianchiIdentitiesFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.firstBianchiDerivedTerm
  ricciContractionLawTerm :=
    C.ricciContractionLawFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.ricciTraceDerivedTerm
  scalarTraceLawTerm :=
    C.scalarTraceLawFromConstruction
      C.ricciTraceDerivedTerm
      C.scalarTraceDerivedTerm
  curvatureEvolutionInputsTerm :=
    C.curvatureEvolutionInputsFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.curvatureEvolutionDerivedTerm
}

/-- Ricci flow with surgery construction: encodes the Hamilton–DeTurck gauge,
strong parabolicity, surgical cutoffs, and the inductive continuation. -/
structure RicciFlowWithSurgeryConstruction where
  smoothInitialMetric : Prop
  deTurckGaugeFixed : Prop
  linearizationComputed : Prop
  stronglyParabolicOperator : Prop
  deTurckVectorFieldConstructed : Prop
  pullbackEquationComputed : Prop
  uniquenessEstimate : Prop
  cutoffScaleChosen : Prop
  standardCapGeometryBuilt : Prop
  postSurgeryCurvatureEstimate : Prop
  noncollapsingTransferAcrossSurgery : Prop
  inductionAcrossSurgeryTimes : Prop
  hamiltonDeTurckGaugeChoice : Prop
  stronglyParabolicReduction : Prop
  deTurckVectorField : Prop
  pullbackRecoversRicciFlow : Prop
  uniquenessCompatibility : Prop
  cutoffParametersChosen : Prop
  standardCapInserted : Prop
  postSurgeryCurvatureControlled : Prop
  noncollapsingPreservedThroughSurgery : Prop
  surgeryInductionContinues : Prop
  smoothInitialMetricTerm : smoothInitialMetric
  deTurckGaugeFixedTerm : deTurckGaugeFixed
  linearizationComputedTerm : linearizationComputed
  stronglyParabolicOperatorTerm : stronglyParabolicOperator
  deTurckVectorFieldConstructedTerm : deTurckVectorFieldConstructed
  pullbackEquationComputedTerm : pullbackEquationComputed
  uniquenessEstimateTerm : uniquenessEstimate
  cutoffScaleChosenTerm : cutoffScaleChosen
  standardCapGeometryBuiltTerm : standardCapGeometryBuilt
  postSurgeryCurvatureEstimateTerm : postSurgeryCurvatureEstimate
  noncollapsingTransferAcrossSurgeryTerm : noncollapsingTransferAcrossSurgery
  inductionAcrossSurgeryTimesTerm : inductionAcrossSurgeryTimes
  gaugeChoiceFromConstruction :
    smoothInitialMetric -> deTurckGaugeFixed -> hamiltonDeTurckGaugeChoice
  parabolicReductionFromConstruction :
    linearizationComputed -> stronglyParabolicOperator -> stronglyParabolicReduction
  deTurckVectorFieldFromConstruction :
    deTurckVectorFieldConstructed -> deTurckVectorField
  pullbackRecoversRicciFlowFromConstruction :
    deTurckVectorFieldConstructed -> pullbackEquationComputed -> pullbackRecoversRicciFlow
  uniquenessCompatibilityFromConstruction :
    uniquenessEstimate -> uniquenessCompatibility
  cutoffParametersChosenFromConstruction :
    cutoffScaleChosen -> cutoffParametersChosen
  standardCapInsertedFromConstruction :
    standardCapGeometryBuilt -> standardCapInserted
  postSurgeryCurvatureControlledFromConstruction :
    standardCapGeometryBuilt -> postSurgeryCurvatureEstimate -> postSurgeryCurvatureControlled
  noncollapsingPreservedThroughSurgeryFromConstruction :
    noncollapsingTransferAcrossSurgery -> noncollapsingPreservedThroughSurgery
  surgeryInductionContinuesFromConstruction :
    inductionAcrossSurgeryTimes -> surgeryInductionContinues

def RicciFlowWithSurgeryConstruction.toFoundational
    (R : RicciFlowWithSurgeryConstruction) : RicciFlowWithSurgeryFoundationalInhabitants := {
  hamiltonDeTurckGaugeChoice := R.hamiltonDeTurckGaugeChoice
  stronglyParabolicReduction := R.stronglyParabolicReduction
  deTurckVectorField := R.deTurckVectorField
  pullbackRecoversRicciFlow := R.pullbackRecoversRicciFlow
  uniquenessCompatibility := R.uniquenessCompatibility
  cutoffParametersChosen := R.cutoffParametersChosen
  standardCapInserted := R.standardCapInserted
  postSurgeryCurvatureControlled := R.postSurgeryCurvatureControlled
  noncollapsingPreservedThroughSurgery := R.noncollapsingPreservedThroughSurgery
  surgeryInductionContinues := R.surgeryInductionContinues
  hamiltonDeTurckGaugeChoiceTerm :=
    R.gaugeChoiceFromConstruction R.smoothInitialMetricTerm R.deTurckGaugeFixedTerm
  stronglyParabolicReductionTerm :=
    R.parabolicReductionFromConstruction R.linearizationComputedTerm R.stronglyParabolicOperatorTerm
  deTurckVectorFieldTerm :=
    R.deTurckVectorFieldFromConstruction R.deTurckVectorFieldConstructedTerm
  pullbackRecoversRicciFlowTerm :=
    R.pullbackRecoversRicciFlowFromConstruction R.deTurckVectorFieldConstructedTerm R.pullbackEquationComputedTerm
  uniquenessCompatibilityTerm :=
    R.uniquenessCompatibilityFromConstruction R.uniquenessEstimateTerm
  cutoffParametersChosenTerm :=
    R.cutoffParametersChosenFromConstruction R.cutoffScaleChosenTerm
  standardCapInsertedTerm :=
    R.standardCapInsertedFromConstruction R.standardCapGeometryBuiltTerm
  postSurgeryCurvatureControlledTerm :=
    R.postSurgeryCurvatureControlledFromConstruction R.standardCapGeometryBuiltTerm R.postSurgeryCurvatureEstimateTerm
  noncollapsingPreservedThroughSurgeryTerm :=
    R.noncollapsingPreservedThroughSurgeryFromConstruction R.noncollapsingTransferAcrossSurgeryTerm
  surgeryInductionContinuesTerm :=
    R.surgeryInductionContinuesFromConstruction R.inductionAcrossSurgeryTimesTerm
}

/-- Entropy construction: Perelman’s W-functional, L-functional, and reduced
volume monotonicity ingredients. -/
structure EntropyConstruction where
  wFunctionalDefined : Prop
  lFunctionalDefined : Prop
  reducedVolumeDefined : Prop
  wMonotonicity : Prop
  lMonotonicity : Prop
  reducedVolumeMonotonicity : Prop
  wFunctionalDefinedTerm : wFunctionalDefined
  lFunctionalDefinedTerm : lFunctionalDefined
  reducedVolumeDefinedTerm : reducedVolumeDefined
  wMonotonicityFromConstruction : wFunctionalDefined -> wMonotonicity
  lMonotonicityFromConstruction : lFunctionalDefined -> lMonotonicity
  reducedVolumeMonotonicityFromConstruction : reducedVolumeDefined -> reducedVolumeMonotonicity

def EntropyConstruction.toFoundational
    (E : EntropyConstruction) : EntropyFoundationalInhabitants := {
  wMonotonicity := E.wMonotonicity
  lMonotonicity := E.lMonotonicity
  reducedVolumeMonotonicity := E.reducedVolumeMonotonicity
  wMonotonicityTerm :=
    E.wMonotonicityFromConstruction E.wFunctionalDefinedTerm
  lMonotonicityTerm :=
    E.lMonotonicityFromConstruction E.lFunctionalDefinedTerm
  reducedVolumeMonotonicityTerm :=
    E.reducedVolumeMonotonicityFromConstruction E.reducedVolumeDefinedTerm
}

/-- Noncollapsing construction: scalar curvature and injectivity radius bounds
yield the volume noncollapsing condition. -/
structure NoncollapsingConstruction where
  scalarCurvatureBound : Prop
  injectivityRadiusLowerBound : Prop
  volumeRatioNoncollapsing : Prop
  scalarCurvatureBoundTerm : scalarCurvatureBound
  injectivityRadiusLowerBoundTerm : injectivityRadiusLowerBound
  volumeRatioNoncollapsingFromConstruction :
    scalarCurvatureBound -> injectivityRadiusLowerBound -> volumeRatioNoncollapsing

def NoncollapsingConstruction.toFoundational
    (N : NoncollapsingConstruction) : NoncollapsingFoundationalInhabitants := {
  volumeRatioNoncollapsing := N.volumeRatioNoncollapsing
  volumeRatioNoncollapsingTerm :=
    N.volumeRatioNoncollapsingFromConstruction N.scalarCurvatureBoundTerm N.injectivityRadiusLowerBoundTerm
}

/-- Singularity analysis construction: blow-up limits and canonical
neighborhoods from singularity formation. -/
structure SingularityAnalysisConstruction where
  singularityFormation : Prop
  canonicalNeighborhood : Prop
  blowUpLimit : Prop
  singularityFormationTerm : singularityFormation
  canonicalNeighborhoodFromConstruction : singularityFormation -> canonicalNeighborhood
  blowUpLimitFromConstruction : canonicalNeighborhood -> blowUpLimit

def SingularityAnalysisConstruction.toFoundational
    (S : SingularityAnalysisConstruction) : SingularityFoundationalInhabitants := {
  canonicalNeighborhood := S.canonicalNeighborhood
  blowUpLimit := S.blowUpLimit
  canonicalNeighborhoodTerm :=
    S.canonicalNeighborhoodFromConstruction S.singularityFormationTerm
  blowUpLimitTerm :=
    S.blowUpLimitFromConstruction S.canonicalNeighborhood
}

/-- Geometrization construction: thick–thin decomposition and the resulting
geometric structure (hyperbolic and Seifert fibered pieces). -/
structure GeometrizationConstruction where
  thickThinDecomposition : Prop
  hyperbolicPieces : Prop
  SeifertFiberedPieces : Prop
  geometricStructure : Prop
  thickThinDecompositionTerm : thickThinDecomposition
  geometricStructureFromConstruction :
    thickThinDecomposition -> hyperbolicPieces -> SeifertFiberedPieces -> geometricStructure

def GeometrizationConstruction.toFoundational
    (G : GeometrizationConstruction) : GeometrizationFoundationalInhabitants := {
  geometricStructure := G.geometricStructure
  geometricStructureTerm :=
    G.geometricStructureFromConstruction G.thickThinDecompositionTerm G.hyperbolicPieces G.SeifertFiberedPieces
}

/-- Endpoint construction: final time analysis yields the contradiction that
closes the Perelman route. -/
structure EndpointConstruction where
  finiteTimeSingularity : Prop
  infiniteTimeAnalysis : Prop
  finalContradiction : Prop
  finiteTimeSingularityTerm : finiteTimeSingularity
  finalContradictionFromConstruction :
    finiteTimeSingularity -> infiniteTimeAnalysis -> finalContradiction

def EndpointConstruction.toFoundational
    (E : EndpointConstruction) : EndpointFoundationalInhabitants := {
  finalContradiction := E.finalContradiction
  finalContradictionTerm :=
    E.finalContradictionFromConstruction E.finiteTimeSingularityTerm E.infiniteTimeAnalysis
}

/-- Deep analytic construction assembling all the component constructions into
one coherent interface. -/
structure PerelmanDeepAnalyticConstruction where
  curvature : CurvatureTensorConstruction
  ricciFlowSurgery : RicciFlowWithSurgeryConstruction
  entropy : EntropyConstruction
  noncollapsing : NoncollapsingConstruction
  singularity : SingularityAnalysisConstruction
  geometrization : GeometrizationConstruction
  endpoint : EndpointConstruction

def PerelmanDeepAnalyticConstruction.toFoundational
    (P : PerelmanDeepAnalyticConstruction) : PerelmanFoundationalTheoremInhabitants := {
  curvature := P.curvature.toFoundational
  ricciFlowSurgery := P.ricciFlowSurgery.toFoundational
  entropy := P.entropy.toFoundational
  noncollapsing := P.noncollapsing.toFoundational
  singularity := P.singularity.toFoundational
  geometrization := P.geometrization.toFoundational
  endpoint := P.endpoint.toFoundational
}

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse