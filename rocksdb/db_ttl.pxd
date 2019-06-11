cimport options
from libc.stdint cimport int32_t
from status cimport Status
from libcpp cimport bool as cpp_bool
from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "rocksdb/utilities/db_ttl.h" namespace "rocksdb":
    cdef cppclass DBWithTTL:

        void SetTtl(
            int32_t
            ) nogil except+

        void SetTtl_ColumnFamilies(
            ColumnFamilyHandle*,
            int32_t
            ) nogil except+
        
        Status CreateColumnFamilyWithTtl(
            const options.Options&,
            const string&,
            ColumnFamilyHandle*,
            int
        ) nogil except+

    cdef Status DB_Open "rocksdb::DBWithTTL::Open"(
        const options.Options&,
        const string&,
        DBWithTTL**,
        int32_t,
        cpp_bool) nogil except+

    cdef Status DB_Open_ColumnFamilies "rocksdb::DBWithTTL::Open"(
        const options.Options&,
        const string&,
        const vector[ColumnFamilyDescriptor]&,
        vector[ColumnFamilyHandle*]*,
        DB**
        vector[int32_t],
        cpp_bool) nogil except+
