%6 = "it.ComputeRHS"(%4, %3) {
    allFormats = [["D", "D"], ["D", "S"]],
    allPerms = [[0, 1], [1, 2]],
    allBlocks = [["UNK", "UNK"], ["D", "UNK"]]
}

; How this will work:
; ELLPACK has the following attributes:
;   -> D (A1)
;   -> D (A1_tile)
;   -> S (A2)
; All these attributes are loaded by the "comet_read_file" function and
; storted in the structure created by it.
;
; "allBlocks" will hold block (tiling) information for each dimension of
; our matrix/tensor. There MUST be a corresponding entry in "allBlocks" for
; each dimension. If the block isn't needed, something like "UNK" can be entered.
;
; In the IndexToSCF pass:
; (Refer to "multiply.cpp" in ../ellpack of this repository. Refer to the "sparse_multiply" function)
; All formats will be generated as they are now. If a block format is detected,
; an inner loop will be generated for the block, and a variable will be introduced that accounts
; for the combination of both the dimension and block loop
; Pseudocode:
; function genDimension()
;   gen dimension loop
;   if hasBlock(dimension):
;       gen tile loop
;       compute loop variable
;   ...

