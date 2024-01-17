#pragma once

extern void read_input_sizes_2D_f64(int32_t fileID,
                             int32_t A1format, int32_t A1_block_format,
                             int32_t A2format, int32_t A2_block_format,
                             int A1pos_rank, void *A1pos_ptr, int32_t readMode);

extern void read_input_2D_f64(int32_t fileID,
                           int32_t A1format, int32_t A1_block_format,
                           int32_t A2format, int32_t A2_block_format,
                           int A1pos_rank, void *A1pos_ptr, int A1crd_rank, void *A1crd_ptr,
                           int A1block_pos_rank, void *A1block_pos_ptr, int A1block_crd_rank, void *A1block_crd_ptr,
                           int A2pos_rank, void *A2pos_ptr, int A2crd_rank, void *A2crd_ptr,
                           int A2block_pos_rank, void *A2block_pos_ptr, int A2block_crd_rank, void *A2block_crd_ptr,
                           int Aval_rank, void *Aval_ptr, int32_t readMode);

