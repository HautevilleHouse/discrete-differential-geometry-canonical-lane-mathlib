import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

/-!
# Discrete Geodesic Package

This module defines discrete geodesics and their curvature.
-/

structure DiscreteGeodesicPackage where
  discreteSurface : Type u
  vertexPath : Type v
  geodesicProperty : vertexPath → Prop
  geodesicCurvature : vertexPath → ℝ
  geodesicEquation : Prop
  geodesicInvariant : Prop
  geodesicClosed : Prop

structure DiscreteGeodesicEvidence (G : DiscreteGeodesicPackage) where
  geodesicEquationClosed : G.geodesicEquation
  geodesicInvariantClosed : G.geodesicInvariant
  geodesicClosedTerm : G.geodesicClosed

def DiscreteGeodesicClosed (G : DiscreteGeodesicPackage) : Prop :=
  G.geodesicEquation ∧ G.geodesicInvariant ∧ G.geodesicClosed

theorem discrete_geodesic_closed_from_evidence (G : DiscreteGeodesicPackage)
    (E : DiscreteGeodesicEvidence G) : DiscreteGeodesicClosed G := by
  exact And.intro E.geodesicEquationClosed
    (And.intro E.geodesicInvariantClosed E.geodesicClosedTerm)

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse