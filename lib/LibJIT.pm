package LibJIT;

use 5.020002;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

our @TYPES = qw(
    jit_type_void
    jit_type_sbyte
    jit_type_ubyte
    jit_type_short
    jit_type_ushort
    jit_type_int
    jit_type_uint
    jit_type_nint
    jit_type_nuint
    jit_type_long
    jit_type_ulong
    jit_type_float32
    jit_type_float64
    jit_type_nfloat
    jit_type_void_ptr
    jit_type_sys_bool
    jit_type_sys_char
    jit_type_sys_schar
    jit_type_sys_uchar
    jit_type_sys_short
    jit_type_sys_ushort
    jit_type_sys_int
    jit_type_sys_uint
    jit_type_sys_long
    jit_type_sys_ulong
    jit_type_sys_longlong
    jit_type_sys_ulonglong
    jit_type_sys_float
    jit_type_sys_double
    jit_type_sys_long_double
);

our %EXPORT_TAGS = (
    'all' => [
        qw(
            JIT_PROT_EXEC_READ
            JIT_PROT_EXEC_READ_WRITE
            JIT_PROT_NONE
            JIT_PROT_READ
            JIT_PROT_READ_WRITE
            jit_abi_cdecl
            jit_abi_fastcall
            jit_abi_stdcall
            jit_abi_vararg
            jit_label_undefined
            _jit_get_frame_address
            _jit_get_next_frame_address
            _jit_get_return_address
            jit_apply
            jit_apply_raw
            jit_block_current_is_dead
            jit_block_ends_in_dead
            jit_block_free_meta
            jit_block_from_label
            jit_block_get_context
            jit_block_get_function
            jit_block_get_label
            jit_block_get_meta
            jit_block_get_next_label
            jit_block_is_reachable
            jit_block_next
            jit_block_previous
            jit_block_set_meta
            jit_calloc
            jit_closure_create
            jit_closure_va_get_float32
            jit_closure_va_get_float64
            jit_closure_va_get_long
            jit_closure_va_get_nfloat
            jit_closure_va_get_nint
            jit_closure_va_get_nuint
            jit_closure_va_get_ptr
            jit_closure_va_get_struct
            jit_closure_va_get_ulong
            jit_constant_convert
            jit_context_build_end
            jit_context_build_start
            jit_context_create
            jit_context_destroy
            jit_context_free_meta
            jit_context_get_meta
            jit_context_get_meta_numeric
            jit_context_set_memory_manager
            jit_context_set_meta
            jit_context_set_meta_numeric
            jit_context_set_on_demand_driver
            jit_debugger_add_breakpoint
            jit_debugger_attach_self
            jit_debugger_break
            jit_debugger_create
            jit_debugger_destroy
            jit_debugger_detach_self
            jit_debugger_finish
            jit_debugger_from_context
            jit_debugger_get_context
            jit_debugger_get_native_thread
            jit_debugger_get_self
            jit_debugger_get_thread
            jit_debugger_is_alive
            jit_debugger_is_running
            jit_debugger_next
            jit_debugger_quit
            jit_debugger_remove_all_breakpoints
            jit_debugger_remove_breakpoint
            jit_debugger_run
            jit_debugger_set_breakable
            jit_debugger_set_hook
            jit_debugger_step
            jit_debugger_wait_event
            jit_debugging_possible
            jit_default_memory_manager
            jit_exception_builtin
            jit_exception_clear_last
            jit_exception_get_handler
            jit_exception_get_last
            jit_exception_get_last_and_clear
            jit_exception_get_stack_trace
            jit_exception_set_handler
            jit_exception_set_last
            jit_exception_throw
            jit_float32_abs
            jit_float32_acos
            jit_float32_add
            jit_float32_asin
            jit_float32_atan
            jit_float32_atan2
            jit_float32_ceil
            jit_float32_cmpg
            jit_float32_cmpl
            jit_float32_cos
            jit_float32_cosh
            jit_float32_div
            jit_float32_eq
            jit_float32_exp
            jit_float32_floor
            jit_float32_ge
            jit_float32_gt
            jit_float32_ieee_rem
            jit_float32_is_finite
            jit_float32_is_inf
            jit_float32_is_nan
            jit_float32_le
            jit_float32_log
            jit_float32_log10
            jit_float32_lt
            jit_float32_max
            jit_float32_min
            jit_float32_mul
            jit_float32_ne
            jit_float32_neg
            jit_float32_pow
            jit_float32_rem
            jit_float32_rint
            jit_float32_round
            jit_float32_sign
            jit_float32_sin
            jit_float32_sinh
            jit_float32_sqrt
            jit_float32_sub
            jit_float32_tan
            jit_float32_tanh
            jit_float32_to_float64
            jit_float32_to_int
            jit_float32_to_int_ovf
            jit_float32_to_long
            jit_float32_to_long_ovf
            jit_float32_to_nfloat
            jit_float32_to_uint
            jit_float32_to_uint_ovf
            jit_float32_to_ulong
            jit_float32_to_ulong_ovf
            jit_float32_trunc
            jit_float64_abs
            jit_float64_acos
            jit_float64_add
            jit_float64_asin
            jit_float64_atan
            jit_float64_atan2
            jit_float64_ceil
            jit_float64_cmpg
            jit_float64_cmpl
            jit_float64_cos
            jit_float64_cosh
            jit_float64_div
            jit_float64_eq
            jit_float64_exp
            jit_float64_floor
            jit_float64_ge
            jit_float64_gt
            jit_float64_ieee_rem
            jit_float64_is_finite
            jit_float64_is_inf
            jit_float64_is_nan
            jit_float64_le
            jit_float64_log
            jit_float64_log10
            jit_float64_lt
            jit_float64_max
            jit_float64_min
            jit_float64_mul
            jit_float64_ne
            jit_float64_neg
            jit_float64_pow
            jit_float64_rem
            jit_float64_rint
            jit_float64_round
            jit_float64_sign
            jit_float64_sin
            jit_float64_sinh
            jit_float64_sqrt
            jit_float64_sub
            jit_float64_tan
            jit_float64_tanh
            jit_float64_to_float32
            jit_float64_to_int
            jit_float64_to_int_ovf
            jit_float64_to_long
            jit_float64_to_long_ovf
            jit_float64_to_nfloat
            jit_float64_to_uint
            jit_float64_to_uint_ovf
            jit_float64_to_ulong
            jit_float64_to_ulong_ovf
            jit_float64_trunc
            jit_frame_contains_crawl_mark
            jit_free
            jit_function_abandon
            jit_function_apply
            jit_function_apply_vararg
            jit_function_clear_recompilable
            jit_function_compile
            jit_function_compile_entry
            jit_function_create
            jit_function_create_nested
            jit_function_free_meta
            jit_function_from_closure
            jit_function_from_pc
            jit_function_from_vtable_pointer
            jit_function_get_context
            jit_function_get_current
            jit_function_get_entry
            jit_function_get_max_optimization_level
            jit_function_get_meta
            jit_function_get_nested_parent
            jit_function_get_on_demand_compiler
            jit_function_get_optimization_level
            jit_function_get_signature
            jit_function_is_compiled
            jit_function_is_recompilable
            jit_function_labels_equal
            jit_function_next
            jit_function_previous
            jit_function_reserve_label
            jit_function_set_meta
            jit_function_set_on_demand_compiler
            jit_function_set_optimization_level
            jit_function_set_recompilable
            jit_function_setup_entry
            jit_function_to_closure
            jit_function_to_vtable_pointer
            jit_get_closure_alignment
            jit_get_closure_size
            jit_get_trampoline_alignment
            jit_get_trampoline_size
            jit_init
            jit_insn_abs
            jit_insn_acos
            jit_insn_add
            jit_insn_add_ovf
            jit_insn_add_relative
            jit_insn_address_of
            jit_insn_address_of_label
            jit_insn_alloca
            jit_insn_and
            jit_insn_asin
            jit_insn_atan
            jit_insn_atan2
            jit_insn_branch
            jit_insn_branch_if
            jit_insn_branch_if_not
            jit_insn_branch_if_pc_not_in_range
            jit_insn_call
            jit_insn_call_filter
            jit_insn_call_finally
            jit_insn_call_indirect
            jit_insn_call_indirect_vtable
            jit_insn_call_intrinsic
            jit_insn_call_native
            jit_insn_ceil
            jit_insn_check_null
            jit_insn_cmpg
            jit_insn_cmpl
            jit_insn_convert
            jit_insn_cos
            jit_insn_cosh
            jit_insn_default_return
            jit_insn_defer_pop_stack
            jit_insn_dest_is_value
            jit_insn_div
            jit_insn_dup
            jit_insn_eq
            jit_insn_exp
            jit_insn_floor
            jit_insn_flush_defer_pop
            jit_insn_flush_struct
            jit_insn_ge
            jit_insn_get_call_stack
            jit_insn_get_dest
            jit_insn_get_function
            jit_insn_get_label
            jit_insn_get_name
            jit_insn_get_native
            jit_insn_get_opcode
            jit_insn_get_signature
            jit_insn_get_value1
            jit_insn_get_value2
            jit_insn_gt
            jit_insn_import
            jit_insn_incoming_frame_posn
            jit_insn_incoming_reg
            jit_insn_is_finite
            jit_insn_is_inf
            jit_insn_is_nan
            jit_insn_iter_init
            jit_insn_iter_init_last
            jit_insn_iter_next
            jit_insn_iter_previous
            jit_insn_jump_table
            jit_insn_label
            jit_insn_le
            jit_insn_load
            jit_insn_load_elem
            jit_insn_load_elem_address
            jit_insn_load_relative
            jit_insn_load_small
            jit_insn_log
            jit_insn_log10
            jit_insn_lt
            jit_insn_mark_breakpoint
            jit_insn_mark_breakpoint_variable
            jit_insn_mark_offset
            jit_insn_max
            jit_insn_memcpy
            jit_insn_memmove
            jit_insn_memset
            jit_insn_min
            jit_insn_move_blocks_to_end
            jit_insn_move_blocks_to_start
            jit_insn_mul
            jit_insn_mul_ovf
            jit_insn_ne
            jit_insn_neg
            jit_insn_new_block
            jit_insn_not
            jit_insn_or
            jit_insn_outgoing_frame_posn
            jit_insn_outgoing_reg
            jit_insn_pop_stack
            jit_insn_pow
            jit_insn_push
            jit_insn_push_ptr
            jit_insn_push_return_area_ptr
            jit_insn_rem
            jit_insn_rem_ieee
            jit_insn_rethrow_unhandled
            jit_insn_return
            jit_insn_return_from_filter
            jit_insn_return_from_finally
            jit_insn_return_ptr
            jit_insn_return_reg
            jit_insn_rint
            jit_insn_round
            jit_insn_set_param
            jit_insn_set_param_ptr
            jit_insn_setup_for_nested
            jit_insn_shl
            jit_insn_shr
            jit_insn_sign
            jit_insn_sin
            jit_insn_sinh
            jit_insn_sqrt
            jit_insn_sshr
            jit_insn_start_catcher
            jit_insn_start_filter
            jit_insn_start_finally
            jit_insn_store
            jit_insn_store_elem
            jit_insn_store_relative
            jit_insn_sub
            jit_insn_sub_ovf
            jit_insn_tan
            jit_insn_tanh
            jit_insn_throw
            jit_insn_thrown_exception
            jit_insn_to_bool
            jit_insn_to_not_bool
            jit_insn_trunc
            jit_insn_uses_catcher
            jit_insn_ushr
            jit_insn_xor
            jit_int_abs
            jit_int_add
            jit_int_add_ovf
            jit_int_and
            jit_int_cmp
            jit_int_div
            jit_int_eq
            jit_int_ge
            jit_int_gt
            jit_int_le
            jit_int_lt
            jit_int_max
            jit_int_min
            jit_int_mul
            jit_int_mul_ovf
            jit_int_ne
            jit_int_neg
            jit_int_not
            jit_int_or
            jit_int_rem
            jit_int_shl
            jit_int_shr
            jit_int_sign
            jit_int_sub
            jit_int_sub_ovf
            jit_int_to_float32
            jit_int_to_float64
            jit_int_to_int
            jit_int_to_int_ovf
            jit_int_to_long
            jit_int_to_long_ovf
            jit_int_to_nfloat
            jit_int_to_sbyte
            jit_int_to_sbyte_ovf
            jit_int_to_short
            jit_int_to_short_ovf
            jit_int_to_ubyte
            jit_int_to_ubyte_ovf
            jit_int_to_uint
            jit_int_to_uint_ovf
            jit_int_to_ulong
            jit_int_to_ulong_ovf
            jit_int_to_ushort
            jit_int_to_ushort_ovf
            jit_int_xor
            jit_long_abs
            jit_long_add
            jit_long_add_ovf
            jit_long_and
            jit_long_cmp
            jit_long_div
            jit_long_eq
            jit_long_ge
            jit_long_gt
            jit_long_le
            jit_long_lt
            jit_long_max
            jit_long_min
            jit_long_mul
            jit_long_mul_ovf
            jit_long_ne
            jit_long_neg
            jit_long_not
            jit_long_or
            jit_long_rem
            jit_long_shl
            jit_long_shr
            jit_long_sign
            jit_long_sub
            jit_long_sub_ovf
            jit_long_to_float32
            jit_long_to_float64
            jit_long_to_int
            jit_long_to_int_ovf
            jit_long_to_long
            jit_long_to_long_ovf
            jit_long_to_nfloat
            jit_long_to_uint
            jit_long_to_uint_ovf
            jit_long_to_ulong
            jit_long_to_ulong_ovf
            jit_long_xor
            jit_malloc
            jit_memchr
            jit_memcmp
            jit_memcpy
            jit_memmove
            jit_memset
            jit_meta_destroy
            jit_meta_free
            jit_meta_get
            jit_meta_set
            jit_nfloat_abs
            jit_nfloat_acos
            jit_nfloat_add
            jit_nfloat_asin
            jit_nfloat_atan
            jit_nfloat_atan2
            jit_nfloat_ceil
            jit_nfloat_cmpg
            jit_nfloat_cmpl
            jit_nfloat_cos
            jit_nfloat_cosh
            jit_nfloat_div
            jit_nfloat_eq
            jit_nfloat_exp
            jit_nfloat_floor
            jit_nfloat_ge
            jit_nfloat_gt
            jit_nfloat_ieee_rem
            jit_nfloat_is_finite
            jit_nfloat_is_inf
            jit_nfloat_is_nan
            jit_nfloat_le
            jit_nfloat_log
            jit_nfloat_log10
            jit_nfloat_lt
            jit_nfloat_max
            jit_nfloat_min
            jit_nfloat_mul
            jit_nfloat_ne
            jit_nfloat_neg
            jit_nfloat_pow
            jit_nfloat_rem
            jit_nfloat_rint
            jit_nfloat_round
            jit_nfloat_sign
            jit_nfloat_sin
            jit_nfloat_sinh
            jit_nfloat_sqrt
            jit_nfloat_sub
            jit_nfloat_tan
            jit_nfloat_tanh
            jit_nfloat_to_float32
            jit_nfloat_to_float64
            jit_nfloat_to_int
            jit_nfloat_to_int_ovf
            jit_nfloat_to_long
            jit_nfloat_to_long_ovf
            jit_nfloat_to_uint
            jit_nfloat_to_uint_ovf
            jit_nfloat_to_ulong
            jit_nfloat_to_ulong_ovf
            jit_nfloat_trunc
            jit_raw_supported
            jit_readelf_add_to_context
            jit_readelf_close
            jit_readelf_get_name
            jit_readelf_get_needed
            jit_readelf_get_section
            jit_readelf_get_section_by_type
            jit_readelf_get_symbol
            jit_readelf_map_vaddr
            jit_readelf_num_needed
            jit_readelf_open
            jit_readelf_register_symbol
            jit_readelf_resolve_all
            jit_realloc
            jit_snprintf
            jit_sprintf
            jit_stack_trace_free
            jit_stack_trace_get_function
            jit_stack_trace_get_offset
            jit_stack_trace_get_pc
            jit_stack_trace_get_size
            jit_strcat
            jit_strchr
            jit_strcmp
            jit_strcpy
            jit_strdup
            jit_stricmp
            jit_strlen
            jit_strncmp
            jit_strncpy
            jit_strndup
            jit_strnicmp
            jit_strrchr
            jit_supports_closures
            jit_supports_threads
            jit_supports_virtual_memory
            jit_type_best_alignment
            jit_type_copy
            jit_type_create_pointer
            jit_type_create_signature
            jit_type_create_struct
            jit_type_create_tagged
            jit_type_create_union
            jit_type_find_name
            jit_type_free
            jit_type_get_abi
            jit_type_get_alignment
            jit_type_get_field
            jit_type_get_kind
            jit_type_get_name
            jit_type_get_offset
            jit_type_get_param
            jit_type_get_ref
            jit_type_get_return
            jit_type_get_size
            jit_type_get_tagged_data
            jit_type_get_tagged_kind
            jit_type_get_tagged_type
            jit_type_has_tag
            jit_type_is_pointer
            jit_type_is_primitive
            jit_type_is_signature
            jit_type_is_struct
            jit_type_is_tagged
            jit_type_is_union
            jit_type_normalize
            jit_type_num_fields
            jit_type_num_params
            jit_type_promote_int
            jit_type_remove_tags
            jit_type_return_via_pointer
            jit_type_set_names
            jit_type_set_offset
            jit_type_set_size_and_alignment
            jit_type_set_tagged_data
            jit_type_set_tagged_type
            jit_uint_add
            jit_uint_add_ovf
            jit_uint_and
            jit_uint_cmp
            jit_uint_div
            jit_uint_eq
            jit_uint_ge
            jit_uint_gt
            jit_uint_le
            jit_uint_lt
            jit_uint_max
            jit_uint_min
            jit_uint_mul
            jit_uint_mul_ovf
            jit_uint_ne
            jit_uint_neg
            jit_uint_not
            jit_uint_or
            jit_uint_rem
            jit_uint_shl
            jit_uint_shr
            jit_uint_sub
            jit_uint_sub_ovf
            jit_uint_to_float32
            jit_uint_to_float64
            jit_uint_to_int
            jit_uint_to_int_ovf
            jit_uint_to_long
            jit_uint_to_long_ovf
            jit_uint_to_nfloat
            jit_uint_to_uint
            jit_uint_to_uint_ovf
            jit_uint_to_ulong
            jit_uint_to_ulong_ovf
            jit_uint_xor
            jit_ulong_add
            jit_ulong_add_ovf
            jit_ulong_and
            jit_ulong_cmp
            jit_ulong_div
            jit_ulong_eq
            jit_ulong_ge
            jit_ulong_gt
            jit_ulong_le
            jit_ulong_lt
            jit_ulong_max
            jit_ulong_min
            jit_ulong_mul
            jit_ulong_mul_ovf
            jit_ulong_ne
            jit_ulong_neg
            jit_ulong_not
            jit_ulong_or
            jit_ulong_rem
            jit_ulong_shl
            jit_ulong_shr
            jit_ulong_sub
            jit_ulong_sub_ovf
            jit_ulong_to_float32
            jit_ulong_to_float64
            jit_ulong_to_int
            jit_ulong_to_int_ovf
            jit_ulong_to_long
            jit_ulong_to_long_ovf
            jit_ulong_to_nfloat
            jit_ulong_to_uint
            jit_ulong_to_uint_ovf
            jit_ulong_to_ulong
            jit_ulong_to_ulong_ovf
            jit_ulong_xor
            jit_unwind_free
            jit_unwind_get_function
            jit_unwind_get_offset
            jit_unwind_get_pc
            jit_unwind_init
            jit_unwind_jump
            jit_unwind_next
            jit_unwind_next_pc
            jit_uses_interpreter
            jit_value_create
            jit_value_create_constant
            jit_value_create_float32_constant
            jit_value_create_float64_constant
            jit_value_create_long_constant
            jit_value_create_nfloat_constant
            jit_value_create_nint_constant
            jit_value_get_block
            jit_value_get_constant
            jit_value_get_context
            jit_value_get_float32_constant
            jit_value_get_float64_constant
            jit_value_get_function
            jit_value_get_long_constant
            jit_value_get_nfloat_constant
            jit_value_get_nint_constant
            jit_value_get_param
            jit_value_get_struct_pointer
            jit_value_get_type
            jit_value_is_addressable
            jit_value_is_constant
            jit_value_is_local
            jit_value_is_parameter
            jit_value_is_temporary
            jit_value_is_true
            jit_value_is_volatile
            jit_value_ref
            jit_value_set_addressable
            jit_value_set_volatile
            jit_vmem_commit
            jit_vmem_decommit
            jit_vmem_init
            jit_vmem_page_size
            jit_vmem_protect
            jit_vmem_release
            jit_vmem_reserve
            jit_vmem_reserve_committed
            jit_vmem_round_down
            jit_vmem_round_up
            jit_writeelf_add_function
            jit_writeelf_add_needed
            jit_writeelf_create
            jit_writeelf_destroy
            jit_writeelf_write
            jit_writeelf_write_section
            jitom_class_add_ref
            jitom_class_delete
            jitom_class_get_all_supers
            jitom_class_get_fields
            jitom_class_get_interfaces
            jitom_class_get_methods
            jitom_class_get_modifiers
            jitom_class_get_name
            jitom_class_get_primary_super
            jitom_class_get_type
            jitom_class_get_value_type
            jitom_class_new
            jitom_class_new_value
            jitom_destroy_model
            jitom_field_get_modifiers
            jitom_field_get_name
            jitom_field_get_type
            jitom_field_load
            jitom_field_load_address
            jitom_field_store
            jitom_get_class_by_name
            jitom_method_get_modifiers
            jitom_method_get_name
            jitom_method_get_type
            jitom_method_invoke
            jitom_method_invoke_virtual
            jitom_type_get_class
            jitom_type_get_model
            jitom_type_is_class
            jitom_type_is_value
            jitom_type_tag_as_class
            jitom_type_tag_as_value
            jit_dump_type
            jit_dump_value
            jit_dump_insn
            jit_dump_function
        ), @TYPES
    ]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = '0.03';

sub AUTOLOAD {
    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&LibJIT::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
        no strict 'refs';
        *$AUTOLOAD = sub { $val };
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('LibJIT', $VERSION);

1;
__END__

=head1 NAME

LibJIT - Perl bindings for GNU LibJIT

=head1 SYNOPSIS

    use LibJIT qw/:all/;

    my $ctx = jit_context_create;
    jit_context_build_start $ctx;

    my $sig = jit_type_create_signature jit_abi_cdecl, jit_type_nint, [ jit_type_nint, jit_type_nint ], 1;
    my $fun = jit_function_create $ctx, $sig;

    my ($i, $j) = map jit_value_get_param($fun, $_), 0 .. 1;

    my $prod = jit_insn_mul $fun, $i, $j;
    jit_insn_return $fun, $prod;

    jit_function_compile $fun;
    jit_context_build_end $ctx;

=head1 DESCRIPTION

As straightforward as bindings can be - for every function and constant defined
by the C library a Perl subroutine is exported.

Where C function takes two arguments, a pointer and number of elements, Perl
function would take a single array reference instead. This should be
straightforward in most cases, except, probably, C<jit_function_apply>.

In C, C<jit_function_apply> has this signature (see LibJIT documentation for
description of each argument):
    
    int jit_function_apply (jit_function_t func, void **args, void *return_area)

In Perl, C<args> is represented as a reference to an array of strings, where
each string contains binary representation of the argument, as produced by
C<pack>. C<return_area> should be a scalar variable, when C<jit_function_apply>
returns it will be set to the binary representation of the return value, that
can be decoded with C<unpack>.

L<FFI::Raw> in combination with C<jit_function_to_closure> can be a cleaner way
to call compiled functions.

=head1 SEE MORE

GNU LibJIT home page and documentation: L<https://www.gnu.org/software/libjit/>.

=head1 AUTHOR

Vickenty Fesunov, E<lt>cpan+libjit@setattr.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Vickenty Fesunov.

The library is distributed under the terms of the GNU Lesser General
Public License.  See the LICENSE file for details.

=cut
