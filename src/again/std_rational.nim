
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
##
## Note that `Complex` in `std/complex` is defined for
## `SomeFloat` only.
## Stuff like $Z[i]$ needs a separate definition.

import std/rationals

import ./structure
import ./std_int


proc plus_properties*[T: SomeInteger](
  x: typedesc[Rational[T]]
): OperatorFlags = plus_properties(T)

proc mul_properties*[T: SomeInteger](
  x: typedesc[Rational[T]]
): OperatorFlags = mul_properties(T) + {is_divisible}

proc `~`*[T: SomeInteger](x, y: Rational[T]): Rational[T] = y - x
proc `\`*[T: SomeInteger](x, y: Rational[T]): Rational[T] = y / x
proc inv*[T: SomeInteger](x: Rational[T]): Rational[T] = identity(T) / x
proc zero*[T: SomeInteger](
  x: typedesc[Rational[T]]
): Rational[T] = zero(T) // identity(T)
proc identity*[T: SomeInteger](
  x: typedesc[Rational[T]]
): Rational[T] = identity(T) // identity(T)
