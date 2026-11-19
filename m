Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106819;
	b=iTjsiv3RRYltxhM/qoi0XJTalc7Q+HIQtEXbgLt3+GLlbebFX4payQAvhmdZDewnOR5o
	 TbKzzCkWP8zTTRMKBNEAiAub2kQ5U1mFFh0d8OZEVShHfb/wcsLZzuva+ae1e2foPDWSx
	 pdgvw6vctJamngVeLOUxpgBFJ9SEEv0VHZK897D5qkCHKd0ERmcFrJoHOPCc+CYPwOyvx
	 NBTjHeOz1HZClN/GKrRsZWxwNZEF6kffcHniUX/FgT1bW3u1WkSsAZjQeGwwV083QNxwI
	 j/u07AhY3MsY2mdXh06V7coBrGaQlOvpV2g7DbH97v+Yjwb4bqiBP8Maqg5lYMBR+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106819;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=yHrH5cW1e8t7twuY25htjr7F4bM9IB20sjELRKHQ4Oo=;
	b=Poxd4/sr0KJ6BqQ2sqFh4cuveFLdq3w8OKgpiaUQC03HMjt+WFRIy6cDA0qHvFrUExCU
	 ve80AeM4tAVvcCPviIg3Y+0MDg+nQcjXa4nI+4+poZKM6di4t0Vmp3sDanyfOFlA90kV8
	 jR7jgm6MSIlpXLTjCLbTQ7IHkfnVvgATLWsZVxqI7HhFh1bEOhvtitNtnS1iiH2qtRL3E
	 uco+vsreIizaQuo3HWUTozF51AOQf8T8wdYE+2BWhoNGIPY/hKM7ZIbz/XU+Y8FeK+zNn
	 DdLWCW57pdAZQ27z6dp9s5wJARfaTwESLiTwq1CILnGjJAlCJs+IvzRMr4Ig+bs6pSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePoS6w7C;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EAC60A2603
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59EAC60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePoS6w7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106819; x=1826642819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ou1CMQn4ZCf0WrrRe2E0magmyzy11KAqHw5DgMHEPQ=;
  b=ePoS6w7C378DhqKbqMCNhg2oEQNfOVI96HWUO+m2/tkHtlROpfeyUZwC
   GM1Zygujbs6ebKeHDhVOCZwfuLFefRVxvhnKPTUtCaRS+jkyBB44E+xv9
   Ympj3smqbHpMmHo247M/C5Py7nj0zpI2GTNDbxW8Qr8YrmnsriTQpw8U1
   Td47Alan/aALBgAvtabP7B+PH1RNOUtsH4BZmCarlk/7NET3z09l358qc
   a2GF5ovc0bojm80igoGQ2u6jF4sxW0R3OR046SR1mssgMcZyrOy/aUalu
   DaBSDrrpvDycNftr1TwromcFIb2N1HiTOsAxNStzixvUs5eC80RruT+uM
   g==;
X-CSE-ConnectionGUID: ndjrMQkUTNm571BhivdpqQ==
X-CSE-MsgGUID: RpUglzoRRsmGbh1LQAJGIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991137"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:46:58 -0800
X-CSE-ConnectionGUID: QH8w2j2uQeKIubHf4up2PQ==
X-CSE-MsgGUID: IF4abJMHTwGApy3NT1YxzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843372"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:46:56 -0800
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	stfomichev@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tushar.vyavahare@intel.com,
	kerneljasonxing@gmail.com,
	bjorn@kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH v5 net-next 06/13] selftests: xsk: run one test case per xskxceiver invocation
Date: Thu, 19 Nov 2026 17:46:29 +0100
Message-Id: <20261119164636.1071385-7-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Run one test case in one mode per xskxceiver invocation, so that every
case starts from a fresh process and a crash fails only its own case. A
single case is also the unit that the next patch splits into RX and TX
processes.

xskxceiver now requires -m and -t, runs exactly that case, reports one
KTAP result and exits with its verdict. An unsupported mode skips the
case instead of exiting with XFAIL.

test_xsk.sh runs all cases in one xskxceiver invocation, which no
longer works, so remove it and its xsk_prereqs.sh, along with the
MAINTAINERS pattern that covers both. drivers/net/xsk.py, added later
in this series, runs the cases from then on. As test_xsk.sh is in
TEST_PROGS_EXTENDED, which run_tests does not run, the default run
loses no test in between. Point the comments that name test_xsk.sh to
drivers/net/xsk.py.

Drop the xskxceiver.c note on enabling packet dumps with -D in
test_xsk.sh; xskxceiver has no such option and dumps packets on
validation errors.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 MAINTAINERS                                   |   1 -
 tools/testing/selftests/net/Makefile          |   2 -
 tools/testing/selftests/net/lib/Makefile      |   2 +-
 .../selftests/net/lib/xsk/xskxceiver.c        |  63 ++---
 tools/testing/selftests/net/test_xsk.sh       | 230 ------------------
 tools/testing/selftests/net/xsk_prereqs.sh    |  86 -------
 6 files changed, 23 insertions(+), 361 deletions(-)
 delete mode 100755 tools/testing/selftests/net/test_xsk.sh
 delete mode 100755 tools/testing/selftests/net/xsk_prereqs.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c4be..186554e49410 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30568,7 +30568,6 @@ F:	include/net/xsk_buff_pool.h
 F:	include/uapi/linux/if_xdp.h
 F:	include/uapi/linux/xdp_diag.h
 F:	net/xdp/
-F:	tools/testing/selftests/net/*xsk*
 F:	tools/testing/selftests/net/lib/xsk/
 
 XEN BLOCK SUBSYSTEM
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index c80dabbcc907..71b0c028e893 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -142,7 +142,6 @@ TEST_PROGS := \
 # end of TEST_PROGS
 
 TEST_PROGS_EXTENDED := \
-	test_xsk.sh \
 	xfrm_policy_add_speed.sh \
 # end of TEST_PROGS_EXTENDED
 
@@ -215,7 +214,6 @@ TEST_FILES := \
 	in_netns.sh \
 	lib.sh \
 	settings \
-	xsk_prereqs.sh \
 # end of TEST_FILES
 
 # YNL files, must be before "include ..lib.mk"
diff --git a/tools/testing/selftests/net/lib/Makefile b/tools/testing/selftests/net/lib/Makefile
index 0a6cd733883d..84e3d220d5aa 100644
--- a/tools/testing/selftests/net/lib/Makefile
+++ b/tools/testing/selftests/net/lib/Makefile
@@ -35,7 +35,7 @@ include ../../lib.mk
 BPF_PROG_DIRS := xsk
 include ../bpf.mk
 
-# AF_XDP test engine used by net/test_xsk.sh.
+# AF_XDP test engine used by drivers/net/xsk.py.
 XSK_SRCS := $(filter-out %.bpf.c,$(wildcard xsk/*.c)) \
 	$(top_srcdir)/tools/lib/find_bit.c
 
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
index 97eece4c57f8..b72e9332bf70 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -6,7 +6,7 @@
  * Linux kernel samples/bpf/xdpsock* and modified
  * for use.
  *
- * See test_xsk.sh for detailed information on test topology
+ * See drivers/net/xsk.py for detailed information on test topology
  * and prerequisite network setup.
  *
  * This test program contains two threads, each thread is single socket with
@@ -64,11 +64,6 @@
  * - Tx thread Transmits a number of packets from veth<xxxx> to veth<yyyy>
  * - Rx thread verifies if all packets were received and delivered in-order,
  *   and have the right content
- *
- * Enable/disable packet dump mode:
- * --------------------------
- * To enable L2 - L4 headers and payload dump of each packet on STDOUT, add
- * parameter -D to params array in test_xsk.sh, i.e. params=("-S" "-D")
  */
 
 #define _GNU_SOURCE
@@ -169,14 +164,14 @@ static struct option long_options[] = {
 static void print_usage(char **argv)
 {
 	const char *str =
-		"  Usage: xskxceiver [OPTIONS]\n"
+		"  Usage: %s -i TX_IFACE -i RX_IFACE -m MODE -t TEST [OPTIONS]\n"
 		"  Options:\n"
 		"  -i, --interface      Use interface\n"
 		"  -v, --verbose        Verbose output\n"
 		"  -b, --busy-poll      Enable busy poll\n"
-		"  -m, --mode           Run only mode skb, drv, or zc\n"
+		"  -m, --mode           Mode to run: skb, drv or zc\n"
 		"  -l, --list           List all available tests\n"
-		"  -t, --test           Run a specific test. Enter number from -l option.\n"
+		"  -t, --test           Test case to run, a number from -l\n"
 		"  -h, --help           Display this help and exit\n";
 
 	ksft_print_msg(str, basename(argv[0]));
@@ -267,6 +262,9 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 		}
 	}
 
+	if (opt_run_test == RUN_ALL_TESTS || opt_mode == TEST_MODE_ALL)
+		print_usage(argv);
+
 	bind_iface(ifobj_tx, ifname[0], worker_testapp_validate_tx, argv);
 	bind_iface(ifobj_rx, ifname[1], worker_testapp_validate_rx, argv);
 }
@@ -365,10 +363,9 @@ int main(int argc, char **argv)
 	u32 cache_line_size, max_frags, umem_tailroom;
 	const size_t total_tests = ARRAY_SIZE(tests);
 	struct ifobject *ifobj_tx, *ifobj_rx;
-	u32 i, j, failed_tests = 0, nb_tests;
 	struct test_spec test = {};
 	int ret = TEST_FAILURE;
-	u32 caps, modes = 0;
+	u32 caps;
 
 	/* Use libbpf 1.0 API mode */
 	libbpf_set_strict_mode(LIBBPF_STRICT_ALL);
@@ -419,40 +416,18 @@ int main(int argc, char **argv)
 
 	caps = detect_mode_caps(ifobj_tx);
 
-	if (opt_mode != TEST_MODE_ALL && !mode_supported(opt_mode, caps)) {
+	if (!mode_supported(opt_mode, caps)) {
 		if (opt_mode == TEST_MODE_DRV)
-			ksft_print_msg("Error: XDP_DRV mode not supported.\n");
+			ksft_print_msg("XDP_DRV mode not supported.\n");
 		else
-			ksft_print_msg("Error: zero-copy mode not supported.\n");
-		ksft_exit_xfail();
+			ksft_print_msg("zero-copy mode not supported.\n");
+		ret = TEST_SKIP;
+		goto out;
 	}
 
-	for (i = TEST_MODE_SKB; i <= TEST_MODE_ZC; i++)
-		if ((opt_mode == TEST_MODE_ALL || i == opt_mode) && mode_supported(i, caps))
-			modes++;
-	if (opt_run_test == RUN_ALL_TESTS)
-		nb_tests = total_tests;
-	else
-		nb_tests = 1;
-	ksft_set_plan(modes * nb_tests);
-
-	for (i = TEST_MODE_SKB; i <= TEST_MODE_ZC; i++) {
-		if (opt_mode != TEST_MODE_ALL && i != opt_mode)
-			continue;
-		if (!mode_supported(i, caps))
-			continue;
-
-		for (j = 0; j < total_tests; j++) {
-			if (opt_run_test != RUN_ALL_TESTS && j != opt_run_test)
-				continue;
-
-			test_init(&test, ifobj_tx, ifobj_rx, i, &tests[j]);
-			if (run_pkt_test(&test) == TEST_FAILURE)
-				failed_tests++;
-			usleep(USLEEP_MAX);
-		}
-	}
-	ret = failed_tests ? TEST_FAILURE : TEST_PASS;
+	ksft_set_plan(1);
+	test_init(&test, ifobj_tx, ifobj_rx, opt_mode, &tests[opt_run_test]);
+	ret = run_pkt_test(&test);
 
 out:
 	cleanup_iface(ifobj_tx);
@@ -462,6 +437,12 @@ int main(int argc, char **argv)
 	ifobject_delete(ifobj_tx);
 	ifobject_delete(ifobj_rx);
 
+	if (ret == TEST_SKIP && ksft_test_num()) {
+		ksft_print_cnts();
+		return KSFT_SKIP;
+	}
+	if (ret == TEST_SKIP)
+		ksft_exit_skip("mode not supported\n");
 	if (ret)
 		ksft_exit_fail();
 	else
diff --git a/tools/testing/selftests/net/test_xsk.sh b/tools/testing/selftests/net/test_xsk.sh
deleted file mode 100755
index fbf4551d596a..000000000000
--- a/tools/testing/selftests/net/test_xsk.sh
+++ /dev/null
@@ -1,230 +0,0 @@
-#!/bin/bash
-# SPDX-License-Identifier: GPL-2.0
-# Copyright(c) 2020 Intel Corporation, Weqaar Janjua <weqaar.a.janjua@intel.com>
-
-# AF_XDP selftests based on veth
-#
-# End-to-end AF_XDP over Veth test
-#
-# Topology:
-# ---------
-#                 -----------
-#               _ | Process | _
-#              /  -----------  \
-#             /        |        \
-#            /         |         \
-#      -----------     |     -----------
-#      | Thread1 |     |     | Thread2 |
-#      -----------     |     -----------
-#           |          |          |
-#      -----------     |     -----------
-#      |  xskX   |     |     |  xskY   |
-#      -----------     |     -----------
-#           |          |          |
-#      -----------     |     ----------
-#      |  vethX  | --------- |  vethY |
-#      -----------   peer    ----------
-#
-# AF_XDP is an address family optimized for high performance packet processing,
-# it is XDP’s user-space interface.
-#
-# An AF_XDP socket is linked to a single UMEM which is a region of virtual
-# contiguous memory, divided into equal-sized frames.
-#
-# Refer to AF_XDP Kernel Documentation for detailed information:
-# https://www.kernel.org/doc/html/latest/networking/af_xdp.html
-#
-# Prerequisites setup by script:
-#
-#   Set up veth interfaces as per the topology shown ^^:
-#   * setup two veth interfaces
-#   ** veth<xxxx>
-#   ** veth<yyyy>
-#   *** xxxx and yyyy are randomly generated 4 digit numbers used to avoid
-#       conflict with any existing interface
-#   * tests the veth and xsk layers of the topology
-#
-# See the source xskxceiver.c for information on each test
-#
-# Kernel configuration:
-# ---------------------
-# See "config" file for recommended kernel config options.
-#
-# Turn on XDP sockets and veth support when compiling i.e.
-# 	Networking support -->
-# 		Networking options -->
-# 			[ * ] XDP sockets
-#
-# Executing Tests:
-# ----------------
-# Must run with CAP_NET_ADMIN capability.
-#
-# Run:
-#   sudo ./test_xsk.sh
-#
-# If running from kselftests:
-#   sudo make run_tests
-#
-# Run with verbose output:
-#   sudo ./test_xsk.sh -v
-#
-# Set up veth interfaces and leave them up so xskxceiver can be launched in a debugger:
-#   sudo ./test_xsk.sh -d
-#
-# Run test suite in a specific mode only [skb,drv,zc]
-#   sudo ./test_xsk.sh -m MODE
-#
-# List available tests
-#   ./test_xsk.sh -l
-#
-# Run a specific test from the test suite
-#   sudo ./test_xsk.sh -t TEST_NAME
-#
-# Display the available command line options
-#   ./test_xsk.sh -h
-
-. xsk_prereqs.sh
-
-while getopts "vdm:lt:h" flag
-do
-	case "${flag}" in
-		v) verbose=1;;
-		d) debug=1;;
-		m) MODE=${OPTARG};;
-		l) list=1;;
-		t) TEST=${OPTARG};;
-		h) help=1;;
-	esac
-done
-
-if [ ! -x "./${XSKOBJ}" ]; then
-	echo "xskxceiver was not built; skipping"
-	exit $ksft_skip
-fi
-
-TEST_NAME="PREREQUISITES"
-
-URANDOM=/dev/urandom
-[ ! -e "${URANDOM}" ] && { echo "${URANDOM} not found. Skipping tests."; test_exit $ksft_fail; }
-
-VETH0_POSTFIX=$(cat ${URANDOM} | tr -dc '0-9' | fold -w 256 | head -n 1 | head --bytes 4)
-VETH0=ve${VETH0_POSTFIX}
-VETH1_POSTFIX=$(cat ${URANDOM} | tr -dc '0-9' | fold -w 256 | head -n 1 | head --bytes 4)
-VETH1=ve${VETH1_POSTFIX}
-MTU=1500
-
-trap ctrl_c INT
-
-function ctrl_c() {
-        cleanup_exit ${VETH0} ${VETH1}
-	exit 1
-}
-
-setup_vethPairs() {
-	if [[ $verbose -eq 1 ]]; then
-	        echo "setting up ${VETH0}"
-	fi
-	ip link add ${VETH0} numtxqueues 4 numrxqueues 4 type veth peer name ${VETH1} numtxqueues 4 numrxqueues 4
-	if [ -f /proc/net/if_inet6 ]; then
-		echo 1 > /proc/sys/net/ipv6/conf/${VETH0}/disable_ipv6
-		echo 1 > /proc/sys/net/ipv6/conf/${VETH1}/disable_ipv6
-	fi
-	if [[ $verbose -eq 1 ]]; then
-	        echo "setting up ${VETH1}"
-	fi
-
-	if [[ $busy_poll -eq 1 ]]; then
-	        echo 2 > /sys/class/net/${VETH0}/napi_defer_hard_irqs
-		echo 200000 > /sys/class/net/${VETH0}/gro_flush_timeout
-		echo 2 > /sys/class/net/${VETH1}/napi_defer_hard_irqs
-		echo 200000 > /sys/class/net/${VETH1}/gro_flush_timeout
-	fi
-
-	ip link set ${VETH1} mtu ${MTU}
-	ip link set ${VETH0} mtu ${MTU}
-	ip link set ${VETH1} up
-	ip link set ${VETH0} up
-}
-
-if [[ $list -eq 1 ]]; then
-        ./${XSKOBJ} -l
-        exit
-fi
-
-if [[ $help -eq 1 ]]; then
-	./${XSKOBJ}
-        exit
-fi
-
-validate_root_exec
-validate_veth_support ${VETH0}
-validate_ip_utility
-setup_vethPairs
-
-retval=$?
-if [ $retval -ne 0 ]; then
-	test_status $retval "${TEST_NAME}"
-	cleanup_exit ${VETH0} ${VETH1}
-	exit $retval
-fi
-
-
-if [[ $verbose -eq 1 ]]; then
-	ARGS+="-v "
-fi
-
-if [ -n "$MODE" ]; then
-	ARGS+="-m ${MODE} "
-fi
-
-if [ -n "$TEST" ]; then
-	ARGS+="-t ${TEST} "
-fi
-
-retval=$?
-test_status $retval "${TEST_NAME}"
-
-## START TESTS
-
-statusList=()
-
-TEST_NAME="XSK_SELFTESTS_${VETH0}_SOFTIRQ"
-
-if [[ $debug -eq 1 ]]; then
-    echo "-i" ${VETH0} "-i" ${VETH1}
-    exit
-fi
-
-exec_xskxceiver
-
-cleanup_exit ${VETH0} ${VETH1}
-
-if [[ $list -eq 1 ]]; then
-    exit
-fi
-
-TEST_NAME="XSK_SELFTESTS_${VETH0}_BUSY_POLL"
-busy_poll=1
-
-setup_vethPairs
-exec_xskxceiver
-
-## END TESTS
-
-cleanup_exit ${VETH0} ${VETH1}
-
-failures=0
-echo -e "\nSummary:"
-for i in "${!statusList[@]}"
-do
-	if [ ${statusList[$i]} -ne 0 ]; then
-	        test_status ${statusList[$i]} ${nameList[$i]}
-		failures=1
-	fi
-done
-
-if [ $failures -eq 0 ]; then
-        echo "All tests successful!"
-else
-	exit 1
-fi
diff --git a/tools/testing/selftests/net/xsk_prereqs.sh b/tools/testing/selftests/net/xsk_prereqs.sh
deleted file mode 100755
index 5e5c8ef3fff2..000000000000
--- a/tools/testing/selftests/net/xsk_prereqs.sh
+++ /dev/null
@@ -1,86 +0,0 @@
-#!/bin/bash
-# SPDX-License-Identifier: GPL-2.0
-# Copyright(c) 2020 Intel Corporation.
-
-ksft_pass=0
-ksft_fail=1
-ksft_xfail=2
-ksft_xpass=3
-ksft_skip=4
-
-XSKOBJ=lib/xskxceiver
-
-validate_root_exec()
-{
-	msg="skip all tests:"
-	if [ $UID != 0 ]; then
-		echo $msg must be run as root >&2
-		test_exit $ksft_fail
-	else
-		return $ksft_pass
-	fi
-}
-
-validate_veth_support()
-{
-	msg="skip all tests:"
-	if [ $(ip link add $1 type veth 2>/dev/null; echo $?;) != 0 ]; then
-		echo $msg veth kernel support not available >&2
-		test_exit $ksft_skip
-	else
-		ip link del $1
-		return $ksft_pass
-	fi
-}
-
-test_status()
-{
-	statusval=$1
-	if [ $statusval -eq $ksft_fail ]; then
-		echo "$2: [ FAIL ]"
-	elif [ $statusval -eq $ksft_skip ]; then
-		echo "$2: [ SKIPPED ]"
-	elif [ $statusval -eq $ksft_pass ]; then
-		echo "$2: [ PASS ]"
-	fi
-}
-
-test_exit()
-{
-	if [ $1 -ne 0 ]; then
-		test_status $1 $(basename $0)
-	fi
-	exit 1
-}
-
-clear_configs()
-{
-	[ $(ip link show $1 &>/dev/null; echo $?;) == 0 ] &&
-		{ ip link del $1; }
-}
-
-cleanup_exit()
-{
-	clear_configs $1 $2
-}
-
-validate_ip_utility()
-{
-	[ ! $(type -P ip) ] && { echo "'ip' not found. Skipping tests."; test_exit $ksft_skip; }
-}
-
-exec_xskxceiver()
-{
-        if [[ $busy_poll -eq 1 ]]; then
-	        ARGS+="-b "
-	fi
-
-	./${XSKOBJ} -i ${VETH0} -i ${VETH1} ${ARGS}
-	retval=$?
-
-	if [[ $list -ne 1 ]]; then
-	    test_status $retval "${TEST_NAME}"
-	    statusList+=($retval)
-	    nameList+=(${TEST_NAME})
-	fi
-}
-- 
2.43.0

