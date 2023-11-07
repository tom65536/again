
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

import std/complex

import ./structure
import ./std_float


proc plus_properties*[T: SomeFloat](
  x: typedesc[Complex[T]]
): OperatorFlags = plus_properties(T)

proc mul_properties*[T: SomeFloat](
  x: typedesc[Complex[T]]
): OperatorFlags = mul_properties(T)

proc `~`*[T: SomeFloat](x, y: Complex[T]): Complex[T] = y - x
proc `\`*[T: SomeFloat](x, y: Complex[T]): Complex[T] = y / x
proc inv*[T: SomeFloat](x: Complex[T]): Complex[T] = identity(T) / x
proc zero*[T: SomeFloat](
  x: typedesc[Complex[T]]
): Complex[T] = complex(zero(T), zero(T))
proc identity*[T: SomeFloat](
  x: typedesc[Complex[T]]
): Complex[T] = complex(identity(T), zero(T))
