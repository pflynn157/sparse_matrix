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
  %183 = mul i64 %29, 62451
  %184 = getelementptr double, ptr null, i64 %183
  %185 = ptrtoint ptr %184 to i64
  %186 = add i64 %185, 32
  %187 = call ptr @malloc(i64 %186)
  %188 = ptrtoint ptr %187 to i64
  %189 = add i64 %188, 31
  %190 = urem i64 %189, 32
  %191 = sub i64 %189, %190
  %192 = inttoptr i64 %191 to ptr
  %193 = mul i64 %27, 62451
  %194 = getelementptr double, ptr null, i64 %193
  %195 = ptrtoint ptr %194 to i64
  %196 = add i64 %195, 32
  %197 = call ptr @malloc(i64 %196)
  %198 = ptrtoint ptr %197 to i64
  %199 = add i64 %198, 31
  %200 = urem i64 %199, 32
  %201 = sub i64 %199, %200
  %202 = inttoptr i64 %201 to ptr
  br label %203

203:                                              ; preds = %214, %180
  %204 = phi i64 [ %215, %214 ], [ 0, %180 ]
  %205 = icmp slt i64 %204, %29
  br i1 %205, label %206, label %216

206:                                              ; preds = %209, %203
  %207 = phi i64 [ %213, %209 ], [ 0, %203 ]
  %208 = icmp slt i64 %207, 62451
  br i1 %208, label %209, label %214

209:                                              ; preds = %206
  %210 = mul i64 %204, 62451
  %211 = add i64 %210, %207
  %212 = getelementptr double, ptr %192, i64 %211
  store double 1.700000e+00, ptr %212, align 8
  %213 = add i64 %207, 1
  br label %206

214:                                              ; preds = %206
  %215 = add i64 %204, 1
  br label %203

216:                                              ; preds = %227, %203
  %217 = phi i64 [ %228, %227 ], [ 0, %203 ]
  %218 = icmp slt i64 %217, %27
  br i1 %218, label %219, label %229

219:                                              ; preds = %222, %216
  %220 = phi i64 [ %226, %222 ], [ 0, %216 ]
  %221 = icmp slt i64 %220, 62451
  br i1 %221, label %222, label %227

222:                                              ; preds = %219
  %223 = mul i64 %217, 62451
  %224 = add i64 %223, %220
  %225 = getelementptr double, ptr %202, i64 %224
  store double 0.000000e+00, ptr %225, align 8
  %226 = add i64 %220, 1
  br label %219

227:                                              ; preds = %219
  %228 = add i64 %217, 1
  br label %216

229:                                              ; preds = %273, %216
  %230 = phi i64 [ %275, %273 ], [ 0, %216 ]
  %231 = icmp slt i64 %230, 10
  br i1 %231, label %232, label %276

232:                                              ; preds = %229
  %233 = call double @getTime()
  %234 = load i64, ptr %32, align 4
  br label %235

235:                                              ; preds = %271, %232
  %236 = phi i64 [ %272, %271 ], [ 0, %232 ]
  %237 = icmp slt i64 %236, %234
  br i1 %237, label %238, label %273

238:                                              ; preds = %235
  %239 = load i64, ptr %134, align 4
  br label %240

240:                                              ; preds = %269, %238
  %241 = phi i64 [ %270, %269 ], [ 0, %238 ]
  %242 = icmp slt i64 %241, %239
  br i1 %242, label %243, label %271

243:                                              ; preds = %240
  %244 = load i64, ptr %32, align 4
  %245 = mul i64 %241, %244
  %246 = add i64 %245, %236
  %247 = getelementptr i64, ptr %117, i64 %246
  %248 = load i64, ptr %247, align 4
  br label %249

249:                                              ; preds = %252, %243
  %250 = phi i64 [ %268, %252 ], [ 0, %243 ]
  %251 = icmp slt i64 %250, 62451
  br i1 %251, label %252, label %269

252:                                              ; preds = %249
  %253 = getelementptr double, ptr %168, i64 %246
  %254 = load double, ptr %253, align 8
  %255 = mul i64 %248, 62451
  %256 = add i64 %255, %250
  %257 = getelementptr double, ptr %192, i64 %256
  %258 = load double, ptr %257, align 8
  %259 = mul i64 %236, 62451
  %260 = add i64 %259, %250
  %261 = getelementptr double, ptr %202, i64 %260
  %262 = load double, ptr %261, align 8
  %263 = fmul double %254, %258
  %264 = fadd double %262, %263
  %265 = mul i64 %236, 62451
  %266 = add i64 %265, %250
  %267 = getelementptr double, ptr %202, i64 %266
  store double %264, ptr %267, align 8
  %268 = add i64 %250, 1
  br label %249

269:                                              ; preds = %249
  %270 = add i64 %241, 1
  br label %240

271:                                              ; preds = %240
  %272 = add i64 %236, 1
  br label %235

273:                                              ; preds = %235
  %274 = call double @getTime()
  call void @printElapsedTime(double %233, double %274)
  %275 = add i64 %230, 1
  br label %229

276:                                              ; preds = %229
  ret void
}

declare void @read_input_2D_f64(i32, i64, i64, i64, i64, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i32)

declare void @read_input_sizes_2D_f64(i32, i64, i64, i64, i64, i64, ptr, i32)

declare void @comet_sort_index(i64, ptr, i64, i64)

declare double @getTime()

declare void @printElapsedTime(double, double)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
