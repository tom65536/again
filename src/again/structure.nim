

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

type
  OperatorFlag* {.size: sizeof(cint).} = enum
    is_commutative
    is_associative
    is_divisible
    is_medial
    has_identity

  OperatorFlags* = set[OperatorFlag]

  AdditiveMagma* = concept x, y, type T
    x + y is T
    plus_properties(T) is OperatorFlags

  MultiplicativeMagma* = concept x, y, type T
    x * y is T
    mul_properties(T) is OperatorFlags

proc plus_properties*(x: typedesc[int]): OperatorFlags = {
  is_commutative,
  is_associative,
  is_divisible,
  has_identity
}
