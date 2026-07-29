import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure ReggeCalculusPackage where
  triangulation : Type u
  edgeLengths : Type v
  deficitAngles : Type w
  curvatureDefined : Prop
  reggeEquationsFormed : Prop
  convergenceToSmooth : Prop

structure ReggeCalculusEvidence (R : ReggeCalculusPackage) where
  curvatureDefinedClosed : R.curvatureDefined
  reggeEquationsFormedClosed : R.reggeEquationsFormed
  convergenceToSmoothClosed : R.convergenceToSmooth

def ReggeCalculusClosed (R : ReggeCalculusPackage) : Prop :=
  R.curvatureDefined ∧ R.reggeEquationsFormed ∧ R.convergenceToSmooth

theorem regge_calculus_closed_from_evidence
    (R : ReggeCalculusPackage) (E : ReggeCalculusEvidence R) :
    ReggeCalculusClosed R := by
  exact And.intro E.curvatureDefinedClosed
    (And.intro E.reggeEquationsFormedClosed E.convergenceToSmoothClosed)

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse