import DiscreteDifferentialGeometryCanonicalLaneLean.DiscreteCurvature

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure AdmissibleClass where
  object : DiscreteCurvaturePackage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DiscreteCurvatureClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse