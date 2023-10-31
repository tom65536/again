
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
  int_plus_properties: OperatorFlags = {
    is_commutative,
    is_associative,
    is_divisible,
    has_identity
  }

  uint_plus_properties: OperatorFlags = {
    is_commutative,
    is_associative,
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

proc plus_properties*(x: typedesc[uint]): OperatorFlags =
  uint_plus_properties
proc mul_properties*(x: typedesc[uint]): OperatorFlags =
  int_mul_properties
proc zero*(x: typedesc[uint]): uint = 0
proc identity*(x: typedesc[uint]): uint = 1

proc plus_properties*(x: typedesc[uint8]): OperatorFlags =
  uint_plus_properties
proc mul_properties*(x: typedesc[uint8]): OperatorFlags =
  int_mul_properties
proc zero*(x: typedesc[uint8]): uint8 = 0
proc identity*(x: typedesc[uint8]): uint8 = 1

proc plus_properties*(x: typedesc[uint16]): OperatorFlags =
  uint_plus_properties
proc mul_properties*(x: typedesc[uint16]): OperatorFlags =
  int_mul_properties
proc zero*(x: typedesc[uint16]): uint16 = 0
proc identity*(x: typedesc[uint16]): uint16 = 1

proc plus_properties*(x: typedesc[uint32]): OperatorFlags =
  uint_plus_properties
proc mul_properties*(x: typedesc[uint32]): OperatorFlags =
  int_mul_properties
proc zero*(x: typedesc[uint32]): uint32 = 0
proc identity*(x: typedesc[uint32]): uint32 = 1

proc plus_properties*(x: typedesc[uint64]): OperatorFlags =
  uint_plus_properties
proc mul_properties*(x: typedesc[uint64]): OperatorFlags =
  int_mul_properties
proc zero*(x: typedesc[uint64]): uint64 = 0
proc identity*(x: typedesc[uint64]): uint64 = 1
