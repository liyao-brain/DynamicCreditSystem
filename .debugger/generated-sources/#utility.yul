{

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_tuple_t_uint256_t_uint256_t_uint256__to_t_uint256_t_uint256_t_uint256__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

    }

    function identity(value) -> ret {
        ret := value
    }

    function convert_t_uint160_to_t_uint160(value) -> converted {
        converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
    }

    function convert_t_uint160_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_uint160(value)
    }

    function convert_t_contract$_TestToken_$1207_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_address(value)
    }

    function abi_encode_t_contract$_TestToken_$1207_to_t_address_fromStack(value, pos) {
        mstore(pos, convert_t_contract$_TestToken_$1207_to_t_address(value))
    }

    function abi_encode_tuple_t_contract$_TestToken_$1207__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_contract$_TestToken_$1207_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function store_literal_in_memory_a08d66f010282343c63a2adfb2fb2eae7af36c2d0e7cd9b2008665789fb65b40(memPtr) {

        mstore(add(memPtr, 0), "User already registered")

    }

    function abi_encode_t_stringliteral_a08d66f010282343c63a2adfb2fb2eae7af36c2d0e7cd9b2008665789fb65b40_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 23)
        store_literal_in_memory_a08d66f010282343c63a2adfb2fb2eae7af36c2d0e7cd9b2008665789fb65b40(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_a08d66f010282343c63a2adfb2fb2eae7af36c2d0e7cd9b2008665789fb65b40__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_a08d66f010282343c63a2adfb2fb2eae7af36c2d0e7cd9b2008665789fb65b40_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_7407ae7c87c72ed4ff3e96e9a39d169b4f6f4c248ff3f4ac2723be024c6c567b(memPtr) {

        mstore(add(memPtr, 0), "User is not registered")

    }

    function abi_encode_t_stringliteral_7407ae7c87c72ed4ff3e96e9a39d169b4f6f4c248ff3f4ac2723be024c6c567b_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 22)
        store_literal_in_memory_7407ae7c87c72ed4ff3e96e9a39d169b4f6f4c248ff3f4ac2723be024c6c567b(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_7407ae7c87c72ed4ff3e96e9a39d169b4f6f4c248ff3f4ac2723be024c6c567b__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_7407ae7c87c72ed4ff3e96e9a39d169b4f6f4c248ff3f4ac2723be024c6c567b_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_ef044ad6405ef4469010c94dcca80ea659dc907c9a8ef395829b70391f7b72c5(memPtr) {

        mstore(add(memPtr, 0), "Must deposit collateral")

    }

    function abi_encode_t_stringliteral_ef044ad6405ef4469010c94dcca80ea659dc907c9a8ef395829b70391f7b72c5_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 23)
        store_literal_in_memory_ef044ad6405ef4469010c94dcca80ea659dc907c9a8ef395829b70391f7b72c5(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_ef044ad6405ef4469010c94dcca80ea659dc907c9a8ef395829b70391f7b72c5__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_ef044ad6405ef4469010c94dcca80ea659dc907c9a8ef395829b70391f7b72c5_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x11() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x11)
        revert(0, 0x24)
    }

    function checked_add_t_uint256(x, y) -> sum {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        sum := add(x, y)

        if gt(x, sum) { panic_error_0x11() }

    }

    function checked_mul_t_uint256(x, y) -> product {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        let product_raw := mul(x, y)
        product := cleanup_t_uint256(product_raw)

        // overflow, if x != 0 and y != product/x
        if iszero(
            or(
                iszero(x),
                eq(y, div(product, x))
            )
        ) { panic_error_0x11() }

    }

    function panic_error_0x12() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x12)
        revert(0, 0x24)
    }

    function checked_div_t_uint256(x, y) -> r {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        if iszero(y) { panic_error_0x12() }

        r := div(x, y)
    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

    }

    function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

    }

    function store_literal_in_memory_7c964c326b67c843150eed17e017986a1c8b57d452216fbab7a5febdee50bf9b(memPtr) {

        mstore(add(memPtr, 0), "Must repay tokens")

    }

    function abi_encode_t_stringliteral_7c964c326b67c843150eed17e017986a1c8b57d452216fbab7a5febdee50bf9b_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 17)
        store_literal_in_memory_7c964c326b67c843150eed17e017986a1c8b57d452216fbab7a5febdee50bf9b(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_7c964c326b67c843150eed17e017986a1c8b57d452216fbab7a5febdee50bf9b__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_7c964c326b67c843150eed17e017986a1c8b57d452216fbab7a5febdee50bf9b_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_address__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_t_uint256_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function store_literal_in_memory_a7e5e4d46ea524835ea36125140e247d59a2bce707f2094f88605dba8157d192(memPtr) {

        mstore(add(memPtr, 0), "Insufficient token balance")

    }

    function abi_encode_t_stringliteral_a7e5e4d46ea524835ea36125140e247d59a2bce707f2094f88605dba8157d192_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 26)
        store_literal_in_memory_a7e5e4d46ea524835ea36125140e247d59a2bce707f2094f88605dba8157d192(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_a7e5e4d46ea524835ea36125140e247d59a2bce707f2094f88605dba8157d192__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_a7e5e4d46ea524835ea36125140e247d59a2bce707f2094f88605dba8157d192_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_56841c6d3d30f61ef74f3a60dafc3727decd398cb94afe927bdc7f31b14ee531(memPtr) {

        mstore(add(memPtr, 0), "Repayment exceeds loan balance")

    }

    function abi_encode_t_stringliteral_56841c6d3d30f61ef74f3a60dafc3727decd398cb94afe927bdc7f31b14ee531_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 30)
        store_literal_in_memory_56841c6d3d30f61ef74f3a60dafc3727decd398cb94afe927bdc7f31b14ee531(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_56841c6d3d30f61ef74f3a60dafc3727decd398cb94afe927bdc7f31b14ee531__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_56841c6d3d30f61ef74f3a60dafc3727decd398cb94afe927bdc7f31b14ee531_to_t_string_memory_ptr_fromStack( tail)

    }

    function checked_sub_t_uint256(x, y) -> diff {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        diff := sub(x, y)

        if gt(diff, x) { panic_error_0x11() }

    }

    function store_literal_in_memory_ea442b783cbd784fbadccd52f2abfdff95e8d33fc80a928c2a339476425e135f(memPtr) {

        mstore(add(memPtr, 0), "Not enough collateral to return")

    }

    function abi_encode_t_stringliteral_ea442b783cbd784fbadccd52f2abfdff95e8d33fc80a928c2a339476425e135f_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 31)
        store_literal_in_memory_ea442b783cbd784fbadccd52f2abfdff95e8d33fc80a928c2a339476425e135f(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_ea442b783cbd784fbadccd52f2abfdff95e8d33fc80a928c2a339476425e135f__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_ea442b783cbd784fbadccd52f2abfdff95e8d33fc80a928c2a339476425e135f_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function validator_revert_t_bool(value) {
        if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
    }

    function abi_decode_t_bool_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_bool(value)
    }

    function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
        updated_pos := pos
    }

    function store_literal_in_memory_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470(memPtr) {

    }

    function abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, 0)
        store_literal_in_memory_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470(pos)
        end := add(pos, 0)
    }

    function abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack_reversed(pos ) -> end {

        pos := abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack( pos)

        end := pos
    }

    function store_literal_in_memory_c7c2be2f1b63a3793f6e2d447ce95ba2239687186a7fd6b5268a969dcdb42dcd(memPtr) {

        mstore(add(memPtr, 0), "ETH transfer failed")

    }

    function abi_encode_t_stringliteral_c7c2be2f1b63a3793f6e2d447ce95ba2239687186a7fd6b5268a969dcdb42dcd_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 19)
        store_literal_in_memory_c7c2be2f1b63a3793f6e2d447ce95ba2239687186a7fd6b5268a969dcdb42dcd(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_c7c2be2f1b63a3793f6e2d447ce95ba2239687186a7fd6b5268a969dcdb42dcd__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_c7c2be2f1b63a3793f6e2d447ce95ba2239687186a7fd6b5268a969dcdb42dcd_to_t_string_memory_ptr_fromStack( tail)

    }

}
