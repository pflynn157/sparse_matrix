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
	mov	ecx, 1
	mov	r9d, 1
	xor	edi, edi
	xor	esi, esi
	mov	rdx, -1
	mov	r8, -1
	push	1
	push	rax
	call	read_input_sizes_2D_f64@PLT
	add	rsp, 16
	mov	r14, qword ptr [rbx]
	mov	r12, qword ptr [rbx + 8]
	mov	r15, qword ptr [rbx + 16]
	mov	r13, qword ptr [rbx + 24]
	mov	rax, qword ptr [rbx + 32]
	mov	qword ptr [rbp - 72], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 40]
	mov	qword ptr [rbp - 80], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 48]
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 56]
	mov	qword ptr [rbp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rbx + 64]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 72]
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	mov	rax, qword ptr [rbx + 80]
	mov	qword ptr [rbp - 144], rax      # 8-byte Spill
	lea	rbx, [8*r14]
	mov	rdi, rbx
	call	malloc@PLT
	test	r14, r14
	mov	qword ptr [rbp - 88], rax       # 8-byte Spill
	jle	.LBB0_2
# %bb.1:                                # %.lr.ph.preheader
	mov	rdi, qword ptr [rbp - 88]       # 8-byte Reload
	xor	esi, esi
	mov	rdx, rbx
	call	memset@PLT
	mov	rax, qword ptr [rbp - 88]       # 8-byte Reload
.LBB0_2:                                # %._crit_edge
	mov	rcx, rsp
	lea	rdx, [rcx - 48]
	mov	qword ptr [rbp - 136], rdx      # 8-byte Spill
	mov	rsp, rdx
	mov	qword ptr [rcx - 48], rax
	mov	qword ptr [rcx - 40], rax
	mov	qword ptr [rcx - 32], 0
	mov	qword ptr [rcx - 24], r14
	mov	qword ptr [rcx - 16], 1
	lea	r14, [8*r12]
	mov	rdi, r14
	call	malloc@PLT
	mov	rbx, rax
	test	r12, r12
	jle	.LBB0_4
# %bb.3:                                # %.lr.ph98.preheader
	mov	rdi, rbx
	xor	esi, esi
	mov	rdx, r14
	call	memset@PLT
.LBB0_4:                                # %._crit_edge99
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 128], rcx      # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], rbx
	mov	qword ptr [rax - 40], rbx
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r12
	mov	qword ptr [rax - 16], 1
	lea	r14, [8*r15]
	mov	rdi, r14
	call	malloc@PLT
	mov	rbx, rax
	test	r15, r15
	jle	.LBB0_6
# %bb.5:                                # %.lr.ph101.preheader
	mov	rdi, rbx
	xor	esi, esi
	mov	rdx, r14
	call	memset@PLT
.LBB0_6:                                # %._crit_edge102
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 112], rcx      # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], rbx
	mov	qword ptr [rax - 40], rbx
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r15
	mov	qword ptr [rax - 16], 1
	lea	r14, [8*r13]
	mov	rdi, r14
	call	malloc@PLT
	mov	rbx, rax
	test	r13, r13
	mov	r12, qword ptr [rbp - 72]       # 8-byte Reload
	jle	.LBB0_8
# %bb.7:                                # %.lr.ph104.preheader
	mov	rdi, rbx
	xor	esi, esi
	mov	rdx, r14
	call	memset@PLT
.LBB0_8:                                # %._crit_edge105
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 104], rcx      # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], rbx
	mov	qword ptr [rax - 40], rbx
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r13
	mov	qword ptr [rax - 16], 1
	lea	rbx, [8*r12]
	mov	rdi, rbx
	call	malloc@PLT
	mov	r14, rax
	test	r12, r12
	mov	r15, qword ptr [rbp - 80]       # 8-byte Reload
	jle	.LBB0_10
# %bb.9:                                # %.lr.ph107.preheader
	mov	rdi, r14
	xor	esi, esi
	mov	rdx, rbx
	call	memset@PLT
.LBB0_10:                               # %._crit_edge108
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 96], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r14
	mov	qword ptr [rax - 40], r14
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r12
	mov	qword ptr [rax - 16], 1
	lea	rbx, [8*r15]
	mov	rdi, rbx
	call	malloc@PLT
	mov	r12, rax
	test	r15, r15
	jle	.LBB0_12
# %bb.11:                               # %.lr.ph110.preheader
	mov	rdi, r12
	xor	esi, esi
	mov	rdx, rbx
	call	memset@PLT
.LBB0_12:                               # %._crit_edge111
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 72], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], r12
	mov	qword ptr [rax - 40], r12
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r15
	mov	qword ptr [rax - 16], 1
	mov	r13, qword ptr [rbp - 48]       # 8-byte Reload
	lea	r15, [8*r13]
	mov	rdi, r15
	call	malloc@PLT
	mov	rbx, rax
	test	r13, r13
	jle	.LBB0_14
# %bb.13:                               # %.lr.ph113.preheader
	mov	rdi, rbx
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_14:                               # %._crit_edge114
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 80], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], rbx
	mov	qword ptr [rax - 40], rbx
	mov	qword ptr [rax - 32], 0
	mov	rcx, qword ptr [rbp - 48]       # 8-byte Reload
	mov	qword ptr [rax - 24], rcx
	mov	qword ptr [rax - 16], 1
	mov	r13, qword ptr [rbp - 120]      # 8-byte Reload
	lea	r15, [8*r13]
	mov	rdi, r15
	call	malloc@PLT
	mov	rbx, rax
	test	r13, r13
	jle	.LBB0_16
# %bb.15:                               # %.lr.ph116.preheader
	mov	rdi, rbx
	xor	esi, esi
	mov	rdx, r15
	call	memset@PLT
.LBB0_16:                               # %._crit_edge117
	mov	rax, rsp
	lea	rcx, [rax - 48]
	mov	qword ptr [rbp - 48], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rax - 48], rbx
	mov	qword ptr [rax - 40], rbx
	mov	qword ptr [rax - 32], 0
	mov	qword ptr [rax - 24], r13
	mov	qword ptr [rax - 16], 1
	mov	r15, qword ptr [rbp - 56]       # 8-byte Reload
	lea	rbx, [8*r15]
	mov	rdi, rbx
	call	malloc@PLT
	mov	r13, rax
	test	r15, r15
	jle	.LBB0_18
# %bb.17:                               # %.lr.ph119.preheader
	mov	rdi, r13
	xor	esi, esi
	mov	rdx, rbx
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
	mov	ecx, 1
	mov	r9d, 1
	xor	edi, edi
	xor	esi, esi
	mov	rdx, -1
	mov	r8, -1
	push	1
	push	r10
	push	1
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 80]       # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 72]       # 8-byte Reload
	push	rax
	push	1
	mov	rax, qword ptr [rbp - 96]       # 8-byte Reload
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
	mov	rbx, qword ptr [rbp - 144]      # 8-byte Reload
	lea	rdi, [8*rbx + 32]
	call	malloc@PLT
	mov	r15, rax
	add	r15, 31
	and	r15, -32
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	lea	rdi, [8*rax + 32]
	call	malloc@PLT
	mov	rsi, rbx
	mov	rbx, rax
	add	rbx, 31
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
.LBB0_24:                               # %.lr.ph122.preheader132
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
	and	rbx, -32
	mov	rdx, qword ptr [rbp - 64]       # 8-byte Reload
	test	rdx, rdx
	jle	.LBB0_27
# %bb.30:                               # %.lr.ph123.preheader
	shl	rdx, 3
	mov	rdi, rbx
	xor	esi, esi
	call	memset@PLT
.LBB0_27:                               # %.preheader.preheader
	xor	eax, eax
	jmp	.LBB0_28
	.p2align	4, 0x90
.LBB0_37:                               # %._crit_edge128
                                        #   in Loop: Header=BB0_28 Depth=1
	call	getTime@PLT
	vmovapd	xmm1, xmm0
	vmovsd	xmm0, qword ptr [rbp - 56]      # 8-byte Reload
                                        # xmm0 = mem[0],zero
	call	printElapsedTime@PLT
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	add	rax, 1
	cmp	rax, 10
	je	.LBB0_38
.LBB0_28:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_32 Depth 2
                                        #       Child Loop BB0_34 Depth 3
                                        #       Child Loop BB0_36 Depth 3
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	call	getTime@PLT
	vmovsd	qword ptr [rbp - 56], xmm0      # 8-byte Spill
	mov	rax, qword ptr [rbp - 88]       # 8-byte Reload
	mov	rax, qword ptr [rax]
	test	rax, rax
	jle	.LBB0_37
# %bb.29:                               # %.lr.ph127.preheader
                                        #   in Loop: Header=BB0_28 Depth=1
	xor	ecx, ecx
	jmp	.LBB0_32
	.p2align	4, 0x90
.LBB0_31:                               # %.loopexit
                                        #   in Loop: Header=BB0_32 Depth=2
	cmp	rcx, rax
	je	.LBB0_37
.LBB0_32:                               # %.lr.ph127
                                        #   Parent Loop BB0_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_34 Depth 3
                                        #       Child Loop BB0_36 Depth 3
	mov	rdx, rcx
	add	rcx, 1
	mov	rsi, qword ptr [r14 + 8*rdx]
	mov	rdi, qword ptr [r14 + 8*rdx + 8]
	cmp	rdi, rsi
	jle	.LBB0_31
# %bb.33:                               # %.lr.ph125
                                        #   in Loop: Header=BB0_32 Depth=2
	vmovsd	xmm0, qword ptr [rbx + 8*rdx]   # xmm0 = mem[0],zero
	mov	r9d, edi
	sub	r9d, esi
	mov	r8, rsi
	not	r8
	add	r8, rdi
	and	r9, 3
	je	.LBB0_35
	.p2align	4, 0x90
.LBB0_34:                               # %.prol.preheader
                                        #   Parent Loop BB0_28 Depth=1
                                        #     Parent Loop BB0_32 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mov	r10, qword ptr [r12 + 8*rsi]
	vmovsd	xmm1, qword ptr [r13 + 8*rsi]   # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r10]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rbx + 8*rdx], xmm0
	add	rsi, 1
	add	r9, -1
	jne	.LBB0_34
.LBB0_35:                               # %.prol.loopexit
                                        #   in Loop: Header=BB0_32 Depth=2
	cmp	r8, 3
	jb	.LBB0_31
	.p2align	4, 0x90
.LBB0_36:                               # %.lr.ph125.new
                                        #   Parent Loop BB0_28 Depth=1
                                        #     Parent Loop BB0_32 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mov	r8, qword ptr [r12 + 8*rsi]
	vmovsd	xmm1, qword ptr [r13 + 8*rsi]   # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r8]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rbx + 8*rdx], xmm0
	mov	r8, qword ptr [r12 + 8*rsi + 8]
	vmovsd	xmm1, qword ptr [r13 + 8*rsi + 8] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r8]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rbx + 8*rdx], xmm0
	mov	r8, qword ptr [r12 + 8*rsi + 16]
	vmovsd	xmm1, qword ptr [r13 + 8*rsi + 16] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r8]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rbx + 8*rdx], xmm0
	mov	r8, qword ptr [r12 + 8*rsi + 24]
	vmovsd	xmm1, qword ptr [r13 + 8*rsi + 24] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [r15 + 8*r8]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rbx + 8*rdx], xmm0
	add	rsi, 4
	cmp	rdi, rsi
	jne	.LBB0_36
	jmp	.LBB0_31
.LBB0_38:
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
