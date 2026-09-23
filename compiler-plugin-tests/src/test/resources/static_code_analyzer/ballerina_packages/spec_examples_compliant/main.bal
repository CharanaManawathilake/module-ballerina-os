// Copyright (c) 2025 WSO2 LLC. (http://www.wso2.org)
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

// The compliant examples from section 5 of docs/spec/spec.md, written exactly as the spec shows them

import ballerina/os;

// 5.1 - ballerina/os:1
public function listDirectory(string userInput) returns os:Process|error {
    if !["reports", "archive"].some(directory => directory == userInput) {
        return error("unknown directory");
    }
    return check os:exec({value: "/bin/ls", arguments: [userInput]});
}

// 5.2 - ballerina/os:2
public function configure(string userInput) returns os:Error? {
    if !["production", "staging"].some(mode => mode == userInput) {
        return error("unknown mode");
    }
    check os:setEnv("APP_MODE", userInput);
}

// 5.3 - ballerina/os:3
public function countFiles() returns os:Process|error {
    return check os:exec({value: "/bin/ls", arguments: ["/var/data"]});
}

// 5.4 - ballerina/os:4
public function status() returns os:Process|error {
    return check os:exec({value: "/usr/bin/git", arguments: ["status"]});
}
