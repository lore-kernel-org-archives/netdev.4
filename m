Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657004;
	b=mqPnwjkMVCmJ0OfoVYDYf/76ILan/GEVhvavv8voyGisPePC97QN9qdOJ4rgEylrfu9N
	 S4ryzk+KAai5UI0aq8Q2tQ2rhHI0fatYfuzxLF+LG2e8sM+jjbqPUHQSHWuZ2suubJLTb
	 PB91Wlhx5Ao7c0bpaQjubHSImbcR8J+oaWxVV4Y10fn18FunjaYGhFOVIAayKg6UgJM+P
	 BMtBgPN0pomizYJgJHobhgFN4Ol3MunlLcgUYcEyWJpiSs1EInFwCqIO8vV9p4ilM0UAR
	 RuJvPRjtFXjUXrymS9FL/kpBJbZSEgPeBEpiLGRqfW1CpUFDglRk7OUp7x9IiM3719g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=wkYXyPC8gksvw2kQJfieXcUNj0+AGAcQkrbWdWBsASM=;
	b=dvd/hQ/BwfLM5VsdR1Vm89Y+q3DRXZkfgI/ebdvuhGDSNY3yQjyptu94zDOr91aFEFuM
	 RGTGqFmkE4H03+eUz/htTWtOHNK7Xuw7R7liF/K4GbnhYMJIe83PymV4YOo7hNFEY8Kej
	 6QnkY9Vc7yXK1MwBe83e9L0LY0ywKFM615yVxvyp/ybg8nw4LuhV/0LdinEebC+HSt/pw
	 xtQOsFuPHILphP63zl7KfpAOXDmxkUSWP5Wr3f8IGEtKj6KzQKZlv3KdPkcRRVIt644nj
	 dRO7R1kUhexj1k13svzwUtJpBtxBMTZm08cL8Y4MXyNW9FqegZB6p1QZJoIFaNuoRBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Km+bWvEx;
	arc=none smtp.remote-ip=209.85.160.197
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17926606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17926606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Km+bWvEx
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d53d0bd3dso107091531cf.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795657003; x=1796261803; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkYXyPC8gksvw2kQJfieXcUNj0+AGAcQkrbWdWBsASM=;
        b=Km+bWvExH1UUhIiLga6kc6JeyJxcQPsj6uv03zUUSU7LLcl3WzbxcsUXXrKG2OxDuz
         v73jtCegDcBLJdnnyX6PswgEhFUIxn6Tev+n9XQvfj1hbV4A8DCOc9wlMyvZPbKaf3sg
         j0YX6unZPjEhhDM7WRWglIAdtnWT10FatQqx1GExa14lSH0e5bmLkEvdmp84beEiDqU8
         0pHQDXiZBUkNsEv+X4KycPLARi6IT3wOqKfgLvRwcUlPv5sIPKtGQPiwnkvOxyfZIAo3
         JNlhMyRHZJn1OYzoAd31/as/OaQiQ+7CT64qtr/O6DzjtmBS7F4uVoY5nOeLd6LRXDVD
         SuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657003; x=1796261803;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkYXyPC8gksvw2kQJfieXcUNj0+AGAcQkrbWdWBsASM=;
        b=C3LPZi8tQ9fLzoUpiS8kNGTKvaBrEHv0/M0pTcvnC0DXzaYJ8lt2l1AtGYCmqglOoq
         pUcD72fhadvYrpvbPX7JzkBK6AEGtvNtQ0jRn3CsoUFr9pH1rjrgqsp8FoZVOs09F7Vp
         t8VkgxLK2tICitkHQqerwsmL+wPBmauRRmX+cYaTHj58Cg4W6hrFWZhADM+w+ndBckcz
         13tc6Ptfq00+C66Uz+pF5KAUjBXRPDX/jcWoK+TtjrLWL3bl1+GcNXZV3I0G4ekMjeKl
         DPamOGkIPAftSiv1ZJqBJD6eqR5qWnxAG/YtESKYjKE7T8/KbObxx6dOwXbwI6B1gxmK
         i6hQ==
X-Gm-Message-State: APuU4Z+MCO9GYtJdNPkU1E9LdDnJSz6u/JdLksOLOFWSX+1O4/24l9k5
	twfDHrMGDds/EHoFBydjELjbQQHtyxJCK+owWoVFavu1dkSpex9rjcRW2KfJwpEHLG2jDAcEI/I
	9V8kfEy5TQQ==
X-Received: from qtcpe23.prod.google.com ([2002:a05:622a:e657:b0:55b:ad90:3424])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:622a:1aaa:b0:55c:307e:c961
 with SMTP id d75a77b69052e-55d768a0566mr338528581cf.3.1795657002745; Wed, 25
 Nov 2026 17:36:42 -0800 (PST)
Date: Wed, 25 Nov 2026 20:36:42 -0500
In-Reply-To: <20261119133557.3214802-1-piyus@iiitd.ac.in>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119133557.3214802-1-piyus@iiitd.ac.in>
Message-ID: <willemb.186fd6e73558@google.com>
Subject: Re: [PATCH net v3] net/sched: act_csum: bound the IPv6 jumbo payload length
From: willemb@google.com
To: Piyus Kedia <piyus@iiitd.ac.in>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev-bot+sashiko@kernel.org, kapil@presceralabs.ai
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Piyus Kedia wrote:
> tcf_csum_ipv6_hopopts() takes the payload length out of a hop-by-hop
> jumbo option and stores it unchecked:

> 	case IPV6_TLV_JUMBO:
> 		optlen = xh[off + 1] + 2;
> 		if (optlen != 6 || len < 6 || (off & 3) != 2)
> 			/* wrong jumbo option length/alignment */
> 			return 0;
> 		*pl = ntohl(*(__be32 *)(xh + off + 2));

> tcf_csum_ipv6() then hands ipl = *pl + sizeof(struct ipv6hdr) to the
> per-protocol handlers as the extent of the packet, so a 32-bit value
> chosen by whoever built the header reaches the length they read.

> Both guards downstream fail on such a value.  In
> tcf_csum_skb_nextlayer(), ipl + ntkoff is an unsigned int plus an int, so
> an ipl just under 2^32 wraps to a small number and pskb_may_pull()
> succeeds without pulling anything, while ipl < hl stays false precisely
> because ipl is huge.  tcf_csum_ipv6_udp()'s UDPLITE arm then admits any
> 16-bit length, since ul <= ipl - ihl compares against ~4.29e9, and
> csum_partial() reads that many bytes off the end of the skb.

> The same wrapped ipl also admits out-of-bounds WRITES, and the plain UDP
> arm is not exempt from those.  Nothing downstream establishes that the
> transport header is present: skb_try_make_writable() only copies a cloned
> skb and returns 0 without consulting its length,

> 	return skb_cloned(skb) && !skb_clone_writable(skb, write_len) &&
> 	       pskb_expand_head(skb, 0, 0, GFP_ATOMIC);

> so inside tcf_csum_skb_nextlayer() the pskb_may_pull(skb, ipl + ntkoff)
> that wrapped is the only length check there was.  The one remaining
> guarantee is the loop condition in tcf_csum_ipv6(),

> 	} while (pskb_may_pull(skb, hl + 1 + ntkoff));

> which covers a single byte past the option chain.  The handlers then store
> through the returned pointer at offsets that byte does not cover:

> 	tcf_csum_ipv6_tcp():   tcph->check = 0;          /* bytes 16-17 */
> 	tcf_csum_ipv6_icmp():  icmp6h->icmp6_cksum = 0;  /* bytes 2-3   */
> 	tcf_csum_ipv6_udp():   udph->check = 0;          /* bytes 6-7   */

> In tcf_csum_ipv6_udp() that store precedes the ul tests, so the plain UDP
> arm performs it and only then returns on ul != ipl - ihl.  It cannot do
> the long read, but it does write at an offset nothing checked, and the
> udph->len it compares is read from the same unchecked header.

> Measured on 7.3.1 with a print added to tcf_csum_skb_nextlayer() for the
> purpose, driving one 49-byte packet (40 + 8 hop-by-hop + 1) through a
> clsact csum action with TCA_CSUM_UPDATE_FLAG_TCP:

>    ihl=48 jhl=20 hl=68 ntkoff=14 ipl=4294967282 skb_len=63 data_len=0
>    headlen=63 hdr_end=82 oob=1

> ipl is 0xFFFFFFF2, so ipl + ntkoff is 0 and pskb_may_pull() passes without
> pulling; ipl < hl is false because ipl is huge; and the 20-byte header the
> function hands back ends 19 bytes past the 63 bytes of linear data.
> data_len is 0, so there is no paged data for the store to land in.

> These writes do not produce a KASAN report, which is why the harness that
> found the read above never reported them.  The overshoot is at most 17
> bytes past the end of the linear data, rawv6_send_hdrinc() allocates
> length + hlen + tlen + 15 so there are at least 15 spare bytes, and
> __alloc_skb() puts skb_shared_info "exactly at the end of allocated zone"
> - inside the same object, immediately after skb->end.  The store therefore
> lands in the tailroom or in skb_shared_info, where no redzone is poisoned,
> and corrupts shinfo silently instead of faulting.  With a one-byte TCP
> header a 49-byte packet (40 + 8 hop-by-hop + 1) gives skb->len = 63 at
> clsact egress, exactly what the loop condition establishes, while
> tcph->check is stored at offsets 78-79.

> Three more paths take the same unbounded ipl.  tcf_csum_ipv6_tcp(),
> tcf_csum_ipv6_icmp() and the ul == 0 arm of tcf_csum_ipv6_udp() each do

> 	skb->csum = csum_partial(hdr, ipl - ihl, 0);

> with only tcf_csum_skb_nextlayer() in front of them.  When ipl lies in
> [2^32 - ntkoff, 2^32 - 1] the sum there wraps to a v in [0, ntkoff - 1],
> pskb_may_pull() succeeds and ipl < hl is false, so ipl - ihl arrives at
> csum_partial()'s int len as the negative v - ntkoff - ihl.

> Whether a negative length reads anything depends on the configuration,
> and that is also why a KASAN fuzzer does not reach these three.  x86 has
> two implementations of csum_partial() and the config chooses:

> 	arch/x86/Kconfig
> 		config GENERIC_CSUM
> 			bool
> 			default y if KMSAN || KASAN

> With KASAN the kernel gets lib/checksum.c, whose do_csum() opens with
> "if (len <= 0) goto out;" and reads nothing.  Without KASAN it gets
> arch/x86/lib/csum-partial_64.c, which has no such test:

> 	if (likely(len >= 80)) { ... }	/* signed, false when negative */
> 	if (len >= 40) { ... }		/* signed, false */
> 	if (len & 32) { ... }		/* bitwise, runs */
> 	if (len & 16) { ... }
> 	if (len & 8)  { ... }
> 	if (len & 7)  { ... }

> The first two tests are signed comparisons and the last four are bitwise,
> so a negative length sums whatever its low six bits say, up to
> 32+16+8+7 = 63 bytes from the transport header.  With the payload_len
> 0xFFFFFFCA used above, a 16-byte hop-by-hop header (ihl = 56) and
> ntkoff = 14, len is -70, whose low byte is 1011 1010, so the 32, 16, 8
> and 2 blocks run and 58 bytes are read past a 20-byte TCP header.  The
> folded result is written into tcph->check or icmp6_cksum and transmitted.

> So "action csum tcp" and "action csum icmp" setups were exposed to a
> bounded over-read of up to 63 bytes on kernels built without KASAN, while
> the 65535-byte read reported below is the UDP-Lite case specifically.

> With payload_len 0xFFFFFFCA, a UDPLITE header claiming 60000 bytes and a
> 704-byte skb, KASAN reports:

>    BUG: KASAN: slab-out-of-bounds in csum_partial+0x103/0x1f0  
> lib/checksum.c:119
>    Read of size 4 at addr ffff8880259642c0 by task syz-executor/13111
>     tcf_csum_ipv6_udp+0x19e/0x250 net/sched/act_csum.c
>     tcf_csum_ipv6+0x63c/0x780 net/sched/act_csum.c:549
>     tcf_csum_act+0x34d/0x480 net/sched/act_csum.c:601
>     tcf_action_exec+0x109/0x390 net/sched/act_api.c:1161
>     tcf_classify+0x13d/0x440 net/sched/cls_api.c:1875
>     tc_run+0x31a/0x460 net/core/dev.c:4491
>     __dev_queue_xmit+0x1a7e/0x2390 net/core/dev.c:4890
>     ip6_output+0x280/0x400 net/ipv6/ip6_output.c:248
>     rawv6_send_hdrinc+0xb90/0x1170 net/ipv6/raw.c:663
>     rawv6_sendmsg+0x10d3/0x1260 net/ipv6/raw.c:908
>    The buggy address belongs to the object at ffff888025964000
>     which belongs to the cache skbuff_small_head of size 704
>    The buggy address is located 0 bytes to the right of
>     allocated 704-byte region [ffff888025964000, ffff8880259642c0)

> The packet above is generated locally through a raw AF_INET6 socket with
> IPV6_HDRINCL and leaves an Ethernet device, so skb_network_offset() is
> non-zero and the sum wraps.  Installing the action needs CAP_NET_ADMIN in
> the network namespace - reachable by an unprivileged user through a user
> namespace - but SENDING the packet that reaches it needs no privilege at
> all, and the sender need not be local.  A bridged IPv6 frame arrives at tc
> egress with skb_network_offset() equal to 14 as well:

> 	__netif_receive_skb_core()		/* skb_reset_network_header() */
> 	  -> bridge rx_handler -> forward
> 	br_dev_queue_push_xmit()		/* skb_push(skb, ETH_HLEN) */
> 	  -> dev_queue_xmit() -> tc egress
> 	  -> tcf_csum_act() -> tcf_csum_ipv6() -> tcf_csum_ipv6_hopopts()

> Such a frame never passes ipv6_rcv() or its jumbo checks.  The only
> bridge-side check of this option is br_validate_ipv6(), which calls
> nf_ip6_check_hbh_len() and runs only when br_netfilter is loaded.
> act_mirred redirecting ingress to egress pushes the MAC header back the
> same way (skb_push_rcsum(skb_to_send, mac_len)), so ntkoff is mac_len at
> the target device's egress there too.

> So on a bridge, a VM tap or a container veth whose port egress carries
> "action csum", a remote host, guest or container with no privilege on the
> host can send a jumbo length of 0xFFFFFFCA and reach the UDP-Lite read,
> the TCP/ICMP over-read, or the header writes above.  The folded checksum
> of the out-of-bounds bytes is written into the packet and transmitted.

> Fix both ends.  tcf_csum_skb_nextlayer() now checks that the header it is
> about to hand out is itself pullable, rather than inferring it from a
> caller-supplied ipl that can wrap; that check cannot reject a valid  
> packet,
> since ipl >= hl and ipl + ntkoff <= skb->len together give
> hl + ntkoff <= skb->len.  With it, the same packet is refused before any
> store: the print above does not appear and the action drops the skb, while
> ordinary traffic is unaffected.

> And bound the length the way nf_ip6_check_hbh_len() already does for the  
> same
> option: a jumbogram carries payload_len 0 and more than IPV6_MAXPLEN
> bytes, and the length it claims must be backed by the skb.  Once *pl is
> bounded, ipl cannot exceed skb->len, the sum in
> tcf_csum_skb_nextlayer() no longer wraps, and the UDPLITE comparison is a
> real bound again.  The bound is skb->len - skb_network_offset(skb), so it
> holds for the bridged and redirected cases as well as the local one, and
> it closes the writes with the reads: with ipl + ntkoff back inside
> skb->len, the pskb_may_pull() in tcf_csum_skb_nextlayer() is again what
> establishes that the transport header is there before anything stores to
> it.  That subtraction cannot itself wrap, because hopopts is only reached
> after the pskb_may_pull(skb, sizeof(*ip6h) + ntkoff) at the top of
> tcf_csum_ipv6() has succeeded.

> The [BUG] report for this, with the KASAN trace, the reproduction
> conditions and the impact, went to the list as a separate mail and was not
> threaded with v1.  Both are linked below: the report first, then v1 and  
> the
> review of it.

> Per Documentation/process/generated-content.rst: the out-of-bounds read
> was found by an AI-driven fuzzing harness, developed
> jointly by Kapil Vaswani and myself, which exercised the csum action
> under KASAN on x86_64.  The root-cause analysis, this changelog and the
> patch were written with the assistance of a large language model,
> and reviewed by hand; the before/after testing below
> the --- was run by us.  The analysis of the TCP, ICMP and ul == 0 paths
> added in v2 came from addressing an AI-generated review of v1 on the list;
> the Kconfig and Makefile behaviour it rests on was checked against the
> tree by hand.  The out-of-bounds writes and the bridged and redirected
> sender paths described in this version came from addressing a further
> AI-generated review of v2; skb_try_make_writable(), the loop condition,
> the store ordering in tcf_csum_ipv6_udp(), br_dev_queue_push_xmit(),
> br_validate_ipv6() and act_mirred's mac_len push were each read in the
> tree to confirm them.  v3 adds the pskb_may_pull() check in
> tcf_csum_skb_nextlayer() that the write analysis called for; the jumbo  
> bound
> is unchanged from v2.  The before/after above was measured by us.

> Link: https://lore.kernel.org/r/20261112075159.3552470-1-piyus@iiitd.ac.in
> Link: https://lore.kernel.org/r/20261112075445.3555341-1-piyus@iiitd.ac.in
> Fixes: eb4d40654505 ("net/sched: add ACT_CSUM action to update packets  
> checksums")
> Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>

Please reduce commit message size.

> ---
> v2: changelog only; the code change is unchanged.

>      v1 said the handlers passing ipl - ihl were protected because
>      csum_partial() takes an int.  That was true of the kernel it was
>      tested on and not of a kernel without KASAN, which links a
>      csum_partial() with no len <= 0 test.  v2 states the exposure of
>      tcf_csum_ipv6_tcp(), tcf_csum_ipv6_icmp() and the ul == 0 UDP-Lite
>      arm, bounded at 63 bytes, and why the sanitiser hides it.

>      Bounding *pl in tcf_csum_ipv6_hopopts() already closed all four
>      paths in v1, so the diff is byte-for-byte the same.

> Tested on 7.3.1 with KASAN, in a single-VM qemu rig, same .config and
> same image before and after; only net/sched/act_csum.o and the relink  
> differ
> (kernel build #2 unpatched, #3 patched):

>                jumbo length  payload_len   before            after
>    variant A   0xFFFFFFCA    16            KASAN, VM lost    ok, exit 0
>    variant B   0xFFFFFFCA    0             KASAN, VM lost    ok, exit 0
>    control     none (PadN)   16            not run           ok

>    before, variant A: Read of size 4 at addr ffff888024cb6340, task 11851
>    before, variant B: Read of size 4 at addr ffff88805fe8e9c0, task 9555

> Both faulting runs reach csum_partial() through the trace above.  After  
> the
> patch both programs run to completion with every setup step succeeding and
> all four sendto() calls accepted, so the packets do travel the egress path
> and the action simply refuses the length:

>    ntkoff=14 pl=0xffffffca ipl=0xfffffff2 ipl+ntkoff=0x00000000 \
>        ipl-ihl=0xffffffc2 ul=60000

> The control is the same program with the jumbo option replaced by a PadN  
> and
> a UDP-Lite length of 8, which is inside the packet.  It was run on the
> patched kernel only, since what it is there to show is that the patch did
> not break the path: the walker still accepts an ordinary hop-by-hop option
> and csum_partial() still runs over the 8 bytes the packet really has.   
> Only
> an unbacked jumbo length is rejected.

> Reproducer: not included here.  This bug was found with AI assistance,  
> which
> Documentation/process/security-bugs.rst says to treat as public; the same
> paragraph says not to post the reproducer publicly.  It is a short shell
> script plus a ~40-line C sender, tested, and available on request.

> Conditions it needs: a clsact qdisc with a csum action carrying
> TCA_CSUM_UPDATE_FLAG_UDPLITE, on an Ethernet-type device, with the packet
> locally generated so that skb_network_offset() is 14 and the sum in
> tcf_csum_skb_nextlayer() can wrap.  CAP_NET_ADMIN in the network  
> namespace,
> which CONFIG_USER_NS makes reachable by an unprivileged user.

>   net/sched/act_csum.c | 25 +++++++++++++++++++++----
>   1 file changed, 21 insertions(+), 4 deletions(-)

> diff --git a/net/sched/act_csum.c b/net/sched/act_csum.c
> index 5fff52a8ca90..eab8cdf6745b 100644
> --- a/net/sched/act_csum.c
> +++ b/net/sched/act_csum.c
> @@ -138,7 +138,17 @@
>   	int ntkoff = skb_network_offset(skb);
>   	int hl = ihl + jhl;

> +	/* Three distinct requirements, and each needs its own test.  ipl is the
> +	 * extent the callers read to, so it has to be pullable; it has to cover
> +	 * the jhl-byte header; and that header has to be pullable in its own
> +	 * right, because ipl + ntkoff is an unsigned int plus an int and a
> +	 * caller that has not bounded ipl can wrap it, after which the first
> +	 * test passes without pulling anything.  skb_try_make_writable() does
> +	 * not stand in for that: it copies a cloned skb and ignores its length
> +	 * argument otherwise.
> +	 */

Same for code comments

     [severity: medium, confidence: high]
     Checking !pskb_may_pull(skb, hl + ntkoff) does not actually protect  
against
     an unbounded caller wrapping ipl + ntkoff: whenever skb->len >= hl +  
ntkoff
     (for example, a 70-byte UDP-Lite packet with hl = 56 and ntkoff = 14),  
both
     pskb_may_pull() calls pass and tcf_csum_skb_nextlayer() still returns a
     non-NULL pointer with the wrapped ipl, allowing csum_partial() to read  
out
     of bounds. Conversely, when ipl + ntkoff cannot wrap, the second
     pskb_may_pull() is redundant because ipl >= hl already implies
     hl + ntkoff <= ipl + ntkoff <= skb_headlen(skb).

     Instead of a second pskb_may_pull() and a 9-line comment, check the
     arithmetic directly (also making hl unsigned int to match ihl/ipl/jhl):

         int ntkoff = skb_network_offset(skb);
         unsigned int hl, total;

         if (ntkoff < 0 || check_add_overflow(ihl, jhl, &hl) ||
             ipl < hl || check_add_overflow(ipl, (unsigned int)ntkoff,  
&total) ||
             !pskb_may_pull(skb, total) ||
             skb_try_make_writable(skb, hl + ntkoff))
             return NULL;

>   	if (!pskb_may_pull(skb, ipl + ntkoff) || (ipl < hl) ||
> +	    !pskb_may_pull(skb, hl + ntkoff) ||
>   	    skb_try_make_writable(skb, hl + ntkoff))
>   		return NULL;

--

pw-bot: cr
