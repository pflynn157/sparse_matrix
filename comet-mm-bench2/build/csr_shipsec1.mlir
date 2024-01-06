module attributes {llvm.data_layout = ""} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @main() {
    %0 = llvm.mlir.constant(32 : index) : i64
    %1 = llvm.mlir.constant(140874 : index) : i64
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = llvm.mlir.constant(1 : index) : i64
    %4 = llvm.mlir.constant(13 : index) : i64
    %5 = llvm.mlir.constant(-1 : index) : i64
    %6 = llvm.mlir.constant(2 : index) : i64
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.mlir.constant(0 : i32) : i32
    %9 = llvm.mlir.constant(1 : i32) : i32
    %10 = llvm.mlir.constant(4 : index) : i64
    %11 = llvm.mlir.constant(5 : index) : i64
    %12 = llvm.mlir.constant(6 : index) : i64
    %13 = llvm.mlir.constant(7 : index) : i64
    %14 = llvm.mlir.constant(8 : index) : i64
    %15 = llvm.mlir.constant(9 : index) : i64
    %16 = llvm.mlir.constant(10 : index) : i64
    %17 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %18 = llvm.mlir.constant(1.700000e+00 : f64) : f64
    %19 = llvm.mlir.constant(140874 : index) : i64
    %20 = llvm.mlir.constant(1 : index) : i64
    %21 = llvm.mlir.constant(0 : index) : i64
    %22 = llvm.mlir.null : !llvm.ptr<i64>
    %23 = llvm.getelementptr %22[13] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %24 = llvm.ptrtoint %23 : !llvm.ptr<i64> to i64
    %25 = llvm.call @malloc(%24) : (i64) -> !llvm.ptr<i8>
    %26 = llvm.bitcast %25 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %27 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %28 = llvm.insertvalue %26, %27[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %26, %28[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.insertvalue %2, %29[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %31 = llvm.insertvalue %4, %30[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.insertvalue %3, %31[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %33 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %32, %33 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %34 = llvm.bitcast %33 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %35 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %36 = llvm.insertvalue %3, %35[0] : !llvm.struct<(i64, ptr<i8>)> 
    %37 = llvm.insertvalue %34, %36[1] : !llvm.struct<(i64, ptr<i8>)> 
    llvm.call @read_input_sizes_2D_f64(%8, %21, %5, %20, %5, %3, %34, %9) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr<i8>, i32) -> ()
    %38 = llvm.load %26 : !llvm.ptr<i64>
    %39 = llvm.getelementptr %26[1] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %40 = llvm.load %39 : !llvm.ptr<i64>
    %41 = llvm.getelementptr %26[2] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %42 = llvm.load %41 : !llvm.ptr<i64>
    %43 = llvm.getelementptr %26[3] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %44 = llvm.load %43 : !llvm.ptr<i64>
    %45 = llvm.getelementptr %26[4] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %46 = llvm.load %45 : !llvm.ptr<i64>
    %47 = llvm.getelementptr %26[5] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %48 = llvm.load %47 : !llvm.ptr<i64>
    %49 = llvm.getelementptr %26[6] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %50 = llvm.load %49 : !llvm.ptr<i64>
    %51 = llvm.getelementptr %26[7] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %52 = llvm.load %51 : !llvm.ptr<i64>
    %53 = llvm.getelementptr %26[8] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %54 = llvm.load %53 : !llvm.ptr<i64>
    %55 = llvm.getelementptr %26[9] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %56 = llvm.load %55 : !llvm.ptr<i64>
    %57 = llvm.getelementptr %26[10] : (!llvm.ptr<i64>) -> !llvm.ptr<i64>
    %58 = llvm.load %57 : !llvm.ptr<i64>
    %59 = llvm.mlir.null : !llvm.ptr<i64>
    %60 = llvm.getelementptr %59[%38] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %61 = llvm.ptrtoint %60 : !llvm.ptr<i64> to i64
    %62 = llvm.call @malloc(%61) : (i64) -> !llvm.ptr<i8>
    %63 = llvm.bitcast %62 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %64 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %65 = llvm.insertvalue %63, %64[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.insertvalue %63, %65[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.insertvalue %2, %66[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %68 = llvm.insertvalue %38, %67[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %69 = llvm.insertvalue %3, %68[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%21 : i64)
  ^bb1(%70: i64):  // 2 preds: ^bb0, ^bb2
    %71 = llvm.icmp "slt" %70, %38 : i64
    llvm.cond_br %71, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %72 = llvm.getelementptr %63[%70] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %21, %72 : !llvm.ptr<i64>
    %73 = llvm.add %70, %20  : i64
    llvm.br ^bb1(%73 : i64)
  ^bb3:  // pred: ^bb1
    %74 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %69, %74 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %75 = llvm.bitcast %74 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %76 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %77 = llvm.insertvalue %3, %76[0] : !llvm.struct<(i64, ptr<i8>)> 
    %78 = llvm.insertvalue %75, %77[1] : !llvm.struct<(i64, ptr<i8>)> 
    %79 = llvm.mlir.null : !llvm.ptr<i64>
    %80 = llvm.getelementptr %79[%40] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %81 = llvm.ptrtoint %80 : !llvm.ptr<i64> to i64
    %82 = llvm.call @malloc(%81) : (i64) -> !llvm.ptr<i8>
    %83 = llvm.bitcast %82 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %84 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %85 = llvm.insertvalue %83, %84[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.insertvalue %83, %85[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %87 = llvm.insertvalue %2, %86[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %88 = llvm.insertvalue %40, %87[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %89 = llvm.insertvalue %3, %88[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb4(%21 : i64)
  ^bb4(%90: i64):  // 2 preds: ^bb3, ^bb5
    %91 = llvm.icmp "slt" %90, %40 : i64
    llvm.cond_br %91, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %92 = llvm.getelementptr %83[%90] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %21, %92 : !llvm.ptr<i64>
    %93 = llvm.add %90, %20  : i64
    llvm.br ^bb4(%93 : i64)
  ^bb6:  // pred: ^bb4
    %94 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %89, %94 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %95 = llvm.bitcast %94 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %96 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %97 = llvm.insertvalue %3, %96[0] : !llvm.struct<(i64, ptr<i8>)> 
    %98 = llvm.insertvalue %95, %97[1] : !llvm.struct<(i64, ptr<i8>)> 
    %99 = llvm.mlir.null : !llvm.ptr<i64>
    %100 = llvm.getelementptr %99[%42] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %101 = llvm.ptrtoint %100 : !llvm.ptr<i64> to i64
    %102 = llvm.call @malloc(%101) : (i64) -> !llvm.ptr<i8>
    %103 = llvm.bitcast %102 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %104 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %105 = llvm.insertvalue %103, %104[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %106 = llvm.insertvalue %103, %105[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %107 = llvm.insertvalue %2, %106[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %108 = llvm.insertvalue %42, %107[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %109 = llvm.insertvalue %3, %108[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb7(%21 : i64)
  ^bb7(%110: i64):  // 2 preds: ^bb6, ^bb8
    %111 = llvm.icmp "slt" %110, %42 : i64
    llvm.cond_br %111, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %112 = llvm.getelementptr %103[%110] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %21, %112 : !llvm.ptr<i64>
    %113 = llvm.add %110, %20  : i64
    llvm.br ^bb7(%113 : i64)
  ^bb9:  // pred: ^bb7
    %114 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %109, %114 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %115 = llvm.bitcast %114 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %116 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %117 = llvm.insertvalue %3, %116[0] : !llvm.struct<(i64, ptr<i8>)> 
    %118 = llvm.insertvalue %115, %117[1] : !llvm.struct<(i64, ptr<i8>)> 
    %119 = llvm.mlir.null : !llvm.ptr<i64>
    %120 = llvm.getelementptr %119[%44] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %121 = llvm.ptrtoint %120 : !llvm.ptr<i64> to i64
    %122 = llvm.call @malloc(%121) : (i64) -> !llvm.ptr<i8>
    %123 = llvm.bitcast %122 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %124 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %125 = llvm.insertvalue %123, %124[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %126 = llvm.insertvalue %123, %125[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %127 = llvm.insertvalue %2, %126[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %128 = llvm.insertvalue %44, %127[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %129 = llvm.insertvalue %3, %128[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb10(%21 : i64)
  ^bb10(%130: i64):  // 2 preds: ^bb9, ^bb11
    %131 = llvm.icmp "slt" %130, %44 : i64
    llvm.cond_br %131, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %132 = llvm.getelementptr %123[%130] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %21, %132 : !llvm.ptr<i64>
    %133 = llvm.add %130, %20  : i64
    llvm.br ^bb10(%133 : i64)
  ^bb12:  // pred: ^bb10
    %134 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %129, %134 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %135 = llvm.bitcast %134 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %136 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %137 = llvm.insertvalue %3, %136[0] : !llvm.struct<(i64, ptr<i8>)> 
    %138 = llvm.insertvalue %135, %137[1] : !llvm.struct<(i64, ptr<i8>)> 
    %139 = llvm.mlir.null : !llvm.ptr<i64>
    %140 = llvm.getelementptr %139[%46] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %141 = llvm.ptrtoint %140 : !llvm.ptr<i64> to i64
    %142 = llvm.call @malloc(%141) : (i64) -> !llvm.ptr<i8>
    %143 = llvm.bitcast %142 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %144 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %145 = llvm.insertvalue %143, %144[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %146 = llvm.insertvalue %143, %145[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %147 = llvm.insertvalue %2, %146[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %148 = llvm.insertvalue %46, %147[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %149 = llvm.insertvalue %3, %148[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb13(%21 : i64)
  ^bb13(%150: i64):  // 2 preds: ^bb12, ^bb14
    %151 = llvm.icmp "slt" %150, %46 : i64
    llvm.cond_br %151, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %152 = llvm.getelementptr %143[%150] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %21, %152 : !llvm.ptr<i64>
    %153 = llvm.add %150, %20  : i64
    llvm.br ^bb13(%153 : i64)
  ^bb15:  // pred: ^bb13
    %154 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %149, %154 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %155 = llvm.bitcast %154 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %156 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %157 = llvm.insertvalue %3, %156[0] : !llvm.struct<(i64, ptr<i8>)> 
    %158 = llvm.insertvalue %155, %157[1] : !llvm.struct<(i64, ptr<i8>)> 
    %159 = llvm.mlir.null : !llvm.ptr<i64>
    %160 = llvm.getelementptr %159[%48] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %161 = llvm.ptrtoint %160 : !llvm.ptr<i64> to i64
    %162 = llvm.call @malloc(%161) : (i64) -> !llvm.ptr<i8>
    %163 = llvm.bitcast %162 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %164 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %165 = llvm.insertvalue %163, %164[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %166 = llvm.insertvalue %163, %165[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %167 = llvm.insertvalue %2, %166[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %168 = llvm.insertvalue %48, %167[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %169 = llvm.insertvalue %3, %168[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb16(%21 : i64)
  ^bb16(%170: i64):  // 2 preds: ^bb15, ^bb17
    %171 = llvm.icmp "slt" %170, %48 : i64
    llvm.cond_br %171, ^bb17, ^bb18
  ^bb17:  // pred: ^bb16
    %172 = llvm.getelementptr %163[%170] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %21, %172 : !llvm.ptr<i64>
    %173 = llvm.add %170, %20  : i64
    llvm.br ^bb16(%173 : i64)
  ^bb18:  // pred: ^bb16
    %174 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %169, %174 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %175 = llvm.bitcast %174 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %176 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %177 = llvm.insertvalue %3, %176[0] : !llvm.struct<(i64, ptr<i8>)> 
    %178 = llvm.insertvalue %175, %177[1] : !llvm.struct<(i64, ptr<i8>)> 
    %179 = llvm.mlir.null : !llvm.ptr<i64>
    %180 = llvm.getelementptr %179[%50] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %181 = llvm.ptrtoint %180 : !llvm.ptr<i64> to i64
    %182 = llvm.call @malloc(%181) : (i64) -> !llvm.ptr<i8>
    %183 = llvm.bitcast %182 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %184 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %185 = llvm.insertvalue %183, %184[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %186 = llvm.insertvalue %183, %185[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %187 = llvm.insertvalue %2, %186[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %188 = llvm.insertvalue %50, %187[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %189 = llvm.insertvalue %3, %188[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb19(%21 : i64)
  ^bb19(%190: i64):  // 2 preds: ^bb18, ^bb20
    %191 = llvm.icmp "slt" %190, %50 : i64
    llvm.cond_br %191, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %192 = llvm.getelementptr %183[%190] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %21, %192 : !llvm.ptr<i64>
    %193 = llvm.add %190, %20  : i64
    llvm.br ^bb19(%193 : i64)
  ^bb21:  // pred: ^bb19
    %194 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %189, %194 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %195 = llvm.bitcast %194 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %196 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %197 = llvm.insertvalue %3, %196[0] : !llvm.struct<(i64, ptr<i8>)> 
    %198 = llvm.insertvalue %195, %197[1] : !llvm.struct<(i64, ptr<i8>)> 
    %199 = llvm.mlir.null : !llvm.ptr<i64>
    %200 = llvm.getelementptr %199[%52] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %201 = llvm.ptrtoint %200 : !llvm.ptr<i64> to i64
    %202 = llvm.call @malloc(%201) : (i64) -> !llvm.ptr<i8>
    %203 = llvm.bitcast %202 : !llvm.ptr<i8> to !llvm.ptr<i64>
    %204 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>
    %205 = llvm.insertvalue %203, %204[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %206 = llvm.insertvalue %203, %205[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %207 = llvm.insertvalue %2, %206[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %208 = llvm.insertvalue %52, %207[3, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    %209 = llvm.insertvalue %3, %208[4, 0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb22(%21 : i64)
  ^bb22(%210: i64):  // 2 preds: ^bb21, ^bb23
    %211 = llvm.icmp "slt" %210, %52 : i64
    llvm.cond_br %211, ^bb23, ^bb24
  ^bb23:  // pred: ^bb22
    %212 = llvm.getelementptr %203[%210] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %21, %212 : !llvm.ptr<i64>
    %213 = llvm.add %210, %20  : i64
    llvm.br ^bb22(%213 : i64)
  ^bb24:  // pred: ^bb22
    %214 = llvm.alloca %3 x !llvm.struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %209, %214 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>>
    %215 = llvm.bitcast %214 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %216 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %217 = llvm.insertvalue %3, %216[0] : !llvm.struct<(i64, ptr<i8>)> 
    %218 = llvm.insertvalue %215, %217[1] : !llvm.struct<(i64, ptr<i8>)> 
    %219 = llvm.mlir.null : !llvm.ptr<f64>
    %220 = llvm.getelementptr %219[%54] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %221 = llvm.ptrtoint %220 : !llvm.ptr<f64> to i64
    %222 = llvm.call @malloc(%221) : (i64) -> !llvm.ptr<i8>
    %223 = llvm.bitcast %222 : !llvm.ptr<i8> to !llvm.ptr<f64>
    %224 = llvm.mlir.undef : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)>
    %225 = llvm.insertvalue %223, %224[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    %226 = llvm.insertvalue %223, %225[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    %227 = llvm.insertvalue %2, %226[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    %228 = llvm.insertvalue %54, %227[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    %229 = llvm.insertvalue %3, %228[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb25(%21 : i64)
  ^bb25(%230: i64):  // 2 preds: ^bb24, ^bb26
    %231 = llvm.icmp "slt" %230, %54 : i64
    llvm.cond_br %231, ^bb26, ^bb27
  ^bb26:  // pred: ^bb25
    %232 = llvm.getelementptr %223[%230] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %17, %232 : !llvm.ptr<f64>
    %233 = llvm.add %230, %20  : i64
    llvm.br ^bb25(%233 : i64)
  ^bb27:  // pred: ^bb25
    %234 = llvm.alloca %3 x !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)>>
    llvm.store %229, %234 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)>>
    %235 = llvm.bitcast %234 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<1 x i64>, array<1 x i64>)>> to !llvm.ptr<i8>
    %236 = llvm.mlir.undef : !llvm.struct<(i64, ptr<i8>)>
    %237 = llvm.insertvalue %3, %236[0] : !llvm.struct<(i64, ptr<i8>)> 
    %238 = llvm.insertvalue %235, %237[1] : !llvm.struct<(i64, ptr<i8>)> 
    llvm.call @read_input_2D_f64(%8, %21, %5, %20, %5, %3, %75, %3, %95, %3, %115, %3, %135, %3, %155, %3, %175, %3, %195, %3, %215, %3, %235, %9) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i32) -> ()
    %239 = llvm.mul %58, %1  : i64
    %240 = llvm.mlir.null : !llvm.ptr<f64>
    %241 = llvm.getelementptr %240[%239] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %242 = llvm.ptrtoint %241 : !llvm.ptr<f64> to i64
    %243 = llvm.add %242, %0  : i64
    %244 = llvm.call @malloc(%243) : (i64) -> !llvm.ptr<i8>
    %245 = llvm.bitcast %244 : !llvm.ptr<i8> to !llvm.ptr<f64>
    %246 = llvm.ptrtoint %245 : !llvm.ptr<f64> to i64
    %247 = llvm.sub %0, %3  : i64
    %248 = llvm.add %246, %247  : i64
    %249 = llvm.urem %248, %0  : i64
    %250 = llvm.sub %248, %249  : i64
    %251 = llvm.inttoptr %250 : i64 to !llvm.ptr<f64>
    %252 = llvm.mul %56, %1  : i64
    %253 = llvm.mlir.null : !llvm.ptr<f64>
    %254 = llvm.getelementptr %253[%252] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %255 = llvm.ptrtoint %254 : !llvm.ptr<f64> to i64
    %256 = llvm.add %255, %0  : i64
    %257 = llvm.call @malloc(%256) : (i64) -> !llvm.ptr<i8>
    %258 = llvm.bitcast %257 : !llvm.ptr<i8> to !llvm.ptr<f64>
    %259 = llvm.ptrtoint %258 : !llvm.ptr<f64> to i64
    %260 = llvm.sub %0, %3  : i64
    %261 = llvm.add %259, %260  : i64
    %262 = llvm.urem %261, %0  : i64
    %263 = llvm.sub %261, %262  : i64
    %264 = llvm.inttoptr %263 : i64 to !llvm.ptr<f64>
    llvm.br ^bb28(%21 : i64)
  ^bb28(%265: i64):  // 2 preds: ^bb27, ^bb31
    %266 = llvm.icmp "slt" %265, %58 : i64
    llvm.cond_br %266, ^bb29(%21 : i64), ^bb32(%21 : i64)
  ^bb29(%267: i64):  // 2 preds: ^bb28, ^bb30
    %268 = llvm.icmp "slt" %267, %19 : i64
    llvm.cond_br %268, ^bb30, ^bb31
  ^bb30:  // pred: ^bb29
    %269 = llvm.mul %265, %1  : i64
    %270 = llvm.add %269, %267  : i64
    %271 = llvm.getelementptr %251[%270] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %18, %271 : !llvm.ptr<f64>
    %272 = llvm.add %267, %20  : i64
    llvm.br ^bb29(%272 : i64)
  ^bb31:  // pred: ^bb29
    %273 = llvm.add %265, %20  : i64
    llvm.br ^bb28(%273 : i64)
  ^bb32(%274: i64):  // 2 preds: ^bb28, ^bb35
    %275 = llvm.icmp "slt" %274, %56 : i64
    llvm.cond_br %275, ^bb33(%21 : i64), ^bb36(%21 : i64)
  ^bb33(%276: i64):  // 2 preds: ^bb32, ^bb34
    %277 = llvm.icmp "slt" %276, %19 : i64
    llvm.cond_br %277, ^bb34, ^bb35
  ^bb34:  // pred: ^bb33
    %278 = llvm.mul %274, %1  : i64
    %279 = llvm.add %278, %276  : i64
    %280 = llvm.getelementptr %264[%279] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %17, %280 : !llvm.ptr<f64>
    %281 = llvm.add %276, %20  : i64
    llvm.br ^bb33(%281 : i64)
  ^bb35:  // pred: ^bb33
    %282 = llvm.add %274, %20  : i64
    llvm.br ^bb32(%282 : i64)
  ^bb36(%283: i64):  // 2 preds: ^bb32, ^bb46
    %284 = llvm.icmp "slt" %283, %16 : i64
    llvm.cond_br %284, ^bb37, ^bb47
  ^bb37:  // pred: ^bb36
    %285 = llvm.call @getTime() : () -> f64
    %286 = llvm.load %63 : !llvm.ptr<i64>
    llvm.br ^bb38(%21 : i64)
  ^bb38(%287: i64):  // 2 preds: ^bb37, ^bb45
    %288 = llvm.icmp "slt" %287, %286 : i64
    llvm.cond_br %288, ^bb39, ^bb46
  ^bb39:  // pred: ^bb38
    %289 = llvm.add %287, %20  : i64
    %290 = llvm.getelementptr %143[%287] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %291 = llvm.load %290 : !llvm.ptr<i64>
    %292 = llvm.getelementptr %143[%289] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %293 = llvm.load %292 : !llvm.ptr<i64>
    llvm.br ^bb40(%291 : i64)
  ^bb40(%294: i64):  // 2 preds: ^bb39, ^bb44
    %295 = llvm.icmp "slt" %294, %293 : i64
    llvm.cond_br %295, ^bb41, ^bb45
  ^bb41:  // pred: ^bb40
    %296 = llvm.getelementptr %163[%294] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %297 = llvm.load %296 : !llvm.ptr<i64>
    llvm.br ^bb42(%21 : i64)
  ^bb42(%298: i64):  // 2 preds: ^bb41, ^bb43
    %299 = llvm.icmp "slt" %298, %19 : i64
    llvm.cond_br %299, ^bb43, ^bb44
  ^bb43:  // pred: ^bb42
    %300 = llvm.getelementptr %223[%294] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %301 = llvm.load %300 : !llvm.ptr<f64>
    %302 = llvm.mul %297, %1  : i64
    %303 = llvm.add %302, %298  : i64
    %304 = llvm.getelementptr %251[%303] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %305 = llvm.load %304 : !llvm.ptr<f64>
    %306 = llvm.mul %287, %1  : i64
    %307 = llvm.add %306, %298  : i64
    %308 = llvm.getelementptr %264[%307] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %309 = llvm.load %308 : !llvm.ptr<f64>
    %310 = llvm.fmul %301, %305  : f64
    %311 = llvm.fadd %309, %310  : f64
    %312 = llvm.mul %287, %1  : i64
    %313 = llvm.add %312, %298  : i64
    %314 = llvm.getelementptr %264[%313] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %311, %314 : !llvm.ptr<f64>
    %315 = llvm.add %298, %20  : i64
    llvm.br ^bb42(%315 : i64)
  ^bb44:  // pred: ^bb42
    %316 = llvm.add %294, %20  : i64
    llvm.br ^bb40(%316 : i64)
  ^bb45:  // pred: ^bb40
    llvm.br ^bb38(%289 : i64)
  ^bb46:  // pred: ^bb38
    %317 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%285, %317) : (f64, f64) -> ()
    %318 = llvm.add %283, %20  : i64
    llvm.br ^bb36(%318 : i64)
  ^bb47:  // pred: ^bb36
    llvm.return
  }
  llvm.func @read_input_2D_f64(i32, i64, i64, i64, i64, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i64, !llvm.ptr<i8>, i32) attributes {sym_visibility = "private"}
  llvm.func @read_input_sizes_2D_f64(i32, i64, i64, i64, i64, i64, !llvm.ptr<i8>, i32) attributes {sym_visibility = "private"}
  llvm.func @comet_sort_index(i64, !llvm.ptr<i8>, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @getTime() -> f64 attributes {sym_visibility = "private"}
  llvm.func @printElapsedTime(f64, f64) attributes {sym_visibility = "private"}
}
