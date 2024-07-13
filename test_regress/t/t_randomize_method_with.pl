#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2024 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

scenarios(simulator => 1);

if (!$Self->have_solver) {
    skip("No constraint solver installed");
} else {
    compile(
        # Ensure we test captures of static variables
        verilator_flags2 => ["--fno-inline"],
        );

    execute(
        check_finished => 1,
        );
}

ok(1);
1;
