!STARTOFREGISTRYGENERATEDFILE 'MAP_Fortran_Types.f90'
!
! WARNING This file is generated automatically by the FAST registry.
! Do not edit.  Your changes to this file will be lost.
!
! FAST Registry
!*********************************************************************************************************************************
! MAP_Fortran_Types
!.................................................................................................................................
! This file is part of MAP_Fortran.
!
! Copyright (C) 2012-2016 National Renewable Energy Laboratory
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!
!
! W A R N I N G : This file was automatically generated from the FAST registry.  Changes made to this file may be lost.
!
!*********************************************************************************************************************************
!> This module contains the user-defined types needed in MAP_Fortran. It also contains copy, destroy, pack, and
!! unpack routines associated with each defined data type. This code is automatically generated by the FAST Registry.
MODULE MAP_Fortran_Types
!---------------------------------------------------------------------------------------------------------------------------------
USE NWTC_Library
IMPLICIT NONE
! =========  Lin_InitInputType  =======
  TYPE, PUBLIC :: Lin_InitInputType
    LOGICAL  :: linearize = .false.      !< Flag that tells this module if the glue code wants to linearize.  (fortran-only) [-]
  END TYPE Lin_InitInputType
! =======================
! =========  Lin_InitOutputType  =======
  TYPE, PUBLIC :: Lin_InitOutputType
    CHARACTER(200) , DIMENSION(:), ALLOCATABLE  :: LinNames_y      !< second line of output file contents: units (fortran-only) [-]
    CHARACTER(200) , DIMENSION(:), ALLOCATABLE  :: LinNames_u      !< Names of the inputs used in linearization (fortran-only) [-]
    LOGICAL , DIMENSION(:), ALLOCATABLE  :: IsLoad_u      !< Flag that tells FAST if the inputs used in linearization are loads (for preconditioning matrix) (fortran-only) [-]
  END TYPE Lin_InitOutputType
! =======================
! =========  Lin_ParamType  =======
  TYPE, PUBLIC :: Lin_ParamType
    INTEGER(IntKi) , DIMENSION(:,:), ALLOCATABLE  :: Jac_u_indx      !< matrix to help fill/pack the u vector in computing the jacobian (fortran-only) [-]
    REAL(R8Ki)  :: du      !< determines size of the translational displacement perturbation for u (inputs) (fortran-only) [-]
    INTEGER(IntKi)  :: Jac_ny      !< number of outputs in jacobian matrix (fortran-only) [-]
  END TYPE Lin_ParamType
! =======================
CONTAINS
 SUBROUTINE MAP_Fortran_CopyLin_InitInputType( SrcLin_InitInputTypeData, DstLin_InitInputTypeData, CtrlCode, ErrStat, ErrMsg )
   TYPE(Lin_InitInputType), INTENT(IN) :: SrcLin_InitInputTypeData
   TYPE(Lin_InitInputType), INTENT(INOUT) :: DstLin_InitInputTypeData
   INTEGER(IntKi),  INTENT(IN   ) :: CtrlCode
   INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
   CHARACTER(*),    INTENT(  OUT) :: ErrMsg
! Local 
   INTEGER(IntKi)                 :: i,j,k
   INTEGER(IntKi)                 :: ErrStat2
   CHARACTER(ErrMsgLen)           :: ErrMsg2
   CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_CopyLin_InitInputType'
! 
   ErrStat = ErrID_None
   ErrMsg  = ""
    DstLin_InitInputTypeData%linearize = SrcLin_InitInputTypeData%linearize
 END SUBROUTINE MAP_Fortran_CopyLin_InitInputType

 SUBROUTINE MAP_Fortran_DestroyLin_InitInputType( Lin_InitInputTypeData, ErrStat, ErrMsg )
  TYPE(Lin_InitInputType), INTENT(INOUT) :: Lin_InitInputTypeData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
  
  INTEGER(IntKi)                 :: i, i1, i2, i3, i4, i5 
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*),    PARAMETER :: RoutineName = 'MAP_Fortran_DestroyLin_InitInputType'

  ErrStat = ErrID_None
  ErrMsg  = ""

 END SUBROUTINE MAP_Fortran_DestroyLin_InitInputType


subroutine MAP_Fortran_PackLin_InitInputType(Buf, Indata)
   type(PackBuffer), intent(inout) :: Buf
   type(Lin_InitInputType), intent(in) :: InData
   character(*), parameter         :: RoutineName = 'MAP_Fortran_PackLin_InitInputType'
   if (Buf%ErrStat >= AbortErrLev) return
   ! linearize
   call RegPack(Buf, InData%linearize)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine

subroutine MAP_Fortran_UnPackLin_InitInputType(Buf, OutData)
   type(PackBuffer), intent(inout)    :: Buf
   type(Lin_InitInputType), intent(inout) :: OutData
   character(*), parameter            :: RoutineName = 'MAP_Fortran_UnPackLin_InitInputType'
   if (Buf%ErrStat /= ErrID_None) return
   ! linearize
   call RegUnpack(Buf, OutData%linearize)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine
 SUBROUTINE MAP_Fortran_CopyLin_InitOutputType( SrcLin_InitOutputTypeData, DstLin_InitOutputTypeData, CtrlCode, ErrStat, ErrMsg )
   TYPE(Lin_InitOutputType), INTENT(IN) :: SrcLin_InitOutputTypeData
   TYPE(Lin_InitOutputType), INTENT(INOUT) :: DstLin_InitOutputTypeData
   INTEGER(IntKi),  INTENT(IN   ) :: CtrlCode
   INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
   CHARACTER(*),    INTENT(  OUT) :: ErrMsg
! Local 
   INTEGER(IntKi)                 :: i,j,k
   INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
   INTEGER(IntKi)                 :: ErrStat2
   CHARACTER(ErrMsgLen)           :: ErrMsg2
   CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_CopyLin_InitOutputType'
! 
   ErrStat = ErrID_None
   ErrMsg  = ""
IF (ALLOCATED(SrcLin_InitOutputTypeData%LinNames_y)) THEN
  i1_l = LBOUND(SrcLin_InitOutputTypeData%LinNames_y,1)
  i1_u = UBOUND(SrcLin_InitOutputTypeData%LinNames_y,1)
  IF (.NOT. ALLOCATED(DstLin_InitOutputTypeData%LinNames_y)) THEN 
    ALLOCATE(DstLin_InitOutputTypeData%LinNames_y(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstLin_InitOutputTypeData%LinNames_y.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstLin_InitOutputTypeData%LinNames_y = SrcLin_InitOutputTypeData%LinNames_y
ENDIF
IF (ALLOCATED(SrcLin_InitOutputTypeData%LinNames_u)) THEN
  i1_l = LBOUND(SrcLin_InitOutputTypeData%LinNames_u,1)
  i1_u = UBOUND(SrcLin_InitOutputTypeData%LinNames_u,1)
  IF (.NOT. ALLOCATED(DstLin_InitOutputTypeData%LinNames_u)) THEN 
    ALLOCATE(DstLin_InitOutputTypeData%LinNames_u(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstLin_InitOutputTypeData%LinNames_u.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstLin_InitOutputTypeData%LinNames_u = SrcLin_InitOutputTypeData%LinNames_u
ENDIF
IF (ALLOCATED(SrcLin_InitOutputTypeData%IsLoad_u)) THEN
  i1_l = LBOUND(SrcLin_InitOutputTypeData%IsLoad_u,1)
  i1_u = UBOUND(SrcLin_InitOutputTypeData%IsLoad_u,1)
  IF (.NOT. ALLOCATED(DstLin_InitOutputTypeData%IsLoad_u)) THEN 
    ALLOCATE(DstLin_InitOutputTypeData%IsLoad_u(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstLin_InitOutputTypeData%IsLoad_u.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstLin_InitOutputTypeData%IsLoad_u = SrcLin_InitOutputTypeData%IsLoad_u
ENDIF
 END SUBROUTINE MAP_Fortran_CopyLin_InitOutputType

 SUBROUTINE MAP_Fortran_DestroyLin_InitOutputType( Lin_InitOutputTypeData, ErrStat, ErrMsg )
  TYPE(Lin_InitOutputType), INTENT(INOUT) :: Lin_InitOutputTypeData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
  
  INTEGER(IntKi)                 :: i, i1, i2, i3, i4, i5 
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*),    PARAMETER :: RoutineName = 'MAP_Fortran_DestroyLin_InitOutputType'

  ErrStat = ErrID_None
  ErrMsg  = ""

IF (ALLOCATED(Lin_InitOutputTypeData%LinNames_y)) THEN
  DEALLOCATE(Lin_InitOutputTypeData%LinNames_y)
ENDIF
IF (ALLOCATED(Lin_InitOutputTypeData%LinNames_u)) THEN
  DEALLOCATE(Lin_InitOutputTypeData%LinNames_u)
ENDIF
IF (ALLOCATED(Lin_InitOutputTypeData%IsLoad_u)) THEN
  DEALLOCATE(Lin_InitOutputTypeData%IsLoad_u)
ENDIF
 END SUBROUTINE MAP_Fortran_DestroyLin_InitOutputType


subroutine MAP_Fortran_PackLin_InitOutputType(Buf, Indata)
   type(PackBuffer), intent(inout) :: Buf
   type(Lin_InitOutputType), intent(in) :: InData
   character(*), parameter         :: RoutineName = 'MAP_Fortran_PackLin_InitOutputType'
   if (Buf%ErrStat >= AbortErrLev) return
   ! LinNames_y
   call RegPack(Buf, allocated(InData%LinNames_y))
   if (allocated(InData%LinNames_y)) then
      call RegPackBounds(Buf, 1, lbound(InData%LinNames_y), ubound(InData%LinNames_y))
      call RegPack(Buf, InData%LinNames_y)
   end if
   if (RegCheckErr(Buf, RoutineName)) return
   ! LinNames_u
   call RegPack(Buf, allocated(InData%LinNames_u))
   if (allocated(InData%LinNames_u)) then
      call RegPackBounds(Buf, 1, lbound(InData%LinNames_u), ubound(InData%LinNames_u))
      call RegPack(Buf, InData%LinNames_u)
   end if
   if (RegCheckErr(Buf, RoutineName)) return
   ! IsLoad_u
   call RegPack(Buf, allocated(InData%IsLoad_u))
   if (allocated(InData%IsLoad_u)) then
      call RegPackBounds(Buf, 1, lbound(InData%IsLoad_u), ubound(InData%IsLoad_u))
      call RegPack(Buf, InData%IsLoad_u)
   end if
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine

subroutine MAP_Fortran_UnPackLin_InitOutputType(Buf, OutData)
   type(PackBuffer), intent(inout)    :: Buf
   type(Lin_InitOutputType), intent(inout) :: OutData
   character(*), parameter            :: RoutineName = 'MAP_Fortran_UnPackLin_InitOutputType'
   integer(IntKi)  :: LB(1), UB(1)
   integer(IntKi)  :: stat
   logical         :: IsAllocAssoc
   if (Buf%ErrStat /= ErrID_None) return
   ! LinNames_y
   if (allocated(OutData%LinNames_y)) deallocate(OutData%LinNames_y)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%LinNames_y(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%LinNames_y.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%LinNames_y)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   ! LinNames_u
   if (allocated(OutData%LinNames_u)) deallocate(OutData%LinNames_u)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%LinNames_u(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%LinNames_u.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%LinNames_u)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   ! IsLoad_u
   if (allocated(OutData%IsLoad_u)) deallocate(OutData%IsLoad_u)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%IsLoad_u(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%IsLoad_u.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%IsLoad_u)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
end subroutine
 SUBROUTINE MAP_Fortran_CopyLin_ParamType( SrcLin_ParamTypeData, DstLin_ParamTypeData, CtrlCode, ErrStat, ErrMsg )
   TYPE(Lin_ParamType), INTENT(IN) :: SrcLin_ParamTypeData
   TYPE(Lin_ParamType), INTENT(INOUT) :: DstLin_ParamTypeData
   INTEGER(IntKi),  INTENT(IN   ) :: CtrlCode
   INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
   CHARACTER(*),    INTENT(  OUT) :: ErrMsg
! Local 
   INTEGER(IntKi)                 :: i,j,k
   INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
   INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
   INTEGER(IntKi)                 :: ErrStat2
   CHARACTER(ErrMsgLen)           :: ErrMsg2
   CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_CopyLin_ParamType'
! 
   ErrStat = ErrID_None
   ErrMsg  = ""
IF (ALLOCATED(SrcLin_ParamTypeData%Jac_u_indx)) THEN
  i1_l = LBOUND(SrcLin_ParamTypeData%Jac_u_indx,1)
  i1_u = UBOUND(SrcLin_ParamTypeData%Jac_u_indx,1)
  i2_l = LBOUND(SrcLin_ParamTypeData%Jac_u_indx,2)
  i2_u = UBOUND(SrcLin_ParamTypeData%Jac_u_indx,2)
  IF (.NOT. ALLOCATED(DstLin_ParamTypeData%Jac_u_indx)) THEN 
    ALLOCATE(DstLin_ParamTypeData%Jac_u_indx(i1_l:i1_u,i2_l:i2_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstLin_ParamTypeData%Jac_u_indx.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstLin_ParamTypeData%Jac_u_indx = SrcLin_ParamTypeData%Jac_u_indx
ENDIF
    DstLin_ParamTypeData%du = SrcLin_ParamTypeData%du
    DstLin_ParamTypeData%Jac_ny = SrcLin_ParamTypeData%Jac_ny
 END SUBROUTINE MAP_Fortran_CopyLin_ParamType

 SUBROUTINE MAP_Fortran_DestroyLin_ParamType( Lin_ParamTypeData, ErrStat, ErrMsg )
  TYPE(Lin_ParamType), INTENT(INOUT) :: Lin_ParamTypeData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
  
  INTEGER(IntKi)                 :: i, i1, i2, i3, i4, i5 
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*),    PARAMETER :: RoutineName = 'MAP_Fortran_DestroyLin_ParamType'

  ErrStat = ErrID_None
  ErrMsg  = ""

IF (ALLOCATED(Lin_ParamTypeData%Jac_u_indx)) THEN
  DEALLOCATE(Lin_ParamTypeData%Jac_u_indx)
ENDIF
 END SUBROUTINE MAP_Fortran_DestroyLin_ParamType


subroutine MAP_Fortran_PackLin_ParamType(Buf, Indata)
   type(PackBuffer), intent(inout) :: Buf
   type(Lin_ParamType), intent(in) :: InData
   character(*), parameter         :: RoutineName = 'MAP_Fortran_PackLin_ParamType'
   if (Buf%ErrStat >= AbortErrLev) return
   ! Jac_u_indx
   call RegPack(Buf, allocated(InData%Jac_u_indx))
   if (allocated(InData%Jac_u_indx)) then
      call RegPackBounds(Buf, 2, lbound(InData%Jac_u_indx), ubound(InData%Jac_u_indx))
      call RegPack(Buf, InData%Jac_u_indx)
   end if
   if (RegCheckErr(Buf, RoutineName)) return
   ! du
   call RegPack(Buf, InData%du)
   if (RegCheckErr(Buf, RoutineName)) return
   ! Jac_ny
   call RegPack(Buf, InData%Jac_ny)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine

subroutine MAP_Fortran_UnPackLin_ParamType(Buf, OutData)
   type(PackBuffer), intent(inout)    :: Buf
   type(Lin_ParamType), intent(inout) :: OutData
   character(*), parameter            :: RoutineName = 'MAP_Fortran_UnPackLin_ParamType'
   integer(IntKi)  :: LB(2), UB(2)
   integer(IntKi)  :: stat
   logical         :: IsAllocAssoc
   if (Buf%ErrStat /= ErrID_None) return
   ! Jac_u_indx
   if (allocated(OutData%Jac_u_indx)) deallocate(OutData%Jac_u_indx)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 2, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%Jac_u_indx(LB(1):UB(1),LB(2):UB(2)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%Jac_u_indx.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%Jac_u_indx)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   ! du
   call RegUnpack(Buf, OutData%du)
   if (RegCheckErr(Buf, RoutineName)) return
   ! Jac_ny
   call RegUnpack(Buf, OutData%Jac_ny)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine
END MODULE MAP_Fortran_Types
!ENDOFREGISTRYGENERATEDFILE
