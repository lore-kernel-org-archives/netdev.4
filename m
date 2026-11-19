Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106825;
	b=xL65S9iyVrtRMB+dTWOhehsz+hyn9qbXpzUINUHpgOTlbc0eXh1ylMAUwO+IEcMGw9n8
	 CRGQJjhpxJDH0gPfRckKIJQ6Sxv3OdCOkzegRABMSZm43eyh7FAUOwAhl5X0IM0YWue6B
	 WYavK+gKalePikZGi1A8Wm9dXYUciS/j5nuI+yBKP2vCo1O7hpopJ6/QYC/PW4iqPsR3B
	 XAzVcwzmeuVIxhwkYRpGD2iHQnLxARdXPEhSN6eiTXzKK/jYFdZhfiElgrtgROdiqUZB5
	 +zCVvoZbtpVXOsyDb7XETSQWbOk5sUkjvmWp0d3ttEjdR+PEdIiuL3gEQ00MB9Hue3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106825;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H1tm6nwMp7mltdjFvYIHkwXIxnxNcakhAGafrR8BQzU=;
	b=H7f+dreurz6LxJybO83nTmGmpdjMAChJGUi4DtW7qljIVvosHm3Yc7vbK0IaLGC5vlSq
	 jRH9jbf3XhatrjlrvQ4bKj5lkA+k1ic1gGk5DMq26JhoGHQXuXAj0/BBTiajucCdhi2qG
	 +xaHrsB++ehbuGGOXN7a6YZ95ITkJabDVnw13E2lmzXco702/ZVKkRESurntQ1XAkww3n
	 tlWqjCl2s/pBs/6D7woA9eFn0Vn44F2M5yFWqN10eZLEW8zghu4wbHa/cvVHrJu9JbIBT
	 FxawzBreyWgSNLZVlZeIBIAssYBz1paoiPi0zSknapS+O1Rf0YcSK4yk5IjQhRSEhVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FUcg1gnL;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494060A260A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1494060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FUcg1gnL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106824; x=1826642824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XfCjpLAT9Dyjrs/InWGxEw8Yb/TtzV+oGvQU/Xf7YGA=;
  b=FUcg1gnLUSao3jNGMGeGF6lehj+SFcqIEocTiQJamN8N7QmCQndg+JCq
   Gm44rLwXEqHwK/KVXJmKT2hx8Kiug7ZH3scdJU9exvyi57x59nzz479kD
   9cxqX0pAXpPtKpWri6UdxDnHIipi1cChLTN2F8z093Weq5msnkud03kHi
   YpHw0av4xLUm8xKCijFho7EAY2ie8d0vh1FaJ5HqWV2swvwutvDnHJE3/
   He5BQNc3vtyor9fbjXoZ/d28D2QlgKcFbgD9APydc0ZhXqW/hOld28Cy6
   ju6t+a8A8SqRUa4yI+HGaJ+2gniA+n82jlZk7m+ghsAtPhg0Oy327zqfP
   w==;
X-CSE-ConnectionGUID: XkATrwMoSnujNUJdKLmxYQ==
X-CSE-MsgGUID: jdUjqbhnRBSmE3mm5P5FVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991163"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:47:04 -0800
X-CSE-ConnectionGUID: EK/Hp9LISQypGsfyvRGbXg==
X-CSE-MsgGUID: wHkDDtgdSbagRA+d2ykKfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843390"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:47:01 -0800
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
Subject: [PATCH v5 net-next 08/13] selftests: xsk: send UDP over IPv4 or IPv6 between the interface MACs
Date: Thu, 19 Nov 2026 17:46:31 +0100
Message-Id: <20261119164636.1071385-9-maciej.fijalkowski@intel.com>
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
Content-Transfer-Encoding: 8bit

xskxceiver sends frames of the loopback ethertype between made-up MAC
addresses, and its XDP programs redirect every frame to the XSKMAP.
That suits a veth pair that carries nothing else, but not a physical
link, where the peer NIC filters out the made-up addresses and the
programs take neighbour discovery, LLDP or SSH away from the stack.

Send the test packets as UDP between the MAC addresses of the two
interfaces on any link. Each endpoint takes the IPv4 or IPv6 addresses
of the flow (--src-ip, --dst-ip), the MAC address of its peer
(--dst-mac) and the UDP port (--udp-port), and reads its own MAC
address from the interface. Over IPv4 the UDP checksum is left at zero,
as IPv4 allows; over IPv6 it is computed from the known payload.
PKT_HDR_SIZE and MIN_PKT_SIZE now stand for variables that
xsk_set_flow() sets, so the smallest packet grows with the headers to
64 bytes over IPv4 and 88 over IPv6, and a verbatim stream adds up the
descriptors of a packet for its IP and UDP lengths.

The XDP programs redirect only the UDP packets to the test port and
pass everything else to the stack, all IPv4 fragments included. The port
is written when a skeleton is loaded, so it also reaches the shadow
endpoint's copy, whose programs the local side attaches once
BIDIRECTIONAL swaps the directions. XDP_SHARED_UMEM picks the socket by
the UDP source port, the test port plus the socket index, rather than by
a made-up destination MAC, and xsk_xdp_adjust_tail() numbers a grown
tail after the UDP header.

is_adjust_tail_supported() copied all of .bss into an int with
bpf_map_lookup_elem(), past the end of the int even before the port
grew .bss; read adjust_value through the skeleton instead.
is_frag_valid() now rejects a fragment too short for the words it
reads, and pkt_dump() prints only the words within the length it is
given, which is_pkt_valid() gives as the first fragment's length.
write_payload() zeroes the bytes after the last full word, which the
IPv6 UDP checksum counts.

Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 240 ++++++++++++++----
 .../testing/selftests/net/lib/xsk/test_xsk.h  |   7 +-
 tools/testing/selftests/net/lib/xsk/xsk.c     |  26 ++
 tools/testing/selftests/net/lib/xsk/xsk.h     |   1 +
 .../selftests/net/lib/xsk/xsk_xdp_common.h    |   3 +-
 .../selftests/net/lib/xsk/xsk_xdp_progs.bpf.c |  91 ++++++-
 .../selftests/net/lib/xsk/xskxceiver.c        |  48 +++-
 7 files changed, 348 insertions(+), 68 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index fdf449822f02..d4485da0f9ac 100644
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
@@ -792,31 +933,12 @@ static bool is_metadata_correct(struct pkt *pkt, void *buffer, u64 addr)
 	return true;
 }
 
-static int is_adjust_tail_supported(struct xsk_xdp_progs *skel_rx, bool *supported)
+static bool is_adjust_tail_supported(struct xsk_xdp_progs *skel_rx)
 {
-	struct bpf_map *data_map;
-	int adjust_value = 0;
-	int key = 0;
-	int ret;
-
-	data_map = bpf_object__find_map_by_name(skel_rx->obj, "xsk_xdp_.bss");
-	if (!data_map || !bpf_map__is_internal(data_map)) {
-		ksft_print_msg("Error: could not find bss section of XDP program\n");
-		return -EINVAL;
-	}
-
-	ret = bpf_map_lookup_elem(bpf_map__fd(data_map), &key, &adjust_value);
-	if (ret) {
-		ksft_print_msg("Error: bpf_map_lookup_elem failed with error %d\n", ret);
-		return ret;
-	}
-
 	/* Set the 'adjust_value' variable to -EOPNOTSUPP in the XDP program if the adjust_tail
 	 * helper is not supported. Skip the adjust_tail test case in this scenario.
 	 */
-	*supported = adjust_value != -EOPNOTSUPP;
-
-	return 0;
+	return skel_rx->bss->adjust_value != -EOPNOTSUPP;
 }
 
 static bool is_frag_valid(struct xsk_umem_info *umem, u64 addr, u32 len, u32 expected_pkt_nb,
@@ -836,6 +958,11 @@ static bool is_frag_valid(struct xsk_umem_info *umem, u64 addr, u32 len, u32 exp
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
@@ -877,12 +1004,13 @@ static bool is_frag_valid(struct xsk_umem_info *umem, u64 addr, u32 len, u32 exp
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
 
@@ -980,7 +1108,7 @@ static int complete_pkts(struct xsk_socket_info *xsk, int batch_size)
 
 static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 {
-	u32 frags_processed = 0, nb_frags = 0, pkt_len = 0;
+	u32 frags_processed = 0, nb_frags = 0, pkt_len = 0, first_len = 0;
 	u32 idx_rx = 0, idx_fq = 0, rcvd, pkts_sent = 0;
 	struct pkt_stream *pkt_stream = xsk->pkt_stream;
 	struct ifobject *ifobj = test->ifobj_rx;
@@ -1057,8 +1185,10 @@ static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
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
@@ -1068,7 +1198,7 @@ static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 			continue;
 
 		/* The complete packet has been received */
-		if (!is_pkt_valid(pkt, umem->buffer, first_addr, pkt_len) ||
+		if (!is_pkt_valid(pkt, umem->buffer, first_addr, first_len, pkt_len) ||
 		    !is_offset_correct(umem, pkt, addr))
 			return TEST_FAILURE;
 
@@ -1218,7 +1348,7 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 
 	for (i = 0; i < xsk->batch_size; i++) {
 		struct pkt *pkt = pkt_stream_get_next_tx_pkt(pkt_stream);
-		u32 nb_frags_left, nb_frags, bytes_written = 0;
+		u32 nb_frags_left, nb_frags, total_len, bytes_written = 0;
 
 		if (!pkt)
 			break;
@@ -1230,6 +1360,7 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 			break;
 		}
 		nb_frags_left = nb_frags;
+		total_len = pkt_total_len(pkt_stream, pkt, nb_frags);
 
 		while (nb_frags_left--) {
 			struct xdp_desc *tx_desc = xsk_ring_prod__tx_desc(&xsk->tx, idx + i);
@@ -1246,8 +1377,8 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 				tx_desc->options = 0;
 			}
 			if (pkt->valid)
-				pkt_generate(xsk, umem, tx_desc->addr, tx_desc->len, pkt->pkt_nb,
-					     bytes_written);
+				pkt_generate(xsk, umem, tx_desc->addr, tx_desc->len, total_len,
+					     pkt->pkt_nb, bytes_written);
 			bytes_written += tx_desc->len;
 
 			print_verbose("Tx addr: %llx len: %u options: %u pkt_nb: %u\n",
@@ -1640,7 +1771,6 @@ static int testapp_prepare_rx_endpoint(struct test_spec *test,
 static int testapp_validate_rx_endpoint(struct test_spec *test,
 					struct ifobject *ifobject)
 {
-	bool supported;
 	int err;
 
 	err = receive_pkts(test);
@@ -1653,9 +1783,7 @@ static int testapp_validate_rx_endpoint(struct test_spec *test,
 	if (!test->adjust_tail)
 		return err;
 
-	if (is_adjust_tail_supported(ifobject->xdp_progs, &supported))
-		return TEST_FAILURE;
-	if (!supported) {
+	if (!is_adjust_tail_supported(ifobject->xdp_progs)) {
 		test->adjust_tail_support = false;
 		return TEST_PASS;
 	}
@@ -2293,6 +2421,8 @@ int xsk_load_xdp_programs(struct ifobject *ifobj)
 	if (libbpf_get_error(ifobj->xdp_progs))
 		return libbpf_get_error(ifobj->xdp_progs);
 
+	/* The shadow's copy too, swapped directions attach its programs. */
+	ifobj->xdp_progs->bss->test_port = udp_port;
 	return 0;
 }
 
@@ -2353,6 +2483,12 @@ int init_iface(struct ifobject *ifobj)
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
index 660540efc46e..54e6808e3fe4 100644
--- a/tools/testing/selftests/net/lib/xsk/xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/xsk.c
@@ -802,3 +802,29 @@ int get_hw_ring_size(char *ifname, struct ethtool_ringparam *ring_param)
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
index ded94b84cd1d..ef03bf3bd37b 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -64,7 +64,9 @@
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
@@ -81,6 +83,7 @@
 #include <linux/align.h>
 #include <arpa/inet.h>
 #include <net/if.h>
+#include <netinet/ether.h>
 #include <locale.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -112,9 +115,18 @@ static bool opt_listen;
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
@@ -180,6 +192,10 @@ static struct option long_options[] = {
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
@@ -187,7 +203,8 @@ static struct option long_options[] = {
 static void print_usage(char **argv)
 {
 	const char *str =
-		"  Usage: %s -i IFACE -e rx|tx -m MODE -t TEST -p HOST -P PORT [OPTIONS]\n"
+		"  Usage: %s -i IFACE -e rx|tx -m MODE -t TEST -p HOST -P PORT\n"
+		"                    --src-ip IP --dst-ip IP --dst-mac MAC --udp-port PORT [OPTIONS]\n"
 		"  Options:\n"
 		"  -i, --interface      Use interface\n"
 		"  -v, --verbose        Verbose output\n"
@@ -199,6 +216,10 @@ static void print_usage(char **argv)
 		"  -p, --peer           Control host: IPv4/IPv6 address or hostname\n"
 		"  -P, --peer-port      Control TCP port\n"
 		"      --listen         Listen on the control port instead of connecting\n"
+		"      --src-ip IP      IPv4 or IPv6 source address of the test packets\n"
+		"      --dst-ip IP      Destination address, of the same family\n"
+		"      --dst-mac MAC    Destination MAC address of the test packets\n"
+		"      --udp-port PORT  UDP destination port, and source port of socket 0\n"
 		"  -h, --help           Display this help and exit\n";
 
 	ksft_print_msg(str, basename(argv[0]));
@@ -294,6 +315,20 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
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
+			opt_udp_port = strtoul(optarg, NULL, 10);
+			break;
 		case 'h':
 		default:
 			print_usage(argv);
@@ -302,7 +337,8 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 
 	if (!opt_ifname || opt_endpoint_role == XSK_ENDPOINT_NONE || !opt_peer_host ||
 	    !*opt_peer_host || !opt_peer_port || opt_run_test == RUN_ALL_TESTS ||
-	    opt_mode == TEST_MODE_ALL)
+	    opt_mode == TEST_MODE_ALL || !opt_src_ip || !opt_dst_ip || !opt_dst_mac ||
+	    !opt_udp_port)
 		print_usage(argv);
 }
 
@@ -417,6 +453,8 @@ static int setup_peer(struct ifobject *local, struct ifobject *shadow,
 	}
 
 	shadow->caps = local->caps;
+	memcpy(shadow->caps.mac, opt_dst_mac->ether_addr_octet, ETH_ALEN);
+
 	xsk_set_endpoint(*peer);
 	return TEST_PASS;
 }
@@ -475,6 +513,10 @@ int main(int argc, char **argv)
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

