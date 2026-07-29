import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteMorseFunctionPackage where
  vertexSet : Type u
  morseFunction : vertexSet → ℝ
  criticalPoints : Set vertexSet
  cellComplexHomotopy : Prop

structure DiscreteMorseFunctionEvidence (M : DiscreteMorseFunctionPackage) where
  criticalPointsIdentified : M.criticalPoints = {v | False}
  cellComplexHomotopyClosed : M.cellComplexHomotopy

def DiscreteMorseFunctionClosed (M : DiscreteMorseFunctionPackage) : Prop :=
  M.cellComplexHomotopy

theorem discrete_morse_function_closed_from_evidence (M : DiscreteMorseFunctionPackage) (E : DiscreteMorseFunctionEvidence M) : DiscreteMorseFunctionClosed M := by
  exact E.cellComplexHomotopyClosed

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse