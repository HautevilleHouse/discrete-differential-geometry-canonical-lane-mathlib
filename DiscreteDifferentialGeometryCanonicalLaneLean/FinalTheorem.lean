import DiscreteDifferentialGeometryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

def ConstrainedDiscreteGeometryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_geometry_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteGeometryClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse
