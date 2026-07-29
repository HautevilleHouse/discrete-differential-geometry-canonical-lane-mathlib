import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteLaplacianPackage where
  graph : Type u
  vertexSet : Type v
  laplacianMatrix : Type w
  spectralProperties : Prop
  harmonicFunctions : Prop
  eigenfunctionExpansion : Prop

structure DiscreteLaplacianEvidence (L : DiscreteLaplacianPackage) where
  spectralPropertiesClosed : L.spectralProperties
  harmonicFunctionsClosed : L.harmonicFunctions
  eigenfunctionExpansionClosed : L.eigenfunctionExpansion

def DiscreteLaplacianClosed (L : DiscreteLaplacianPackage) : Prop :=
  L.spectralProperties ∧ L.harmonicFunctions ∧ L.eigenfunctionExpansion

theorem discrete_laplacian_closed_from_evidence
    (L : DiscreteLaplacianPackage) (E : DiscreteLaplacianEvidence L) :
    DiscreteLaplacianClosed L := by
  exact And.intro E.spectralPropertiesClosed
    (And.intro E.harmonicFunctionsClosed E.eigenfunctionExpansionClosed)

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse