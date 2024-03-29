;proc_dir = '//uz/data/Admin/Hermes/Soft/procnew/RESNEW'
;proc_dir = '//uz/data/Admin/ngesoftware/kul_nm_software'
;proc_dir = 'C:/working/idl/kul_nm_software_development'
proc_dir = '/storage0/home/tsun/code/kul_nm_software_development'
;path_init

; Path
;=====
if !version.os eq 'Win32' $
  then delim = ';' $
  else delim = ':'
  
!path = '/storage0/home/tsun/code/idl/transfer/MC' + delim + $
        ; '/storage0/home/tsun/code/idl/mgh' + delim + $
        '/storage0/home/tsun/code/idl/transfer/TUY' + delim + $
        '/storage0/home/tsun/code/idl/transfer/general' + delim + $
        '/storage0/home/tsun/code/idl/transfer/RECON' + delim + $
        '/storage0/home/tsun/code/idl/transfer/BHC' + delim + $   
        ;'/storage0/home/tsun/code/idl/transfer/example' + delim + $  
	    	'/storage0/home/tsun/code/idl/coyoteprograms/coyote' + delim + $
	    	;proc_dir + '/RECONSTRUCTION_TAO/idl/pro' + delim + $ 	
        proc_dir + '/idl' + delim + $
        proc_dir + '/GENERAL/idl/pro' + delim + $
        proc_dir + '/WIDGETS/idl/pro' + delim + $
        proc_dir + '/RECONSTRUCTION/idl/pro' + delim + $
        proc_dir + '/RECONSTRUCTION_CHAMBOLLEPOCK/idl/pro' + delim + $
        proc_dir + '/CARDIO/idl/pro' + delim + $
        proc_dir + '/FILEIO/idl/pro' + delim + $
        proc_dir + '/FILEIO_GE/idl/pro' + delim + $
        proc_dir + '/MODELLING/idl/pro' + delim + $
        proc_dir + '/REGISTRATION/idl/pro' + delim + $
        proc_dir + '/HERMES/idl/pro' + delim + $
        proc_dir + '/DOSIMETRY/idl/pro' + delim + $
        proc_dir + '/ONCO/idl/pro' + delim + $
        proc_dir + '/HDF/idl/pro' + delim + $
        proc_dir + '/MATTHEW/idl_code/lin/recon' + delim + $
        proc_dir + '/MATTHEW/idl_code/lin/c_files/idl/pro' + delim + $
        proc_dir + '/MATTHEW/c_code/idl/pro' + delim + $
        proc_dir + '/MATTHEW/idl_code/general' + delim + $
;        proc_dir + '/idl/neuro/pro' + delim + $
;        proc_dir + '/trionix/idl/pro' + delim + $
;        proc_dir + '/STUDIES/idl/pro' + delim + $
;        proc_dir + '/HRPLUSTOOLS/idl/pro' + delim + $
;        proc_dir + '/MAPS10000/idl/pro' + delim + $
        !path

NIcommonvars, proc_dir = proc_dir


if 0 then begin &$
  print, 'pseudocolor' &$
  pref_set, 'IDL_GR_X_VISUAL',  4, $ ;4=pseudocolor, 5 = true color
            'IDL_GR_X_DEPTH', 8, 'IDL_GR_X_COLORS', 256, /commit &$
endif else begin &$
  print, 'truecolor' &$
  pref_set, 'IDL_GR_X_VISUAL',  5, 'IDL_GR_X_DEPTH', 24, /commit &$
  device, decomposed = 1 &$
endelse
niset_ct, ta = 0, /kul

max_cpu = getenv('NHOSTS')
;== NHOSTS is not set on control node, no multithreading there
if max_cpu EQ '' then max_cpu = '1'
cpu, tpool_nthreads = fix(max_cpu)
setenv, 'CPU_MAX_COMPUTE_UNITS=' + max_cpu

device, retain = 2