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

import complex
import unittest
import again

test "properties for Complex32":
  check Complex32 is Field
  check zero(Complex32) == complex(0f32, 0f32)
  check identity(Complex32) == complex(1f32, 0f32)

test "properties for Complex64":
  check Complex64 is Field
  check zero(Complex64) == complex(0f64, 0f64)
  check identity(Complex64) == complex(1f64, 0f64)
