
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
## Implementations for standard types.

import ./structure

const
  float_plus_properties: OperatorFlags = {
    is_commutative,
    is_associative,
    is_divisible,
    has_identity
  }

  float_mul_properties: OperatorFlags = {
    is_commutative,
    is_associative,
    is_divisible,
    has_identity
  }

proc plus_properties*(x: typedesc[float32]): OperatorFlags =
  float_plus_properties
proc mul_properties*(x: typedesc[float32]): OperatorFlags =
  float_mul_properties
proc `~`*(x: float32, y: float32): float32 = y - x
proc `\`*(x: float32, y: float32): float32 = y / x
proc inv*(x: float32): float32 = 1 / x
proc zero*(x: typedesc[float32]): float32 = 0
proc identity*(x: typedesc[float32]): float32 = 1

proc plus_properties*(x: typedesc[float64]): OperatorFlags =
  float_plus_properties
proc mul_properties*(x: typedesc[float64]): OperatorFlags =
  float_mul_properties
proc `~`*(x: float64, y: float64): float64 = y - x
proc `\`*(x: float64, y: float64): float64 = y / x
proc inv*(x: float64): float64 = 1 / x
proc zero*(x: typedesc[float64]): float64 = 0
proc identity*(x: typedesc[float64]): float64 = 1
