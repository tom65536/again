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

import unittest
import again

test "properties for int":
  check int is EuclideanRing
  check zero(int) == 0
  check identity(int) == 1

test "properties for int8":
  check int8 is EuclideanRing
  check zero(int8) == 0
  check identity(int8) == 1

test "properties for int16":
  check int16 is EuclideanRing
  check zero(int16) == 0
  check identity(int16) == 1

test "properties for int32":
  check int32 is EuclideanRing
  check zero(int32) == 0
  check identity(int32) == 1

test "properties for int64":
  check int64 is EuclideanRing
  check zero(int64) == 0
  check identity(int64) == 1

test "properties for uint":
  check uint is CommutativeSemiring
  check zero(uint) == 0
  check identity(uint) == 1

test "properties for uint8":
  check uint8 is CommutativeSemiring
  check zero(uint8) == 0
  check identity(uint8) == 1

test "properties for uint16":
  check uint16 is CommutativeSemiring
  check zero(uint16) == 0
  check identity(uint16) == 1

test "properties for uint32":
  check uint32 is CommutativeSemiring
  check zero(uint32) == 0
  check identity(uint32) == 1

test "properties for uint64":
  check uint64 is CommutativeSemiring
  check zero(uint64) == 0
  check identity(uint64) == 1
