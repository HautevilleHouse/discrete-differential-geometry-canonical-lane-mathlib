import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteConnectionPackage where
  fiber : Type u
  base : Type v
  parallelTransport : fiber -> fiber -> Prop
  curvatureHolonomy : Prop
  connectionConsistent : Prop

structure DiscreteConnectionEvidence (C : DiscreteConnectionPackage) where
  curvatureHolonomyClosed : C.curvatureHolonomy
  connectionConsistentClosed : C.connectionConsistent

def DiscreteConnectionClosed (C : DiscreteConnectionPackage) : Prop :=
  C.curvatureHolonomy ∧ C.connectionConsistent

theorem discrete_connection_closed_from_evidence
    (C : DiscreteConnectionPackage) (E : DiscreteConnectionEvidence C) :
    DiscreteConnectionClosed C := by
  exact And.intro E.curvatureHolonomyClosed E.connectionConsistentClosed

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse