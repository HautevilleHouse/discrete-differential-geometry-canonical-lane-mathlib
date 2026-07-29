import DiscreteDifferentialGeometryCanonicalLaneLean.DiscreteConnection

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteDifferentialFormPackage (C : DiscreteConnectionPackage) where
  formDegree : ℕ
  formSpace : Type u
  wedgeProduct : formSpace → formSpace → formSpace
  exteriorDerivative : formSpace → formSpace
  gradedCommutativity : ∀ ω η : formSpace, wedgeProduct ω η = (-1)^(formDegree * formDegree) * wedgeProduct η ω
  nilpotentExteriorDerivative : ∀ ω : formSpace, exteriorDerivative (exteriorDerivative ω) = 0
  leibnizRule : ∀ ω η : formSpace, exteriorDerivative (wedgeProduct ω η) = wedgeProduct (exteriorDerivative ω) η + (-1)^formDegree * wedgeProduct ω (exteriorDerivative η)
  calculusClosed : Prop

structure DiscreteDifferentialFormEvidence {C : DiscreteConnectionPackage}
    (F : DiscreteDifferentialFormPackage C) where
  gradedCommutativityClosed : F.gradedCommutativity
  nilpotentExteriorDerivativeClosed : F.nilpotentExteriorDerivative
  leibnizRuleClosed : F.leibnizRule
  calculusClosedClosed : F.calculusClosed

def DiscreteDifferentialFormClosed {C : DiscreteConnectionPackage}
    (F : DiscreteDifferentialFormPackage C) : Prop :=
  F.gradedCommutativity ∧ F.nilpotentExteriorDerivative ∧ F.leibnizRule ∧ F.calculusClosed

theorem discrete_differential_form_closed_from_evidence {C : DiscreteConnectionPackage}
    (F : DiscreteDifferentialFormPackage C) (E : DiscreteDifferentialFormEvidence F) :
    DiscreteDifferentialFormClosed F :=
  And.intro E.gradedCommutativityClosed (And.intro E.nilpotentExteriorDerivativeClosed (And.intro E.leibnizRuleClosed E.calculusClosedClosed))

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse
