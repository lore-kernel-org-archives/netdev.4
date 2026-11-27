Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762137;
	b=5k1GJHj3sNt8fNHEzLT3DELNa5Sg06BTYnuEVgDuELvhZC7GlJ+n+HzbceSPFAvm1nyO
	 vv3qZJLLnaTyHEKaHIQTpsKLU+6IrCN/IUBu/Qq4XGB6quWTyUuJ9GPa2ZqY+VM0KNQTd
	 le7xvSUTmtlQ77+ElFWjIKNKxoVyOEGBZCseBIwyhYyw6hHvHW7zbQKVUp2aycYGBbFj5
	 wQnH2R45Fp8VCf7AH76ofaMQ6+T7ZabK/jQT1u+MmN3DZZuI9Zoel05kHzG7Y6hzJHo/q
	 eNbvOFIi99vwiKLIWOcsJPT/46iMVyUN3MuY6tXX9NM6Q5rvHgp/v5lb+otV3GktT6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762137;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=k3ZjfG+N7wLxnkU0L9mIF5scwPyKE57TaPHdl1fG3LE=;
	b=256/FVenBfyE3D2zuiFod6BUL2EXUYi1A5pPI4qo0DieTU829EVHngak7luqutPAy+V6
	 R2faj3E2X96IOxjT+O0LHL9olFAUAA7Y3dP2UAd7HpCQkr07aovgBv4DpA9/qE2yq5Dq+
	 /EqeIbIfzfax2MUKyG4Z0wmH4WTDDdyqsBJreJbNc3Cdokam/YJbxaPXMtMn6StUhyvgG
	 C3YUZ3MB8CXAn8yz1CHVMeo5837Rr2Cm3SUqwfyu2knh3jOmNsj3LunAt1X+qM43xBNlG
	 97pZtOxrKr2xdAWi4Ug+RV3JbKyQa0LGMxsq4EXEuDt33J4oB2Ca/45qNIJ0qs6nYUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjYqE8zI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B9606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjYqE8zI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8BE1F0089A;
	Fri, 27 Nov 2026 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795762136;
	bh=k3ZjfG+N7wLxnkU0L9mIF5scwPyKE57TaPHdl1fG3LE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YjYqE8zIJv5HytNH9iuX5BCv+xn14+URyl1MZBY8yLWaR5TOGFQqDMTyLt40Uhp3S
	 q9QfxuMhPRgqvMFk5ugOQ/niFInPv07sEzUfP82wHA5PabZW+s6akNNYmSNNDS/NdA
	 fwqMMHGnk4fEhxJ75R/xBoIaMzato6+/GYK7gL6NfF6VhJGVQDl15jz7CY24l1rxkN
	 HV2xlEFgjkxzIPyFCM/iy/ddNSVdgZWr9DeWWaLwXm9lgYf7MaAKe5lkTIgq+d6wZR
	 AvpBehpYsvjrDgpGyB2A/B20f+j8eRFDTg38Q0AfpARvwRZk51nGB8oMhERWUeAA+J
	 ApC2DP7Nx1YBA==
Subject: Re: [PATCH net] ipv4: reject header length beyond linear data in
 ip_do_fragment()
From: netdev-bot+sashiko@kernel.org
To: ljp1205831794@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, jiapenglin@tencent.com, corvus@tencent.com
Date: Fri, 27 Nov 2026 06:48:55 +0000
Message-ID: <179576213561.3135.12039000289688373845@kernel.org>
In-Reply-To: <20261126064445.57665-1-ljp1205831794@gmail.com>
References: <20261126064445.57665-1-ljp1205831794@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ipv4: ip_do_fragment() uses iph->ihl before validating
  skb_headlen() and hlen
- [Medium] The new guard in ip_do_fragment()
  (net/ipv4/ip_output.c:787-791) measures against the wrong base.
- [Low] The commit message understates the impact.
- [Low] The trailers misuse tags and drop attribution.

--

ipv4: reject header length beyond linear data in ip_do_fragment()

This commit moves the hlen computation in ip_do_fragment() earlier. It
adds a check that rejects the packet with -EINVAL when the IPv4 header
length is below 20 bytes or larger than skb_headlen(). The goal is to stop
the BUG() in ip_frag_next(), which the Open vSwitch fragmentation path can
reach with PUSH_MPLS + TRUNC + MRU.

Closes: https://lore.kernel.org/netdev/20260922030310.8684-3-habte.yibelo@gmail.com/

> request (user+network namespace, PUSH_MPLS x4 + TRUNC + MRU) into a
> deterministic kernel panic under a KASAN build:

[Severity: Low]
Is "under a KASAN build" accurate? The BUG() in ip_frag_next() does not
depend on any condition:

	if (skb_copy_bits(skb, state->ptr, skb_transport_header(skb2), len))
		BUG();

The quoted trace ends with "Fatal exception in interrupt", so it fires
with BH disabled. That means it would panic on any kernel config, not only
on KASAN builds.

The message also leaves out an earlier step. Before that BUG(),
skb_copy_from_linear_data(skb, ..., hlen) in ip_frag_next() reads hlen
bytes from a linear area that is shorter than hlen, so it reads past
skb->tail.

Could the description be updated to reflect both points?

> Closes: https://lore.kernel.org/netdev/20260922030310.8684-3-habte.yibelo@gmail.com/
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>

[Severity: Low]
The Closes: link points at Paulos Yibelo's pending [PATCH net v6 2/2],
not at a bug report. Reported-by: should also be followed by a Closes:
link to that report, but here it is followed directly by Signed-off-by:.

This patch resubmits the hlen half of that series. The overlap is only
mentioned in the note below the --- line, and that note is dropped when
the patch is applied, so git history will not credit Paulos Yibelo.

For comparison, the companion commit 6785011f8b16 has
"Reported-by: Paulos Yibelo" and a Closes: link to his posting.

Should this patch credit Paulos Yibelo with Reported-by:, Suggested-by:
or Co-developed-by:? Or should it be coordinated with the pending series
instead?

> diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
> index d42d776af273e..d5ea596724d7b 100644
> --- a/net/ipv4/ip_output.c
> +++ b/net/ipv4/ip_output.c
> @@ -784,6 +784,11 @@ int ip_do_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
>  	 */
>  
>  	iph = ip_hdr(skb);
> +	hlen = iph->ihl * 4;
> +	if (unlikely(hlen < sizeof(*iph) || hlen > skb_headlen(skb))) {

[Severity: High]
The commit message says the header length is validated before any use
of hlen, but the CHECKSUM_PARTIAL block above still runs first.
ip_check_csum_start() uses ip_hdrlen(skb), which is the same value as
iph->ihl * 4. skb_checksum_help() then runs on a header that has not
been validated yet.

In the OVS TRUNC + prepare_frag() case from the changelog, a
CHECKSUM_PARTIAL skb keeps its original csum_start, because
pskb_trim() does not touch ip_summed. If csum_start was at or past
network_header + hlen, ip_check_csum_start() returns 0, and
skb_checksum_help() is reached with skb_checksum_start_offset(skb) >=
skb_headlen(skb). That path calls skb_dump() and WARN_ONCE("offset
(%d) >= skb_headlen() (%u)"). With panic_on_warn, the same reproducer
still takes the machine down before the new check can reject the
packet.

The opposite case is also open. With iph->ihl < 5, ip_hdrlen() can be
0, so a csum_start equal to the network header passes
ip_check_csum_start(). skb_checksum_help() then stores the folded
checksum inside the IPv4 header itself, possibly over version/ihl,
before hlen < sizeof(*iph) is ever checked.

Separately, iph->ihl is dereferenced before anything checks
skb_headlen(skb) >= sizeof(*iph). If TRUNC leaves only the 30 bytes of
Ethernet + MPLS and prepare_frag() pulls all of them, skb_headlen() is
0 and ip_hdr(skb) points at skb->tail. The new check still rejects the
packet, but only after reading a stale or uninitialized byte past the
tail, which KMSAN would flag.

Would it make sense to do the validation ahead of the CHECKSUM_PARTIAL
block and to check skb_headlen(skb) >= sizeof(*iph) before reading
ihl? iph = ip_hdr(skb) would then need to be re-read after
skb_checksum_help(), since that call can reallocate skb->head.

[Severity: Medium]
Is skb_headlen() the right bound here? iph comes from
skb_network_header(), but skb_headlen() counts from skb->data. The check
only holds when skb_network_offset(skb) is zero, and nothing here enforces
that.

The Open vSwitch caller named in the commit message does not seem to
guarantee a zero offset. In do_output(), TRUNC only trims down to the MAC
header length (ETH_HLEN). The MPLS labels are not included in that floor:

net/openvswitch/actions.c:do_output() {
    ...
		if (unlikely(cutlen < skb->len))
			pskb_trim(skb, max(cutlen, ovs_mac_header_len(key)));
    ...
}

ovs_fragment() then moves the network header to the inner network header.
With four MPLS labels it ends up at offset 30, which the MAX_L2_LEN check
still allows:

	if (eth_p_mpls(skb->protocol)) {
		orig_network_offset = skb_network_offset(skb);
		skb->network_header = skb->inner_network_header;
	}

prepare_frag() then ignores the return value of skb_pull():

	memset(IPCB(skb), 0, sizeof(struct inet_skb_parm));
	skb_pull(skb, hlen);

Take skb->len == 29. skb_pull(skb, 30) returns NULL and leaves skb->data
where it was. ip_hdr(skb) then points 30 bytes past skb->data, which is
past skb->tail.

Now add an MRU of 28 and an output vport with hard_header_len 0. A
TUN-mode tun device qualifies, since tun_net_initialize() sets
dev->hard_header_len = 0. do_output() still calls ovs_fragment() because
29 > 28 + 0.

If the stale byte after the tail holds ihl == 5, then hlen = 20, which is
not above skb_headlen() = 29. The new check passes, and so does the
mtu < hlen + 8 check. A longer original packet sent before TRUNC can
control that stale byte.

>From there, ip_frag_init() reads iph->frag_off from beyond the tail.
ip_frag_next() copies the header from skb->data rather than from the
network header:

	skb_copy_from_linear_data(skb, skb_network_header(skb2), state->hlen);

As a result, every emitted fragment carries Ethernet/MPLS bytes as its
IPv4 header, and the stale frag_off bits end up in its frag_off field.

The BUG() in ip_frag_next() no longer looks reachable, because
hlen <= skb_headlen() keeps state->left and skb_copy_bits() in range.
However, in this case the network offset plus hlen is 50 against a
headlen of 29, and the packet is still not rejected.

Would checking skb_network_offset(skb) + hlen against skb_headlen(skb),
or requiring a zero network offset, cover this case? Another option would
be for prepare_frag() to handle the skb_pull() failure.

> +		err = -EINVAL;
> +		goto fail;
> +	}
>  
>  	mtu = ip_skb_dst_mtu(sk, skb);
>  	if (IPCB(skb)->frag_max_size && IPCB(skb)->frag_max_size < mtu)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126064445.57665-1-ljp1205831794%40gmail.com
