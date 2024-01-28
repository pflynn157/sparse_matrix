module {
  func.func @main() {
    %cst = arith.constant 1.700000e+00 : f64
    %cst_0 = arith.constant 0.000000e+00 : f64
    %c10 = arith.constant 10 : index
    %c9 = arith.constant 9 : index
    %c8 = arith.constant 8 : index
    %c7 = arith.constant 7 : index
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<13xindex>
    %cast = memref.cast %alloc : memref<13xindex> to memref<*xindex>
    call @read_input_sizes_2D_f64(%c0_i32, %c0, %c0, %c1, %c0, %cast, %c1_i32) {filename = "SPARSE_FILE_NAME0"} : (i32, index, index, index, index, memref<*xindex>, i32) -> ()
    %0 = memref.load %alloc[%c0] : memref<13xindex>
    %1 = memref.load %alloc[%c1] : memref<13xindex>
    %2 = memref.load %alloc[%c2] : memref<13xindex>
    %3 = memref.load %alloc[%c3] : memref<13xindex>
    %4 = memref.load %alloc[%c4] : memref<13xindex>
    %5 = memref.load %alloc[%c5] : memref<13xindex>
    %6 = memref.load %alloc[%c6] : memref<13xindex>
    %7 = memref.load %alloc[%c7] : memref<13xindex>
    %8 = memref.load %alloc[%c8] : memref<13xindex>
    %9 = memref.load %alloc[%c9] : memref<13xindex>
    %10 = memref.load %alloc[%c10] : memref<13xindex>
    %alloc_1 = memref.alloc(%0) : memref<?xindex>
    scf.for %arg0 = %c0 to %0 step %c1 {
      memref.store %c0, %alloc_1[%arg0] : memref<?xindex>
    }
    %cast_2 = memref.cast %alloc_1 : memref<?xindex> to memref<*xindex>
    %alloc_3 = memref.alloc(%1) : memref<?xindex>
    scf.for %arg0 = %c0 to %1 step %c1 {
      memref.store %c0, %alloc_3[%arg0] : memref<?xindex>
    }
    %cast_4 = memref.cast %alloc_3 : memref<?xindex> to memref<*xindex>
    %alloc_5 = memref.alloc(%2) : memref<?xindex>
    scf.for %arg0 = %c0 to %2 step %c1 {
      memref.store %c0, %alloc_5[%arg0] : memref<?xindex>
    }
    %cast_6 = memref.cast %alloc_5 : memref<?xindex> to memref<*xindex>
    %alloc_7 = memref.alloc(%3) : memref<?xindex>
    scf.for %arg0 = %c0 to %3 step %c1 {
      memref.store %c0, %alloc_7[%arg0] : memref<?xindex>
    }
    %cast_8 = memref.cast %alloc_7 : memref<?xindex> to memref<*xindex>
    %alloc_9 = memref.alloc(%4) : memref<?xindex>
    scf.for %arg0 = %c0 to %4 step %c1 {
      memref.store %c0, %alloc_9[%arg0] : memref<?xindex>
    }
    %cast_10 = memref.cast %alloc_9 : memref<?xindex> to memref<*xindex>
    %alloc_11 = memref.alloc(%5) : memref<?xindex>
    scf.for %arg0 = %c0 to %5 step %c1 {
      memref.store %c0, %alloc_11[%arg0] : memref<?xindex>
    }
    %cast_12 = memref.cast %alloc_11 : memref<?xindex> to memref<*xindex>
    %alloc_13 = memref.alloc(%6) : memref<?xindex>
    scf.for %arg0 = %c0 to %6 step %c1 {
      memref.store %c0, %alloc_13[%arg0] : memref<?xindex>
    }
    %cast_14 = memref.cast %alloc_13 : memref<?xindex> to memref<*xindex>
    %alloc_15 = memref.alloc(%7) : memref<?xindex>
    scf.for %arg0 = %c0 to %7 step %c1 {
      memref.store %c0, %alloc_15[%arg0] : memref<?xindex>
    }
    %cast_16 = memref.cast %alloc_15 : memref<?xindex> to memref<*xindex>
    %alloc_17 = memref.alloc(%8) : memref<?xf64>
    scf.for %arg0 = %c0 to %8 step %c1 {
      memref.store %cst_0, %alloc_17[%arg0] : memref<?xf64>
    }
    %cast_18 = memref.cast %alloc_17 : memref<?xf64> to memref<*xf64>
    call @read_input_2D_f64(%c0_i32, %c0, %c0, %c1, %c0, %cast_2, %cast_4, %cast_6, %cast_8, %cast_10, %cast_12, %cast_14, %cast_16, %cast_18, %c1_i32) {filename = "SPARSE_FILE_NAME0"} : (i32, index, index, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>, i32) -> ()
    %alloc_19 = memref.alloc(%10) {alignment = 32 : i64} : memref<?x32xf64>
    %alloc_20 = memref.alloc(%9) {alignment = 32 : i64} : memref<?x32xf64>
    linalg.fill ins(%cst : f64) outs(%alloc_19 : memref<?x32xf64>)
    linalg.fill ins(%cst_0 : f64) outs(%alloc_20 : memref<?x32xf64>)
    %11 = call @getTime() : () -> f64
    %12 = memref.load %alloc_1[%c0] : memref<?xindex>
    scf.for %arg0 = %c0 to %12 step %c1 {
      %14 = memref.load %alloc_5[%c0] : memref<?xindex>
      scf.for %arg1 = %c0 to %14 step %c1 {
        %15 = memref.load %alloc_5[%c0] : memref<?xindex>
        %16 = arith.muli %arg0, %15 : index
        %17 = arith.addi %16, %arg1 : index
        %18 = arith.addi %arg0, %c1 : index
        %19 = memref.load %alloc_9[%arg0] : memref<?xindex>
        %20 = memref.load %alloc_9[%18] : memref<?xindex>
        scf.for %arg2 = %19 to %20 step %c1 {
          %21 = memref.load %alloc_11[%arg2] : memref<?xindex>
          %22 = memref.load %alloc_13[%c0] : memref<?xindex>
          scf.for %arg3 = %c0 to %22 step %c1 {
            %23 = memref.load %alloc_13[%c1] : memref<?xindex>
            %24 = arith.muli %21, %23 : index
            %25 = arith.addi %24, %arg3 : index
            scf.for %arg4 = %c0 to %c32 step %c1 {
              %26 = memref.load %alloc_5[%c0] : memref<?xindex>
              %27 = memref.load %alloc_13[%c0] : memref<?xindex>
              %28 = arith.muli %26, %27 : index
              %29 = arith.muli %arg2, %28 : index
              %30 = arith.muli %arg1, %27 : index
              %31 = arith.addi %29, %30 : index
              %32 = arith.addi %31, %arg3 : index
              %33 = memref.load %alloc_17[%32] : memref<?xf64>
              %34 = memref.load %alloc_19[%25, %arg4] : memref<?x32xf64>
              %35 = memref.load %alloc_20[%17, %arg4] : memref<?x32xf64>
              %36 = arith.mulf %33, %34 : f64
              %37 = arith.addf %35, %36 : f64
              memref.store %37, %alloc_20[%17, %arg4] : memref<?x32xf64>
            }
          }
        }
      }
    }
    %13 = call @getTime() : () -> f64
    call @printElapsedTime(%11, %13) : (f64, f64) -> ()
    return
  }
  func.func private @read_input_2D_f64(i32, index, index, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>, i32)
  func.func private @read_input_sizes_2D_f64(i32, index, index, index, index, memref<*xindex>, i32)
  func.func private @comet_sort_index(memref<*xindex>, index, index)
  func.func private @getTime() -> f64
  func.func private @printElapsedTime(f64, f64)
}
