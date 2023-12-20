module {
  func.func @main() {
    %alloc = memref.alloc() : memref<13xindex>
    %cast = memref.cast %alloc : memref<13xindex> to memref<*xindex>
    %c-1 = arith.constant -1 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    call @read_input_sizes_2D_f64(%c0_i32, %c0, %c0, %c3, %c-1, %cast, %c1_i32) {filename = "SPARSE_FILE_NAME0"} : (i32, index, index, index, index, memref<*xindex>, i32) -> ()
    %0 = memref.load %alloc[%c0] : memref<13xindex>
    %c1 = arith.constant 1 : index
    %1 = memref.load %alloc[%c1] : memref<13xindex>
    %c2 = arith.constant 2 : index
    %2 = memref.load %alloc[%c2] : memref<13xindex>
    %3 = memref.load %alloc[%c3] : memref<13xindex>
    %c4 = arith.constant 4 : index
    %4 = memref.load %alloc[%c4] : memref<13xindex>
    %c5 = arith.constant 5 : index
    %5 = memref.load %alloc[%c5] : memref<13xindex>
    %c6 = arith.constant 6 : index
    %6 = memref.load %alloc[%c6] : memref<13xindex>
    %c7 = arith.constant 7 : index
    %7 = memref.load %alloc[%c7] : memref<13xindex>
    %c8 = arith.constant 8 : index
    %8 = memref.load %alloc[%c8] : memref<13xindex>
    %c9 = arith.constant 9 : index
    %9 = memref.load %alloc[%c9] : memref<13xindex>
    %c10 = arith.constant 10 : index
    %10 = memref.load %alloc[%c10] : memref<13xindex>
    %c11 = arith.constant 11 : index
    %c12 = arith.constant 12 : index
    %alloc_0 = memref.alloc(%0) : memref<?xindex>
    scf.for %arg0 = %c0 to %0 step %c1 {
      memref.store %c0, %alloc_0[%arg0] : memref<?xindex>
    }
    %cast_1 = memref.cast %alloc_0 : memref<?xindex> to memref<*xindex>
    %alloc_2 = memref.alloc(%1) : memref<?xindex>
    scf.for %arg0 = %c0 to %1 step %c1 {
      memref.store %c0, %alloc_2[%arg0] : memref<?xindex>
    }
    %cast_3 = memref.cast %alloc_2 : memref<?xindex> to memref<*xindex>
    %alloc_4 = memref.alloc(%2) : memref<?xindex>
    scf.for %arg0 = %c0 to %2 step %c1 {
      memref.store %c0, %alloc_4[%arg0] : memref<?xindex>
    }
    %cast_5 = memref.cast %alloc_4 : memref<?xindex> to memref<*xindex>
    %alloc_6 = memref.alloc(%3) : memref<?xindex>
    scf.for %arg0 = %c0 to %3 step %c1 {
      memref.store %c0, %alloc_6[%arg0] : memref<?xindex>
    }
    %cast_7 = memref.cast %alloc_6 : memref<?xindex> to memref<*xindex>
    %alloc_8 = memref.alloc(%4) : memref<?xindex>
    scf.for %arg0 = %c0 to %4 step %c1 {
      memref.store %c0, %alloc_8[%arg0] : memref<?xindex>
    }
    %cast_9 = memref.cast %alloc_8 : memref<?xindex> to memref<*xindex>
    %alloc_10 = memref.alloc(%5) : memref<?xindex>
    scf.for %arg0 = %c0 to %5 step %c1 {
      memref.store %c0, %alloc_10[%arg0] : memref<?xindex>
    }
    %cast_11 = memref.cast %alloc_10 : memref<?xindex> to memref<*xindex>
    %alloc_12 = memref.alloc(%6) : memref<?xindex>
    scf.for %arg0 = %c0 to %6 step %c1 {
      memref.store %c0, %alloc_12[%arg0] : memref<?xindex>
    }
    %cast_13 = memref.cast %alloc_12 : memref<?xindex> to memref<*xindex>
    %alloc_14 = memref.alloc(%7) : memref<?xindex>
    scf.for %arg0 = %c0 to %7 step %c1 {
      memref.store %c0, %alloc_14[%arg0] : memref<?xindex>
    }
    %cast_15 = memref.cast %alloc_14 : memref<?xindex> to memref<*xindex>
    %alloc_16 = memref.alloc(%8) : memref<?xf64>
    %cst = arith.constant 0.000000e+00 : f64
    scf.for %arg0 = %c0 to %8 step %c1 {
      memref.store %cst, %alloc_16[%arg0] : memref<?xf64>
    }
    %cast_17 = memref.cast %alloc_16 : memref<?xf64> to memref<*xf64>
    call @read_input_2D_f64(%c0_i32, %c0, %c0, %c3, %c-1, %cast_1, %cast_3, %cast_5, %cast_7, %cast_9, %cast_11, %cast_13, %cast_15, %cast_17, %c1_i32) {filename = "SPARSE_FILE_NAME0"} : (i32, index, index, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>, i32) -> ()
    %11 = bufferization.to_tensor %alloc_0 : memref<?xindex>        //;A1_pos
    %12 = bufferization.to_tensor %alloc_2 : memref<?xindex>        //;A1_crd
    %13 = bufferization.to_tensor %alloc_4 : memref<?xindex>        //;A1_tile_pos
    %14 = bufferization.to_tensor %alloc_6 : memref<?xindex>        //;A1_tile_crd
    %15 = bufferization.to_tensor %alloc_8 : memref<?xindex>        //;A2_pos
    %16 = bufferization.to_tensor %alloc_10 : memref<?xindex>       //;A2_crd
    %17 = bufferization.to_tensor %alloc_12 : memref<?xindex>       //;A2_tile_pos
    %18 = bufferization.to_tensor %alloc_14 : memref<?xindex>       //;A2_tile_crd
    %19 = bufferization.to_tensor %alloc_16 : memref<?xf64>         //;Aval
    
    // Create our dense arrays
    %B = memref.alloc(%9, %10) {alignment = 32 : i64} : memref<?x?xf64>
    %C = memref.alloc(%9, %10) {alignment = 32 : i64} : memref<?x?xf64>
    %cst_20 = arith.constant 1.000000e+00 : f64
    linalg.fill ins(%cst_20 : f64) outs(%B : memref<?x?xf64>)
    linalg.fill ins(%cst : f64) outs(%C : memref<?x?xf64>)
    
    //;/////////////////////////////////////////////////////////////////////
    //;const int N = A->A1_pos;
    //;
    //;// LOOP 1: Dense
    //;for (int i1 = 0; i1<A->A1_pos; i1++) {
    //;    // LOOP1.1: Dense (A1_tile)
    //;    for (int i2 = 0; i2<A->A1_tile_pos; i2++) {
    //;        int i = i1;
    //;        
    //;        // Singleton
    //;        int n2 = i1*A->A1_tile_pos+i2;
    //;        int j = A->A2_crd[n2];
    //;        
    //;        // Inner dense loop
    //;        for (int k = 0; k<N; k++) {
    //;            C->A[i*N+k] += A->Aval[n2] * B->A[j*N+k];
    //;        }
    //;    }
    //;}
    //;////////////////////////////////////////////////////////////////////
    
    // Now do the math
    %A1_pos = memref.load %alloc_0[%c0] : memref<?xindex>
    %A1_tile_pos = memref.load %alloc_4[%c0] : memref<?xindex>
    scf.for %i1 = %c0 to %A1_pos step %c1 {
        scf.for %i2 = %c0 to %A1_tile_pos step %c1 {
            %n1 = arith.muli %i1, %A1_tile_pos : index
            %n = arith.addi %n1, %i2 : index
            %j = memref.load %alloc_10[%n] : memref<?xindex>
            
            scf.for %k = %c0 to %A1_pos step %c1 {
                %24 = memref.load %alloc_16[%n] : memref<?xf64>
                %25 = memref.load %B[%j, %k] : memref<?x?xf64>
                %26 = memref.load %C[%i1, %k] : memref<?x?xf64>
                %27 = arith.mulf %24, %25 : f64
                %28 = arith.addf %26, %27 : f64
                memref.store %28, %C[%i1, %k] : memref<?x?xf64>
            }
        }
    }
    
    // Print everything here
    call @comet_print_memref_i64(%cast_1) : (memref<*xindex>) -> ()
    call @comet_print_memref_i64(%cast_3) : (memref<*xindex>) -> ()
    call @comet_print_memref_i64(%cast_5) : (memref<*xindex>) -> ()
    call @comet_print_memref_i64(%cast_7) : (memref<*xindex>) -> ()
    call @comet_print_memref_i64(%cast_9) : (memref<*xindex>) -> ()
    call @comet_print_memref_i64(%cast_11) : (memref<*xindex>) -> ()
    call @comet_print_memref_i64(%cast_13) : (memref<*xindex>) -> ()
    call @comet_print_memref_i64(%cast_15) : (memref<*xindex>) -> ()
    call @comet_print_memref_f64(%cast_17) : (memref<*xf64>) -> ()
    
    // Print B
    //%cast_21 = memref.cast %alloc_19 : memref<?x?xf64> to memref<*xf64>
    %cast_B1 = memref.cast %B : memref<?x?xf64> to memref<*xf64>
    call @comet_print_memref_f64(%cast_B1) : (memref<*xf64>) -> ()
    
    // Print C
    %cast_C1 = memref.cast %C : memref<?x?xf64> to memref<*xf64>
    call @comet_print_memref_f64(%cast_C1) : (memref<*xf64>) -> ()
    
    return
  }
  func.func private @read_input_2D_f64(i32, index, index, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>, i32)
  func.func private @read_input_sizes_2D_f64(i32, index, index, index, index, memref<*xindex>, i32)
  func.func private @comet_sort_index(memref<*xindex>, index, index)
  func.func private @comet_print_memref_f64(memref<*xf64>)
  func.func private @comet_print_memref_i64(memref<*xindex>)
}
