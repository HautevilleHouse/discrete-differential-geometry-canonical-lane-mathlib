import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteIndexTheoremPackage {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage (M : G.mesh)}
    (P : DiscreteGaussBonnetPackage C) where
  diracOperator : Type u
  index : ℤ
  analyticIndex : ℤ
  topologicalIndex : ℤ
  indexTheoremEquality : Prop
  kernelCokernelComputed : Prop

structure DiscreteIndexTheoremEvidence {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage (M : G.mesh)}
    {P : DiscreteGaussBonnetPackage C}
    (I : DiscreteIndexTheoremPackage P) where
  indexTheoremEqualityClosed : I.indexTheoremEquality
  kernelCokernelComputedClosed : I.kernelCokernelComputed

def DiscreteIndexTheoremClosed {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage (M : G.mesh)}
    {P : DiscreteGaussBonnetPackage C}
    (I : DiscreteIndexTheoremPackage P) : Prop :=
  I.indexTheoremEquality ∧ I.kernelCokernelComputed

theorem discrete_index_theorem_closed_from_evidence
    {G : DiscreteRiemannianCurvaturePackage}
    {C : DiscreteConnectionPackage (M : G.mesh)}
    {P : DiscreteGaussBonnetPackage C}
    (I : DiscreteIndexTheoremPackage P) (E : DiscreteIndexTheoremEvidence I) :
    DiscreteIndexTheoremClosed I := by
  exact And.intro E.indexTheoremEqualityClosed E.kernelCokernelComputedClosed

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse