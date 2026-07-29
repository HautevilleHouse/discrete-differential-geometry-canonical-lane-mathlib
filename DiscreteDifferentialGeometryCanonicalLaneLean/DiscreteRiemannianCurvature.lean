import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteRiemannianCurvaturePackage where
  simplex : Type u
  edgeWeights : simplex -> simplex -> Prop
  curvatureAtEdge : simplex -> simplex -> Type v
  holonomyAngle : Type w
  discreteMetric : Prop
  curvatureDefined : Prop

structure DiscreteRiemannianCurvatureEvidence (G : DiscreteRiemannianCurvaturePackage) where
  discreteMetricClosed : G.discreteMetric
  curvatureDefinedClosed : G.curvatureDefined

def DiscreteRiemannianCurvatureClosed (G : DiscreteRiemannianCurvaturePackage) : Prop :=
  G.discreteMetric ∧ G.curvatureDefined

theorem discrete_riemannian_curvature_closed_from_evidence
    (G : DiscreteRiemannianCurvaturePackage) (E : DiscreteRiemannianCurvatureEvidence G) :
    DiscreteRiemannianCurvatureClosed G := by
  exact And.intro E.discreteMetricClosed E.curvatureDefinedClosed

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse