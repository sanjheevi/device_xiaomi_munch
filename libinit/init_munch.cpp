/*
   Copyright (c) 2015, The Linux Foundation. All rights reserved.
   Copyright (C) 2016 The CyanogenMod Project.
   Copyright (C) 2019-2020 The LineageOS Project.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <fstream>
#include <unistd.h>
#include <vector>

#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;

void property_override(char const prop[], char const value[], bool add = true) {
    prop_info *pi;

    pi = (prop_info *)__system_property_find(prop);
    if (pi) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void load_munchglobal() {
    property_override("ro.product.vendor.brand", "Redmi");
    property_override("ro.product.vendor.marketname", "POCO F4");
    property_override("ro.product.model", "22021211RG");
    property_override("ro.build.product", "munch");
    property_override("ro.product.device", "munch");
    property_override("ro.build.fingerprint", "POCO/munch_global/munch:12/RKQ1.211001.001/V13.0.4.0.SLMINXM:user/release-keys");
}

void load_munchin() {
    property_override("ro.product.vendor.brand", "POCO");
    property_override("ro.product.vendor.marketname", "POCO F4");
    property_override("ro.product.model", "22021211RI");
    property_override("ro.build.product", "munch");
    property_override("ro.product.device", "munch");
    property_override("ro.build.fingerprint", "POCO/munch_in/munch:12/RKQ1.211001.001/V13.0.4.0.SLMINXM:user/release-keys");
}

void load_munch() {
    property_override("ro.product.vendor.brand", "Redmi");
    property_override("ro.product.vendor.marketname", "Redmi K40S");
    property_override("ro.product.model", "22021211RC");
    property_override("ro.build.product", "munch");
    property_override("ro.product.device", "munch");
    property_override("ro.build.fingerprint", "Redmi/munch/munch:12/RKQ1.211001.001/V13.0.4.0.SLMINXM:user/release-keys");
}


void vendor_load_properties() {
    std::string region = android::base::GetProperty("ro.boot.hwc", "");

    if (region.find("INDIA") != std::string::npos) {
        load_munchin();
    } else if (region.find("GLOBAL") != std::string::npos) {
        load_munchglobal();
    } else {
      load_munch();
    }
}
