# modified by abner doubleday for use as freebsd shared library
# and inclusion in other projects
# in this state only the library itself is buildable but thats 
# all i wanted to build. the rest is left here for reference
#
# PCG Random Number Generation for C.
#
# original Copyright 2014 Melissa O'Neill <oneill@pcg-random.org>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# For additional information about the PCG random number generation scheme,
# including its license and other licensing options, visit
# 
#     http://www.pcg-random.org
#

all:
	cd src; $(MAKE)
#	cd test-low; $(MAKE)
#	cd test-high; $(MAKE)
#	cd sample; $(MAKE)

install:
	install src/libpcg_random.so /usr/lib
	install -m 0644 include/pcg_variants.h /usr/include

test:   all
	cd test-low; $(MAKE) test
	cd test-high; $(MAKE) test

clean:
	cd src; $(MAKE) clean
	cd test-low; $(MAKE) clean
	cd test-high; $(MAKE) clean
	cd sample; $(MAKE) clean
	rm -f extras/*.o

	
