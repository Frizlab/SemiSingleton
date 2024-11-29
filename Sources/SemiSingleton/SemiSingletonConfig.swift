/*
Copyright 2019 happn

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

import Foundation
#if canImport(OSLog)
import OSLog
#endif

import GlobalConfModule
import Logging



public extension ConfKeys {
	/* SemiSingleton conf namespace declaration. */
	struct SemiSingleton {}
	var semiSingleton: SemiSingleton {SemiSingleton()}
}


extension ConfKeys.SemiSingleton {
	
#if canImport(os)
	#declareConfKey("oslog",  OSLog?         .self, defaultValue: OSLog(subsystem: "me.frizlab.SemiSingleton", category: "Main"))
	#declareConfKey("logger", Logging.Logger?.self, defaultValue: nil)
#else
	#declareConfKey("logger", Logging.Logger?.self, defaultValue: .init(label: "me.frizlab.SemiSingleton"))
#endif

}

extension Conf {
	
#if canImport(os)
	#declareConfAccessor(\.semiSingleton.oslog,  OSLog?         .self)
#endif
	#declareConfAccessor(\.semiSingleton.logger, Logging.Logger?.self)
	
}
