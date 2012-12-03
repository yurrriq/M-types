{-# OPTIONS --without-K #-}
module hott.weak-equivalence where

open import sum using (Σ ; proj₁ ; _,_)
open import level using (_⊔_)
open import hott.hlevel using (contr ; _⁻¹_)
open import function using (_$_)

-- a function is a weak equivalence, if the inverse images of all points are contractible
isWeakEquiv : ∀ {i k} {X : Set i} {Y : Set k} (f : X → Y) → Set (i ⊔ k)
isWeakEquiv {_} {_} {X} {Y} f = (y : Y) → contr $ f ⁻¹ y

-- weak equivalences
_≈_ : ∀ {i j} (X : Set i) (Y : Set j) → Set _
X ≈ Y = Σ (X → Y) λ f → isWeakEquiv f

apply≈ : ∀ {i} {X Y : Set i} → X ≈ Y → X → Y
apply≈ = proj₁

-- ≈⇒≅ : ∀ {i} {X Y : Set i} → X ≈ Y → X ≅ Y
-- ≈⇒≅ {X = X}{Y} (f , we) = makeIso f g iso₁ iso₂
--   where
--     g : Y → X
--     g y = proj₁ (proj₁ (we y))
-- 
--     iso₁ : (x : X) → g (f x) ≡ x
--     iso₁ x = cong proj₁ (proj₂ (we (f x)) (x , refl))
-- 
--     iso₂ : (y : Y) → f (g y) ≡ y
--     iso₂ y = proj₂ (proj₁ (we y))

invert≈ : ∀ {i} {X Y : Set i} → X ≈ Y → Y → X
invert≈ (_ , we) y = proj₁ (proj₁ (we y))