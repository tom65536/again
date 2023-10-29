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
import again/structure

test "properties for int":
  check int is AdditiveAbelianGroup
  check int is MultiplicativeCommutativeMonoid
  check int is Ring
  check int is EuclideanRing
  check 5 mod 3 == 2
  check 5 div 3 == 1
  check zero(int) == 0
  check identity(int) == 1

test "properties for int8":
  check int8 is AdditiveAbelianGroup
  check int8 is MultiplicativeCommutativeMonoid
  # check int8 is EuclideanRing
  check int8 is Ring
  check zero(int8) == 0
  check identity(int8) == 1
