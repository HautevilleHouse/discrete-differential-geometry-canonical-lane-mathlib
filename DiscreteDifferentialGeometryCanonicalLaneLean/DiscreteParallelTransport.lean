import DiscreteDifferentialGeometryCanonicalLaneLean.DiscreteConnection

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteParallelTransportPackage (C : DiscreteConnectionPackage) where
  pathSet : Type u
  transportMap : pathSet → ℝ
  compositionLaw : ∀ p q : pathSet, transportMap (p ++ q) = transportMap p * transportMap q
  identityLaw : ∀ v : C.vertexSet, transportMap (identityPath v) = 1
  inverseLaw : ∀ p : pathSet, transportMap (reverse p) = (transportMap p)⁻¹
  parallelTransportClosed : Prop

structure DiscreteParallelTransportEvidence {C : DiscreteConnectionPackage}
    (T : DiscreteParallelTransportPackage C) where
  compositionClosed : T.compositionLaw
  identityClosed : T.identityLaw
  inverseClosed : T.inverseLaw
  parallelTransportClosedClosed : T.parallelTransportClosed

def DiscreteParallelTransportClosed {C : DiscreteConnectionPackage}
    (T : DiscreteParallelTransportPackage C) : Prop :=
  T.compositionLaw ∧ T.identityLaw ∧ T.inverseLaw ∧ T.parallelTransportClosed

theorem discrete_parallel_transport_closed_from_evidence
    {C : DiscreteConnectionPackage} (T : DiscreteParallelTransportPackage C)
    (E : DiscreteParallelTransportEvidence T) : DiscreteParallelTransportClosed T :=
  And.intro E.compositionClosed (And.intro E.identityClosed (And.intro E.inverseClosed E.parallelTransportClosedClosed))

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse
