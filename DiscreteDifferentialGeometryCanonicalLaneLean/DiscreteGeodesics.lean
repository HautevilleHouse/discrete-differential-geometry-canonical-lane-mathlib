import DiscreteDifferentialGeometryCanonicalLaneLean.DiscreteConnection

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteGeodesicPackage (C : DiscreteConnectionPackage) where
  pathSet : Type u
  geodesicCondition : pathSet → Prop
  locallyLengthMinimizing : Prop
  existenceForEachDirection : Prop
  geodesicClosed : Prop

structure DiscreteGeodesicEvidence {C : DiscreteConnectionPackage}
    (G : DiscreteGeodesicPackage C) where
  locallyLengthMinimizingClosed : G.locallyLengthMinimizing
  existenceForEachDirectionClosed : G.existenceForEachDirection
  geodesicClosedClosed : G.geodesicClosed

def DiscreteGeodesicClosed {C : DiscreteConnectionPackage}
    (G : DiscreteGeodesicPackage C) : Prop :=
  G.locallyLengthMinimizing ∧ G.existenceForEachDirection ∧ G.geodesicClosed

theorem discrete_geodesic_closed_from_evidence {C : DiscreteConnectionPackage}
    (G : DiscreteGeodesicPackage C) (E : DiscreteGeodesicEvidence G) :
    DiscreteGeodesicClosed G :=
  And.intro E.locallyLengthMinimizingClosed (And.intro E.existenceForEachDirectionClosed E.geodesicClosedClosed)

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse
