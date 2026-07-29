import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteConnectionPackage {G : DiscreteRiemannianCurvaturePackage}
    (M : G.mesh) where
  connectionCoefficients : Type u
  parallelTransport : Type v
  holonomyGroup : Type w
  metricCompatible : Prop
  torsionFree : Prop
  curvatureFromConnection : Prop
  holonomyRepresentation : Prop

structure DiscreteConnectionEvidence {G : DiscreteRiemannianCurvaturePackage}
    {M : G.mesh} (C : DiscreteConnectionPackage M) where
  metricCompatibleClosed : C.metricCompatible
  torsionFreeClosed : C.torsionFree
  curvatureFromConnectionClosed : C.curvatureFromConnection
  holonomyRepresentationClosed : C.holonomyRepresentation

def DiscreteConnectionClosed {G : DiscreteRiemannianCurvaturePackage}
    {M : G.mesh} (C : DiscreteConnectionPackage M) : Prop :=
  C.metricCompatible ∧ C.torsionFree ∧
  C.curvatureFromConnection ∧ C.holonomyRepresentation

theorem discrete_connection_closed_from_evidence
    {G : DiscreteRiemannianCurvaturePackage} {M : G.mesh}
    (C : DiscreteConnectionPackage M) (E : DiscreteConnectionEvidence C) :
    DiscreteConnectionClosed C := by
  exact And.intro E.metricCompatibleClosed
    (And.intro E.torsionFreeClosed
      (And.intro E.curvatureFromConnectionClosed
        E.holonomyRepresentationClosed))

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse