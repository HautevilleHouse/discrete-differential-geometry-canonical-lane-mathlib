import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteHolonomyPackage where
  loopSpace : Type u
  holonomyMap : loopSpace -> Type v
  monodromy : Prop
  invarianceUnderHomotopy : Prop
  holonomyGroup : Prop

structure DiscreteHolonomyEvidence (H : DiscreteHolonomyPackage) where
  monodromyClosed : H.monodromy
  invarianceUnderHomotopyClosed : H.invarianceUnderHomotopy
  holonomyGroupClosed : H.holonomyGroup

def DiscreteHolonomyClosed (H : DiscreteHolonomyPackage) : Prop :=
  H.monodromy ∧ H.invarianceUnderHomotopy ∧ H.holonomyGroup

theorem discrete_holonomy_closed_from_evidence
    (H : DiscreteHolonomyPackage) (E : DiscreteHolonomyEvidence H) :
    DiscreteHolonomyClosed H := by
  exact And.intro E.monodromyClosed
    (And.intro E.invarianceUnderHomotopyClosed E.holonomyGroupClosed)

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse