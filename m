Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791971;
	b=NMYjrZEt5UWsdxQ1wusfpRqTnDoQYCF3RseyI9iEE5mY0xhdw8uxScp+Gh742vbOY2H4
	 3KHAucfu7C4pczWgIpK5WpkQ+ScMDQ2mVExWKP3v1vAQ5MySi2Rob8TMpne6+19xMostK
	 /R6qAy804QyeZI9khfKvprUeh+JWxeTWAxLH9K4QOGqczXkkREbX1m8KDz4kQFYyl44O+
	 croufF1RBmXml5bBeSv5T2q1u0y5kPqaQH9gloyOGMP/58crDQ38TU9W1ork9hP9LXR48
	 IvO5a6uSqEjM0Bpw7GqAR9Ag0GiKQOAQaBD2LFo3Ofs3q2mQOyqAmfYNPzUnrXZfewQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791971;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mwcp9B7qcsXz8k9D+NMhOqyc242RpLt54j906IIxMmo=;
	b=hjWkOqYJ0VWQHeuYhdqOCD9HEsbxz2PvTcvXfs8ehQjxd7SheO/SuR+po3p9JZAwSOTr
	 a/dBFX56Hnk2XxesW82sIqKfNWSqrpS2deMopVpoJ5G2oXSvXQOr/+C08SHN2iX8hTuTH
	 0phs0Bki+GrrG/sGCzIeqfL1rGwnGm5NvETCG683yu6O/FPBqZYh8YLmMZG+CRUOPN+4C
	 IrEL7GEJyGbtUJGUBvvU2rPZq6RvkfoD0R1AjH2FzGwjqHhkiQIAkQt3uW7tKiMTngDyc
	 b4Bey9ghsyPVsXRawNnOWsqQSJIASigsFGM+7Xqq+lfNaF/8FaJ7GeygOzW6PxaUYEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gth61PNz;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5FE606A33A
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5FE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gth61PNz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791970; x=1827327970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tyK5dHSby2JLff443fhjL8PTSe/KUtfTH+TkxkrhUkM=;
  b=Gth61PNzpPYOira7UVDl2M4++2AMrWFSxhDjSr3YMp5IKxGZ2USdb3mx
   NaMFEcU89mSN8yQK+QzSxUi8j5Vo7M9BGhSWOMgOtGhs2yM5eV0FPzoVu
   8WEYnd5N7fjik9hsPRmLB2MT4hCDVXJurvQvgR7tFih9RmBr/NfQqhSRi
   dMqwJopzJQSCJ93EIM76xodMuasOhcjd6oEvdenjhv3sCubLTKXFxJWsU
   MTfkrr1+9HkGcp29F+4NFNJXw5Jb1VtXQ2aCChsVJvohuUWcLblZZHV1Q
   kkcagCu6gp2z48k13RHJk3ZZMOFs86Hczow9PYf5yjyyKo8gLRlWrEXA7
   Q==;
X-CSE-ConnectionGUID: 5RuVhfdwSaymY/uQ2v7gdg==
X-CSE-MsgGUID: tjyRPFslS+eXxn2joMSaQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666115"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:06:10 -0800
X-CSE-ConnectionGUID: lzfOgAHtR/qksEe7Bism2Q==
X-CSE-MsgGUID: dV/0P+/0QuuHbr4Y44exGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202813"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:06:08 -0800
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
Subject: [PATCH v6 net-next 09/15] selftests: xsk: send UDP over IPv4 or IPv6 between the interface MACs
Date: Fri, 27 Nov 2026 16:05:21 +0100
Message-Id: <20261127150527.1122049-10-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
References: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
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

xskxceiver sends loopback-ethertype frames between made-up MAC
addresses, and its XDP programs redirect every frame to the XSKMAP.
That works on veth, but on a physical link the peer NIC filters out the
made-up addresses, and the programs take neighbour discovery, LLDP or
SSH away from the stack.

Send UDP over IPv4 or IPv6 between the interface MACs instead, with the
flow given by --src-ip, --dst-ip, --dst-mac and --udp-port; the caller
steers it to the bound queue. The XDP programs redirect only UDP to the
test port and pass the rest, and XDP_SHARED_UMEM picks the socket by
UDP source port rather than by destination MAC. PKT_HDR_SIZE and
MIN_PKT_SIZE now stand for variables set by xsk_set_flow(), so the
smallest packet grows to 64 bytes over IPv4 and 88 over IPv6.

Also have is_frag_valid() reject a fragment too short for the words it
reads, pkt_dump() print only within the given length, and
write_payload() zero the bytes after the last full word, which the IPv6
checksum covers.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 212 +++++++++++++++---
 .../testing/selftests/net/lib/xsk/test_xsk.h  |   7 +-
 tools/testing/selftests/net/lib/xsk/xsk.c     |  26 +++
 tools/testing/selftests/net/lib/xsk/xsk.h     |   1 +
 .../selftests/net/lib/xsk/xsk_xdp_common.h    |   3 +-
 .../selftests/net/lib/xsk/xsk_xdp_progs.bpf.c |  91 +++++++-
 .../selftests/net/lib/xsk/xskxceiver.c        |  56 ++++-
 7 files changed, 353 insertions(+), 43 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index 1ce937fc8bdf..b0ed41b40f82 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -3,10 +3,14 @@
 #include <bpf/bpf.h>
 #include <errno.h>
 #include <limits.h>
+#include <linux/align.h>
 #include <linux/bitmap.h>
 #include <linux/if_link.h>
 #include <linux/mman.h>
 #include <linux/netdev.h>
+#include <linux/ip.h>
+#include <linux/ipv6.h>
+#include <linux/udp.h>
 #include <poll.h>
 #include <string.h>
 #include <sys/mman.h>
@@ -20,14 +24,14 @@
 #include "xsk_xdp_progs.skel.h"
 
 #define DEFAULT_BATCH_SIZE		64
-#define MIN_PKT_SIZE			64
+/* Payload of the smallest packet, which is 64 bytes over IPv4 */
+#define MIN_PAYLOAD_SIZE		20
 #define MAX_ETH_JUMBO_SIZE		9000
 #define MAX_INTERFACES			2
 #define MAX_TEARDOWN_ITER		10
 #define MAX_TX_BUDGET_DEFAULT		32
 #define PKT_DUMP_NB_TO_PRINT		16
-/* Just to align the data in the packet */
-#define PKT_HDR_SIZE			(sizeof(struct ethhdr) + 2)
+#define PKT_HDR_SIZE			pkt_hdr_size
 #define POLL_TMOUT			1000
 #define THREAD_TMOUT			3
 #define UMEM_HEADROOM_TEST_SIZE		128
@@ -36,9 +40,17 @@
 #define XSK_UMEM__LARGE_FRAME_SIZE	(3 * 1024)
 #define XSK_UMEM__MAX_FRAME_SIZE	(4 * 1024)
 
-static const u8 g_mac[ETH_ALEN] = {0x55, 0x44, 0x33, 0x22, 0x11, 0x00};
+/* The test flow, UDP over IPv4 or IPv6 */
+static int flow_family;
+static union {
+	struct in_addr v4;
+	struct in6_addr v6;
+} flow_src, flow_dst;
+static u16 udp_port;
+static u32 pkt_hdr_size;
 
 bool opt_verbose;
+int min_pkt_size;
 
 int pkts_in_flight;
 static struct xsk_peer *ctrl_peer;
@@ -80,19 +92,132 @@ static int pacing_tx_sync(void)
  */
 static void write_payload(void *dest, u32 pkt_nb, u32 start, u32 size)
 {
-	u32 *ptr = (u32 *)dest, i;
+	u32 *ptr = (u32 *)dest, i, words = size / sizeof(*ptr);
 
 	start /= sizeof(*ptr);
-	size /= sizeof(*ptr);
-	for (i = 0; i < size; i++)
+	for (i = 0; i < words; i++)
 		ptr[i] = htonl(pkt_nb << 16 | (i + start));
+	/* The UDP checksum counts a partial last word as zero. */
+	memset(ptr + words, 0, size % sizeof(*ptr));
 }
 
-static void gen_eth_hdr(struct xsk_socket_info *xsk, struct ethhdr *eth_hdr)
+int xsk_set_flow(const char *src_ip, const char *dst_ip, u16 port)
 {
+	u32 ip_hdr_size;
+
+	if (inet_pton(AF_INET, src_ip, &flow_src) == 1 &&
+	    inet_pton(AF_INET, dst_ip, &flow_dst) == 1) {
+		flow_family = AF_INET;
+		ip_hdr_size = sizeof(struct iphdr);
+	} else if (inet_pton(AF_INET6, src_ip, &flow_src) == 1 &&
+		   inet_pton(AF_INET6, dst_ip, &flow_dst) == 1) {
+		flow_family = AF_INET6;
+		ip_hdr_size = sizeof(struct ipv6hdr);
+	} else {
+		return -EINVAL;
+	}
+	if (!port)
+		return -EINVAL;
+
+	udp_port = port;
+	pkt_hdr_size = sizeof(struct ethhdr) + ip_hdr_size +
+		       sizeof(struct udphdr) + PKT_HDR_PAD;
+	/* A multiple of 8, so that a packet that a case puts MIN_PKT_SIZE / 2
+	 * before a boundary keeps its payload 4-byte aligned.
+	 */
+	min_pkt_size = ALIGN(pkt_hdr_size + MIN_PAYLOAD_SIZE, 8);
+	return 0;
+}
+
+/* Add up buf as big-endian 16-bit words, len being even. */
+static u32 csum_add(u32 sum, const void *buf, size_t len)
+{
+	const u8 *pos = buf;
+
+	for (; len > 1; len -= 2, pos += 2)
+		sum += pos[0] << 8 | pos[1];
+	return sum;
+}
+
+static u16 csum_fold(u32 sum)
+{
+	while (sum >> 16)
+		sum = (sum & 0xffff) + (sum >> 16);
+	return htons((u16)~sum);
+}
+
+/* The sum of the payload of len bytes that write_payload() writes: each
+ * word holds pkt_nb and the index of the word in its two 16-bit halves.
+ */
+static u32 payload_csum(u32 pkt_nb, u32 len)
+{
+	u32 words = len / sizeof(u32);
+
+	return words * (pkt_nb & 0xffff) + words * (words - 1) / 2;
+}
+
+static u16 udp6_csum(const struct ipv6hdr *ip6, const struct udphdr *udp, u32 pkt_nb)
+{
+	u32 len = ntohs(udp->len), sum;
+
+	sum = csum_add(0, &ip6->saddr, sizeof(ip6->saddr));
+	sum = csum_add(sum, &ip6->daddr, sizeof(ip6->daddr));
+	sum += len + IPPROTO_UDP;
+	sum = csum_add(sum, udp, sizeof(*udp));
+	/* The pad in front of the payload is zero. */
+	sum += payload_csum(pkt_nb, len - sizeof(*udp) - PKT_HDR_PAD);
+	return csum_fold(sum) ?: 0xffff;
+}
+
+static void gen_pkt_hdr(struct xsk_socket_info *xsk, void *data, u32 pkt_nb, u32 total_len)
+{
+	u32 ip_len = total_len - sizeof(struct ethhdr);
+	struct ethhdr *eth_hdr = data;
+	struct udphdr udp = {
+		.source = htons(xsk->src_port),
+		.dest = htons(udp_port),
+	};
+	void *ptr = eth_hdr + 1;
+
 	memcpy(eth_hdr->h_dest, xsk->dst_mac, ETH_ALEN);
 	memcpy(eth_hdr->h_source, xsk->src_mac, ETH_ALEN);
-	eth_hdr->h_proto = htons(ETH_P_LOOPBACK);
+
+	if (flow_family == AF_INET6) {
+		struct ipv6hdr ip6 = {
+			.version = 6,
+			.payload_len = htons(ip_len - sizeof(ip6)),
+			.nexthdr = IPPROTO_UDP,
+			.hop_limit = 64,
+			.saddr = flow_src.v6,
+			.daddr = flow_dst.v6,
+		};
+
+		eth_hdr->h_proto = htons(ETH_P_IPV6);
+		udp.len = ip6.payload_len;
+		udp.check = udp6_csum(&ip6, &udp, pkt_nb);
+		memcpy(ptr, &ip6, sizeof(ip6));
+		ptr += sizeof(ip6);
+	} else {
+		/* Without a checksum, which UDP over IPv4 does not require */
+		struct iphdr ip = {
+			.version = 4,
+			.ihl = 5,
+			.ttl = 64,
+			.protocol = IPPROTO_UDP,
+			.tot_len = htons(ip_len),
+			.saddr = flow_src.v4.s_addr,
+			.daddr = flow_dst.v4.s_addr,
+		};
+
+		eth_hdr->h_proto = htons(ETH_P_IP);
+		udp.len = htons(ip_len - sizeof(ip));
+		ip.check = csum_fold(csum_add(0, &ip, sizeof(ip)));
+		memcpy(ptr, &ip, sizeof(ip));
+		ptr += sizeof(ip);
+	}
+
+	memcpy(ptr, &udp, sizeof(udp));
+	memset(ptr + sizeof(udp), 0, PKT_HDR_PAD);
 }
 
 u32 mode_to_xdp_flags(enum test_mode mode)
@@ -207,6 +332,7 @@ static void __test_spec_init(struct test_spec *test, struct ifobject *ifobj_tx,
 
 	for (i = 0; i < MAX_INTERFACES; i++) {
 		struct ifobject *ifobj = i ? ifobj_rx : ifobj_tx;
+		struct ifobject *peer = i ? ifobj_tx : ifobj_rx;
 		struct xsk_umem_info *umem;
 
 		ifobj->xsk = &ifobj->xsk_arr[0];
@@ -238,10 +364,10 @@ static void __test_spec_init(struct test_spec *test, struct ifobject *ifobj_tx,
 			else
 				xsk->pkt_stream = test->rx_pkt_stream_default;
 
-			memcpy(xsk->src_mac, g_mac, ETH_ALEN);
-			memcpy(xsk->dst_mac, g_mac, ETH_ALEN);
-			xsk->src_mac[5] += ((j * 2) + 0);
-			xsk->dst_mac[5] += ((j * 2) + 1);
+			memcpy(xsk->src_mac, ifobj->caps.mac, ETH_ALEN);
+			memcpy(xsk->dst_mac, peer->caps.mac, ETH_ALEN);
+			/* xsk_xdp_shared_umem() picks the socket by it. */
+			xsk->src_port = udp_port + j;
 		}
 
 		ifobj->xsk->umem->num_frames = DEFAULT_UMEM_BUFFERS;
@@ -442,6 +568,19 @@ static u32 pkt_nb_frags(u32 frame_size, struct pkt_stream *pkt_stream, struct pk
 	return nb_frags;
 }
 
+/* A verbatim stream has one entry per descriptor, so add up the packet's. */
+static u32 pkt_total_len(struct pkt_stream *pkt_stream, struct pkt *pkt, u32 nb_frags)
+{
+	u32 i, len = 0;
+
+	if (!pkt_stream->verbatim)
+		return pkt->len;
+
+	for (i = 0; i < nb_frags; i++)
+		len += pkt[i].len;
+	return len;
+}
+
 static bool set_pkt_valid(int offset, u32 len)
 {
 	return len <= MAX_ETH_JUMBO_SIZE;
@@ -626,7 +765,7 @@ static void pkt_stream_cancel(struct pkt_stream *pkt_stream)
 }
 
 static void pkt_generate(struct xsk_socket_info *xsk, struct xsk_umem_info *umem, u64 addr, u32 len,
-			 u32 pkt_nb, u32 bytes_written)
+			 u32 total_len, u32 pkt_nb, u32 bytes_written)
 {
 	void *data = xsk_umem__get_data(umem->buffer, addr);
 
@@ -634,7 +773,7 @@ static void pkt_generate(struct xsk_socket_info *xsk, struct xsk_umem_info *umem
 		return;
 
 	if (!bytes_written) {
-		gen_eth_hdr(xsk, data);
+		gen_pkt_hdr(xsk, data, pkt_nb, total_len);
 
 		len -= PKT_HDR_SIZE;
 		data += PKT_HDR_SIZE;
@@ -727,10 +866,11 @@ static void pkt_print_data(u32 *data, u32 cnt)
 	}
 }
 
+/* With eth_header, len counts the bytes after the test header. */
 static void pkt_dump(void *pkt, u32 len, bool eth_header)
 {
 	struct ethhdr *ethhdr = pkt;
-	u32 i, *data;
+	u32 i, words, *data;
 
 	if (eth_header) {
 		/*extract L2 frame */
@@ -748,12 +888,13 @@ static void pkt_dump(void *pkt, u32 len, bool eth_header)
 	}
 
 	/*extract L5 frame */
+	words = len / sizeof(u32);
 	ksft_print_msg("\nDEBUG>> L5: seqnum: ");
-	pkt_print_data(data, PKT_DUMP_NB_TO_PRINT);
+	pkt_print_data(data, min_t(u32, words, PKT_DUMP_NB_TO_PRINT));
 	ksft_print_msg("....");
-	if (len > PKT_DUMP_NB_TO_PRINT * sizeof(u32)) {
+	if (words > PKT_DUMP_NB_TO_PRINT) {
 		ksft_print_msg("\n.... ");
-		pkt_print_data(data + len / sizeof(u32) - PKT_DUMP_NB_TO_PRINT,
+		pkt_print_data(data + words - PKT_DUMP_NB_TO_PRINT,
 			       PKT_DUMP_NB_TO_PRINT);
 	}
 	ksft_print_msg("\n---------------------------------------\n");
@@ -817,6 +958,11 @@ static bool is_frag_valid(struct xsk_umem_info *umem, u64 addr, u32 len, u32 exp
 			       (unsigned long long)addr, len);
 		return false;
 	}
+	if (len < (bytes_processed ? 0 : PKT_HDR_SIZE) + sizeof(*pkt_data)) {
+		ksft_print_msg("Frag too short addr: %llx len: %u\n",
+			       (unsigned long long)addr, len);
+		return false;
+	}
 
 	pkt_data = data;
 	if (!bytes_processed) {
@@ -858,12 +1004,13 @@ static bool is_frag_valid(struct xsk_umem_info *umem, u64 addr, u32 len, u32 exp
 	return false;
 }
 
-static bool is_pkt_valid(struct pkt *pkt, void *buffer, u64 addr, u32 len)
+static bool is_pkt_valid(struct pkt *pkt, void *buffer, u64 addr, u32 frag_len, u32 len)
 {
 	if (pkt->len != len) {
 		ksft_print_msg("[%s] expected packet length [%d], got length [%d]\n",
 			       __func__, pkt->len, len);
-		pkt_dump(xsk_umem__get_data(buffer, addr), len, true);
+		/* Only the first fragment, which holds the header, is at addr. */
+		pkt_dump(xsk_umem__get_data(buffer, addr), frag_len - PKT_HDR_SIZE, true);
 		return false;
 	}
 
@@ -961,7 +1108,7 @@ static int complete_pkts(struct xsk_socket_info *xsk, int batch_size)
 
 static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 {
-	u32 frags_processed = 0, nb_frags = 0, pkt_len = 0;
+	u32 frags_processed = 0, nb_frags = 0, pkt_len = 0, first_len = 0;
 	u32 idx_rx = 0, idx_fq = 0, rcvd, pkts_sent = 0;
 	struct pkt_stream *pkt_stream = xsk->pkt_stream;
 	struct ifobject *ifobj = test->ifobj_rx;
@@ -1038,8 +1185,10 @@ static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 		    !is_metadata_correct(pkt, umem->buffer, addr)))
 			return TEST_FAILURE;
 
-		if (!nb_frags++)
+		if (!nb_frags++) {
 			first_addr = addr;
+			first_len = desc->len;
+		}
 		frags_processed++;
 		pkt_len += desc->len;
 		if (ifobj->use_fill_ring)
@@ -1049,7 +1198,7 @@ static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 			continue;
 
 		/* The complete packet has been received */
-		if (!is_pkt_valid(pkt, umem->buffer, first_addr, pkt_len) ||
+		if (!is_pkt_valid(pkt, umem->buffer, first_addr, first_len, pkt_len) ||
 		    !is_offset_correct(umem, pkt, addr))
 			return TEST_FAILURE;
 
@@ -1199,7 +1348,7 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 
 	for (i = 0; i < xsk->batch_size; i++) {
 		struct pkt *pkt = pkt_stream_get_next_tx_pkt(pkt_stream);
-		u32 nb_frags_left, nb_frags, bytes_written = 0;
+		u32 nb_frags_left, nb_frags, total_len, bytes_written = 0;
 
 		if (!pkt)
 			break;
@@ -1211,6 +1360,7 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 			break;
 		}
 		nb_frags_left = nb_frags;
+		total_len = pkt_total_len(pkt_stream, pkt, nb_frags);
 
 		while (nb_frags_left--) {
 			struct xdp_desc *tx_desc = xsk_ring_prod__tx_desc(&xsk->tx, idx + i);
@@ -1227,8 +1377,8 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 				tx_desc->options = 0;
 			}
 			if (pkt->valid)
-				pkt_generate(xsk, umem, tx_desc->addr, tx_desc->len, pkt->pkt_nb,
-					     bytes_written);
+				pkt_generate(xsk, umem, tx_desc->addr, tx_desc->len, total_len,
+					     pkt->pkt_nb, bytes_written);
 			bytes_written += tx_desc->len;
 
 			print_verbose("Tx addr: %llx len: %u options: %u pkt_nb: %u\n",
@@ -2275,6 +2425,8 @@ int xsk_load_xdp_programs(struct ifobject *ifobj)
 	if (libbpf_get_error(ifobj->xdp_progs))
 		return libbpf_get_error(ifobj->xdp_progs);
 
+	/* The shadow's copy too, swapped directions attach its programs. */
+	ifobj->xdp_progs->bss->test_port = udp_port;
 	return 0;
 }
 
@@ -2335,6 +2487,12 @@ int init_iface(struct ifobject *ifobj)
 		return err;
 	}
 
+	err = xsk_get_mac(ifobj->ifname, ifobj->caps.mac);
+	if (err) {
+		ksft_print_msg("Error reading interface MAC address\n");
+		return err;
+	}
+
 	return detect_ifobj_caps(ifobj);
 }
 
diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.h b/tools/testing/selftests/net/lib/xsk/test_xsk.h
index f1fafae2d140..4690ae2ad9c6 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.h
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.h
@@ -24,7 +24,7 @@
 #define DEFAULT_PKT_CNT			(4 * 1024)
 #define DEFAULT_UMEM_BUFFERS		(DEFAULT_PKT_CNT / 4)
 #define HUGEPAGE_SIZE			(2 * 1024 * 1024)
-#define MIN_PKT_SIZE			64
+#define MIN_PKT_SIZE			min_pkt_size
 #define MAX_ETH_PKT_SIZE		1518
 #define MAX_INTERFACE_NAME_CHARS	16
 #define MAX_TEST_NAME_SIZE		48
@@ -35,6 +35,8 @@
 #define SMP_CACHE_BYTES_PATH "/sys/devices/system/cpu/cpu0/cache/index0/coherency_line_size"
 
 extern bool opt_verbose;
+/* The smallest test packet, set by xsk_set_flow() */
+extern int min_pkt_size;
 #define print_verbose(x...) do { if (opt_verbose) ksft_print_msg(x); } while (0)
 
 
@@ -83,6 +85,7 @@ struct xsk_peer;
 
 /* The control channel to the other endpoint. */
 void xsk_set_endpoint(struct xsk_peer *peer);
+int xsk_set_flow(const char *src_ip, const char *dst_ip, u16 port);
 
 struct xsk_socket_info {
 	struct xsk_ring_cons rx;
@@ -95,6 +98,7 @@ struct xsk_socket_info {
 	u32 batch_size;
 	u8 dst_mac[ETH_ALEN];
 	u8 src_mac[ETH_ALEN];
+	u16 src_port;
 	bool check_consumer;
 };
 
@@ -129,6 +133,7 @@ struct xsk_caps {
 	u32 max_skb_frags;
 	u32 umem_tailroom;
 	u32 tx_max_pending;
+	u8 mac[ETH_ALEN];
 };
 
 struct ifobject {
diff --git a/tools/testing/selftests/net/lib/xsk/xsk.c b/tools/testing/selftests/net/lib/xsk/xsk.c
index 74c7dd12a365..b5834ba16e69 100644
--- a/tools/testing/selftests/net/lib/xsk/xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/xsk.c
@@ -801,3 +801,29 @@ int get_hw_ring_size(char *ifname, struct ethtool_ringparam *ring_param)
 	close(sockfd);
 	return 0;
 }
+
+static int xsk_ifreq_ioctl(const char *ifname, unsigned long req, struct ifreq *ifr)
+{
+	int fd, err = 0;
+
+	fd = socket(AF_INET, SOCK_DGRAM, 0);
+	if (fd < 0)
+		return -errno;
+
+	strncpy(ifr->ifr_name, ifname, sizeof(ifr->ifr_name) - 1);
+	if (ioctl(fd, req, ifr) < 0)
+		err = -errno;
+	close(fd);
+	return err;
+}
+
+int xsk_get_mac(const char *ifname, u8 mac[ETH_ALEN])
+{
+	struct ifreq ifr = {};
+	int err;
+
+	err = xsk_ifreq_ioctl(ifname, SIOCGIFHWADDR, &ifr);
+	if (!err)
+		memcpy(mac, ifr.ifr_hwaddr.sa_data, ETH_ALEN);
+	return err;
+}
diff --git a/tools/testing/selftests/net/lib/xsk/xsk.h b/tools/testing/selftests/net/lib/xsk/xsk.h
index 94a56dd43f2e..263971a57e1e 100644
--- a/tools/testing/selftests/net/lib/xsk/xsk.h
+++ b/tools/testing/selftests/net/lib/xsk/xsk.h
@@ -244,6 +244,7 @@ void xsk_socket__delete(struct xsk_socket *xsk);
 int xsk_set_mtu(int ifindex, int mtu);
 
 int get_hw_ring_size(char *ifname, struct ethtool_ringparam *ring_param);
+int xsk_get_mac(const char *ifname, u8 mac[ETH_ALEN]);
 
 #ifdef __cplusplus
 } /* extern "C" */
diff --git a/tools/testing/selftests/net/lib/xsk/xsk_xdp_common.h b/tools/testing/selftests/net/lib/xsk/xsk_xdp_common.h
index 45810ff552da..47cbceea402d 100644
--- a/tools/testing/selftests/net/lib/xsk/xsk_xdp_common.h
+++ b/tools/testing/selftests/net/lib/xsk/xsk_xdp_common.h
@@ -4,7 +4,8 @@
 #define XSK_XDP_COMMON_H_
 
 #define MAX_SOCKETS 2
-#define PKT_HDR_ALIGN (sizeof(struct ethhdr) + 2) /* Just to align the data in the packet */
+/* Pads the UDP header of a test packet so that the payload is 4-byte aligned */
+#define PKT_HDR_PAD 2
 
 struct xdp_info {
 	__u64 count;
diff --git a/tools/testing/selftests/net/lib/xsk/xsk_xdp_progs.bpf.c b/tools/testing/selftests/net/lib/xsk/xsk_xdp_progs.bpf.c
index 84e5f4732289..2b55dbaf13b2 100644
--- a/tools/testing/selftests/net/lib/xsk/xsk_xdp_progs.bpf.c
+++ b/tools/testing/selftests/net/lib/xsk/xsk_xdp_progs.bpf.c
@@ -5,9 +5,17 @@
 #include <bpf/bpf_helpers.h>
 #include <linux/if_ether.h>
 #include <linux/ip.h>
+#include <linux/ipv6.h>
+#include <linux/udp.h>
+#include <linux/in.h>
 #include <linux/errno.h>
+#include <bpf/bpf_endian.h>
+#include <stdbool.h>
 #include "xsk_xdp_common.h"
 
+#define IP_MF		0x2000
+#define IP_OFFSET	0x1fff
+
 struct {
 	__uint(type, BPF_MAP_TYPE_XSKMAP);
 	__uint(max_entries, 2);
@@ -15,12 +23,64 @@ struct {
 	__uint(value_size, sizeof(int));
 } xsk SEC(".maps");
 
-static unsigned int idx;
 int adjust_value = 0;
 int count = 0;
+/* UDP destination port of the test flow, other traffic goes to the stack */
+__u16 test_port;
+
+/* Return the UDP header of a test packet, and in hdr_len the size of the
+ * headers in front of its payload, or NULL for any other packet.
+ */
+static __always_inline struct udphdr *test_udp_hdr(struct xdp_md *xdp,
+						   __u32 *hdr_len)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	struct ethhdr *eth = data;
+	struct ipv6hdr *ip6;
+	struct udphdr *udp;
+	struct iphdr *ip;
+
+	if ((void *)(eth + 1) > data_end)
+		return NULL;
+
+	if (eth->h_proto == bpf_htons(ETH_P_IP)) {
+		ip = (void *)(eth + 1);
+		/* Fragments go to the stack, which reassembles them. */
+		if ((void *)(ip + 1) > data_end || ip->ihl != 5 ||
+		    ip->protocol != IPPROTO_UDP ||
+		    ip->frag_off & bpf_htons(IP_MF | IP_OFFSET))
+			return NULL;
+		udp = (void *)(ip + 1);
+		*hdr_len = sizeof(*eth) + sizeof(*ip);
+	} else if (eth->h_proto == bpf_htons(ETH_P_IPV6)) {
+		ip6 = (void *)(eth + 1);
+		/* The test flow carries no extension headers. */
+		if ((void *)(ip6 + 1) > data_end || ip6->nexthdr != IPPROTO_UDP)
+			return NULL;
+		udp = (void *)(ip6 + 1);
+		*hdr_len = sizeof(*eth) + sizeof(*ip6);
+	} else {
+		return NULL;
+	}
+
+	if ((void *)(udp + 1) > data_end || udp->dest != bpf_htons(test_port))
+		return NULL;
+	*hdr_len += sizeof(*udp) + PKT_HDR_PAD;
+	return udp;
+}
+
+static __always_inline bool is_test_packet(struct xdp_md *xdp)
+{
+	__u32 hdr_len;
+
+	return test_udp_hdr(xdp, &hdr_len);
+}
 
 SEC("xdp.frags") int xsk_def_prog(struct xdp_md *xdp)
 {
+	if (!is_test_packet(xdp))
+		return XDP_PASS;
 	return bpf_redirect_map(&xsk, 0, XDP_DROP);
 }
 
@@ -28,6 +88,8 @@ SEC("xdp.frags") int xsk_xdp_drop(struct xdp_md *xdp)
 {
 	static unsigned int drop_idx;
 
+	if (!is_test_packet(xdp))
+		return XDP_PASS;
 	/* Drop every other packet */
 	if (drop_idx++ % 2)
 		return XDP_DROP;
@@ -41,6 +103,9 @@ SEC("xdp.frags") int xsk_xdp_populate_metadata(struct xdp_md *xdp)
 	struct xdp_info *meta;
 	int err;
 
+	if (!is_test_packet(xdp))
+		return XDP_PASS;
+
 	/* Reserve enough for all custom metadata. */
 	err = bpf_xdp_adjust_meta(xdp, -(int)sizeof(struct xdp_info));
 	if (err)
@@ -60,16 +125,17 @@ SEC("xdp.frags") int xsk_xdp_populate_metadata(struct xdp_md *xdp)
 
 SEC("xdp") int xsk_xdp_shared_umem(struct xdp_md *xdp)
 {
-	void *data = (void *)(long)xdp->data;
-	void *data_end = (void *)(long)xdp->data_end;
-	struct ethhdr *eth = data;
+	struct udphdr *udp;
+	__u32 hdr_len;
+	__u16 idx;
 
-	if ((void *)(eth + 1) > data_end)
-		return XDP_DROP;
+	udp = test_udp_hdr(xdp, &hdr_len);
+	if (!udp)
+		return XDP_PASS;
 
-	/* Redirecting packets based on the destination MAC address */
-	idx = ((unsigned int)(eth->h_dest[5])) / 2;
-	if (idx > MAX_SOCKETS)
+	/* Socket N sends from test_port + N */
+	idx = bpf_ntohs(udp->source) - test_port;
+	if (idx >= MAX_SOCKETS)
 		return XDP_DROP;
 
 	return bpf_redirect_map(&xsk, idx, XDP_DROP);
@@ -77,9 +143,12 @@ SEC("xdp") int xsk_xdp_shared_umem(struct xdp_md *xdp)
 
 SEC("xdp.frags") int xsk_xdp_adjust_tail(struct xdp_md *xdp)
 {
-	__u32 buff_len, curr_buff_len;
+	__u32 buff_len, curr_buff_len, hdr_len;
 	int ret;
 
+	if (!test_udp_hdr(xdp, &hdr_len))
+		return XDP_PASS;
+
 	buff_len = bpf_xdp_get_buff_len(xdp);
 	if (buff_len == 0)
 		return XDP_DROP;
@@ -106,7 +175,7 @@ SEC("xdp.frags") int xsk_xdp_adjust_tail(struct xdp_md *xdp)
 		__u32 *pkt_data = (void *)(long)xdp->data;
 		__u32 len, words_to_end, seq_num;
 
-		len = curr_buff_len - PKT_HDR_ALIGN;
+		len = curr_buff_len - hdr_len;
 		words_to_end = len / sizeof(*pkt_data) - 1;
 		seq_num = words_to_end;
 
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
index 7f6ef07e5bf5..f7fa9ab93512 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -61,7 +61,9 @@
  * - One process listens on a TCP control port (--listen), the other one
  *   connects to it and the two synchronize each test step over that
  *   connection
- * - Tx process Transmits a number of packets from veth<xxxx> to veth<yyyy>
+ * - Tx process transmits a number of UDP packets over IPv4 or IPv6 from
+ *   veth<xxxx> to veth<yyyy>, and the XDP program of Rx passes other traffic
+ *   to the stack
  * - Rx process verifies if all packets were received and delivered in-order,
  *   and have the right content
  */
@@ -78,6 +80,7 @@
 #include <linux/align.h>
 #include <arpa/inet.h>
 #include <net/if.h>
+#include <netinet/ether.h>
 #include <locale.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -109,9 +112,18 @@ static bool opt_listen;
 static const char *opt_peer_host;
 static const char *opt_peer_port;
 static const char *opt_ifname;
+static const char *opt_src_ip;
+static const char *opt_dst_ip;
+static const struct ether_addr *opt_dst_mac;
+static struct ether_addr dst_mac;
+static u16 opt_udp_port;
 
 enum {
 	OPT_LISTEN = 256,
+	OPT_SRC_IP,
+	OPT_DST_IP,
+	OPT_DST_MAC,
+	OPT_UDP_PORT,
 };
 
 static void __exit_with_error(int error, const char *file, const char *func, int line)
@@ -177,6 +189,10 @@ static struct option long_options[] = {
 	{"peer", required_argument, 0, 'p'},
 	{"peer-port", required_argument, 0, 'P'},
 	{"listen", no_argument, 0, OPT_LISTEN},
+	{"src-ip", required_argument, 0, OPT_SRC_IP},
+	{"dst-ip", required_argument, 0, OPT_DST_IP},
+	{"dst-mac", required_argument, 0, OPT_DST_MAC},
+	{"udp-port", required_argument, 0, OPT_UDP_PORT},
 	{"help", no_argument, 0, 'h'},
 	{0, 0, 0, 0}
 };
@@ -184,7 +200,8 @@ static struct option long_options[] = {
 static void print_usage(char **argv)
 {
 	const char *str =
-		"  Usage: %s -i IFACE -e rx|tx -m MODE -t TEST -p HOST -P PORT [OPTIONS]\n"
+		"  Usage: %s -i IFACE -e rx|tx -m MODE -t TEST -p HOST -P PORT\n"
+		"                    --src-ip IP --dst-ip IP --dst-mac MAC --udp-port PORT [OPTIONS]\n"
 		"  Options:\n"
 		"  -i, --interface      Use interface\n"
 		"  -v, --verbose        Verbose output\n"
@@ -196,6 +213,11 @@ static void print_usage(char **argv)
 		"  -p, --peer           Control host: IPv4/IPv6 address or hostname\n"
 		"  -P, --peer-port      Control TCP port\n"
 		"      --listen         Listen on the control port instead of connecting\n"
+		"      --src-ip IP      IPv4 or IPv6 source address of the test packets\n"
+		"      --dst-ip IP      Destination address, of the same family\n"
+		"      --dst-mac MAC    Destination MAC address of the test packets\n"
+		"      --udp-port PORT  UDP destination port, and source port of socket 0;\n"
+		"                       the caller steers the test flow to the bound queue\n"
 		"  -h, --help           Display this help and exit\n";
 
 	ksft_print_msg(str, basename(argv[0]));
@@ -235,6 +257,7 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 			       char **argv)
 {
 	int option_index, c;
+	unsigned long val;
 
 	opterr = 0;
 
@@ -291,6 +314,26 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 		case OPT_LISTEN:
 			opt_listen = true;
 			break;
+		case OPT_SRC_IP:
+			opt_src_ip = optarg;
+			break;
+		case OPT_DST_IP:
+			opt_dst_ip = optarg;
+			break;
+		case OPT_DST_MAC:
+			opt_dst_mac = ether_aton_r(optarg, &dst_mac);
+			if (!opt_dst_mac)
+				print_usage(argv);
+			break;
+		case OPT_UDP_PORT:
+			/* XDP_SHARED_UMEM sends from the port plus the
+			 * socket index.
+			 */
+			val = strtoul(optarg, NULL, 10);
+			if (!val || val > 0xffff - (MAX_SOCKETS - 1))
+				print_usage(argv);
+			opt_udp_port = val;
+			break;
 		case 'h':
 		default:
 			print_usage(argv);
@@ -299,7 +342,8 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 
 	if (!opt_ifname || opt_endpoint_role == XSK_ENDPOINT_NONE || !opt_peer_host ||
 	    !*opt_peer_host || !opt_peer_port || opt_run_test == RUN_ALL_TESTS ||
-	    opt_mode == TEST_MODE_ALL)
+	    opt_mode == TEST_MODE_ALL || !opt_src_ip || !opt_dst_ip || !opt_dst_mac ||
+	    !opt_udp_port)
 		print_usage(argv);
 }
 
@@ -414,6 +458,8 @@ static int setup_peer(struct ifobject *local, struct ifobject *shadow,
 	}
 
 	shadow->caps = local->caps;
+	memcpy(shadow->caps.mac, opt_dst_mac->ether_addr_octet, ETH_ALEN);
+
 	xsk_set_endpoint(*peer);
 	return TEST_PASS;
 }
@@ -472,6 +518,10 @@ int main(int argc, char **argv)
 		ksft_exit_xfail();
 	}
 
+	/* Before the default packet streams, which have its minimum size. */
+	if (xsk_set_flow(opt_src_ip, opt_dst_ip, opt_udp_port))
+		print_usage(argv);
+
 	/* swap_directions() swaps the workers, so the shadow needs one too. */
 	ifobj_tx->func_ptr = worker_testapp_validate_tx;
 	ifobj_rx->func_ptr = worker_testapp_validate_rx;
-- 
2.43.0

