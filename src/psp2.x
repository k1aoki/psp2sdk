/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)

ENTRY(module_info)

module_start = DEFINED(module_start) ? module_start : 0;
module_stop = DEFINED(module_stop) ? module_stop : 0;

PHDRS
{
	text PT_LOAD FLAGS(5);
	data PT_LOAD FLAGS(6);
	rela 0x60000000;
}

SECTIONS
{
	.text : { *(.text) } :text
	.sceStub.text : { *(.sceStub.text.*) } :text

	.sceModuleInfo.rodata : { *(.sceModuleInfo.rodata) } :text

	.sceLib.ent : { *(.sceLib.ent) } :text
	.sceLib.stub : { *(.sceLib.stub) } :text

	.sceExport.rodata :
	{
		export_top = .;
		*(.sceExport.rodata)
	export_btm = .;
	} :text

	.sceImport.rodata :
	{
		import_top = .;
		KEEP(*(.sceImport.rodata))
	} :text

	.sceFNID.rodata : { KEEP(*(.sceFNID.rodata)) } :text
	.sceFStub.rodata : { KEEP(*(.sceFStub.rodata)) } :text

	.rodata : { *(.rodata) } :text

	.ARM.extab :
	{
		extab_top = .;
		*(.ARM.extab* .gnu.linkonce.armextab.*)
		extab_btm = .;
	} :text

	.ARM.exidx :
	{
		exidx_top = .;
		*(.ARM.exidx* .gnu.linkonce.armexidx.*)
		exidx_btm = .;
	} :text

	.ctors :
	{
		KEEP(*ctrbegin.o(.ctors))
		KEEP(*ctrbegin?.o(.ctors))
		*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors)
		*(SORT(.ctors.*))
		*(.ctors)
	} :text

	.dtors :
	{
		KEEP(*crtbegin.o(.dtors))
		KEEP(*crtbegin?.o(.dtors))
		*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .dtors)
		*(SORT(.dtors.*))
		*(.dtors)
	} :text

	.data : { *(.data) } :data
	.bss : { *(.bss) } :data

	.rel.text : { *(.rel.text) } :rela
	.rel.sceModuleInfo.rodata : { *(.rel.sceModuleInfo.rodata) } :rela

	.rel.sceLib.ent : { *(.rel.sceLib.ent) } :rela
	.rel.sceLib.stub : {
		*(.rel.sceLib.stub)
		. = .;
	} :rela

	.rel.sceExport.rodata : { *(rel.sceExport.rodata) } :rela
	.rel.sceFStub.rodata :
	{
		*(.rel.sceFStub.rodata)
		. = .;
	} :rela

	.rel.rodata : { *(.rel.rodata) } :rela

	.rel.data : { *(.rel.data) } :rela

	.sce_libgen_mark : { KEEP(*(.sce_libgen_mark)) }
	.rel.sce_libgen_mark (NOLOAD) : { KEEP(*(.rel.sce_libgen_mark)) }
}