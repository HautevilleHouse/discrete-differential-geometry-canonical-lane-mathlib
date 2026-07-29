import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteRiemannianCurvaturePackage where
  mesh : Type u
  vertexSet : Type v
  edgeSet : Type w
  faceSet : Type x
  discreteMetric : Type y
  discreteRiemannTensor : Type z
  discreteRicciTensor : Type a
  discreteScalarCurvature : Type b
  polyhedralStructure : Prop
  discreteMetricCompatible : Prop
  riemannTensorLawful : Prop
  ricciContractedFromRiemann : Prop
  scalarCurvatureTrace : Prop

structure DiscreteRiemannianCurvatureEvidence (G : DiscreteRiemannianCurvaturePackage) where
  polyhedralStructureClosed : G.polyhedralStructure
  discreteMetricCompatibleClosed : G.discreteMetricCompatible
  riemannTensorLawfulClosed : G.riemannTensorLawful
  ricciContractedFromRiemannClosed : G.ricciContractedFromRiemann
  scalarCurvatureTraceClosed : G.scalarCurvatureTrace

def DiscreteRiemannianCurvatureClosed (G : DiscreteRiemannianCurvaturePackage) : Prop :=
  G.polyhedralStructure ∧ G.discreteMetricCompatible ∧
  G.riemannTensorLawful ∧ G.ricciContractedFromRiemann ∧ G.scalarCurvatureTrace

theorem discrete_riemannian_curvature_closed_from_evidence
    (G : DiscreteRiemannianCurvaturePackage)
    (E : DiscreteRiemannianCurvatureEvidence G) :
    DiscreteRiemannianCurvatureClosed G := by
  exact And.intro E.polyhedralStructureClosed
    (And.intro E.discreteMetricCompatibleClosed
      (And.intro E.riemannTensorLawfulClosed
        (And.intro E.ricciContractedFromRiemannClosed
          E.scalarCurvatureTraceClosed)))

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse