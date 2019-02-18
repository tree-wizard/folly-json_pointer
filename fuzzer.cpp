#include <folly/json_pointer.h>


extern "C" int LLVMFuzzerTestOneInput(const char *data, size_t Size) {


  folly::json_pointer::parse(data);
        return 0;
}