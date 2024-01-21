; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main() {
  %1 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i64, ptr null, i32 13) to i64))
  %2 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, i64 13, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 1, 4, 0
  %7 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, ptr %7, align 8
  %8 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %7, 1
  call void @read_input_sizes_2D_f64(i32 0, i64 0, i64 -1, i64 3, i64 0, i64 1, ptr %7, i32 1)
  %9 = load i64, ptr %1, align 4
  %10 = getelementptr i64, ptr %1, i32 1
  %11 = load i64, ptr %10, align 4
  %12 = getelementptr i64, ptr %1, i32 2
  %13 = load i64, ptr %12, align 4
  %14 = getelementptr i64, ptr %1, i32 3
  %15 = load i64, ptr %14, align 4
  %16 = getelementptr i64, ptr %1, i32 4
  %17 = load i64, ptr %16, align 4
  %18 = getelementptr i64, ptr %1, i32 5
  %19 = load i64, ptr %18, align 4
  %20 = getelementptr i64, ptr %1, i32 6
  %21 = load i64, ptr %20, align 4
  %22 = getelementptr i64, ptr %1, i32 7
  %23 = load i64, ptr %22, align 4
  %24 = getelementptr i64, ptr %1, i32 8
  %25 = load i64, ptr %24, align 4
  %26 = getelementptr i64, ptr %1, i32 9
  %27 = load i64, ptr %26, align 4
  %28 = getelementptr i64, ptr %1, i32 10
  %29 = load i64, ptr %28, align 4
  %30 = getelementptr i64, ptr null, i64 %9
  %31 = ptrtoint ptr %30 to i64
  %32 = call ptr @malloc(i64 %31)
  %33 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %32, 0
  %34 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %33, ptr %32, 1
  %35 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %34, i64 0, 2
  %36 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %35, i64 %9, 3, 0
  %37 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %36, i64 1, 4, 0
  br label %38

38:                                               ; preds = %41, %0
  %39 = phi i64 [ %43, %41 ], [ 0, %0 ]
  %40 = icmp slt i64 %39, %9
  br i1 %40, label %41, label %44

41:                                               ; preds = %38
  %42 = getelementptr i64, ptr %32, i64 %39
  store i64 0, ptr %42, align 4
  %43 = add i64 %39, 1
  br label %38

44:                                               ; preds = %38
  %45 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %37, ptr %45, align 8
  %46 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %45, 1
  %47 = getelementptr i64, ptr null, i64 %11
  %48 = ptrtoint ptr %47 to i64
  %49 = call ptr @malloc(i64 %48)
  %50 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %49, 0
  %51 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %50, ptr %49, 1
  %52 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %51, i64 0, 2
  %53 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %52, i64 %11, 3, 0
  %54 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %53, i64 1, 4, 0
  br label %55

55:                                               ; preds = %58, %44
  %56 = phi i64 [ %60, %58 ], [ 0, %44 ]
  %57 = icmp slt i64 %56, %11
  br i1 %57, label %58, label %61

58:                                               ; preds = %55
  %59 = getelementptr i64, ptr %49, i64 %56
  store i64 0, ptr %59, align 4
  %60 = add i64 %56, 1
  br label %55

61:                                               ; preds = %55
  %62 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %54, ptr %62, align 8
  %63 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %62, 1
  %64 = getelementptr i64, ptr null, i64 %13
  %65 = ptrtoint ptr %64 to i64
  %66 = call ptr @malloc(i64 %65)
  %67 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %66, 0
  %68 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %67, ptr %66, 1
  %69 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %68, i64 0, 2
  %70 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %69, i64 %13, 3, 0
  %71 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %70, i64 1, 4, 0
  br label %72

72:                                               ; preds = %75, %61
  %73 = phi i64 [ %77, %75 ], [ 0, %61 ]
  %74 = icmp slt i64 %73, %13
  br i1 %74, label %75, label %78

75:                                               ; preds = %72
  %76 = getelementptr i64, ptr %66, i64 %73
  store i64 0, ptr %76, align 4
  %77 = add i64 %73, 1
  br label %72

78:                                               ; preds = %72
  %79 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %71, ptr %79, align 8
  %80 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %79, 1
  %81 = getelementptr i64, ptr null, i64 %15
  %82 = ptrtoint ptr %81 to i64
  %83 = call ptr @malloc(i64 %82)
  %84 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %83, 0
  %85 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %84, ptr %83, 1
  %86 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %85, i64 0, 2
  %87 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %86, i64 %15, 3, 0
  %88 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %87, i64 1, 4, 0
  br label %89

89:                                               ; preds = %92, %78
  %90 = phi i64 [ %94, %92 ], [ 0, %78 ]
  %91 = icmp slt i64 %90, %15
  br i1 %91, label %92, label %95

92:                                               ; preds = %89
  %93 = getelementptr i64, ptr %83, i64 %90
  store i64 0, ptr %93, align 4
  %94 = add i64 %90, 1
  br label %89

95:                                               ; preds = %89
  %96 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %88, ptr %96, align 8
  %97 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %96, 1
  %98 = getelementptr i64, ptr null, i64 %17
  %99 = ptrtoint ptr %98 to i64
  %100 = call ptr @malloc(i64 %99)
  %101 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %100, 0
  %102 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %101, ptr %100, 1
  %103 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %102, i64 0, 2
  %104 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %103, i64 %17, 3, 0
  %105 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %104, i64 1, 4, 0
  br label %106

106:                                              ; preds = %109, %95
  %107 = phi i64 [ %111, %109 ], [ 0, %95 ]
  %108 = icmp slt i64 %107, %17
  br i1 %108, label %109, label %112

109:                                              ; preds = %106
  %110 = getelementptr i64, ptr %100, i64 %107
  store i64 0, ptr %110, align 4
  %111 = add i64 %107, 1
  br label %106

112:                                              ; preds = %106
  %113 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %105, ptr %113, align 8
  %114 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %113, 1
  %115 = getelementptr i64, ptr null, i64 %19
  %116 = ptrtoint ptr %115 to i64
  %117 = call ptr @malloc(i64 %116)
  %118 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %117, 0
  %119 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %118, ptr %117, 1
  %120 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %119, i64 0, 2
  %121 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %120, i64 %19, 3, 0
  %122 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %121, i64 1, 4, 0
  br label %123

123:                                              ; preds = %126, %112
  %124 = phi i64 [ %128, %126 ], [ 0, %112 ]
  %125 = icmp slt i64 %124, %19
  br i1 %125, label %126, label %129

126:                                              ; preds = %123
  %127 = getelementptr i64, ptr %117, i64 %124
  store i64 0, ptr %127, align 4
  %128 = add i64 %124, 1
  br label %123

129:                                              ; preds = %123
  %130 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %122, ptr %130, align 8
  %131 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %130, 1
  %132 = getelementptr i64, ptr null, i64 %21
  %133 = ptrtoint ptr %132 to i64
  %134 = call ptr @malloc(i64 %133)
  %135 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %134, 0
  %136 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %135, ptr %134, 1
  %137 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %136, i64 0, 2
  %138 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %137, i64 %21, 3, 0
  %139 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %138, i64 1, 4, 0
  br label %140

140:                                              ; preds = %143, %129
  %141 = phi i64 [ %145, %143 ], [ 0, %129 ]
  %142 = icmp slt i64 %141, %21
  br i1 %142, label %143, label %146

143:                                              ; preds = %140
  %144 = getelementptr i64, ptr %134, i64 %141
  store i64 0, ptr %144, align 4
  %145 = add i64 %141, 1
  br label %140

146:                                              ; preds = %140
  %147 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %139, ptr %147, align 8
  %148 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %147, 1
  %149 = getelementptr i64, ptr null, i64 %23
  %150 = ptrtoint ptr %149 to i64
  %151 = call ptr @malloc(i64 %150)
  %152 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %151, 0
  %153 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %152, ptr %151, 1
  %154 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %153, i64 0, 2
  %155 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %154, i64 %23, 3, 0
  %156 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %155, i64 1, 4, 0
  br label %157

157:                                              ; preds = %160, %146
  %158 = phi i64 [ %162, %160 ], [ 0, %146 ]
  %159 = icmp slt i64 %158, %23
  br i1 %159, label %160, label %163

160:                                              ; preds = %157
  %161 = getelementptr i64, ptr %151, i64 %158
  store i64 0, ptr %161, align 4
  %162 = add i64 %158, 1
  br label %157

163:                                              ; preds = %157
  %164 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %156, ptr %164, align 8
  %165 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %164, 1
  %166 = getelementptr double, ptr null, i64 %25
  %167 = ptrtoint ptr %166 to i64
  %168 = call ptr @malloc(i64 %167)
  %169 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %168, 0
  %170 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %169, ptr %168, 1
  %171 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %170, i64 0, 2
  %172 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %171, i64 %25, 3, 0
  %173 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %172, i64 1, 4, 0
  br label %174

174:                                              ; preds = %177, %163
  %175 = phi i64 [ %179, %177 ], [ 0, %163 ]
  %176 = icmp slt i64 %175, %25
  br i1 %176, label %177, label %180

177:                                              ; preds = %174
  %178 = getelementptr double, ptr %168, i64 %175
  store double 0.000000e+00, ptr %178, align 8
  %179 = add i64 %175, 1
  br label %174

180:                                              ; preds = %174
  %181 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %173, ptr %181, align 8
  %182 = insertvalue { i64, ptr } { i64 1, ptr undef }, ptr %181, 1
  call void @read_input_2D_f64(i32 0, i64 0, i64 -1, i64 3, i64 0, i64 1, ptr %45, i64 1, ptr %62, i64 1, ptr %79, i64 1, ptr %96, i64 1, ptr %113, i64 1, ptr %130, i64 1, ptr %147, i64 1, ptr %164, i64 1, ptr %181, i32 1)
  %183 = getelementptr double, ptr null, i64 %29
  %184 = ptrtoint ptr %183 to i64
  %185 = add i64 %184, 32
  %186 = call ptr @malloc(i64 %185)
  %187 = ptrtoint ptr %186 to i64
  %188 = add i64 %187, 31
  %189 = urem i64 %188, 32
  %190 = sub i64 %188, %189
  %191 = inttoptr i64 %190 to ptr
  %192 = getelementptr double, ptr null, i64 %27
  %193 = ptrtoint ptr %192 to i64
  %194 = add i64 %193, 32
  %195 = call ptr @malloc(i64 %194)
  %196 = ptrtoint ptr %195 to i64
  %197 = add i64 %196, 31
  %198 = urem i64 %197, 32
  %199 = sub i64 %197, %198
  %200 = inttoptr i64 %199 to ptr
  br label %201

201:                                              ; preds = %204, %180
  %202 = phi i64 [ %206, %204 ], [ 0, %180 ]
  %203 = icmp slt i64 %202, %29
  br i1 %203, label %204, label %207

204:                                              ; preds = %201
  %205 = getelementptr double, ptr %191, i64 %202
  store double 1.700000e+00, ptr %205, align 8
  %206 = add i64 %202, 1
  br label %201

207:                                              ; preds = %210, %201
  %208 = phi i64 [ %212, %210 ], [ 0, %201 ]
  %209 = icmp slt i64 %208, %27
  br i1 %209, label %210, label %213

210:                                              ; preds = %207
  %211 = getelementptr double, ptr %200, i64 %208
  store double 0.000000e+00, ptr %211, align 8
  %212 = add i64 %208, 1
  br label %207

213:                                              ; preds = %245, %207
  %214 = phi i64 [ %247, %245 ], [ 0, %207 ]
  %215 = icmp slt i64 %214, 10
  br i1 %215, label %216, label %248

216:                                              ; preds = %213
  %217 = call double @getTime()
  %218 = load i64, ptr %32, align 4
  br label %219

219:                                              ; preds = %243, %216
  %220 = phi i64 [ %244, %243 ], [ 0, %216 ]
  %221 = icmp slt i64 %220, %218
  br i1 %221, label %222, label %245

222:                                              ; preds = %219
  %223 = load i64, ptr %134, align 4
  br label %224

224:                                              ; preds = %227, %222
  %225 = phi i64 [ %242, %227 ], [ 0, %222 ]
  %226 = icmp slt i64 %225, %223
  br i1 %226, label %227, label %243

227:                                              ; preds = %224
  %228 = load i64, ptr %134, align 4
  %229 = mul i64 %220, %228
  %230 = add i64 %229, %225
  %231 = getelementptr i64, ptr %117, i64 %230
  %232 = load i64, ptr %231, align 4
  %233 = getelementptr double, ptr %168, i64 %230
  %234 = load double, ptr %233, align 8
  %235 = getelementptr double, ptr %191, i64 %232
  %236 = load double, ptr %235, align 8
  %237 = getelementptr double, ptr %200, i64 %225
  %238 = load double, ptr %237, align 8
  %239 = fmul double %234, %236
  %240 = fadd double %238, %239
  %241 = getelementptr double, ptr %200, i64 %225
  store double %240, ptr %241, align 8
  %242 = add i64 %225, 1
  br label %224

243:                                              ; preds = %224
  %244 = add i64 %220, 1
  br label %219

245:                                              ; preds = %219
  %246 = call double @getTime()
  call void @printElapsedTime(double %217, double %246)
  %247 = add i64 %214, 1
  br label %213

248:                                              ; preds = %213
  ret void
}

declare void @read_input_2D_f64(i32, i64, i64, i64, i64, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i32)

declare void @read_input_sizes_2D_f64(i32, i64, i64, i64, i64, i64, ptr, i32)

declare void @comet_sort_index(i64, ptr, i64, i64)

declare double @getTime()

declare void @printElapsedTime(double, double)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
