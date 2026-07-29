import DiscreteDifferentialGeometryCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse
