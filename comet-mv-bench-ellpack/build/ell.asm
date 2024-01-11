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
	mov	qword ptr [rbp - 184], rax
	mov	qword ptr [rbp - 176], rax
	mov	qword ptr [rbp - 168], 0
	mov	qword ptr [rbp - 160], 13
	mov	qword ptr [rbp - 152], 1
	lea	rax, [rbp - 184]
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
	mov	qword ptr [rbp - 80], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 40]
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 48]
	mov	qword ptr [rbp - 88], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 56]
	mov	qword ptr [rbp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rbx + 64]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 72]
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 80]
	mov	qword ptr [rbp - 144], rax      # 8-byte Spill
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
	mov	qword ptr [rbp - 136], rcx      # 8-byte Spill
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
# %bb.3:                                # %.lr.ph98.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_4:                                # %._crit_edge99
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 128], rcx      # 8-byte Spill
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
# %bb.5:                                # %.lr.ph101.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_6:                                # %._crit_edge102
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
	mov	r13, qword ptr [rbp - 80]       # 8-byte Reload
	jle	.LBB0_8
# %bb.7:                                # %.lr.ph104.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_8:                                # %._crit_edge105
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 104], rcx      # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r14
	mov	qword ptr [rax - 40], r14
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r12
	mov	qword ptr [rax - 16], 1
	lea	r15, [8*r13]
	mov	rdi, r15
	call	malloc@PLT
	mov	r14, rax
	test	r13, r13
	mov	r12, qword ptr [rbp - 88]       # 8-byte Reload
	jle	.LBB0_10
# %bb.9:                                # %.lr.ph107.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_10:                               # %._crit_edge108
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 72], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r14
	mov	qword ptr [rax - 40], r14
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r13
	mov	qword ptr [rax - 16], 1
	mov	r13, qword ptr [rbp - 48]       # 8-byte Reload
	lea	r15, [8*r13]
	mov	rdi, r15
	call	malloc@PLT
	mov	r14, rax
	test	r13, r13
	jle	.LBB0_12
# %bb.11:                               # %.lr.ph110.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_12:                               # %._crit_edge111
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 80], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r14
	mov	qword ptr [rax - 40], r14
	mov	qword ptr [rax - 32], 0
	mov	rcx, qword ptr [rbp - 48]       # 8-byte Reload
	mov	qword ptr [rax - 24], rcx
	mov	qword ptr [rax - 16], 1
	lea	r15, [8*r12]
	mov	rdi, r15
	call	malloc@PLT
	mov	rdi, rax
	test	r12, r12
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	r13, qword ptr [rbp - 120]      # 8-byte Reload
	jle	.LBB0_14
# %bb.13:                               # %.lr.ph113.preheader
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
	mov	rdi, qword ptr [rbp - 48]       # 8-byte Reload
.LBB0_14:                               # %._crit_edge114
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 96], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], rdi
	mov	qword ptr [rax - 40], rdi
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r12
	mov	qword ptr [rax - 16], 1
	lea	r12, [8*r13]
	mov	rdi, r12
	call	malloc@PLT
	mov	r15, rax
	test	r13, r13
	jle	.LBB0_16
# %bb.15:                               # %.lr.ph116.preheader
	mov	rdi, r15
	xor	esi, esi
	mov	rdx, r12
	call	memset@PLT
.LBB0_16:                               # %._crit_edge117
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 88], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r15
	mov	qword ptr [rax - 40], r15
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r13
	mov	qword ptr [rax - 16], 1
	mov	r12, qword ptr [rbp - 56]       # 8-byte Reload
	lea	r15, [8*r12]
	mov	rdi, r15
	call	malloc@PLT
	mov	r13, rax
	test	r12, r12
	jle	.LBB0_18
# %bb.17:                               # %.lr.ph119.preheader
	mov	rdi, r13
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_18:                               # %._crit_edge120
	mov	rax, rsp
	lea	r10, [rax - 48]
	mov	rsp, r10
	mov	qword ptr [rax - 48], r13
	mov	qword ptr [rax - 40], r13
	mov	qword ptr [rax - 32], 0
	mov	rcx, qword ptr [rbp - 56]       # 8-byte Reload
	mov	qword ptr [rax - 24], rcx
	mov	qword ptr [rax - 16], 1
	mov	ecx, 3
	mov	r9d, 1
	xor	edi, edi
	xor	esi, esi
	mov	rdx, -1
	xor	r8d, r8d
	push	1
	push	r10
	push	1
	mov	rax, qword ptr [rbp - 88]       # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 96]       # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 80]       # 8-byte Reload
	push	rax
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
	mov	rax, qword ptr [rbp - 128]      # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 136]      # 8-byte Reload
	push	rax
	call	read_input_2D_f64@PLT
	add	rsp, 144
	mov	r12, qword ptr [rbp - 144]      # 8-byte Reload
	lea	rdi, [8*r12 + 32]
	call	malloc@PLT
	mov	r15, rax
	add	r15, 31
	and	r15, -32
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	lea	rdi, [8*rax + 32]
	call	malloc@PLT
	mov	rsi, r12
	mov	r12, rax
	add	r12, 31
	test	rsi, rsi
	jle	.LBB0_26
# %bb.19:                               # %.lr.ph122.preheader
	cmp	rsi, 32
	jae	.LBB0_21
# %bb.20:
	xor	eax, eax
	jmp	.LBB0_24
.LBB0_21:                               # %vector.ph
	mov	rax, rsi
	and	rax, -32
	lea	rcx, [r15 + 192]
	vbroadcastsd	zmm0, qword ptr [rip + .LCPI0_0] # zmm0 = [1.7E+0,1.7E+0,1.7E+0,1.7E+0,1.7E+0,1.7E+0,1.7E+0,1.7E+0]
	mov	rdx, rax
	.p2align	4, 0x90
.LBB0_22:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	zmmword ptr [rcx - 192], zmm0
	vmovupd	zmmword ptr [rcx - 128], zmm0
	vmovupd	zmmword ptr [rcx - 64], zmm0
	vmovupd	zmmword ptr [rcx], zmm0
	add	rcx, 256
	add	rdx, -32
	jne	.LBB0_22
# %bb.23:                               # %middle.block
	cmp	rsi, rax
	je	.LBB0_26
.LBB0_24:                               # %.lr.ph122.preheader133
	sub	rsi, rax
	lea	rax, [r15 + 8*rax]
	movabs	rcx, 4610334938539176755
	.p2align	4, 0x90
.LBB0_25:                               # %.lr.ph122
                                        # =>This Inner Loop Header: Depth=1
	mov	qword ptr [rax], rcx
	add	rax, 8
	add	rsi, -1
	jne	.LBB0_25
.LBB0_26:                               # %.preheader96
	and	r12, -32
	mov	rdx, qword ptr [rbp - 64]       # 8-byte Reload
	test	rdx, rdx
	jle	.LBB0_27
# %bb.33:                               # %.lr.ph123.preheader
	shl	rdx, 3
	mov	rdi, r12
	xor	esi, esi
	call	memset@PLT
.LBB0_27:                               # %.preheader.preheader
	xor	eax, eax
	jmp	.LBB0_28
	.p2align	4, 0x90
.LBB0_39:                               # %._crit_edge129
                                        #   in Loop: Header=BB0_28 Depth=1
	call	getTime@PLT
	vmovapd	xmm1, xmm0
	vmovsd	xmm0, qword ptr [rbp - 56]      # 8-byte Reload
                                        # xmm0 = mem[0],zero
	call	printElapsedTime@PLT
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	add	rax, 1
	cmp	rax, 10
	je	.LBB0_40
.LBB0_28:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_30 Depth 2
                                        #       Child Loop BB0_35 Depth 3
                                        #       Child Loop BB0_37 Depth 3
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	call	getTime@PLT
	vmovsd	qword ptr [rbp - 56], xmm0      # 8-byte Spill
	mov	rax, qword ptr [rbx]
	test	rax, rax
	mov	r10, qword ptr [rbp - 48]       # 8-byte Reload
	jle	.LBB0_39
# %bb.29:                               # %.lr.ph128.preheader
                                        #   in Loop: Header=BB0_28 Depth=1
	xor	ecx, ecx
	jmp	.LBB0_30
	.p2align	4, 0x90
.LBB0_38:                               # %._crit_edge126
                                        #   in Loop: Header=BB0_30 Depth=2
	add	rcx, 1
	cmp	rcx, rax
	je	.LBB0_39
.LBB0_30:                               # %.lr.ph128
                                        #   Parent Loop BB0_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_35 Depth 3
                                        #       Child Loop BB0_37 Depth 3
	mov	rdi, qword ptr [r10]
	test	rdi, rdi
	jle	.LBB0_38
# %bb.31:                               # %.lr.ph125
                                        #   in Loop: Header=BB0_30 Depth=2
	vmovsd	xmm0, qword ptr [r12 + 8*rcx]   # xmm0 = mem[0],zero
	mov	edx, edi
	and	edx, 3
	cmp	rdi, 4
	jae	.LBB0_34
# %bb.32:                               #   in Loop: Header=BB0_30 Depth=2
	xor	esi, esi
	jmp	.LBB0_36
	.p2align	4, 0x90
.LBB0_34:                               # %.lr.ph125.new
                                        #   in Loop: Header=BB0_30 Depth=2
	and	rdi, -4
	xor	esi, esi
	.p2align	4, 0x90
.LBB0_35:                               #   Parent Loop BB0_28 Depth=1
                                        #     Parent Loop BB0_30 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mov	r8, qword ptr [rbx]
	imul	r8, rsi
	add	r8, rcx
	mov	r9, qword ptr [r14 + 8*r8]
	vmovsd	xmm1, qword ptr [r13 + 8*r8]    # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r9]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [r12 + 8*rcx], xmm0
	lea	r8, [rsi + 1]
	imul	r8, qword ptr [rbx]
	add	r8, rcx
	mov	r9, qword ptr [r14 + 8*r8]
	vmovsd	xmm1, qword ptr [r13 + 8*r8]    # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r9]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [r12 + 8*rcx], xmm0
	lea	r8, [rsi + 2]
	imul	r8, qword ptr [rbx]
	add	r8, rcx
	mov	r9, qword ptr [r14 + 8*r8]
	vmovsd	xmm1, qword ptr [r13 + 8*r8]    # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r9]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [r12 + 8*rcx], xmm0
	lea	r8, [rsi + 3]
	imul	r8, qword ptr [rbx]
	add	r8, rcx
	mov	r9, qword ptr [r14 + 8*r8]
	vmovsd	xmm1, qword ptr [r13 + 8*r8]    # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r9]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [r12 + 8*rcx], xmm0
	add	rsi, 4
	cmp	rdi, rsi
	jne	.LBB0_35
.LBB0_36:                               # %._crit_edge126.loopexit.unr-lcssa
                                        #   in Loop: Header=BB0_30 Depth=2
	test	rdx, rdx
	je	.LBB0_38
	.p2align	4, 0x90
.LBB0_37:                               # %.epil.preheader
                                        #   Parent Loop BB0_28 Depth=1
                                        #     Parent Loop BB0_30 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mov	rdi, qword ptr [rbx]
	imul	rdi, rsi
	add	rdi, rcx
	mov	r8, qword ptr [r14 + 8*rdi]
	vmovsd	xmm1, qword ptr [r13 + 8*rdi]   # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r8]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [r12 + 8*rcx], xmm0
	add	rsi, 1
	add	rdx, -1
	jne	.LBB0_37
	jmp	.LBB0_38
.LBB0_40:
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
