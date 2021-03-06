@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software: you can redistribute it and/or modify
@ it under the terms of the GNU Lesser General Public License as published by
@ the Free Software Foundation, either version 3 of the License, or
@ (at your option) any later version.
@
@ This libary is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@ GNU Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public License
@ along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceHeap, 0001, 1, 0

PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0x00be8fc3, sceHeapReallocHeapMemoryWithOption
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0x76c5b003, sceHeapGetTotalFreeSize
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0x9e6716ba, sceHeapReallocHeapMemory
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xa130d00c, sceHeapDeleteHeap
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xa7571ad8, sceHeapCreateHeap
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xaa50462f, sceHeapIsAllocatedHeapMemory
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xad2645b0, sceHeapGetMallinfo
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xb6fc0ba1, sceHeapAllocHeapMemory
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xd09ffc11, sceHeapFreeHeapMemory
PSP2_IMPORT_FUNC SceHeap, 0001, F00, 0xd4c09869, sceHeapAllocHeapMemoryWithOption
