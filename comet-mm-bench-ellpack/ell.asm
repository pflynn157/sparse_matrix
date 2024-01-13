	.text
	.intel_syntax noprefix
	.file	"LLVMDialectModule"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x3ffb333333333333              # double 1.7
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 152
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	edi, 104
	call	malloc@PLT
	mov	rbx, rax
	mov	qword ptr [rbp - 192], rax
	mov	qword ptr [rbp - 184], rax
	mov	qword ptr [rbp - 176], 0
	mov	qword ptr [rbp - 168], 13
	mov	qword ptr [rbp - 160], 1
	lea	rax, [rbp - 192]
	mov	ecx, 3
	mov	r9d, 1
	xor	edi, edi
	xor	esi, esi
	mov	rdx, -1
	xor	r8d, r8d
	push	1
	push	rax
	call	read_input_sizes_2D_f64@PLT
	add	rsp, 16
	mov	r15, qword ptr [rbx]
	mov	r13, qword ptr [rbx + 8]
	mov	r12, qword ptr [rbx + 16]
	mov	rax, qword ptr [rbx + 24]
	mov	qword ptr [rbp - 72], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 32]
	mov	qword ptr [rbp - 96], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 40]
	mov	qword ptr [rbp - 88], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 48]
	mov	qword ptr [rbp - 80], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 56]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 64]
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 72]
	mov	qword ptr [rbp - 136], rax      # 8-byte Spill
	mov	rax, qword ptr [rbx + 80]
	mov	qword ptr [rbp - 128], rax      # 8-byte Spill
	lea	r14, [8*r15]
	mov	rdi, r14
	call	malloc@PLT
	mov	rbx, rax
	test	r15, r15
	jle	.LBB0_2
# %bb.1:                                # %.lr.ph.preheader
	mov	rdi, rbx
	xor	esi, esi
	mov	rdx, r14
	call	memset@PLT
.LBB0_2:                                # %._crit_edge
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 64], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], rbx
	mov	qword ptr [rax - 40], rbx
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r15
	mov	qword ptr [rax - 16], 1
	lea	r15, [8*r13]
	mov	rdi, r15
	call	malloc@PLT
	mov	r14, rax
	test	r13, r13
	jle	.LBB0_4
# %bb.3:                                # %.lr.ph101.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_4:                                # %._crit_edge102
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 120], rcx      # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r14
	mov	qword ptr [rax - 40], r14
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r13
	mov	qword ptr [rax - 16], 1
	lea	r15, [8*r12]
	mov	rdi, r15
	call	malloc@PLT
	mov	r14, rax
	test	r12, r12
	jle	.LBB0_6
# %bb.5:                                # %.lr.ph104.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_6:                                # %._crit_edge105
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 112], rcx      # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r14
	mov	qword ptr [rax - 40], r14
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r12
	mov	qword ptr [rax - 16], 1
	mov	r12, qword ptr [rbp - 72]       # 8-byte Reload
	lea	r15, [8*r12]
	mov	rdi, r15
	call	malloc@PLT
	mov	r14, rax
	test	r12, r12
	mov	r13, qword ptr [rbp - 88]       # 8-byte Reload
	jle	.LBB0_8
# %bb.7:                                # %.lr.ph107.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_8:                                # %._crit_edge108
	mov	qword ptr [rbp - 144], rbx      # 8-byte Spill
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 104], rcx      # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r14
	mov	qword ptr [rax - 40], r14
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r12
	mov	qword ptr [rax - 16], 1
	mov	rbx, qword ptr [rbp - 96]       # 8-byte Reload
	lea	r15, [8*rbx]
	mov	rdi, r15
	call	malloc@PLT
	mov	r14, rax
	test	rbx, rbx
	jle	.LBB0_10
# %bb.9:                                # %.lr.ph110.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_10:                               # %._crit_edge111
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 72], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r14
	mov	qword ptr [rax - 40], r14
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], rbx
	mov	qword ptr [rax - 16], 1
	lea	r15, [8*r13]
	mov	rdi, r15
	call	malloc@PLT
	mov	r12, rax
	test	r13, r13
	mov	rbx, qword ptr [rbp - 56]       # 8-byte Reload
	jle	.LBB0_12
# %bb.11:                               # %.lr.ph113.preheader
	mov	rdi, r12
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_12:                               # %._crit_edge114
	mov	rax, rsp
	lea	r14, [rax - 48]
	mov	rsp, r14
	mov	qword ptr [rax - 48], r12
	mov	qword ptr [rbp - 96], r12       # 8-byte Spill
	mov	qword ptr [rax - 40], r12
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r13
	mov	qword ptr [rax - 16], 1
	mov	r13, qword ptr [rbp - 80]       # 8-byte Reload
	lea	r15, [8*r13]
	mov	rdi, r15
	call	malloc@PLT
	mov	r12, rax
	test	r13, r13
	jle	.LBB0_14
# %bb.13:                               # %.lr.ph116.preheader
	mov	rdi, r12
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_14:                               # %._crit_edge117
	mov	rax, rsp
	lea	r13, [rax - 48]
	mov	rsp, r13
	mov	qword ptr [rax - 48], r12
	mov	qword ptr [rbp - 88], r12       # 8-byte Spill
	mov	qword ptr [rax - 40], r12
	mov	qword ptr [rax - 32], 0
	mov	rcx, qword ptr [rbp - 80]       # 8-byte Reload
	mov	qword ptr [rax - 24], rcx
	mov	qword ptr [rax - 16], 1
	lea	r12, [8*rbx]
	mov	rdi, r12
	call	malloc@PLT
	mov	r15, rax
	test	rbx, rbx
	jle	.LBB0_16
# %bb.15:                               # %.lr.ph119.preheader
	mov	rdi, r15
	xor	esi, esi
	mov	rdx, r12
	call	memset@PLT
.LBB0_16:                               # %._crit_edge120
	mov	rax, rsp
	lea	r12, [rax - 48]
	mov	rsp, r12
	mov	qword ptr [rax - 48], r15
	mov	qword ptr [rax - 40], r15
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], rbx
	mov	qword ptr [rax - 16], 1
	mov	rbx, qword ptr [rbp - 48]       # 8-byte Reload
	lea	r15, [8*rbx]
	mov	rdi, r15
	call	malloc@PLT
	test	rbx, rbx
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	jle	.LBB0_18
# %bb.17:                               # %.lr.ph122.preheader
	mov	rdi, qword ptr [rbp - 56]       # 8-byte Reload
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
.LBB0_18:                               # %._crit_edge123
	mov	rcx, rsp
	lea	r10, [rcx - 48]
	mov	rsp, r10
	mov	qword ptr [rcx - 48], rax
	mov	qword ptr [rcx - 40], rax
	mov	qword ptr [rcx - 32], 0
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	mov	qword ptr [rcx - 24], rax
	mov	qword ptr [rcx - 16], 1
	mov	ecx, 3
	mov	r9d, 1
	xor	edi, edi
	xor	esi, esi
	mov	rdx, -1
	xor	r8d, r8d
	push	1
	push	r10
	push	1
	push	r12
	push	1
	push	r13
	push	1
	push	r14
	push	1
	mov	rax, qword ptr [rbp - 72]       # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 104]      # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 112]      # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 120]      # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	push	rax
	call	read_input_2D_f64@PLT
	add	rsp, 144
	mov	r13, qword ptr [rbp - 128]      # 8-byte Reload
	imul	rdi, r13, 499608
	add	rdi, 32
	call	malloc@PLT
	add	rax, 31
	and	rax, -32
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	mov	r12, qword ptr [rbp - 136]      # 8-byte Reload
	imul	rax, r12, 499608
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	lea	rdi, [rax + 32]
	call	malloc@PLT
	add	rax, 31
	mov	r8, rax
	test	r13, r13
	mov	rbx, qword ptr [rbp - 144]      # 8-byte Reload
	mov	r14, qword ptr [rbp - 96]       # 8-byte Reload
	mov	r15, qword ptr [rbp - 88]       # 8-byte Reload
	jle	.LBB0_24
# %bb.19:                               # %.preheader99.preheader
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	add	rax, 960
	xor	ecx, ecx
	vbroadcastsd	zmm0, qword ptr [rip + .LCPI0_0] # zmm0 = [1.7E+0,1.7E+0,1.7E+0,1.7E+0,1.7E+0,1.7E+0,1.7E+0,1.7E+0]
	vbroadcastsd	ymm1, qword ptr [rip + .LCPI0_0] # ymm1 = [1.7E+0,1.7E+0,1.7E+0,1.7E+0]
	movabs	rdx, 4610334938539176755
	jmp	.LBB0_20
	.p2align	4, 0x90
.LBB0_23:                               # %scalar.ph
                                        #   in Loop: Header=BB0_20 Depth=1
	mov	rdi, qword ptr [rbp - 64]       # 8-byte Reload
	vmovupd	ymmword ptr [rdi + 8*rsi + 499456], ymm1
	vmovupd	ymmword ptr [rdi + 8*rsi + 499488], ymm1
	vmovupd	ymmword ptr [rdi + 8*rsi + 499520], ymm1
	vmovupd	ymmword ptr [rdi + 8*rsi + 499552], ymm1
	mov	qword ptr [rdi + 8*rsi + 499584], rdx
	mov	qword ptr [rdi + 8*rsi + 499592], rdx
	mov	qword ptr [rdi + 8*rsi + 499600], rdx
	add	rcx, 1
	add	rax, 499608
	cmp	rcx, r13
	je	.LBB0_24
.LBB0_20:                               # %.preheader99
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_21 Depth 2
	imul	rsi, rcx, 62451
	mov	rdi, -62336
	.p2align	4, 0x90
.LBB0_21:                               # %vector.body
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovupd	zmmword ptr [rax + 8*rdi + 497728], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 497792], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 497856], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 497920], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 497984], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498048], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498112], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498176], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498240], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498304], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498368], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498432], zmm0
	test	rdi, rdi
	je	.LBB0_23
# %bb.22:                               # %vector.body.3
                                        #   in Loop: Header=BB0_21 Depth=2
	vmovupd	zmmword ptr [rax + 8*rdi + 498496], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498560], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498624], zmm0
	vmovupd	zmmword ptr [rax + 8*rdi + 498688], zmm0
	sub	rdi, -128
	jmp	.LBB0_21
.LBB0_24:                               # %.preheader98
	mov	r13, r8
	and	r13, -32
	test	r12, r12
	jle	.LBB0_26
# %bb.25:                               # %.preheader97.preheader
	mov	rdi, r13
	xor	esi, esi
	mov	rdx, qword ptr [rbp - 48]       # 8-byte Reload
	call	memset@PLT
.LBB0_26:                               # %.preheader
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	add	rax, 8
	mov	qword ptr [rbp - 128], rax      # 8-byte Spill
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	add	rax, 499608
	mov	qword ptr [rbp - 120], rax      # 8-byte Spill
	lea	rax, [r13 + 192]
	mov	qword ptr [rbp - 152], rax      # 8-byte Spill
	xor	eax, eax
	jmp	.LBB0_27
	.p2align	4, 0x90
.LBB0_42:                               # %._crit_edge129
                                        #   in Loop: Header=BB0_27 Depth=1
	call	getTime@PLT
	vmovapd	xmm1, xmm0
	vmovsd	xmm0, qword ptr [rbp - 72]      # 8-byte Reload
                                        # xmm0 = mem[0],zero
	call	printElapsedTime@PLT
	mov	rax, qword ptr [rbp - 104]      # 8-byte Reload
	add	rax, 1
	cmp	rax, 10
	je	.LBB0_43
.LBB0_27:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_29 Depth 2
                                        #       Child Loop BB0_31 Depth 3
                                        #         Child Loop BB0_35 Depth 4
                                        #         Child Loop BB0_38 Depth 4
                                        #         Child Loop BB0_39 Depth 4
	mov	qword ptr [rbp - 104], rax      # 8-byte Spill
	call	getTime@PLT
	vmovsd	qword ptr [rbp - 72], xmm0      # 8-byte Spill
	mov	rax, qword ptr [rbx]
	mov	qword ptr [rbp - 112], rax      # 8-byte Spill
	test	rax, rax
	jle	.LBB0_42
# %bb.28:                               # %.lr.ph128.preheader
                                        #   in Loop: Header=BB0_27 Depth=1
	mov	eax, 3
	mov	qword ptr [rbp - 80], rax       # 8-byte Spill
	mov	rdx, r13
	mov	rsi, qword ptr [rbp - 152]      # 8-byte Reload
	xor	eax, eax
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	jmp	.LBB0_29
	.p2align	4, 0x90
.LBB0_41:                               # %._crit_edge126
                                        #   in Loop: Header=BB0_29 Depth=2
	mov	rcx, qword ptr [rbp - 48]       # 8-byte Reload
	add	rcx, 1
	add	rsi, 499608
	add	rdx, 499608
	add	qword ptr [rbp - 80], 62451     # 8-byte Folded Spill
	mov	rax, rcx
	mov	qword ptr [rbp - 48], rcx       # 8-byte Spill
	cmp	rcx, qword ptr [rbp - 112]      # 8-byte Folded Reload
	mov	r15, qword ptr [rbp - 88]       # 8-byte Reload
	je	.LBB0_42
.LBB0_29:                               # %.lr.ph128
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_31 Depth 3
                                        #         Child Loop BB0_35 Depth 4
                                        #         Child Loop BB0_38 Depth 4
                                        #         Child Loop BB0_39 Depth 4
	mov	rax, qword ptr [r15]
	mov	qword ptr [rbp - 136], rax      # 8-byte Spill
	test	rax, rax
	jle	.LBB0_41
# %bb.30:                               # %.lr.ph125
                                        #   in Loop: Header=BB0_29 Depth=2
	imul	rax, qword ptr [rbp - 48], 499608 # 8-byte Folded Reload
	lea	r9, [rax + r13]
	lea	r10, [rax + r13]
	add	r10, 499608
	xor	r11d, r11d
	.p2align	4, 0x90
.LBB0_31:                               # %vector.memcheck
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_29 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_35 Depth 4
                                        #         Child Loop BB0_38 Depth 4
                                        #         Child Loop BB0_39 Depth 4
	mov	rcx, qword ptr [rbx]
	imul	rcx, r11
	add	rcx, qword ptr [rbp - 48]       # 8-byte Folded Reload
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	lea	rax, [rax + 8*rcx]
	imul	r8, qword ptr [r14 + 8*rcx], 499608
	mov	rdi, qword ptr [rbp - 128]      # 8-byte Reload
	lea	rcx, [rdi + 8*rcx]
	mov	rbx, qword ptr [rbp - 64]       # 8-byte Reload
	lea	r12, [rbx + r8]
	add	r8, qword ptr [rbp - 120]       # 8-byte Folded Reload
	cmp	r9, rcx
	setb	bl
	cmp	rax, r10
	setb	r14b
	cmp	r9, r8
	setb	cl
	cmp	r12, r10
	setb	r8b
	test	bl, r14b
	jne	.LBB0_32
# %bb.33:                               # %vector.memcheck
                                        #   in Loop: Header=BB0_31 Depth=3
	and	cl, r8b
	mov	ebx, 0
	jne	.LBB0_37
# %bb.34:                               # %vector.body149.preheader
                                        #   in Loop: Header=BB0_31 Depth=3
	vbroadcastsd	zmm0, qword ptr [rax]
	mov	r8, -62432
	.p2align	4, 0x90
.LBB0_35:                               # %vector.body149
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_29 Depth=2
                                        #       Parent Loop BB0_31 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmulpd	zmm1, zmm0, zmmword ptr [r12 + 8*r8 + 499456]
	vmulpd	zmm2, zmm0, zmmword ptr [r12 + 8*r8 + 499520]
	vmulpd	zmm3, zmm0, zmmword ptr [r12 + 8*r8 + 499584]
	vmulpd	zmm4, zmm0, zmmword ptr [r12 + 8*r8 + 499648]
	vaddpd	zmm1, zmm1, zmmword ptr [rsi + 8*r8 + 499264]
	vaddpd	zmm2, zmm2, zmmword ptr [rsi + 8*r8 + 499328]
	vaddpd	zmm3, zmm3, zmmword ptr [rsi + 8*r8 + 499392]
	vaddpd	zmm4, zmm4, zmmword ptr [rsi + 8*r8 + 499456]
	vmovupd	zmmword ptr [rsi + 8*r8 + 499264], zmm1
	vmovupd	zmmword ptr [rsi + 8*r8 + 499328], zmm2
	vmovupd	zmmword ptr [rsi + 8*r8 + 499392], zmm3
	vmovupd	zmmword ptr [rsi + 8*r8 + 499456], zmm4
	add	r8, 32
	jne	.LBB0_35
# %bb.36:                               #   in Loop: Header=BB0_31 Depth=3
	mov	ebx, 62432
	jmp	.LBB0_37
	.p2align	4, 0x90
.LBB0_32:                               #   in Loop: Header=BB0_31 Depth=3
	xor	ebx, ebx
.LBB0_37:                               # %scalar.ph145.prol.preheader
                                        #   in Loop: Header=BB0_31 Depth=3
	lea	r8, [rbx - 62450]
	mov	rcx, qword ptr [rbp - 80]       # 8-byte Reload
	add	rcx, rbx
	mov	rdi, r13
	lea	rcx, [8*rcx]
	add	rcx, r13
	mov	r14d, 3
	.p2align	4, 0x90
.LBB0_38:                               # %scalar.ph145.prol
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_29 Depth=2
                                        #       Parent Loop BB0_31 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	mov	r13, r8
	mov	r15, rcx
	vmovsd	xmm0, qword ptr [rax]           # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [r12 + 8*rbx]
	vaddsd	xmm0, xmm0, qword ptr [rdx + 8*rbx]
	vmovsd	qword ptr [rdx + 8*rbx], xmm0
	add	rbx, 1
	add	r8, 1
	add	rcx, 8
	add	r14, -1
	jne	.LBB0_38
	.p2align	4, 0x90
.LBB0_39:                               # %scalar.ph145
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_29 Depth=2
                                        #       Parent Loop BB0_31 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovsd	xmm0, qword ptr [rax]           # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [r12 + 8*r13 + 499608]
	vaddsd	xmm0, xmm0, qword ptr [r15 - 16]
	vmovsd	qword ptr [r15 - 16], xmm0
	vmovsd	xmm0, qword ptr [rax]           # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [r12 + 8*r13 + 499616]
	vaddsd	xmm0, xmm0, qword ptr [r15 - 8]
	vmovsd	qword ptr [r15 - 8], xmm0
	vmovsd	xmm0, qword ptr [rax]           # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [r12 + 8*r13 + 499624]
	vaddsd	xmm0, xmm0, qword ptr [r15]
	vmovsd	qword ptr [r15], xmm0
	vmovsd	xmm0, qword ptr [rax]           # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [r12 + 8*r13 + 499632]
	vaddsd	xmm0, xmm0, qword ptr [r15 + 8]
	vmovsd	qword ptr [r15 + 8], xmm0
	add	r15, 32
	add	r13, 4
	jne	.LBB0_39
# %bb.40:                               # %.loopexit
                                        #   in Loop: Header=BB0_31 Depth=3
	add	r11, 1
	cmp	r11, qword ptr [rbp - 136]      # 8-byte Folded Reload
	mov	rbx, qword ptr [rbp - 144]      # 8-byte Reload
	mov	r14, qword ptr [rbp - 96]       # 8-byte Reload
	mov	r13, rdi
	jne	.LBB0_31
	jmp	.LBB0_41
.LBB0_43:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
	.addrsig
