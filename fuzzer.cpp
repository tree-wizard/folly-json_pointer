#include <folly/json_pointer.h>


extern "C" int LLVMFuzzerTestOneInput(const char *data, size_t Size) {

//folly::StringPiece bin1(data, size);
//folly::json_pointer::parse(bin1);
  
  folly::json_pointer::parse(data);
        return 0;
}
