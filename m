Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851148;
	b=V3TwG2sSHZZ/4gF2jBsGM3NIuH4/gjHFuhFg82Pj2Ut08XffJqZyqOfiG+qa/VHIaRdV
	 e049+X0iMTsl+9AkilThn28IYIQmusPw4OxgHSibSIvPufje3QrtRBTF7j7zEGIA8vYor
	 w0zlBbj+LrhBxcJBLtqE4ZYmWO4j2/RO5JQ2KDB6E+64Ynljw0hR1v3d8yt2Q/l/PpVmL
	 elGLLmf0vqkPsZyh/96nkn9DX79oKR2TworFuYH0fcges8lxJsEmL34o7OH4HmcRQ8ZaI
	 JTSqjmrn5L3AJ4NRXqxxnaxFF/gxWsEo81VQ3Zw5DOkIC5+r+McvMjedhC8AfE6WlpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VHq7U2zYTKKTOjxUw8Yag46IQgKH3uJXkVlAzUEAQhI=;
	b=fM20Oe0SbLljauFgi6EfMmEeSiBGYRo3tUK0jLAy0wXK5J0O8qnuNWAtY1auvpnZcs22
	 oQfJYihmzWIZj6IfieJplfbalPaJCR3Nn3AKZlB0vvRz16b6vPuu163HlbeT1nXCk/NYE
	 B5yehC6Kg2+k1LxycfNxZH7mxjigk2ditSqNSIDTf1hoQny5uo8+YXOXjxO0a3KkXfpBi
	 qgOpE5pWLG5NW45fv2tHoMkavwaCwMaMXYlhtmBkAii997BP83GhLpPOpmq36IY7H2r2h
	 A5xnBUnCx/dQ6g6C2cEiHcdAcGToFecG2EMvfTxPbb2bI4V736+VN3qR2fjhiCPSS0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=JOj96f2w;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20830606A332
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20830606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=JOj96f2w
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e96502e447so39154695ad.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794851144; x=1795455944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VHq7U2zYTKKTOjxUw8Yag46IQgKH3uJXkVlAzUEAQhI=;
        b=JOj96f2w/sqs7djcrupUcLzHqmAzuatWTdIxePwYCmGN9SIHDVB4I6Yfzy/LlR2B4l
         OsAX5jPKvC976iMP/pCosZqeWYRI+SKTQgqebl95zeaCm4M+0wU5b+yEDtzgrUrlNdU/
         WJT0KZiiC/TZeIHmAPXiyWFyXotO+iBYYBmbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851144; x=1795455944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHq7U2zYTKKTOjxUw8Yag46IQgKH3uJXkVlAzUEAQhI=;
        b=E8w0ZZ+mANxtqzXv5eGEGQDlq84jnjohClla7ANAyg04/Hrd3Lsl8KY1j4RDZb91c0
         XSjRdoHyFgZENoktwo7F+wzg5sPYePMO0DLSnVerf5Tb9I4MljnsyYj+Kib4P9XihaE6
         V/EurbNE2NVux4rggXgNQ9fm9BflKDDs+aSeLL6/1FJLGk57hHxleYu5PifVJh9Ei7bj
         x/HnYOcvYgWvoLdvp3GJY01p6K482xxKIe4uiNHWWz8c3LFbZOiWeIbdxtMpLKNirb+p
         je+ho1TxbwqYp6bi1HgUchfHwbL84v7FRFdCpOpzR4uTXmX++yxwZWhjUYcQSm0/obbJ
         f7UA==
X-Forwarded-Encrypted: i=1; AL+hErFxcEcQwU5oOgfJxcSAt/A4OgYWFAA3Rpea4l1wslbtd+qWRcjJZdNhmQGPKXL/46xr+FInjKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lFy8CaTykKgyKvn0bL2hMWH+tfrK/vwDXYWYr/pKD7qv4Gqh/
	imigjb189YleIrq6YfNi2YapaVeZbJYE8bsYljXlLTfX66HHQJPUToqiTM9hyBifpZc=
X-Gm-Gg: AZFdTZdJ9Xqk2pRrG9SJzq69UmZLrFCsPSC8eNBQwoAemvto475eScauB4HztGTKP0g
	HYIXTl70pcVb249JL8V/evPjBEaIQLu3Yn6s248LldmqqJC5g6sC1Ma8NZLv5Em2fAWXwMrqDzv
	3pvhjsWtvBpM7ucakTVK14O7hWu1wVLQ5WJVlifD1ex8+Yh7qN9/SXrMQmHpzfeYWci+AyHruPK
	7sfq9xKmQ8ReigUnvMNWlKRafyQ3aqd+crZIbrR3GEh2aIynT7B5wTYxKlbw0T5LyBhWjjBeJec
	mudD4vvlzxoWvK0sNT7I+1ieZctd+gU8Kl2YWawCQGpfQL6O061dwD+WQtPlR7Edt18FHsBXDHa
	9J67XtQbppvh21WYUb5sdseeAQiAC+eea+QL2fmppxzva/JoFF/HLTZNx02uMonnNmNca6LrW4K
	9UJm2B9phfawFgUqGoflqpzqJn37MSkAj1zHlE9lZwC0eJLDp4pgKC6x8jXXq5jy/g+jZ7y3Qie
	UdhBmo1IFWb4S244BiqpBkdTHzTYMXLunggTWYem6WIZNHlM7Wi3lh86UCj/Q/lDU25O8iTUOki
	bKNx8L5WDP03CFO0b9/VAZM6o8VmjgHwgY3e9JyN63M/t+RJ5Vc0B7Ll5eUpanxVOCGZNs91FNN
	6zN4UROXHNJW2lIAlIs71H4bddjwh5uTSR9/TCcPyWfZg0pzukb/xdSY1lXh4EGoRWGGtd3LNh2
	myNZJUhs3uvA==
X-Received: by 2002:a17:903:2987:b0:2e5:db61:e5d4 with SMTP id d9443c01a7336-2ee0dcec408mr112701565ad.62.1794851143939;
        Mon, 16 Nov 2026 09:45:43 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7ab901dsm2577055ad.74.2026.11.16.09.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:45:43 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] xfrm: unprivileged 64KB out-of-bounds write in xfrm4_remove_tunnel_encap through an unset mac header left with a stale mac_len (reproduced on v7.4-rc3)
Date: Mon, 16 Nov 2026 23:15:30 +0530
Message-Id: <20261116174531.2540348-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

Hi Steffen, Herbert, David and Andrea,

We would like to report an out-of-bounds write in xfrm4_remove_tunnel_encap.

Summary
=======

Affected: reproduced on MAINLINE at aebb72744764 (v7.4-rc3), with KASAN, as
well as on the 7.3.1 tree it was found on.  Every code region involved is
byte-identical between the two - both write sites, the three skbuff.h helpers
and the SRv6 producer - and the two write sites are even at the same line
numbers, net/xfrm/xfrm_input.c:256-258 and :293-295.

Problem: xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap() stamp
the protocol into the ethernet header guarded only by skb->mac_len.  The
restore in front of it, skb_mac_header_rebuild(), does nothing when the mac
header was never set, and does not clear mac_len either.  On an skb whose
mac header has been unset while mac_len stayed behind, skb_mac_header() is
skb->head + 0xffff, so the store is 65535 + offsetof(struct ethhdr,
h_proto) bytes past skb->head.

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
       net/xfrm/xfrm_input.c:258
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
  The buggy address belongs to the object at ffff88805f858000
   which belongs to the cache zswap_entry of size 56

The two bytes land 11 bytes into an unrelated 56-byte zswap_entry, in a
different slab cache from the skb's own.  The address is not influenced by
mac_len: it is always skb->head + 0xffff + offsetof(struct ethhdr, h_proto),
i.e. head + 65547, because the unset sentinel is what mac_header holds.
mac_len only decides whether the write happens at all.  The value is
skb->protocol.  The report's own numbers agree - 0xffff88805f85800b minus
65547 is 0xffff88805f848000, which is page-aligned, as an skb head is.

Conditions: an skb that reaches xfrm input with the mac header unset and
mac_len still non-zero.  SRv6 End.DT4/End.DT6 produces exactly that:
end_dt_vrf_rcv() unsets the mac header on the receive path so the VRF device
can rebuild it, and leaves mac_len at the value the original ethernet frame
had.  The VRF only rebuilds it when something is sniffing the device -
vrf_ip_rcv() guards vrf_add_mac_header_if_unset() with
!list_empty(&vrf_dev->ptype_all) - so with no tcpdump attached the pair
survives into IPsec input.

NO PRIVILEGE IS REQUIRED, which we did not expect and have now measured.
The reproducer needs CONFIG_IPV6_SEG6_LWTUNNEL and CONFIG_NET_VRF, a VRF
device, an End.DT4 route and an inbound tunnel-mode SA, and all of it can be
done by an ordinary user inside a user+network namespace of their own.  On
mainline we reached the bug as uid 65534 under
`unshare -Urn`; the kernel's own warning records UID: 65534.  Section 4 has
the detail and the two non-namespaced things such a run still needs.

Reproducer: tested, not included here - see section 5.

Fix: a patch is in this thread.  It is a two-line change that only writes
the ethernet header when there is one, and it was tested at runtime on this
same mainline base: six boots each of the patched and unpatched kernels, the
write reached in 5 of the 5 unpatched boots where the skb arrived and in
none of the patched ones.  Section 7 has the table and states exactly what
we did and did not verify.

This bug was found with AI assistance.


1. Root cause
=============

Both tunnel-mode decapsulation helpers end the same way.  From
net/xfrm/xfrm_input.c, xfrm4_remove_tunnel_encap() (the IPv6 twin at :293
is identical):

	skb_reset_network_header(skb);
	skb_mac_header_rebuild(skb);
	if (skb->mac_len)
		eth_hdr(skb)->h_proto = skb->protocol;

eth_hdr() is (struct ethhdr *)skb_mac_header(skb), and skb_mac_header() is

	static inline unsigned char *skb_mac_header(const struct sk_buff *skb)
	{
		DEBUG_NET_WARN_ON_ONCE(!skb_mac_header_was_set(skb));
		return skb->head + skb->mac_header;
	}

so the address written depends entirely on skb->mac_header.  The intended
restore is skb_mac_header_rebuild():

	static inline void skb_mac_header_rebuild(struct sk_buff *skb)
	{
		if (skb_mac_header_was_set(skb)) {
			const unsigned char *old_mac = skb_mac_header(skb);

			skb_set_mac_header(skb, -skb->mac_len);
			memmove(skb_mac_header(skb), old_mac, skb->mac_len);
		}
	}

When the mac header was never set this is a no-op: mac_header keeps the
unset sentinel and mac_len is left untouched.  The sentinel is ~0U
truncated to the u16 field, i.e. 0xffff, so skb_mac_header() returns
skb->head + 65535 and the h_proto store at offset 12 writes two bytes at
skb->head + 65547.

The guard tests mac_len, which says nothing about whether mac_header is
valid.  The two are set together by skb_reset_mac_len(), but they are not
cleared together: skb_unset_mac_header() touches only mac_header.

	static inline void skb_unset_mac_header(struct sk_buff *skb)
	{
		skb->mac_header = (typeof(skb->mac_header))~0U;
	}

Five places call it in mainline, and exactly one of them keeps the pair
consistent:

  net/core/skbuff.c:6984   skb_carve_reset_headers()   clears mac_len at :6987
  net/core/lwt_bpf.c:704   bpf_lwt_push_ip_encap()     does not
  net/core/filter.c:2470   __bpf_redirect_neigh()      does not
  net/core/filter.c:7270   bpf_update_srh_state()      does not
  net/ipv6/seg6_local.c:1270  end_dt_vrf_rcv()         does not

end_dt_vrf_rcv() is the one on an ingress path that reaches IPsec input:

	/* the decap packet IPv4/IPv6 does not come with any mac header info.
	 * We must unset the mac header to allow the VRF device to rebuild it,
	 * just in case there is a sniffer attached on the device.
	 */
	skb_unset_mac_header(skb);

The packet arrived over an ethernet device, so mac_len is 14 and stays 14.


2. Why the guard cannot work as written
=======================================

mac_len is a length, not a validity flag, and the tree already treats it
that way elsewhere in this very file.  xfrm4_transport_input() computes the
header length as

	skb_mac_header_was_set(skb) ? skb_mac_header_len(skb) : 0

so the possibility of an unset header on this path is already accounted
for a few hundred lines above the two sites that do not account for it.

skb_mac_header_len() carries the same assertion as skb_mac_header():

	static inline u32 skb_mac_header_len(const struct sk_buff *skb)
	{
		DEBUG_NET_WARN_ON_ONCE(!skb_mac_header_was_set(skb));
		return skb->network_header - skb->mac_header;
	}

DEBUG_NET_WARN_ON_ONCE does not stop anything.  On a kernel with
CONFIG_DEBUG_NET it fires and names the cause, and execution then falls
straight into the write; on a kernel without it there is no warning at all
and the write is silent.  Both reports in section 3 come from the same
event in that order - the assertion first, the KASAN write second.


3. KASAN reports
================

Two reports, one event.  Note that the fuzzer titled this crash "WARNING
in skb_mac_header": that is the detector that fired first, not the bug.
The body is the out-of-bounds write.

First, the assertion inside skb_mac_header(), which states the broken pair
directly - R15 holds 0xe, i.e. mac_len = 14, with the header unset:

  ------------[ cut here ]------------
  !skb_mac_header_was_set(skb)
  WARNING: ./include/linux/skbuff.h:3162 at skb_mac_header+0x66/0x70
           include/linux/skbuff.h:3162, CPU#2: syz-executor/10831
  CPU: 2 UID: 0 PID: 10831 Comm: syz-executor Not tainted 7.3.1 #7
  RIP: 0010:skb_mac_header+0x66/0x70 include/linux/skbuff.h:3162
  R13: 0000000000000002 R14: 0000000000000008 R15: 000000000000000e
  Call Trace:
   <TASK>
   xfrm4_remove_tunnel_encap+0x16c/0x220 net/xfrm/xfrm_input.c:258
   xfrm_inner_mode_encap_remove+0x107/0x150 net/xfrm/xfrm_input.c:356
   xfrm_prepare_input+0x80/0xc0 net/xfrm/xfrm_input.c:382
   xfrm_inner_mode_input+0x89/0x190 net/xfrm/xfrm_input.c:441
   xfrm_input+0xac9/0x1320 net/xfrm/xfrm_input.c:705
   xfrmi_input+0x13a/0x170 net/xfrm/xfrm_interface_core.c:331
   xfrmi4_rcv+0x51/0x70 net/xfrm/xfrm_interface_core.c:339
   xfrm4_esp_rcv+0x7f/0x1e0 net/ipv4/xfrm4_protocol.c:104
   ip_protocol_deliver_rcu+0x261/0x380 net/ipv4/ip_input.c:207
   ip_local_deliver_finish+0x2b9/0x430 net/ipv4/ip_input.c:241

and then the write itself, from the same task and the same call site:

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
       net/xfrm/xfrm_input.c:258
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831

  CPU: 2 UID: 0 PID: 10831 Comm: syz-executor Tainted: G        W   7.3.1 #7
  Call Trace:
   <TASK>
   kasan_check_range+0x2d2/0x2e0 mm/kasan/generic.c:594
   xfrm4_remove_tunnel_encap+0x17d/0x220 net/xfrm/xfrm_input.c:258
   xfrm_inner_mode_encap_remove+0x107/0x150 net/xfrm/xfrm_input.c:356
   xfrm_prepare_input+0x80/0xc0 net/xfrm/xfrm_input.c:382
   xfrm_inner_mode_input+0x89/0x190 net/xfrm/xfrm_input.c:441
   xfrm_input+0xac9/0x1320 net/xfrm/xfrm_input.c:705
   xfrmi_input+0x13a/0x170 net/xfrm/xfrm_interface_core.c:331
   xfrmi4_rcv+0x51/0x70 net/xfrm/xfrm_interface_core.c:339
   xfrm4_esp_rcv+0x7f/0x1e0 net/ipv4/xfrm4_protocol.c:104
   ip_protocol_deliver_rcu+0x261/0x380 net/ipv4/ip_input.c:207
   ip_local_deliver_finish+0x2b9/0x430 net/ipv4/ip_input.c:241
   NF_HOOK+0x2ea/0x380 include/linux/netfilter.h:325
   seg6_local_input_core+0xdb/0x1c0 net/ipv6/seg6_local.c:1734
   lwtunnel_input+0x32e/0x4e0 net/core/lwtunnel.c:465
   NF_HOOK+0x2ea/0x380 include/linux/netfilter.h:325
   __netif_receive_skb+0x1cd/0x3d0 net/core/dev.c:6432
   netif_receive_skb+0x1ba/0x6b0 net/core/dev.c:6579
   tun_rx_batched+0x16b/0x490 drivers/net/tun.c:1571
   tun_get_user+0x1fa4/0x2bb0 drivers/net/tun.c:2048
   tun_chr_write_iter+0xc9/0x160 drivers/net/tun.c:2094
   vfs_write+0x4d9/0x810 fs/read_write.c:687
   ksys_write+0x123/0x200 fs/read_write.c:739
   do_syscall_64+0x170/0x540 arch/x86/entry/syscall_64.c:84
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  The buggy address belongs to the object at ffff88805f858000
   which belongs to the cache zswap_entry of size 56
  The buggy address is located 11 bytes inside of
   allocated 56-byte region [ffff88805f858000, ffff88805f858038)

AND THE SAME THING ON MAINLINE, from a kernel built at aebb72744764 with
KASAN and CONFIG_DEBUG_NET.  Note the verdict: use-after-free rather than
slab-out-of-bounds, because the address is a FIXED 65547 bytes past
skb->head and what sits there is whatever the allocator last put 16 pages
on.  Here it was a page in the buddy allocator's free list.

  !skb_mac_header_was_set(skb)
  WARNING: ./include/linux/skbuff.h:3171 at xfrm_input+0x2c63/0x33b0,
           CPU#2: repro/9544
  ...
  BUG: KASAN: use-after-free in xfrm_input+0x253a/0x33b0
  Write of size 2 at addr ffff88802848000b by task repro/9544
  CPU: 2 UID: 0 PID: 9544 Comm: repro Tainted: G W 7.4.0-rc3 #1
  Call Trace:
   <TASK>
   kasan_check_range+0x39/0x1c0
   xfrm_input+0x253a/0x33b0
   xfrm4_esp_rcv+0x46/0x120
   ip_protocol_deliver_rcu+0x262/0x280
   ip_local_deliver_finish+0x18a/0x320
   seg6_local_input_core.constprop.0+0x79/0x150
   lwtunnel_input+0x186/0x3e0
   __netif_receive_skb_one_core+0xd3/0x130
   netif_receive_skb+0xe8/0x480
   tun_rx_batched.isra.0+0x2fd/0x3b0

  The buggy address belongs to the physical page:
  page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x28480
  page_type: f0(buddy)

  Memory state around the buggy address:
   >ffff888028480000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

0xffff88802848000b minus 65547 is 0xffff888028470000, page-aligned, as an
skb head is.  A page on the buddy free list is not zeroed when it is handed
out again, so the two bytes are already in place for whatever allocates it
next.

The lower half of the stack is the whole mechanism in order:
lwtunnel_input() takes the packet into seg6_local_input_core(), the
End.DT4 behaviour runs end_dt_vrf_rcv() and unsets the mac header, the VRF
hands the packet up to ip_local_deliver_finish(), and ESP input carries it
into xfrm_input() and down to the write.


4. Impact
=========

The write is two bytes of skb->protocol at a fixed 64KB offset from the
head of an skb that is itself freshly allocated, so the target is whatever
object the allocator placed there.  In the reproduced case it was a
zswap_entry in a different slab cache, 11 bytes into a 56-byte object -
which is to say the write crosses cache boundaries and is not confined to
anything the network stack owns.

Two further points:

  - It is a narrow primitive, and we would rather say so than overstate it.
    Two bytes, at a FIXED offset of 65547 from skb->head, with a value that
    is skb->protocol - htons(ETH_P_IP) for End.DT4.  mac_len does not move
    the target; it only gates the write.  So what an attacker influences is
    which object sits 64KB past a freshly allocated skb head, by shaping the
    allocator, and not the offset or the value.

  - Without CONFIG_DEBUG_NET there is no warning before the write, so on a
    production kernel the first symptom is whatever the corrupted object
    does next.

REACHING IT NEEDS NO PRIVILEGE, which is the part we would most like
checked.  The setup is a VRF, an SRv6 End.DT4 route and an inbound SA, and
every capability check on that path is against the network namespace's own
user namespace:

  tun.c:2938        ns_capable(net->user_ns, CAP_NET_ADMIN)   the tap
  xfrm_user.c:3881  netlink_net_capable(skb, CAP_NET_ADMIN)   the SA
  rtnetlink.c:7096  netlink_net_capable(skb, CAP_NET_ADMIN)   VRF and route

and the sysctls the reproducer writes under /proc/sys/net are per-netns.  So
an ordinary user who calls unshare(CLONE_NEWUSER|CLONE_NEWNET) is root of
the namespace that all of those consult.  We measured it rather than argued
it: run as uid 65534 under `unshare -Urn` on mainline, the kernel's own
warning says

  WARNING: ./include/linux/skbuff.h:3171 at xfrm_input+0x2c63/0x33b0,
           CPU#0: repro-ns/9596
  CPU: 0 UID: 65534 PID: 9596 Comm: repro-ns Tainted: G W 7.4.0-rc3 #2

Two things such a run needs that a root one does not, and neither is a
capability:

  - /dev/net/tun must be openable by the user.  It is a device node and not
    a namespaced object, so this depends on the system's permissions for it;
    it was accessible to uid 65534 in the Debian image we used.
  - lo must be brought up inside the new netns, or the End.DT4 route cannot
    be installed at all (ENETDOWN).  Any program can do this in a namespace
    it owns.

The one check in this area that is against the INITIAL user namespace,
tun.c:2884's plain capable(CAP_NET_ADMIN), is gated on IFF_NAPI_FRAGS, and
this reproducer asks for IFF_TAP | IFF_NO_PI.


5. Reproducer
=============

We have a C reproducer, tested, which faults within seconds.  Following
the practice for this kind of report we are not posting it to a public
list.  We will send it privately to any of you who would like it.

It needs CONFIG_IPV6_SEG6_LWTUNNEL, CONFIG_NET_VRF, CONFIG_XFRM_USER,
CONFIG_INET_ESP and CONFIG_KASAN, and does the following in one network
namespace:

  1. turns on ip_forward, ipv6 forwarding and seg6_enabled, and clears
     rp_filter;
  2. creates a tap device for injection and gives it v4 and v6 addresses;
  3. creates a VRF device with a table id;
  4. installs a route whose lwtunnel encap is seg6local with action
     End.DT4 and SEG6_LOCAL_VRFTABLE set to that table;
  5. installs an inbound SA with XFRM_MSG_NEWSA, mode XFRM_MODE_TUNNEL and
     XFRMA_SA_DIR = XFRM_SA_DIR_IN;
  6. writes one ethernet frame into the tap: an outer IPv6 header with the
     SRv6 segment pointing at the End.DT4 route, carrying an IPv4 ESP
     packet matching the SA.

The frame arrives with mac_len = 14, End.DT4 unsets the mac header, and
the ESP packet is then decapsulated by xfrm4_remove_tunnel_encap() with
the pair broken.

TWO THINGS ABOUT RUNNING IT, both of which cost us time and may cost yours:

  - In a FRESH network namespace, lo is down, and without it the seg6local
    route cannot be installed - the netlink request returns ENETDOWN and
    every later lookup ENETUNREACH.  This looks like a permission problem
    and is not one.  Our unprivileged variant brings lo up first.

  - THE TRIGGER DEPENDS ON THE AGE OF THE SYSTEM, which we cannot fully
    explain.  Injecting as soon as the VM is reachable, about 50-65s after
    boot, reached the bug in 1 of 10 identical boots.  Waiting until the
    uptime passed 130s first reached it in 5 of 6.  The setup results were
    identical in both groups - the route and the SA went in, the frames were
    accepted - so what differs is somewhere between the tap and
    seg6_local_input_core, and we have not found it.  If the bug does not
    reproduce for you, this is the first thing to vary.


6. Suggested fix
================

The patch in this thread guards the write in both helpers:

	skb_mac_header_rebuild(skb);
	if (skb_mac_header_was_set(skb) && skb->mac_len)
		eth_hdr(skb)->h_proto = skb->protocol;

This is deliberately the narrow fix.  It matches what
xfrm4_transport_input() already does in the same file, it cannot change
behaviour for any skb whose mac header is set, and it removes the write
that KASAN catches.

There are two broader fixes we considered and did not send, because the
choice is yours rather than ours:

  (a) Clear mac_len in skb_unset_mac_header(), the way
      skb_carve_reset_headers() does by hand.  That restores the invariant
      for every consumer at once rather than for these two, and it would
      also cover the three remaining callers that leave the pair
      inconsistent.  We did not send it because we have not audited what
      the other callers, and the VRF rebuild that end_dt_vrf_rcv()'s
      comment is about, expect mac_len to be after the unset.

  (b) Clear mac_len in end_dt_vrf_rcv() alone.  Smaller than (a), but it
      fixes one producer of a state that several consumers are not
      prepared for, and the same state is still reachable from
      bpf_lwt_push_ip_encap(), __bpf_redirect_neigh() and
      bpf_update_srh_state() if any of them can reach such a consumer.
      We have not established whether they can.

If you would prefer (a) or (b), or both together with the guard, we are
happy to send that instead.


7. What was and was not checked
===============================

Checked:

  - The write reproduces on MAINLINE at aebb72744764 (v7.4-rc3), in a kernel
    we built from the pristine tree with CONFIG_KASAN_GENERIC and
    CONFIG_DEBUG_NET, as the use-after-free report in section 3.  It also
    reproduces on 7.3.1, where it was found, as slab-out-of-bounds.
  - Six code regions were extracted from both trees and compared; all six
    are byte-identical: xfrm4_remove_tunnel_encap() and
    xfrm6_remove_tunnel_encap() (28 lines each), skb_mac_header_rebuild()
    (9 lines), skb_mac_header() (5 lines), skb_unset_mac_header() (4 lines)
    and end_dt_vrf_rcv() (33 lines).  The two write sites are at the same
    line numbers in mainline as in the report.
  - skb_unset_mac_header() has five callers in mainline and only
    skb_carve_reset_headers() clears mac_len, as listed in section 1.
  - An unprivileged user reaches it.  Run as uid 65534 under `unshare -Urn`
    on mainline, with the kernel recording UID: 65534 - section 4.
  - THE PATCH WAS TESTED AT RUNTIME, on the same mainline base, with the two
    kernels built back to back from one scripted run so each image is
    provably from its commit.  Six boots each, injecting after the uptime
    passed 130s.  The skb_reset_mac_len() warnings at skbuff.h:2995 serve as
    a control: they fire when the unset-header skb reaches the receive path,
    and they are NOT affected by this patch.

                      skb came through   reached the write   KASAN
      unpatched         5 of 6 boots       5 of 5             1
      patched           2 of 6 boots       0 of 2             0

    So in every unpatched boot where the broken skb arrived it reached the
    write, and in no patched boot did it, including the two where the
    control shows the same skb arriving.  The patch also makes this
    deterministic rather than statistical: with the guard, eth_hdr(skb) is
    never evaluated when the header is unset, so skb_mac_header() is not
    called at that site at all - which is why its assertion disappears from
    the patched runs while the unrelated ones remain.
  - The patch applies to aebb72744764 and the file compiles; checkpatch
    reports only the missing Fixes: tag.

Not checked, and we would rather say so than imply otherwise:

  - There is no Fixes: tag because neither tree we have carries history for
    the file.  We can add one if you tell us which commit introduced the
    mac_len guard.
  - We have not tried to steer the write.  The offset is fixed and the value
    is one of two constants, so what an attacker would influence is which
    object sits 65547 bytes past a fresh skb head, by shaping the allocator;
    we have not attempted that.
  - We have not audited whether the three other non-clearing callers of
    skb_unset_mac_header() - bpf_lwt_push_ip_encap(), __bpf_redirect_neigh()
    and bpf_update_srh_state() - can reach a consumer that writes through
    the header.
  - We do not know what makes the trigger depend on the age of the system,
    only that it does.  Section 5 has the numbers.

Thanks and regards,
Piyus Kedia
Kapil Vaswani
