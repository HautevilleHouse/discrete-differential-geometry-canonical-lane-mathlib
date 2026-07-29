import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteGaussBonnetPackage {G : DiscreteRiemannianCurvaturePackage}
    (C : DiscreteConnectionPackage (M : G.mesh)) where
  eulerCharacteristic : ℤ
  totalCurvature : Prop
  angleDefectSum : Prop
  boundaryTerms : Prop
  formulaMatchesEuler : Prop

structure DiscreteGaussBonnetEvidence {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage (M : G.mesh)}
    (P : DiscreteGaussBonnetPackage C) where
  totalCurvatureClosed : P.totalCurvature
  angleDefectSumClosed : P.angleDefectSum
  boundaryTermsClosed : P.boundaryTerms
  formulaMatchesEulerClosed : P.formulaMatchesEuler

def DiscreteGaussBonnetClosed {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage (M : G.mesh)}
    (P : DiscreteGaussBonnetPackage C) : Prop :=
  P.totalCurvature ∧ P.angleDefectSum ∧
  P.boundaryTerms ∧ P.formulaMatchesEuler

theorem discrete_gauss_bonnet_closed_from_evidence
    {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage (M : G.mesh)}
    (P : DiscreteGaussBonnetPackage C) (E : DiscreteGaussBonnetEvidence P) :
    DiscreteGaussBonnetClosed P := by
  exact And.intro E.totalCurvatureClosed
    (And.intro E.angleDefectSumClosed
      (And.intro E.boundaryTermsClosed E.formulaMatchesEulerClosed))

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse