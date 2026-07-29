import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteDifferentialGeometrySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DiscreteDifferentialGeometryAdmittedObject where
  space : DiscreteDifferentialGeometrySpace
  discreteStructure : Prop
  differentialStructure : Prop
  curvatureInvariants : Prop
  conclusion : discreteStructure ∧ differentialStructure ∧ curvatureInvariants

def DiscreteDifferentialGeometryWitnessClosed (O : DiscreteDifferentialGeometryAdmittedObject) : Prop :=
  O.discreteStructure ∧ O.differentialStructure ∧ O.curvatureInvariants

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse