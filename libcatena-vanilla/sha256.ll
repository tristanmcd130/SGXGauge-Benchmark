; ModuleID = 'third-party/zedwood/sha256.cpp'
source_filename = "third-party/zedwood/sha256.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"class.zedwood::(anonymous namespace)::SHA256" = type { i32, i32, [128 x i8], [8 x i32] }
%"class.std::allocator" = type { i8 }

$_ZNSt15__new_allocatorIcED2Ev = comdat any

@.str = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@_ZN7zedwood12_GLOBAL__N_16SHA2568sha256_kE = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 16

; Function Attrs: noinline optnone uwtable
define dso_local void @_ZN7zedwood4Hash6sha256ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr noalias sret(%"class.std::__cxx11::basic_string") align 8 %agg.result, ptr noundef %input) #0 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %this.addr.i13 = alloca ptr, align 8
  %this.addr.i11 = alloca ptr, align 8
  %this.addr.i9 = alloca ptr, align 8
  %this.addr.i = alloca ptr, align 8
  %result.ptr = alloca ptr, align 8
  %input.indirect_addr = alloca ptr, align 8
  %digest = alloca [32 x i8], align 16
  %ctx = alloca %"class.zedwood::(anonymous namespace)::SHA256", align 4
  %buf = alloca [65 x i8], align 16
  %i = alloca i32, align 4
  %ref.tmp = alloca %"class.std::allocator", align 1
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %agg.result, ptr %result.ptr, align 8
  store ptr %input, ptr %input.indirect_addr, align 8
  %arraydecay = getelementptr inbounds [32 x i8], ptr %digest, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %arraydecay, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 4 %ctx, i8 0, i64 168, i1 false)
  call void @_ZN7zedwood12_GLOBAL__N_16SHA2564initEv(ptr noundef nonnull align 4 dereferenceable(168) %ctx)
  %call = call noundef ptr @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(ptr noundef nonnull align 8 dereferenceable(32) %input) #8
  %call1 = call noundef i64 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6lengthEv(ptr noundef nonnull align 8 dereferenceable(32) %input) #8
  %conv = trunc i64 %call1 to i32
  call void @_ZN7zedwood12_GLOBAL__N_16SHA2566updateEPKhj(ptr noundef nonnull align 4 dereferenceable(168) %ctx, ptr noundef %call, i32 noundef %conv)
  %arraydecay2 = getelementptr inbounds [32 x i8], ptr %digest, i64 0, i64 0
  call void @_ZN7zedwood12_GLOBAL__N_16SHA2568finalizeEPh(ptr noundef nonnull align 4 dereferenceable(168) %ctx, ptr noundef %arraydecay2)
  %arrayidx = getelementptr inbounds [65 x i8], ptr %buf, i64 0, i64 64
  store i8 0, ptr %arrayidx, align 16
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %0, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [65 x i8], ptr %buf, i64 0, i64 0
  %1 = load i32, ptr %i, align 4
  %mul = mul nsw i32 %1, 2
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay3, i64 %idx.ext
  %2 = load i32, ptr %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx4 = getelementptr inbounds [32 x i8], ptr %digest, i64 0, i64 %idxprom
  %3 = load i8, ptr %arrayidx4, align 1
  %conv5 = zext i8 %3 to i32
  %call6 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %add.ptr, ptr noundef @.str, i32 noundef %conv5) #8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, ptr %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %arraydecay7 = getelementptr inbounds [65 x i8], ptr %buf, i64 0, i64 0
  store ptr %ref.tmp, ptr %this.addr.i, align 8
  %this1.i = load ptr, ptr %this.addr.i, align 8
  store ptr %this1.i, ptr %this.addr.i13, align 8
  %this1.i14 = load ptr, ptr %this.addr.i13, align 8
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(ptr noundef nonnull align 8 dereferenceable(32) %agg.result, ptr noundef %arraydecay7, ptr noundef nonnull align 1 dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %for.end
  store ptr %ref.tmp, ptr %this.addr.i9, align 8
  %this1.i10 = load ptr, ptr %this.addr.i9, align 8
  call void @_ZNSt15__new_allocatorIcED2Ev(ptr noundef nonnull align 1 dereferenceable(1) %this1.i10) #8
  ret void

lpad:                                             ; preds = %for.end
  %5 = landingpad { ptr, i32 }
          cleanup
  %6 = extractvalue { ptr, i32 } %5, 0
  store ptr %6, ptr %exn.slot, align 8
  %7 = extractvalue { ptr, i32 } %5, 1
  store i32 %7, ptr %ehselector.slot, align 4
  store ptr %ref.tmp, ptr %this.addr.i11, align 8
  %this1.i12 = load ptr, ptr %this.addr.i11, align 8
  call void @_ZNSt15__new_allocatorIcED2Ev(ptr noundef nonnull align 1 dereferenceable(1) %this1.i12) #8
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val8 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val8
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal void @_ZN7zedwood12_GLOBAL__N_16SHA2564initEv(ptr noundef nonnull align 4 dereferenceable(168) %this) #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %m_h = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %arrayidx = getelementptr inbounds [8 x i32], ptr %m_h, i64 0, i64 0
  store i32 1779033703, ptr %arrayidx, align 4
  %m_h2 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %arrayidx3 = getelementptr inbounds [8 x i32], ptr %m_h2, i64 0, i64 1
  store i32 -1150833019, ptr %arrayidx3, align 4
  %m_h4 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %arrayidx5 = getelementptr inbounds [8 x i32], ptr %m_h4, i64 0, i64 2
  store i32 1013904242, ptr %arrayidx5, align 4
  %m_h6 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %arrayidx7 = getelementptr inbounds [8 x i32], ptr %m_h6, i64 0, i64 3
  store i32 -1521486534, ptr %arrayidx7, align 4
  %m_h8 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %arrayidx9 = getelementptr inbounds [8 x i32], ptr %m_h8, i64 0, i64 4
  store i32 1359893119, ptr %arrayidx9, align 4
  %m_h10 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %arrayidx11 = getelementptr inbounds [8 x i32], ptr %m_h10, i64 0, i64 5
  store i32 -1694144372, ptr %arrayidx11, align 4
  %m_h12 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %arrayidx13 = getelementptr inbounds [8 x i32], ptr %m_h12, i64 0, i64 6
  store i32 528734635, ptr %arrayidx13, align 4
  %m_h14 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %arrayidx15 = getelementptr inbounds [8 x i32], ptr %m_h14, i64 0, i64 7
  store i32 1541459225, ptr %arrayidx15, align 4
  %m_len = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  store i32 0, ptr %m_len, align 4
  %m_tot_len = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 0
  store i32 0, ptr %m_tot_len, align 4
  ret void
}

; Function Attrs: mustprogress noinline optnone uwtable
define internal void @_ZN7zedwood12_GLOBAL__N_16SHA2566updateEPKhj(ptr noundef nonnull align 4 dereferenceable(168) %this, ptr noundef %message, i32 noundef %len) #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %message.addr = alloca ptr, align 8
  %len.addr = alloca i32, align 4
  %block_nb = alloca i32, align 4
  %new_len = alloca i32, align 4
  %rem_len = alloca i32, align 4
  %tmp_len = alloca i32, align 4
  %shifted_message = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %message, ptr %message.addr, align 8
  store i32 %len, ptr %len.addr, align 4
  %this1 = load ptr, ptr %this.addr, align 8
  %m_len = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %0 = load i32, ptr %m_len, align 4
  %sub = sub i32 64, %0
  store i32 %sub, ptr %tmp_len, align 4
  %1 = load i32, ptr %len.addr, align 4
  %2 = load i32, ptr %tmp_len, align 4
  %cmp = icmp ult i32 %1, %2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %len.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, ptr %tmp_len, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ %4, %cond.false ]
  store i32 %cond, ptr %rem_len, align 4
  %m_block = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %m_len2 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %5 = load i32, ptr %m_len2, align 4
  %idxprom = zext i32 %5 to i64
  %arrayidx = getelementptr inbounds [128 x i8], ptr %m_block, i64 0, i64 %idxprom
  %6 = load ptr, ptr %message.addr, align 8
  %7 = load i32, ptr %rem_len, align 4
  %conv = zext i32 %7 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %arrayidx, ptr align 1 %6, i64 %conv, i1 false)
  %m_len3 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %8 = load i32, ptr %m_len3, align 4
  %9 = load i32, ptr %len.addr, align 4
  %add = add i32 %8, %9
  %cmp4 = icmp ult i32 %add, 64
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %10 = load i32, ptr %len.addr, align 4
  %m_len5 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %11 = load i32, ptr %m_len5, align 4
  %add6 = add i32 %11, %10
  store i32 %add6, ptr %m_len5, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %12 = load i32, ptr %len.addr, align 4
  %13 = load i32, ptr %rem_len, align 4
  %sub7 = sub i32 %12, %13
  store i32 %sub7, ptr %new_len, align 4
  %14 = load i32, ptr %new_len, align 4
  %div = udiv i32 %14, 64
  store i32 %div, ptr %block_nb, align 4
  %15 = load ptr, ptr %message.addr, align 8
  %16 = load i32, ptr %rem_len, align 4
  %idx.ext = zext i32 %16 to i64
  %add.ptr = getelementptr inbounds i8, ptr %15, i64 %idx.ext
  store ptr %add.ptr, ptr %shifted_message, align 8
  %m_block8 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %arraydecay = getelementptr inbounds [128 x i8], ptr %m_block8, i64 0, i64 0
  call void @_ZN7zedwood12_GLOBAL__N_16SHA2569transformEPKhj(ptr noundef nonnull align 4 dereferenceable(168) %this1, ptr noundef %arraydecay, i32 noundef 1)
  %17 = load ptr, ptr %shifted_message, align 8
  %18 = load i32, ptr %block_nb, align 4
  call void @_ZN7zedwood12_GLOBAL__N_16SHA2569transformEPKhj(ptr noundef nonnull align 4 dereferenceable(168) %this1, ptr noundef %17, i32 noundef %18)
  %19 = load i32, ptr %new_len, align 4
  %rem = urem i32 %19, 64
  store i32 %rem, ptr %rem_len, align 4
  %m_block9 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %arraydecay10 = getelementptr inbounds [128 x i8], ptr %m_block9, i64 0, i64 0
  %20 = load ptr, ptr %shifted_message, align 8
  %21 = load i32, ptr %block_nb, align 4
  %shl = shl i32 %21, 6
  %idxprom11 = zext i32 %shl to i64
  %arrayidx12 = getelementptr inbounds i8, ptr %20, i64 %idxprom11
  %22 = load i32, ptr %rem_len, align 4
  %conv13 = zext i32 %22 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %arraydecay10, ptr align 1 %arrayidx12, i64 %conv13, i1 false)
  %23 = load i32, ptr %rem_len, align 4
  %m_len14 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  store i32 %23, ptr %m_len14, align 4
  %24 = load i32, ptr %block_nb, align 4
  %add15 = add i32 %24, 1
  %shl16 = shl i32 %add15, 6
  %m_tot_len = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 0
  %25 = load i32, ptr %m_tot_len, align 4
  %add17 = add i32 %25, %shl16
  store i32 %add17, ptr %m_tot_len, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: nounwind
declare noundef ptr @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(ptr noundef nonnull align 8 dereferenceable(32)) #4

; Function Attrs: nounwind
declare noundef i64 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6lengthEv(ptr noundef nonnull align 8 dereferenceable(32)) #4

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal void @_ZN7zedwood12_GLOBAL__N_16SHA2568finalizeEPh(ptr noundef nonnull align 4 dereferenceable(168) %this, ptr noundef %digest) #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %digest.addr = alloca ptr, align 8
  %block_nb = alloca i32, align 4
  %pm_len = alloca i32, align 4
  %len_b = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store ptr %digest, ptr %digest.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %m_len = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %0 = load i32, ptr %m_len, align 4
  %rem = urem i32 %0, 64
  %cmp = icmp ult i32 55, %rem
  %conv = zext i1 %cmp to i32
  %add = add nsw i32 1, %conv
  store i32 %add, ptr %block_nb, align 4
  %m_tot_len = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 0
  %1 = load i32, ptr %m_tot_len, align 4
  %m_len2 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %2 = load i32, ptr %m_len2, align 4
  %add3 = add i32 %1, %2
  %shl = shl i32 %add3, 3
  store i32 %shl, ptr %len_b, align 4
  %3 = load i32, ptr %block_nb, align 4
  %shl4 = shl i32 %3, 6
  store i32 %shl4, ptr %pm_len, align 4
  %m_block = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %arraydecay = getelementptr inbounds [128 x i8], ptr %m_block, i64 0, i64 0
  %m_len5 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %4 = load i32, ptr %m_len5, align 4
  %idx.ext = zext i32 %4 to i64
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay, i64 %idx.ext
  %5 = load i32, ptr %pm_len, align 4
  %m_len6 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %6 = load i32, ptr %m_len6, align 4
  %sub = sub i32 %5, %6
  %conv7 = zext i32 %sub to i64
  call void @llvm.memset.p0.i64(ptr align 1 %add.ptr, i8 0, i64 %conv7, i1 false)
  %m_block8 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %m_len9 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 1
  %7 = load i32, ptr %m_len9, align 4
  %idxprom = zext i32 %7 to i64
  %arrayidx = getelementptr inbounds [128 x i8], ptr %m_block8, i64 0, i64 %idxprom
  store i8 -128, ptr %arrayidx, align 1
  %8 = load i32, ptr %len_b, align 4
  %conv10 = trunc i32 %8 to i8
  %m_block11 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %arraydecay12 = getelementptr inbounds [128 x i8], ptr %m_block11, i64 0, i64 0
  %9 = load i32, ptr %pm_len, align 4
  %idx.ext13 = zext i32 %9 to i64
  %add.ptr14 = getelementptr inbounds i8, ptr %arraydecay12, i64 %idx.ext13
  %add.ptr15 = getelementptr inbounds i8, ptr %add.ptr14, i64 -4
  %add.ptr16 = getelementptr inbounds i8, ptr %add.ptr15, i64 3
  store i8 %conv10, ptr %add.ptr16, align 1
  %10 = load i32, ptr %len_b, align 4
  %shr = lshr i32 %10, 8
  %conv17 = trunc i32 %shr to i8
  %m_block18 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %arraydecay19 = getelementptr inbounds [128 x i8], ptr %m_block18, i64 0, i64 0
  %11 = load i32, ptr %pm_len, align 4
  %idx.ext20 = zext i32 %11 to i64
  %add.ptr21 = getelementptr inbounds i8, ptr %arraydecay19, i64 %idx.ext20
  %add.ptr22 = getelementptr inbounds i8, ptr %add.ptr21, i64 -4
  %add.ptr23 = getelementptr inbounds i8, ptr %add.ptr22, i64 2
  store i8 %conv17, ptr %add.ptr23, align 1
  %12 = load i32, ptr %len_b, align 4
  %shr24 = lshr i32 %12, 16
  %conv25 = trunc i32 %shr24 to i8
  %m_block26 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %arraydecay27 = getelementptr inbounds [128 x i8], ptr %m_block26, i64 0, i64 0
  %13 = load i32, ptr %pm_len, align 4
  %idx.ext28 = zext i32 %13 to i64
  %add.ptr29 = getelementptr inbounds i8, ptr %arraydecay27, i64 %idx.ext28
  %add.ptr30 = getelementptr inbounds i8, ptr %add.ptr29, i64 -4
  %add.ptr31 = getelementptr inbounds i8, ptr %add.ptr30, i64 1
  store i8 %conv25, ptr %add.ptr31, align 1
  %14 = load i32, ptr %len_b, align 4
  %shr32 = lshr i32 %14, 24
  %conv33 = trunc i32 %shr32 to i8
  %m_block34 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %arraydecay35 = getelementptr inbounds [128 x i8], ptr %m_block34, i64 0, i64 0
  %15 = load i32, ptr %pm_len, align 4
  %idx.ext36 = zext i32 %15 to i64
  %add.ptr37 = getelementptr inbounds i8, ptr %arraydecay35, i64 %idx.ext36
  %add.ptr38 = getelementptr inbounds i8, ptr %add.ptr37, i64 -4
  %add.ptr39 = getelementptr inbounds i8, ptr %add.ptr38, i64 0
  store i8 %conv33, ptr %add.ptr39, align 1
  %m_block40 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 2
  %arraydecay41 = getelementptr inbounds [128 x i8], ptr %m_block40, i64 0, i64 0
  %16 = load i32, ptr %block_nb, align 4
  call void @_ZN7zedwood12_GLOBAL__N_16SHA2569transformEPKhj(ptr noundef nonnull align 4 dereferenceable(168) %this1, ptr noundef %arraydecay41, i32 noundef %16)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %17 = load i32, ptr %i, align 4
  %cmp42 = icmp slt i32 %17, 8
  br i1 %cmp42, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %m_h = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %18 = load i32, ptr %i, align 4
  %idxprom43 = sext i32 %18 to i64
  %arrayidx44 = getelementptr inbounds [8 x i32], ptr %m_h, i64 0, i64 %idxprom43
  %19 = load i32, ptr %arrayidx44, align 4
  %conv45 = trunc i32 %19 to i8
  %20 = load ptr, ptr %digest.addr, align 8
  %21 = load i32, ptr %i, align 4
  %shl46 = shl i32 %21, 2
  %idxprom47 = sext i32 %shl46 to i64
  %arrayidx48 = getelementptr inbounds i8, ptr %20, i64 %idxprom47
  %add.ptr49 = getelementptr inbounds i8, ptr %arrayidx48, i64 3
  store i8 %conv45, ptr %add.ptr49, align 1
  %m_h50 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %22 = load i32, ptr %i, align 4
  %idxprom51 = sext i32 %22 to i64
  %arrayidx52 = getelementptr inbounds [8 x i32], ptr %m_h50, i64 0, i64 %idxprom51
  %23 = load i32, ptr %arrayidx52, align 4
  %shr53 = lshr i32 %23, 8
  %conv54 = trunc i32 %shr53 to i8
  %24 = load ptr, ptr %digest.addr, align 8
  %25 = load i32, ptr %i, align 4
  %shl55 = shl i32 %25, 2
  %idxprom56 = sext i32 %shl55 to i64
  %arrayidx57 = getelementptr inbounds i8, ptr %24, i64 %idxprom56
  %add.ptr58 = getelementptr inbounds i8, ptr %arrayidx57, i64 2
  store i8 %conv54, ptr %add.ptr58, align 1
  %m_h59 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %26 = load i32, ptr %i, align 4
  %idxprom60 = sext i32 %26 to i64
  %arrayidx61 = getelementptr inbounds [8 x i32], ptr %m_h59, i64 0, i64 %idxprom60
  %27 = load i32, ptr %arrayidx61, align 4
  %shr62 = lshr i32 %27, 16
  %conv63 = trunc i32 %shr62 to i8
  %28 = load ptr, ptr %digest.addr, align 8
  %29 = load i32, ptr %i, align 4
  %shl64 = shl i32 %29, 2
  %idxprom65 = sext i32 %shl64 to i64
  %arrayidx66 = getelementptr inbounds i8, ptr %28, i64 %idxprom65
  %add.ptr67 = getelementptr inbounds i8, ptr %arrayidx66, i64 1
  store i8 %conv63, ptr %add.ptr67, align 1
  %m_h68 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %30 = load i32, ptr %i, align 4
  %idxprom69 = sext i32 %30 to i64
  %arrayidx70 = getelementptr inbounds [8 x i32], ptr %m_h68, i64 0, i64 %idxprom69
  %31 = load i32, ptr %arrayidx70, align 4
  %shr71 = lshr i32 %31, 24
  %conv72 = trunc i32 %shr71 to i8
  %32 = load ptr, ptr %digest.addr, align 8
  %33 = load i32, ptr %i, align 4
  %shl73 = shl i32 %33, 2
  %idxprom74 = sext i32 %shl73 to i64
  %arrayidx75 = getelementptr inbounds i8, ptr %32, i64 %idxprom74
  %add.ptr76 = getelementptr inbounds i8, ptr %arrayidx75, i64 0
  store i8 %conv72, ptr %add.ptr76, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %34 = load i32, ptr %i, align 4
  %inc = add nsw i32 %34, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #4

declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(ptr noundef nonnull align 8 dereferenceable(32), ptr noundef, ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #5

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal void @_ZN7zedwood12_GLOBAL__N_16SHA2569transformEPKhj(ptr noundef nonnull align 4 dereferenceable(168) %this, ptr noundef %message, i32 noundef %block_nb) #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %message.addr = alloca ptr, align 8
  %block_nb.addr = alloca i32, align 4
  %w = alloca [64 x i32], align 16
  %wv = alloca [8 x i32], align 16
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %sub_block = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store ptr %message, ptr %message.addr, align 8
  store i32 %block_nb, ptr %block_nb.addr, align 4
  %this1 = load ptr, ptr %this.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc196, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %block_nb.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end198

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %message.addr, align 8
  %3 = load i32, ptr %i, align 4
  %shl = shl i32 %3, 6
  %idx.ext = sext i32 %shl to i64
  %add.ptr = getelementptr inbounds i8, ptr %2, i64 %idx.ext
  store ptr %add.ptr, ptr %sub_block, align 8
  store i32 0, ptr %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %4 = load i32, ptr %j, align 4
  %cmp3 = icmp slt i32 %4, 16
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %5 = load ptr, ptr %sub_block, align 8
  %6 = load i32, ptr %j, align 4
  %shl5 = shl i32 %6, 2
  %idxprom = sext i32 %shl5 to i64
  %arrayidx = getelementptr inbounds i8, ptr %5, i64 %idxprom
  %add.ptr6 = getelementptr inbounds i8, ptr %arrayidx, i64 3
  %7 = load i8, ptr %add.ptr6, align 1
  %conv = zext i8 %7 to i32
  %8 = load ptr, ptr %sub_block, align 8
  %9 = load i32, ptr %j, align 4
  %shl7 = shl i32 %9, 2
  %idxprom8 = sext i32 %shl7 to i64
  %arrayidx9 = getelementptr inbounds i8, ptr %8, i64 %idxprom8
  %add.ptr10 = getelementptr inbounds i8, ptr %arrayidx9, i64 2
  %10 = load i8, ptr %add.ptr10, align 1
  %conv11 = zext i8 %10 to i32
  %shl12 = shl i32 %conv11, 8
  %or = or i32 %conv, %shl12
  %11 = load ptr, ptr %sub_block, align 8
  %12 = load i32, ptr %j, align 4
  %shl13 = shl i32 %12, 2
  %idxprom14 = sext i32 %shl13 to i64
  %arrayidx15 = getelementptr inbounds i8, ptr %11, i64 %idxprom14
  %add.ptr16 = getelementptr inbounds i8, ptr %arrayidx15, i64 1
  %13 = load i8, ptr %add.ptr16, align 1
  %conv17 = zext i8 %13 to i32
  %shl18 = shl i32 %conv17, 16
  %or19 = or i32 %or, %shl18
  %14 = load ptr, ptr %sub_block, align 8
  %15 = load i32, ptr %j, align 4
  %shl20 = shl i32 %15, 2
  %idxprom21 = sext i32 %shl20 to i64
  %arrayidx22 = getelementptr inbounds i8, ptr %14, i64 %idxprom21
  %add.ptr23 = getelementptr inbounds i8, ptr %arrayidx22, i64 0
  %16 = load i8, ptr %add.ptr23, align 1
  %conv24 = zext i8 %16 to i32
  %shl25 = shl i32 %conv24, 24
  %or26 = or i32 %or19, %shl25
  %17 = load i32, ptr %j, align 4
  %idxprom27 = sext i32 %17 to i64
  %arrayidx28 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom27
  store i32 %or26, ptr %arrayidx28, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %18 = load i32, ptr %j, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, ptr %j, align 4
  br label %for.cond2, !llvm.loop !9

for.end:                                          ; preds = %for.cond2
  store i32 16, ptr %j, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc87, %for.end
  %19 = load i32, ptr %j, align 4
  %cmp30 = icmp slt i32 %19, 64
  br i1 %cmp30, label %for.body31, label %for.end89

for.body31:                                       ; preds = %for.cond29
  %20 = load i32, ptr %j, align 4
  %sub = sub nsw i32 %20, 2
  %idxprom32 = sext i32 %sub to i64
  %arrayidx33 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom32
  %21 = load i32, ptr %arrayidx33, align 4
  %shr = lshr i32 %21, 17
  %22 = load i32, ptr %j, align 4
  %sub34 = sub nsw i32 %22, 2
  %idxprom35 = sext i32 %sub34 to i64
  %arrayidx36 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom35
  %23 = load i32, ptr %arrayidx36, align 4
  %shl37 = shl i32 %23, 15
  %or38 = or i32 %shr, %shl37
  %24 = load i32, ptr %j, align 4
  %sub39 = sub nsw i32 %24, 2
  %idxprom40 = sext i32 %sub39 to i64
  %arrayidx41 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom40
  %25 = load i32, ptr %arrayidx41, align 4
  %shr42 = lshr i32 %25, 19
  %26 = load i32, ptr %j, align 4
  %sub43 = sub nsw i32 %26, 2
  %idxprom44 = sext i32 %sub43 to i64
  %arrayidx45 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom44
  %27 = load i32, ptr %arrayidx45, align 4
  %shl46 = shl i32 %27, 13
  %or47 = or i32 %shr42, %shl46
  %xor = xor i32 %or38, %or47
  %28 = load i32, ptr %j, align 4
  %sub48 = sub nsw i32 %28, 2
  %idxprom49 = sext i32 %sub48 to i64
  %arrayidx50 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom49
  %29 = load i32, ptr %arrayidx50, align 4
  %shr51 = lshr i32 %29, 10
  %xor52 = xor i32 %xor, %shr51
  %30 = load i32, ptr %j, align 4
  %sub53 = sub nsw i32 %30, 7
  %idxprom54 = sext i32 %sub53 to i64
  %arrayidx55 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom54
  %31 = load i32, ptr %arrayidx55, align 4
  %add = add i32 %xor52, %31
  %32 = load i32, ptr %j, align 4
  %sub56 = sub nsw i32 %32, 15
  %idxprom57 = sext i32 %sub56 to i64
  %arrayidx58 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom57
  %33 = load i32, ptr %arrayidx58, align 4
  %shr59 = lshr i32 %33, 7
  %34 = load i32, ptr %j, align 4
  %sub60 = sub nsw i32 %34, 15
  %idxprom61 = sext i32 %sub60 to i64
  %arrayidx62 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom61
  %35 = load i32, ptr %arrayidx62, align 4
  %shl63 = shl i32 %35, 25
  %or64 = or i32 %shr59, %shl63
  %36 = load i32, ptr %j, align 4
  %sub65 = sub nsw i32 %36, 15
  %idxprom66 = sext i32 %sub65 to i64
  %arrayidx67 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom66
  %37 = load i32, ptr %arrayidx67, align 4
  %shr68 = lshr i32 %37, 18
  %38 = load i32, ptr %j, align 4
  %sub69 = sub nsw i32 %38, 15
  %idxprom70 = sext i32 %sub69 to i64
  %arrayidx71 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom70
  %39 = load i32, ptr %arrayidx71, align 4
  %shl72 = shl i32 %39, 14
  %or73 = or i32 %shr68, %shl72
  %xor74 = xor i32 %or64, %or73
  %40 = load i32, ptr %j, align 4
  %sub75 = sub nsw i32 %40, 15
  %idxprom76 = sext i32 %sub75 to i64
  %arrayidx77 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom76
  %41 = load i32, ptr %arrayidx77, align 4
  %shr78 = lshr i32 %41, 3
  %xor79 = xor i32 %xor74, %shr78
  %add80 = add i32 %add, %xor79
  %42 = load i32, ptr %j, align 4
  %sub81 = sub nsw i32 %42, 16
  %idxprom82 = sext i32 %sub81 to i64
  %arrayidx83 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom82
  %43 = load i32, ptr %arrayidx83, align 4
  %add84 = add i32 %add80, %43
  %44 = load i32, ptr %j, align 4
  %idxprom85 = sext i32 %44 to i64
  %arrayidx86 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom85
  store i32 %add84, ptr %arrayidx86, align 4
  br label %for.inc87

for.inc87:                                        ; preds = %for.body31
  %45 = load i32, ptr %j, align 4
  %inc88 = add nsw i32 %45, 1
  store i32 %inc88, ptr %j, align 4
  br label %for.cond29, !llvm.loop !10

for.end89:                                        ; preds = %for.cond29
  store i32 0, ptr %j, align 4
  br label %for.cond90

for.cond90:                                       ; preds = %for.inc97, %for.end89
  %46 = load i32, ptr %j, align 4
  %cmp91 = icmp slt i32 %46, 8
  br i1 %cmp91, label %for.body92, label %for.end99

for.body92:                                       ; preds = %for.cond90
  %m_h = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %47 = load i32, ptr %j, align 4
  %idxprom93 = sext i32 %47 to i64
  %arrayidx94 = getelementptr inbounds [8 x i32], ptr %m_h, i64 0, i64 %idxprom93
  %48 = load i32, ptr %arrayidx94, align 4
  %49 = load i32, ptr %j, align 4
  %idxprom95 = sext i32 %49 to i64
  %arrayidx96 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 %idxprom95
  store i32 %48, ptr %arrayidx96, align 4
  br label %for.inc97

for.inc97:                                        ; preds = %for.body92
  %50 = load i32, ptr %j, align 4
  %inc98 = add nsw i32 %50, 1
  store i32 %inc98, ptr %j, align 4
  br label %for.cond90, !llvm.loop !11

for.end99:                                        ; preds = %for.cond90
  store i32 0, ptr %j, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc181, %for.end99
  %51 = load i32, ptr %j, align 4
  %cmp101 = icmp slt i32 %51, 64
  br i1 %cmp101, label %for.body102, label %for.end183

for.body102:                                      ; preds = %for.cond100
  %arrayidx103 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 7
  %52 = load i32, ptr %arrayidx103, align 4
  %arrayidx104 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %53 = load i32, ptr %arrayidx104, align 16
  %shr105 = lshr i32 %53, 6
  %arrayidx106 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %54 = load i32, ptr %arrayidx106, align 16
  %shl107 = shl i32 %54, 26
  %or108 = or i32 %shr105, %shl107
  %arrayidx109 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %55 = load i32, ptr %arrayidx109, align 16
  %shr110 = lshr i32 %55, 11
  %arrayidx111 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %56 = load i32, ptr %arrayidx111, align 16
  %shl112 = shl i32 %56, 21
  %or113 = or i32 %shr110, %shl112
  %xor114 = xor i32 %or108, %or113
  %arrayidx115 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %57 = load i32, ptr %arrayidx115, align 16
  %shr116 = lshr i32 %57, 25
  %arrayidx117 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %58 = load i32, ptr %arrayidx117, align 16
  %shl118 = shl i32 %58, 7
  %or119 = or i32 %shr116, %shl118
  %xor120 = xor i32 %xor114, %or119
  %add121 = add i32 %52, %xor120
  %arrayidx122 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %59 = load i32, ptr %arrayidx122, align 16
  %arrayidx123 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 5
  %60 = load i32, ptr %arrayidx123, align 4
  %and = and i32 %59, %60
  %arrayidx124 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %61 = load i32, ptr %arrayidx124, align 16
  %not = xor i32 %61, -1
  %arrayidx125 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 6
  %62 = load i32, ptr %arrayidx125, align 8
  %and126 = and i32 %not, %62
  %xor127 = xor i32 %and, %and126
  %add128 = add i32 %add121, %xor127
  %63 = load i32, ptr %j, align 4
  %idxprom129 = sext i32 %63 to i64
  %arrayidx130 = getelementptr inbounds [64 x i32], ptr @_ZN7zedwood12_GLOBAL__N_16SHA2568sha256_kE, i64 0, i64 %idxprom129
  %64 = load i32, ptr %arrayidx130, align 4
  %add131 = add i32 %add128, %64
  %65 = load i32, ptr %j, align 4
  %idxprom132 = sext i32 %65 to i64
  %arrayidx133 = getelementptr inbounds [64 x i32], ptr %w, i64 0, i64 %idxprom132
  %66 = load i32, ptr %arrayidx133, align 4
  %add134 = add i32 %add131, %66
  store i32 %add134, ptr %t1, align 4
  %arrayidx135 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %67 = load i32, ptr %arrayidx135, align 16
  %shr136 = lshr i32 %67, 2
  %arrayidx137 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %68 = load i32, ptr %arrayidx137, align 16
  %shl138 = shl i32 %68, 30
  %or139 = or i32 %shr136, %shl138
  %arrayidx140 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %69 = load i32, ptr %arrayidx140, align 16
  %shr141 = lshr i32 %69, 13
  %arrayidx142 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %70 = load i32, ptr %arrayidx142, align 16
  %shl143 = shl i32 %70, 19
  %or144 = or i32 %shr141, %shl143
  %xor145 = xor i32 %or139, %or144
  %arrayidx146 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %71 = load i32, ptr %arrayidx146, align 16
  %shr147 = lshr i32 %71, 22
  %arrayidx148 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %72 = load i32, ptr %arrayidx148, align 16
  %shl149 = shl i32 %72, 10
  %or150 = or i32 %shr147, %shl149
  %xor151 = xor i32 %xor145, %or150
  %arrayidx152 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %73 = load i32, ptr %arrayidx152, align 16
  %arrayidx153 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 1
  %74 = load i32, ptr %arrayidx153, align 4
  %and154 = and i32 %73, %74
  %arrayidx155 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %75 = load i32, ptr %arrayidx155, align 16
  %arrayidx156 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 2
  %76 = load i32, ptr %arrayidx156, align 8
  %and157 = and i32 %75, %76
  %xor158 = xor i32 %and154, %and157
  %arrayidx159 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 1
  %77 = load i32, ptr %arrayidx159, align 4
  %arrayidx160 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 2
  %78 = load i32, ptr %arrayidx160, align 8
  %and161 = and i32 %77, %78
  %xor162 = xor i32 %xor158, %and161
  %add163 = add i32 %xor151, %xor162
  store i32 %add163, ptr %t2, align 4
  %arrayidx164 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 6
  %79 = load i32, ptr %arrayidx164, align 8
  %arrayidx165 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 7
  store i32 %79, ptr %arrayidx165, align 4
  %arrayidx166 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 5
  %80 = load i32, ptr %arrayidx166, align 4
  %arrayidx167 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 6
  store i32 %80, ptr %arrayidx167, align 8
  %arrayidx168 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  %81 = load i32, ptr %arrayidx168, align 16
  %arrayidx169 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 5
  store i32 %81, ptr %arrayidx169, align 4
  %arrayidx170 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 3
  %82 = load i32, ptr %arrayidx170, align 4
  %83 = load i32, ptr %t1, align 4
  %add171 = add i32 %82, %83
  %arrayidx172 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 4
  store i32 %add171, ptr %arrayidx172, align 16
  %arrayidx173 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 2
  %84 = load i32, ptr %arrayidx173, align 8
  %arrayidx174 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 3
  store i32 %84, ptr %arrayidx174, align 4
  %arrayidx175 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 1
  %85 = load i32, ptr %arrayidx175, align 4
  %arrayidx176 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 2
  store i32 %85, ptr %arrayidx176, align 8
  %arrayidx177 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  %86 = load i32, ptr %arrayidx177, align 16
  %arrayidx178 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 1
  store i32 %86, ptr %arrayidx178, align 4
  %87 = load i32, ptr %t1, align 4
  %88 = load i32, ptr %t2, align 4
  %add179 = add i32 %87, %88
  %arrayidx180 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 0
  store i32 %add179, ptr %arrayidx180, align 16
  br label %for.inc181

for.inc181:                                       ; preds = %for.body102
  %89 = load i32, ptr %j, align 4
  %inc182 = add nsw i32 %89, 1
  store i32 %inc182, ptr %j, align 4
  br label %for.cond100, !llvm.loop !12

for.end183:                                       ; preds = %for.cond100
  store i32 0, ptr %j, align 4
  br label %for.cond184

for.cond184:                                      ; preds = %for.inc193, %for.end183
  %90 = load i32, ptr %j, align 4
  %cmp185 = icmp slt i32 %90, 8
  br i1 %cmp185, label %for.body186, label %for.end195

for.body186:                                      ; preds = %for.cond184
  %91 = load i32, ptr %j, align 4
  %idxprom187 = sext i32 %91 to i64
  %arrayidx188 = getelementptr inbounds [8 x i32], ptr %wv, i64 0, i64 %idxprom187
  %92 = load i32, ptr %arrayidx188, align 4
  %m_h189 = getelementptr inbounds %"class.zedwood::(anonymous namespace)::SHA256", ptr %this1, i32 0, i32 3
  %93 = load i32, ptr %j, align 4
  %idxprom190 = sext i32 %93 to i64
  %arrayidx191 = getelementptr inbounds [8 x i32], ptr %m_h189, i64 0, i64 %idxprom190
  %94 = load i32, ptr %arrayidx191, align 4
  %add192 = add i32 %94, %92
  store i32 %add192, ptr %arrayidx191, align 4
  br label %for.inc193

for.inc193:                                       ; preds = %for.body186
  %95 = load i32, ptr %j, align 4
  %inc194 = add nsw i32 %95, 1
  store i32 %inc194, ptr %j, align 4
  br label %for.cond184, !llvm.loop !13

for.end195:                                       ; preds = %for.cond184
  br label %for.inc196

for.inc196:                                       ; preds = %for.end195
  %96 = load i32, ptr %i, align 4
  %inc197 = add nsw i32 %96, 1
  store i32 %inc197, ptr %i, align 4
  br label %for.cond, !llvm.loop !14

for.end198:                                       ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt15__new_allocatorIcED2Ev(ptr noundef nonnull align 1 dereferenceable(1) %this) unnamed_addr #7 comdat align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  ret void
}

attributes #0 = { noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/UML-PLow/llvm-enclaves e50a5f97de89be168dc2fa01058fa858ddac04ea)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
