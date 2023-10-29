

# AGAIN - Algebra and Group theory in Nim
# Copyright (C) 2023  Thomas Reiter
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
## Definition of algebraic structures.
##
## The concepts defining algebraic steuctures are
## defined ver similar to the
## [emmy](https://github.com/andreaferretti/emmy)
## package.
##
## See also [Magma (Wikipedia)](https://en.m.wikipedia.org/wiki/Magma_(algebra))

type
  OperatorFlag* {.size: sizeof(cint).} = enum
    ## Properties of binary operators:
    ## - commutative: `x * y == y * x`
    ## - associative: `(x * y) * z == x * (y * z)`
    ## - divisible: `x * y == z` is solvable for `x`
    ## - medial: `(u * v) * (x * y) == (u * x) * (v * z)`
    ## - identity: there is an `e`: `e * x == x`
    is_commutative
    is_associative
    is_divisible
    is_medial
    has_identity

  OperatorFlags* = set[OperatorFlag]

  AdditiveMagma* = concept x, y, type T
    ## A set equipped with a plus operator.
    x + y is T
    plus_properties(T) is OperatorFlags

  MultiplicativeMagma* = concept x, y, type T
    ## A set equipped with a multiplication operator.
    x * y is T
    mul_properties(T) is OperatorFlags

  AdditiveUnitalMagma* = concept type T
    ## An additive magma with a zero element
    T is AdditiveMagma
    zero(T) is T
    OperatorFlag.has_identity in plus_properties(T)

  MultiplicativeUnitalMagma* = concept type T
    ## A multiplicative magma with an identity element
    T is MultiplicativeMagma
    identity(T) is T
    OperatorFlag.has_identity in mul_properties(T)

  AdditiveSemigroup* = concept type T
    ## An associative additive magma
    T is AdditiveMagma
    OperatorFlag.is_associative in plus_properties(T)

  MultiplicativeSemigroup* = concept type T
    ## An associative multiplicative magma
    T is MultiplicativeMagma
    OperatorFlag.is_associative in mul_properties(T)

  AdditiveQuasigroup* = concept x, y, type T
    ## A divisible additive magma:
    ## `x=b-a` solves `x+a = b`
    ## `x=a~b` solves `a+x = b`
    T is AdditiveMagma
    OperatorFlag.is_divisible in plus_properties(T)
    x - y is T
    x ~ y is T

  MultiplicativeQuasigroup* = concept x, y, type T
    ## A divisible multiplicative magma:
    ## `x=b/a` solves `x*a = b`
    ## `x=a\b` solves `a*x = b`
    T is MultiplicativeMagma
    x / y is T
    x \ y is T
    OperatorFlag.is_divisible in mul_properties(T)

  AdditiveLoop* = concept type T
    ## A unital Quasigroup
    T is AdditiveQuasigroup
    T is AdditiveUnitalMagma

  MultiplicativeLoop* = concept type T
    ## A unital Quasigroup
    T is MultiplicativeQuasigroup
    T is MultiplicativeUnitalMagma

  AdditiveMonoid* = concept type T
    ## A unital Semigroup
    T is AdditiveSemigroup
    T is AdditiveUnitalMagma

  MultiplicativeMonoid* = concept type T
    ## A unital Semigroup
    T is MultiplicativeSemigroup
    T is MultiplicativeUnitalMagma

  AdditiveAssociativeQuasigroup* = concept type T
    ## An associative Quasigroup
    T is AdditiveSemigroup
    T is AdditiveQuasigroup

  MultiplicativeAssociativeQuasigroup* = concept type T
    ## An associative Quasigroup
    T is MultiplicativeSemigroup
    T is MultiplicativeQuasigroup

  AdditiveGroup* = concept x, type T
    T is AdditiveSemigroup
    T is AdditiveQuasigroup
    T is AdditiveAssociativeQuasigroup
    - x is T

  MultiplicativeGroup* = concept x, type T
    T is MultiplicativeSemigroup
    T is MultiplicativeQuasigroup
    T is MultiplicativeAssociativeQuasigroup
    inv(x) is T

  AdditiveAbelianGroup* = concept type T
    T is AdditiveGroup
    OperatorFlag.is_commutative in plus_properties(T)

  MultiplicativeAbelianGroup* = concept type T
    T is MultiplicativeGroup
    OperatorFlag.is_commutative in mul_properties(T)

  AdditiveCommutativeMonoid* = concept type T
    T is AdditiveMonoid
    OperatorFlag.is_commutative in plus_properties(T)

  MultiplicativeCommutativeMonoid* = concept type T
    T is MultiplicativeMonoid
    OperatorFlag.is_commutative in mul_properties(T)

  AdditiveCommutativeMagma* = concept type T
    T is AdditiveMagma
    OperatorFlag.is_commutative in plus_properties(T)

  MultiplicativeCommutativeMagma* = concept type T
    T is MultiplicativeMagma
    OperatorFlag.is_commutative in mul_properties(T)

  Semiring* = concept type T
    T is AdditiveCommutativeMonoid
    T is MultiplicativeMonoid

  CommutativeSemiring* = concept type T
    T is AdditiveCommutativeMonoid
    T is MultiplicativeCommutativeMonoid

  Ring* = concept type T
    T is AdditiveAbelianGroup
    T is MultiplicativeMonoid

  DivisionRing* = concept type T
    T is AdditiveAbelianGroup
    T is MultiplicativeGroup

  Field* = concept type T
    T is DivisionRing
    T is AdditiveAbelianGroup
    T is MultiplicativeAbelianGroup

  EuclideanRing* = concept x, y, type T
    T is AdditiveAbelianGroup
    T is MultiplicativeMonoid
    x div y is T
    x mod y is T

# Implementations for primitive types
const
  int_plus_properties: OperatorFlags = {
    is_commutative,
    is_associative,
    is_divisible,
    has_identity
  }

  int_mul_properties: OperatorFlags = {
    is_commutative,
    is_associative,
    has_identity
  }

proc plus_properties*(x: typedesc[int]): OperatorFlags =
  int_plus_properties
proc mul_properties*(x: typedesc[int]): OperatorFlags =
  int_mul_properties
proc `~`*(x: int, y: int): int = y - x
proc zero*(x: typedesc[int]): int = 0
proc identity*(x: typedesc[int]): int = 1

proc plus_properties*(x: typedesc[int8]): OperatorFlags =
  int_plus_properties
proc mul_properties*(x: typedesc[int8]): OperatorFlags =
  int_mul_properties
proc `~`*(x: int8, y: int8): int8 = y - x
proc zero*(x: typedesc[int8]): int8 = 0
proc identity*(x: typedesc[int8]): int8 = 1

proc plus_properties*(x: typedesc[int16]): OperatorFlags =
  int_plus_properties
proc mul_properties*(x: typedesc[int16]): OperatorFlags =
  int_mul_properties
proc `~`*(x: int16, y: int16): int16 = y - x
proc zero*(x: typedesc[int16]): int16 = 0
proc identity*(x: typedesc[int16]): int16 = 1

proc plus_properties*(x: typedesc[int32]): OperatorFlags =
  int_plus_properties
proc mul_properties*(x: typedesc[int32]): OperatorFlags =
  int_mul_properties
proc `~`*(x: int32, y: int32): int32 = y - x
proc zero*(x: typedesc[int32]): int32 = 0
proc identity*(x: typedesc[int32]): int32 = 1

proc plus_properties*(x: typedesc[int64]): OperatorFlags =
  int_plus_properties
proc mul_properties*(x: typedesc[int64]): OperatorFlags =
  int_mul_properties
proc `~`*(x: int64, y: int64): int64 = y - x
proc zero*(x: typedesc[int64]): int64 = 0
proc identity*(x: typedesc[int64]): int64 = 1
