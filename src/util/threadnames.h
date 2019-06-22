// Copyright (c) 2018 The Refnet Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef REFNET_UTIL_THREADNAMES_H
#define REFNET_UTIL_THREADNAMES_H

#include <string>

namespace util {
//! Rename a thread both in terms of an internal (in-memory) name as well
//! as its system thread name.
void ThreadRename(std::string&&);

//! Get the thread's internal (in-memory) name; used e.g. for identification in
//! logging.
const std::string& ThreadGetInternalName();

} // namespace util

#endif // REFNET_UTIL_THREADNAMES_H
