# ImVirt - I'm virtualized?
#
# Authors:
#   Thomas Liske <liske@ibh.de>
#
# Copyright Holder:
#   2009 - 2012 (C) IBH IT-Service GmbH [http://www.ibh.de/]
#
# License:
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this package; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
#

package ImVirt::Utils::dmidecode;

use strict;
use warnings;
use IO::Handle;
use ImVirt::Utils::dmidecode::kernel;
use ImVirt::Utils::dmidecode::pipe;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT = qw(
    dmidecode_string
    dmidecode_type
);

our $VERSION = '0.2';

my $has_kernel = ImVirt::Utils::dmidecode::kernel::available();
my $has_pipe = ImVirt::Utils::dmidecode::pipe::available();

sub dmidecode_string($) {
    return ImVirt::Utils::dmidecode::kernel::dmidecode_string(shift)
	if($has_kernel);

    return ImVirt::Utils::dmidecode::pipe::dmidecode_string(shift)
	if($has_pipe);

    return ();
}
sub dmidecode_type($) {
    return ImVirt::Utils::dmidecode::kernel::dmidecode_type(shift)
	if($has_kernel);

    return ImVirt::Utils::dmidecode::pipe::dmidecode_type(shift)
	if($has_pipe);

    return ();
}

1;
