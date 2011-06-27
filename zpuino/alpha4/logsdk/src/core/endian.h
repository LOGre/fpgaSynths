/*
 endian.h - Endianess helpers and defines for Arduino
 Copyright (c) 2011 Alvaro Lopes.  All right reserved.
 
 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#ifndef __ENDIAN_H__
#define __ENDIAN_H__

#include <inttypes.h>

#define __LITTLE_ENDIAN 1234
#define __BIG_ENDIAN 4321

#ifdef AVR
#define __BYTE_ORDER __LITTLE_ENDIAN
#endif

#ifdef ZPU
#define __BYTE_ORDER __BIG_ENDIAN
#endif

#ifndef __BYTE_ORDER
#error Unsupported platform. Please fix "endian.h"
#endif

typedef struct {
	unsigned char v[4];
	inline operator uint32_t () const {
		uint32_t r = (v[3]<<24)|(v[2]<<16)|(v[1]<<8)|v[0];
		return r;
	}
	inline void operator=(const uint32_t &c) {
		v[3] = c>>24;
		v[2] = (c>>16)&0xff;
		v[1] = (c>>8)&0xff;
		v[0] = c&0xff;
	}

} __attribute__((packed)) __swapped32;

typedef struct {
	unsigned char v[2];
	inline operator uint16_t () const {
		uint16_t r = (v[1]<<8)|v[0];
		return r;
	}
	inline void operator=(const uint16_t &c) {
		v[1] = c>>8;
		v[0] = c&0xff;
	}

} __attribute__((packed)) __swapped16;



#if __BYTE_ORDER == __LITTLE_ENDIAN

#define cpu_to_le32(x) (x)
#define le32_to_cpu(x) (x)
#define cpu_to_le16(x) (x)
#define le16_to_cpu(x) (x)

#define cpu_to_be32(x) bswap_32(x)
#define be32_to_cpu(x) bswap_32(x)
#define cpu_to_be16(x) bswap_16(x)
#define be16_to_cpu(x) bswap_16(x)

typedef uint32_t __le32;
typedef uint16_t __le16;
typedef __swapped32 __be32;
typedef __swapped16 __be16;

#elif __BYTE_ORDER == __BIG_ENDIAN

#define cpu_to_le32(x) bswap_32(x)
#define le32_to_cpu(x) bswap_32(x)
#define cpu_to_le16(x) bswap_16(x)
#define le16_to_cpu(x) bswap_16(x)

#define cpu_to_be32(x) (x)
#define be32_to_cpu(x) (x)
#define cpu_to_be16(x) (x)
#define be16_to_cpu(x) (x)

typedef uint32_t __be32;
typedef uint16_t __be16;
typedef __swapped32 __le32;
typedef __swapped16 __le16;

#endif

static inline uint16_t bswap_16(uint16_t v)
{
	return (v>>8) | ((v & 0xff) << 8);

}
static inline uint32_t bswap_32(uint32_t v)
{
	return ((v>>24)
			|((v&0x00ff0000)>>8)
			|((v&0x0000ff00)<<8)
			|((v&0x000000ff)<<24));
}

#endif
