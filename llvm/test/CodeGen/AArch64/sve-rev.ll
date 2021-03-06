; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s 2>%t | FileCheck %s
; RUN: FileCheck --check-prefix=WARN --allow-empty %s <%t

; If this check fails please read test/CodeGen/AArch64/README for instructions on how to resolve it.
; WARN-NOT: warning

target triple = "aarch64-unknown-linux-gnu"

;
; RBIT
;

define <vscale x 16 x i8> @bitreverse_i8(<vscale x 16 x i8> %a) #0 {
; CHECK-LABEL: bitreverse_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    rbit z0.b, p0/m, z0.b
; CHECK-NEXT:    ret
  %res = call <vscale x 16 x i8> @llvm.bitreverse.nxv16i8(<vscale x 16 x i8> %a)
  ret <vscale x 16 x i8> %res
}

define <vscale x 8 x i16> @bitreverse_i16(<vscale x 8 x i16> %a) #0 {
; CHECK-LABEL: bitreverse_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    rbit z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = call <vscale x 8 x i16> @llvm.bitreverse.nxv8i16(<vscale x 8 x i16> %a)
  ret <vscale x 8 x i16> %res
}

define <vscale x 4 x i32> @bitreverse_i32(<vscale x 4 x i32> %a) #0 {
; CHECK-LABEL: bitreverse_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    rbit z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = call <vscale x 4 x i32> @llvm.bitreverse.nxv4i32(<vscale x 4 x i32> %a)
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @bitreverse_i64(<vscale x 2 x i64> %a) #0 {
; CHECK-LABEL: bitreverse_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    rbit z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = call <vscale x 2 x i64> @llvm.bitreverse.nxv2i64(<vscale x 2 x i64> %a)
  ret <vscale x 2 x i64> %res
}

;
; REVB
;

define <vscale x 8 x i16> @byteswap_i16(<vscale x 8 x i16> %a) #0 {
; CHECK-LABEL: byteswap_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    revb z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = call <vscale x 8 x i16> @llvm.bswap.nxv8i16(<vscale x 8 x i16> %a)
  ret <vscale x 8 x i16> %res
}

define <vscale x 4 x i32> @byteswap_i32(<vscale x 4 x i32> %a) #0 {
; CHECK-LABEL: byteswap_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    revb z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = call <vscale x 4 x i32> @llvm.bswap.nxv4i32(<vscale x 4 x i32> %a)
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @byteswap_i64(<vscale x 2 x i64> %a) #0 {
; CHECK-LABEL: byteswap_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    revb z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = call <vscale x 2 x i64> @llvm.bswap.nxv2i64(<vscale x 2 x i64> %a)
  ret <vscale x 2 x i64> %res
}

attributes #0 = { "target-features"="+sve" }

declare <vscale x 16 x i8> @llvm.bitreverse.nxv16i8(<vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.bitreverse.nxv8i16(<vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.bitreverse.nxv4i32(<vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.bitreverse.nxv2i64(<vscale x 2 x i64>)

declare <vscale x 8 x i16> @llvm.bswap.nxv8i16(<vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.bswap.nxv4i32(<vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.bswap.nxv2i64(<vscale x 2 x i64>)
