import canonicalLaneMathlib.AdmissibleClass
import Mathlib.LinearAlgebra.Matrix.PosDef

namespace HautevilleHouse
namespace DiscreteDifferentialGeometryCanonicalLaneLean

structure DiscreteLaplaceOperatorPackage where
  vertexSet : Type u
  edgeSet : Type v
  laplaceMatrix : Matrix ℝ vertexSet vertexSet
  discreteHeatKernel : Prop
  spectrumProperties : Prop

structure DiscreteLaplaceOperatorEvidence (L : DiscreteLaplaceOperatorPackage) where
  discreteHeatKernelClosed : L.discreteHeatKernel
  spectrumPropertiesClosed : L.spectrumProperties

def DiscreteLaplaceOperatorClosed (L : DiscreteLaplaceOperatorPackage) : Prop :=
  L.discreteHeatKernel ∧ L.spectrumProperties

theorem discrete_laplace_operator_closed_from_evidence (L : DiscreteLaplaceOperatorPackage) (E : DiscreteLaplaceOperatorEvidence L) : DiscreteLaplaceOperatorClosed L := by
  exact And.intro E.discreteHeatKernelClosed E.spectrumPropertiesClosed

end DiscreteDifferentialGeometryCanonicalLaneLean
end HautevilleHouse