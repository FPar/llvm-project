; Test that presence of an incorrectly declared library function is ignored by
; instcombine.
;
; This test case attempts to perform the
;     strstr(str, pat) == str -> strncmp(str, pat, strlen(str)) == 0
; transformation. Because strncmp is incorrectly declared, creating a call to it
; fails. At that point, strlen has already been inserted into the module.
; Because it is dead, it will be removed subsequently. This can cause
; instcombine to believe that the module was modified, which attempts the same
; transformation during every following iteration, causing instcombine to fail.
;
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

define i32 @fail_instcombine_bad_libcall(ptr %0, ptr %1) {
  %3 = call ptr @strstr(ptr %0, ptr %1)
  %4 = icmp ne ptr %3, %0
  br i1 %4, label %a, label %b

a:
  ret i32 4
b:
  ret i32 2
}

declare ptr @strstr(ptr, ptr)

; This shoul
declare void @strncmp()
