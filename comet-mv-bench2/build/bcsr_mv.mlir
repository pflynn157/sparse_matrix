module attributes {llvm.data_layout = ""} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @main() {
    %0 = llvm.mlir.constant(32 : index) : i64
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(13 : index) : i64
    %4 = llvm.mlir.constant(2 : index) : i64
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.mlir.constant(0 : i32) : i32
    %7 = llvm.mlir.constant(1 : i32) : i32
    %8 = llvm.mlir.constant(4 : index) : i64
    %9 = llvm.mlir.constant(5 : index) : i64
    %10 = llvm.mlir.constant(6 : index) : i64
    %11 = llvm.mlir.constant(7 : index) : i64
    %12 = llvm.mlir.constant(8 : index) : i64
    %13 = llvm.mlir.constant(9 : index) : i64
    %14 = llvm.mlir.constant(10 : index) : i64
    %15 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %16 = llvm.mlir.constant(1.700000e+00 : f64) : f64
    %17 = llvm.mlir.constant(1 : index) : i64
    %18 = llvm.mlir.constant(0 : index) : i64
    %19 = llvm.mlir.null : !llvm.ptr<i64>
    %20 = llvm.getelementptr %19[13] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %21 = llvm.ptrtoint %20 : !llvm.ptr<i64> to i64
    %22 = llvm.call @malloc(%21) : (i64) -> !llvm.ptr<i8>
    %23 = llvm.bitcast %22 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %24 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %25 = llvm.insertvalue %23, %24[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.insertvalue %23, %25[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.insertvalue %1, %26[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.insertvalue %3, %27[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %2, %28[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %29, %30 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %31 = llvm.bitcast %30 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %32 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %33 = llvm.insertvalue %2, %32[0] : !llvm.struct<(i64, ptr<i8>)> 
    %34 = llvm.insertvalue %31, %33[1] : !llvm.struct<(i64, ptr<i8>)> 
    llvm.call @read_input_sizes_2D_f64(%6, %18, %18, %17, %18, %2, %31, %7) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr<i8>, i32) -> ()
    %35 = llvm.load %23 : !llvm.ptr<i64>
    %36 = llvm.getelementptr %23[1] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %37 = llvm.load %36 : !llvm.ptr<i64>
    %38 = llvm.getelementptr %23[2] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %39 = llvm.load %38 : !llvm.ptr<i64>
    %40 = llvm.getelementptr %23[3] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %41 = llvm.load %40 : !llvm.ptr<i64>
    %42 = llvm.getelementptr %23[4] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %43 = llvm.load %42 : !llvm.ptr<i64>
    %44 = llvm.getelementptr %23[5] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %45 = llvm.load %44 : !llvm.ptr<i64>
    %46 = llvm.getelementptr %23[6] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %47 = llvm.load %46 : !llvm.ptr<i64>
    %48 = llvm.getelementptr %23[7] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %49 = llvm.load %48 : !llvm.ptr<i64>
    %50 = llvm.getelementptr %23[8] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %51 = llvm.load %50 : !llvm.ptr<i64>
    %52 = llvm.getelementptr %23[9] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %53 = llvm.load %52 : !llvm.ptr<i64>
    %54 = llvm.getelementptr %23[10] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %55 = llvm.load %54 : !llvm.ptr<i64>
    %56 = llvm.mlir.null : !llvm.ptr<i64>
    %57 = llvm.getelementptr %56[%35] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %58 = llvm.ptrtoint %57 : !llvm.ptr<i64> to i64
    %59 = llvm.call @malloc(%58) : (i64) -> !llvm.ptr<i8>
    %60 = llvm.bitcast %59 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %61 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %62 = llvm.insertvalue %60, %61[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.insertvalue %60, %62[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.insertvalue %1, %63[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.insertvalue %35, %64[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.insertvalue %2, %65[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%18 : i64)
  ^bb1(%67: i64):  // 2 preds: ^bb0, ^bb2
    %68 = llvm.icmp "slt" %67, %35 : i64
    llvm.cond_br %68, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %69 = llvm.getelementptr %60[%67] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %18, %69 : !llvm.ptr<i64>
    %70 = llvm.add %67, %17  : i64
    llvm.br ^bb1(%70 : i64)
  ^bb3:  // pred: ^bb1
    %71 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %66, %71 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %72 = llvm.bitcast %71 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %73 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %74 = llvm.insertvalue %2, %73[0] : !llvm.struct<(i64, ptr<i8>)> 
    %75 = llvm.insertvalue %72, %74[1] : !llvm.struct<(i64, ptr<i8>)> 
    %76 = llvm.mlir.null : !llvm.ptr<i64>
    %77 = llvm.getelementptr %76[%37] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %78 = llvm.ptrtoint %77 : !llvm.ptr<i64> to i64
    %79 = llvm.call @malloc(%78) : (i64) -> !llvm.ptr<i8>
    %80 = llvm.bitcast %79 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %81 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %82 = llvm.insertvalue %80, %81[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.insertvalue %80, %82[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %84 = llvm.insertvalue %1, %83[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %85 = llvm.insertvalue %37, %84[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.insertvalue %2, %85[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb4(%18 : i64)
  ^bb4(%87: i64):  // 2 preds: ^bb3, ^bb5
    %88 = llvm.icmp "slt" %87, %37 : i64
    llvm.cond_br %88, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %89 = llvm.getelementptr %80[%87] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %18, %89 : !llvm.ptr<i64>
    %90 = llvm.add %87, %17  : i64
    llvm.br ^bb4(%90 : i64)
  ^bb6:  // pred: ^bb4
    %91 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %86, %91 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %92 = llvm.bitcast %91 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %93 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %94 = llvm.insertvalue %2, %93[0] : !llvm.struct<(i64, ptr<i8>)> 
    %95 = llvm.insertvalue %92, %94[1] : !llvm.struct<(i64, ptr<i8>)> 
    %96 = llvm.mlir.null : !llvm.ptr<i64>
    %97 = llvm.getelementptr %96[%39] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %98 = llvm.ptrtoint %97 : !llvm.ptr<i64> to i64
    %99 = llvm.call @malloc(%98) : (i64) -> !llvm.ptr<i8>
    %100 = llvm.bitcast %99 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %101 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %102 = llvm.insertvalue %100, %101[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %103 = llvm.insertvalue %100, %102[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %104 = llvm.insertvalue %1, %103[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %105 = llvm.insertvalue %39, %104[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %106 = llvm.insertvalue %2, %105[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb7(%18 : i64)
  ^bb7(%107: i64):  // 2 preds: ^bb6, ^bb8
    %108 = llvm.icmp "slt" %107, %39 : i64
    llvm.cond_br %108, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %109 = llvm.getelementptr %100[%107] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %18, %109 : !llvm.ptr<i64>
    %110 = llvm.add %107, %17  : i64
    llvm.br ^bb7(%110 : i64)
  ^bb9:  // pred: ^bb7
    %111 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %106, %111 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %112 = llvm.bitcast %111 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %113 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %114 = llvm.insertvalue %2, %113[0] : !llvm.struct<(i64, ptr<i8>)> 
    %115 = llvm.insertvalue %112, %114[1] : !llvm.struct<(i64, ptr<i8>)> 
    %116 = llvm.mlir.null : !llvm.ptr<i64>
    %117 = llvm.getelementptr %116[%41] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %118 = llvm.ptrtoint %117 : !llvm.ptr<i64> to i64
    %119 = llvm.call @malloc(%118) : (i64) -> !llvm.ptr<i8>
    %120 = llvm.bitcast %119 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %121 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %122 = llvm.insertvalue %120, %121[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %123 = llvm.insertvalue %120, %122[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %124 = llvm.insertvalue %1, %123[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %125 = llvm.insertvalue %41, %124[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %126 = llvm.insertvalue %2, %125[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb10(%18 : i64)
  ^bb10(%127: i64):  // 2 preds: ^bb9, ^bb11
    %128 = llvm.icmp "slt" %127, %41 : i64
    llvm.cond_br %128, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %129 = llvm.getelementptr %120[%127] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %18, %129 : !llvm.ptr<i64>
    %130 = llvm.add %127, %17  : i64
    llvm.br ^bb10(%130 : i64)
  ^bb12:  // pred: ^bb10
    %131 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %126, %131 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %132 = llvm.bitcast %131 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %133 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %134 = llvm.insertvalue %2, %133[0] : !llvm.struct<(i64, ptr<i8>)> 
    %135 = llvm.insertvalue %132, %134[1] : !llvm.struct<(i64, ptr<i8>)> 
    %136 = llvm.mlir.null : !llvm.ptr<i64>
    %137 = llvm.getelementptr %136[%43] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %138 = llvm.ptrtoint %137 : !llvm.ptr<i64> to i64
    %139 = llvm.call @malloc(%138) : (i64) -> !llvm.ptr<i8>
    %140 = llvm.bitcast %139 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %141 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %142 = llvm.insertvalue %140, %141[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %143 = llvm.insertvalue %140, %142[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %144 = llvm.insertvalue %1, %143[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %145 = llvm.insertvalue %43, %144[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %146 = llvm.insertvalue %2, %145[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb13(%18 : i64)
  ^bb13(%147: i64):  // 2 preds: ^bb12, ^bb14
    %148 = llvm.icmp "slt" %147, %43 : i64
    llvm.cond_br %148, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %149 = llvm.getelementptr %140[%147] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %18, %149 : !llvm.ptr<i64>
    %150 = llvm.add %147, %17  : i64
    llvm.br ^bb13(%150 : i64)
  ^bb15:  // pred: ^bb13
    %151 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %146, %151 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %152 = llvm.bitcast %151 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %153 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %154 = llvm.insertvalue %2, %153[0] : !llvm.struct<(i64, ptr<i8>)> 
    %155 = llvm.insertvalue %152, %154[1] : !llvm.struct<(i64, ptr<i8>)> 
    %156 = llvm.mlir.null : !llvm.ptr<i64>
    %157 = llvm.getelementptr %156[%45] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %158 = llvm.ptrtoint %157 : !llvm.ptr<i64> to i64
    %159 = llvm.call @malloc(%158) : (i64) -> !llvm.ptr<i8>
    %160 = llvm.bitcast %159 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %161 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %162 = llvm.insertvalue %160, %161[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %163 = llvm.insertvalue %160, %162[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %164 = llvm.insertvalue %1, %163[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %165 = llvm.insertvalue %45, %164[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %166 = llvm.insertvalue %2, %165[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb16(%18 : i64)
  ^bb16(%167: i64):  // 2 preds: ^bb15, ^bb17
    %168 = llvm.icmp "slt" %167, %45 : i64
    llvm.cond_br %168, ^bb17, ^bb18
  ^bb17:  // pred: ^bb16
    %169 = llvm.getelementptr %160[%167] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %18, %169 : !llvm.ptr<i64>
    %170 = llvm.add %167, %17  : i64
    llvm.br ^bb16(%170 : i64)
  ^bb18:  // pred: ^bb16
    %171 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %166, %171 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %172 = llvm.bitcast %171 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %173 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %174 = llvm.insertvalue %2, %173[0] : !llvm.struct<(i64, ptr<i8>)> 
    %175 = llvm.insertvalue %172, %174[1] : !llvm.struct<(i64, ptr<i8>)> 
    %176 = llvm.mlir.null : !llvm.ptr<i64>
    %177 = llvm.getelementptr %176[%47] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %178 = llvm.ptrtoint %177 : !llvm.ptr<i64> to i64
    %179 = llvm.call @malloc(%178) : (i64) -> !llvm.ptr<i8>
    %180 = llvm.bitcast %179 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %181 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %182 = llvm.insertvalue %180, %181[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %183 = llvm.insertvalue %180, %182[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %184 = llvm.insertvalue %1, %183[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %185 = llvm.insertvalue %47, %184[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %186 = llvm.insertvalue %2, %185[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb19(%18 : i64)
  ^bb19(%187: i64):  // 2 preds: ^bb18, ^bb20
    %188 = llvm.icmp "slt" %187, %47 : i64
    llvm.cond_br %188, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %189 = llvm.getelementptr %180[%187] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %18, %189 : !llvm.ptr<i64>
    %190 = llvm.add %187, %17  : i64
    llvm.br ^bb19(%190 : i64)
  ^bb21:  // pred: ^bb19
    %191 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %186, %191 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %192 = llvm.bitcast %191 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %193 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %194 = llvm.insertvalue %2, %193[0] : !llvm.struct<(i64, ptr<i8>)> 
    %195 = llvm.insertvalue %192, %194[1] : !llvm.struct<(i64, ptr<i8>)> 
    %196 = llvm.mlir.null : !llvm.ptr<i64>
    %197 = llvm.getelementptr %196[%49] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %198 = llvm.ptrtoint %197 : !llvm.ptr<i64> to i64
    %199 = llvm.call @malloc(%198) : (i64) -> !llvm.ptr<i8>
    %200 = llvm.bitcast %199 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %201 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %202 = llvm.insertvalue %200, %201[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %203 = llvm.insertvalue %200, %202[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %204 = llvm.insertvalue %1, %203[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %205 = llvm.insertvalue %49, %204[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %206 = llvm.insertvalue %2, %205[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb22(%18 : i64)
  ^bb22(%207: i64):  // 2 preds: ^bb21, ^bb23
    %208 = llvm.icmp "slt" %207, %49 : i64
    llvm.cond_br %208, ^bb23, ^bb24
  ^bb23:  // pred: ^bb22
    %209 = llvm.getelementptr %200[%207] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %18, %209 : !llvm.ptr<i64>
    %210 = llvm.add %207, %17  : i64
    llvm.br ^bb22(%210 : i64)
  ^bb24:  // pred: ^bb22
    %211 = llvm.alloca %2 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %206, %211 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %212 = llvm.bitcast %211 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %213 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %214 = llvm.insertvalue %2, %213[0] : !llvm.struct<(i64, ptr<i8>)> 
    %215 = llvm.insertvalue %212, %214[1] : !llvm.struct<(i64, ptr<i8>)> 
    %216 = llvm.mlir.null : !llvm.ptr<f64>
    %217 = llvm.getelementptr %216[%51] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %218 = llvm.ptrtoint %217 : !llvm.ptr<f64> to i64
    %219 = llvm.call @malloc(%218) : (i64) -> !llvm.ptr<i8>
    %220 = llvm.bitcast %219 : !llvm.ptr<i8> to !llvm.ptr<f64>
    %221 = llvm.mlir.undef : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)>
    %222 = llvm.insertvalue %220, %221[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    %223 = llvm.insertvalue %220, %222[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    %224 = llvm.insertvalue %1, %223[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    %225 = llvm.insertvalue %51, %224[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    %226 = llvm.insertvalue %2, %225[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb25(%18 : i64)
  ^bb25(%227: i64):  // 2 preds: ^bb24, ^bb26
    %228 = llvm.icmp "slt" %227, %51 : i64
    llvm.cond_br %228, ^bb26, ^bb27
  ^bb26:  // pred: ^bb25
    %229 = llvm.getelementptr %220[%227] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %15, %229 : !llvm.ptr<f64>
    %230 = llvm.add %227, %17  : i64
    llvm.br ^bb25(%230 : i64)
  ^bb27:  // pred: ^bb25
    %231 = llvm.alloca %2 x !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %226, %231 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)>>
    %232 = llvm.bitcast %231 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %233 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %234 = llvm.insertvalue %2, %233[0] : !llvm.struct<(i64, ptr<i8>)> 
    %235 = llvm.insertvalue %232, %234[1] : !llvm.struct<(i64, ptr<i8>)> 
    llvm.call @read_input_2D_f64(%6, %18, %18, %17, %18, %2, %72, %2, %92, %2, %112, %2, %132, %2, %152, %2, %172, %2, %192, %2, %212, %2, %232, %7) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i32) -> ()
    %236 = llvm.mlir.null : !llvm.ptr<f64>
    %237 = llvm.getelementptr %236[%55] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %238 = llvm.ptrtoint %237 : !llvm.ptr<f64> to i64
    %239 = llvm.add %238, %0  : i64
    %240 = llvm.call @malloc(%239) : (i64) -> !llvm.ptr<i8>
    %241 = llvm.bitcast %240 : !llvm.ptr<i8> to !llvm.ptr<f64>
    %242 = llvm.ptrtoint %241 : !llvm.ptr<f64> to i64
    %243 = llvm.sub %0, %2  : i64
    %244 = llvm.add %242, %243  : i64
    %245 = llvm.urem %244, %0  : i64
    %246 = llvm.sub %244, %245  : i64
    %247 = llvm.inttoptr %246 : i64 to !llvm.ptr<f64>
    %248 = llvm.mlir.null : !llvm.ptr<f64>
    %249 = llvm.getelementptr %248[%53] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %250 = llvm.ptrtoint %249 : !llvm.ptr<f64> to i64
    %251 = llvm.add %250, %0  : i64
    %252 = llvm.call @malloc(%251) : (i64) -> !llvm.ptr<i8>
    %253 = llvm.bitcast %252 : !llvm.ptr<i8> to !llvm.ptr<f64>
    %254 = llvm.ptrtoint %253 : !llvm.ptr<f64> to i64
    %255 = llvm.sub %0, %2  : i64
    %256 = llvm.add %254, %255  : i64
    %257 = llvm.urem %256, %0  : i64
    %258 = llvm.sub %256, %257  : i64
    %259 = llvm.inttoptr %258 : i64 to !llvm.ptr<f64>
    llvm.br ^bb28(%18 : i64)
  ^bb28(%260: i64):  // 2 preds: ^bb27, ^bb29
    %261 = llvm.icmp "slt" %260, %55 : i64
    llvm.cond_br %261, ^bb29, ^bb30(%18 : i64)
  ^bb29:  // pred: ^bb28
    %262 = llvm.getelementptr %247[%260] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %16, %262 : !llvm.ptr<f64>
    %263 = llvm.add %260, %17  : i64
    llvm.br ^bb28(%263 : i64)
  ^bb30(%264: i64):  // 2 preds: ^bb28, ^bb31
    %265 = llvm.icmp "slt" %264, %53 : i64
    llvm.cond_br %265, ^bb31, ^bb32(%18 : i64)
  ^bb31:  // pred: ^bb30
    %266 = llvm.getelementptr %259[%264] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %15, %266 : !llvm.ptr<f64>
    %267 = llvm.add %264, %17  : i64
    llvm.br ^bb30(%267 : i64)
  ^bb32(%268: i64):  // 2 preds: ^bb30, ^bb45
    %269 = llvm.icmp "slt" %268, %14 : i64
    llvm.cond_br %269, ^bb33, ^bb46
  ^bb33:  // pred: ^bb32
    %270 = llvm.call @getTime() : () -> f64
    %271 = llvm.load %60 : !llvm.ptr<i64>
    llvm.br ^bb34(%18 : i64)
  ^bb34(%272: i64):  // 2 preds: ^bb33, ^bb44
    %273 = llvm.icmp "slt" %272, %271 : i64
    llvm.cond_br %273, ^bb35, ^bb45
  ^bb35:  // pred: ^bb34
    %274 = llvm.load %100 : !llvm.ptr<i64>
    llvm.br ^bb36(%18 : i64)
  ^bb36(%275: i64):  // 2 preds: ^bb35, ^bb43
    %276 = llvm.icmp "slt" %275, %274 : i64
    llvm.cond_br %276, ^bb37, ^bb44
  ^bb37:  // pred: ^bb36
    %277 = llvm.load %100 : !llvm.ptr<i64>
    %278 = llvm.mul %272, %277  : i64
    %279 = llvm.add %278, %275  : i64
    %280 = llvm.add %272, %17  : i64
    %281 = llvm.getelementptr %140[%272] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %282 = llvm.load %281 : !llvm.ptr<i64>
    %283 = llvm.getelementptr %140[%280] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %284 = llvm.load %283 : !llvm.ptr<i64>
    llvm.br ^bb38(%282 : i64)
  ^bb38(%285: i64):  // 2 preds: ^bb37, ^bb42
    %286 = llvm.icmp "slt" %285, %284 : i64
    llvm.cond_br %286, ^bb39, ^bb43
  ^bb39:  // pred: ^bb38
    %287 = llvm.getelementptr %160[%285] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %288 = llvm.load %287 : !llvm.ptr<i64>
    %289 = llvm.load %180 : !llvm.ptr<i64>
    llvm.br ^bb40(%18 : i64)
  ^bb40(%290: i64):  // 2 preds: ^bb39, ^bb41
    %291 = llvm.icmp "slt" %290, %289 : i64
    llvm.cond_br %291, ^bb41, ^bb42
  ^bb41:  // pred: ^bb40
    %292 = llvm.getelementptr %180[1] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %293 = llvm.load %292 : !llvm.ptr<i64>
    %294 = llvm.mul %288, %293  : i64
    %295 = llvm.add %294, %290  : i64
    %296 = llvm.load %100 : !llvm.ptr<i64>
    %297 = llvm.load %180 : !llvm.ptr<i64>
    %298 = llvm.mul %296, %297  : i64
    %299 = llvm.mul %285, %298  : i64
    %300 = llvm.mul %275, %297  : i64
    %301 = llvm.add %299, %300  : i64
    %302 = llvm.add %301, %290  : i64
    %303 = llvm.getelementptr %220[%302] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %304 = llvm.load %303 : !llvm.ptr<f64>
    %305 = llvm.getelementptr %247[%295] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %306 = llvm.load %305 : !llvm.ptr<f64>
    %307 = llvm.getelementptr %259[%279] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %308 = llvm.load %307 : !llvm.ptr<f64>
    %309 = llvm.fmul %304, %306  : f64
    %310 = llvm.fadd %308, %309  : f64
    %311 = llvm.getelementptr %259[%279] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %310, %311 : !llvm.ptr<f64>
    %312 = llvm.add %290, %17  : i64
    llvm.br ^bb40(%312 : i64)
  ^bb42:  // pred: ^bb40
    %313 = llvm.add %285, %17  : i64
    llvm.br ^bb38(%313 : i64)
  ^bb43:  // pred: ^bb38
    %314 = llvm.add %275, %17  : i64
    llvm.br ^bb36(%314 : i64)
  ^bb44:  // pred: ^bb36
    %315 = llvm.add %272, %17  : i64
    llvm.br ^bb34(%315 : i64)
  ^bb45:  // pred: ^bb34
    %316 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%270, %316) : (f64, f64) -> ()
    %317 = llvm.add %268, %17  : i64
    llvm.br ^bb32(%317 : i64)
  ^bb46:  // pred: ^bb32
    llvm.return
  }
  llvm.func @read_input_2D_f64(i32, i64, i64, i64, i64, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i32) attributes {sym_visibility = "private"}
  llvm.func @read_input_sizes_2D_f64(i32, i64, i64, i64, i64, i64, !llvm.ptr<i8>, i32) attributes {sym_visibility = "private"}
  llvm.func @comet_sort_index(i64, !llvm.ptr<i8>, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @getTime() -> f64 attributes {sym_visibility = "private"}
  llvm.func @printElapsedTime(f64, f64) attributes {sym_visibility = "private"}
}
