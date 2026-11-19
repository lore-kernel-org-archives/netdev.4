Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069350;
	b=gbKiGUvSbuTDgV3tqLKPy0GvYzkScZ23J0qtOy/EXkPDS1xm/pbTH4+Qkhfh2fQslE67
	 OzykLwSb30EpQZY5/xg+CxWZMWnEZFhfvRVizPeD/WzPD359SMUXANKtmlKVcNfEiQ7EJ
	 kYXWwGsjO/wBD5AAM5nkrzMNZPfj1LXpH62AKMOyxVmY/WV3nMdyUCMY+eejIwLRVgumy
	 37fI84yei8v7G/sVSHFLOm8dByv7I/2hYNcUIL6W/bccG12cK2IAIEcCTl35JZ6MjtEYe
	 6NBe5x4CbR4hpSyTKB29LLq/mTD5emn3ud5ZAjjUhR+CYFWT0Zoh9Nb535Fxt227UTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069350;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mBBLFHn2+33Nh68ew1lXsaRwuuz7TPCR0eOaeXY0uQY=;
	b=cxrx3QL9NU5VdpTKEFZzW4zuzmpelEJIFOAk6b96pfvB1x523A4I9PbLa0UfIBUK1/vd
	 nghf0z16R4xUyTeUTCcjIFubbZV6lXZqwMoehZP8GdKjyjDw9IIto3p/t/pOLZVczCepV
	 CNt+MpKPrp/EcgTdr6uD/d8eb6AE+etWHc3IkpfWYd+e3s1ohsw3nv7T2ptq8+8ly5IUF
	 MB8N+vDb4Jlw9l/0wxqS5d0LavVJb0ILG1FA3MnjJCP3OqRFCb58T9lEWbGzRXhnhA4TP
	 t0HUOgXOmvfvG0DkqwdlnrnZ2PBF1QaGGj80G4COnYUJVtDeqYNf2Zxn2PdXz6pcXFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foLa6Lrz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C877606A326;
	Thu, 19 Nov 2026 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foLa6Lrz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9AF1F000C5;
	Thu, 19 Nov 2026 06:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795069350;
	bh=mBBLFHn2+33Nh68ew1lXsaRwuuz7TPCR0eOaeXY0uQY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=foLa6LrzsH1eeQA4Tfrvomi+9TBkSodt9806M+hQDPTqYkjbDkZ1k0JoSGBr69AQ2
	 C0JH33sW0z+JpQ82ykBeCBt6l4Y1aBrOb4c3xs9ypBhgACUqNzJ4DBsTwmLEUecanA
	 QGCTrdthpNNYUJ9sjJeodSs8vEyLVdu5j0Y0Cv2Gdu89J3ygRf/0FIRBZKMKFP7knx
	 9wPb9rdDap49CHFO0EG5ngfDZW6LqWSNiLdzfKreaGFMCBCRuKX81boeY/TTHexEvg
	 aewXaVl9zpJLSBbKKekNCWdypa6b5t8leHfgx7wDjyVL1tMeJsGCxX6c9dgOrpyfVS
	 I6FBCU89ADnbA==
Subject:
 Re: [PATCH net v2] net/sched: act_csum: bound the IPv6 jumbo payload length
From: netdev-bot+sashiko@kernel.org
To: piyus@iiitd.ac.in
Cc: jhs@mojatatu.com, jiri@resnulli.us, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, kapil@presceralabs.ai
Date: Thu, 19 Nov 2026 06:22:28 +0000
Message-ID: <179506934898.3136.2983483959880388164@kernel.org>
In-Reply-To: <20261116182108.2581258-2-piyus@iiitd.ac.in>
References: <20261116182108.2581258-2-piyus@iiitd.ac.in>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The v2 changelog says the TCP, ICMPv6 and UDP-Lite ul == 0
  paths were exposed only to "a bounded over-read of up to 63 bytes",…
- [Medium] The changelog understates who can trigger the bug.

--

net/sched: act_csum: bound the IPv6 jumbo payload length

This patch bounds the jumbo payload length parsed by
tcf_csum_ipv6_hopopts(). The length must exceed IPV6_MAXPLEN, the IPv6
payload_len must be zero, and the claimed length must fit within the skb.
This stops the ipl + ntkoff sum in tcf_csum_skb_nextlayer() from wrapping
and keeps csum_partial() from reading past the end of the skb.

Link: https://lore.kernel.org/r/20261112075159.3552470-1-piyus@iiitd.ac.in
Link: https://lore.kernel.org/r/20261112075445.3555341-1-piyus@iiitd.ac.in

> 16-bit length, since ul <= ipl - ihl compares against ~4.29e9, and
> csum_partial() reads that many bytes off the end of the skb.  (The plain
> UDP arm is not affected: it requires ul == ipl - ihl.)

[ ... ]

> So "action csum tcp" and "action csum icmp" setups were exposed to a
> bounded over-read of up to 63 bytes on kernels built without KASAN, while
> the 65535-byte read reported below is the UDP-Lite case specifically.

[Severity: Medium]
Is this impact statement complete? It covers only reads, but the same
wrapped-ipl path also seems to allow out-of-bounds header writes.

When ipl + ntkoff wraps, the only check that any transport header bytes
exist is the loop guard in tcf_csum_ipv6(). It covers one byte:

    } while (pskb_may_pull(skb, hl + 1 + ntkoff));

tcf_csum_skb_nextlayer() then lets the wrapped ipl through. Also,
skb_try_make_writable() does not check the length:

    if (!pskb_may_pull(skb, ipl + ntkoff) || (ipl < hl) ||
        skb_try_make_writable(skb, hl + ntkoff))

After that, the handlers store to header fields whose offsets were never
checked:

    tcf_csum_ipv6_tcp():   tcph->check = 0;          (bytes 16-17)
    tcf_csum_ipv6_icmp():  icmp6h->icmp6_cksum = 0;  (bytes 2-3)
    tcf_csum_ipv6_udp():   udph->check = 0;          (bytes 6-7)

In tcf_csum_ipv6_udp(), the udph->check store comes before the ul tests:

    ul = udp_get_len_short(udph);

    udph->check = 0;

    if (udplite) {
    ...
    } else {
        if (ul != ipl - ihl)
            goto ignore_obscure_skb;

So the plain UDP arm cannot do the large read. It still writes at an
unchecked offset, though, and udph->len is read from the same unchecked
header.

On the rawv6_send_hdrinc() path, the skb is allocated with
length + hlen + tlen + 15 bytes. With tlen = 0 and a length of the form
41 + 8k, the tailroom can be exactly 15 bytes. Two examples are 353 bytes
in the 704-byte small head and 673 bytes in kmalloc-1024. With a 1-byte
TCP header, tcph->check then lands on skb_shared_info at skb->end. KASAN
would not flag this because the store stays inside the allocation.

The code change closes all of these paths, since the new bound on *pl
keeps ipl + ntkoff within skb->len. v2 was a changelog-only respin meant
to describe the exposure. Could the changelog also mention these writes,
and qualify the statement that the plain UDP arm is not affected?

[ ... ]

> The packet is generated locally through a raw AF_INET6 socket with
> IPV6_HDRINCL and leaves an Ethernet device, so skb_network_offset() is
> non-zero and the sum above wraps.  Reaching it needs a clsact qdisc with
> a csum action carrying TCA_CSUM_UPDATE_FLAG_UDPLITE, which is
> CAP_NET_ADMIN in the network namespace - reachable by an unprivileged
> user through a user namespace.  The folded checksum of the out-of-bounds
> bytes is written into the packet and transmitted.

[ ... ]

> Conditions it needs: a clsact qdisc with a csum action carrying
> TCA_CSUM_UPDATE_FLAG_UDPLITE, on an Ethernet-type device, with the packet
> locally generated so that skb_network_offset() is 14 and the sum in
> tcf_csum_skb_nextlayer() can wrap.  CAP_NET_ADMIN in the network namespace,
> which CONFIG_USER_NS makes reachable by an unprivileged user.

[Severity: Medium]
Can a wider set of senders trigger this than described here?
CAP_NET_ADMIN is needed to install the csum action, but not to send the
packet that reaches it.

A bridged IPv6 frame from another host also arrives at tc egress with
skb_network_offset() equal to 14:

__netif_receive_skb_core()
    skb_reset_network_header(skb);
  -> bridge rx_handler -> forward
br_dev_queue_push_xmit()
    skb_push(skb, ETH_HLEN);
    dev_queue_xmit(skb);
  -> tc egress -> tcf_csum_act() -> tcf_csum_ipv6()
     -> tcf_csum_ipv6_hopopts()

These frames never pass through ipv6_rcv() or its jumbo option checks.
The only bridge-side check is br_validate_ipv6()->nf_ip6_check_hbh_len(),
and that only runs with br_netfilter.

act_mirred ingress-to-egress redirects also push the MAC header back, so
ntkoff is mac_len at the target device's egress.

Take a bridge, VM tap or container veth host where action csum is
installed on a port's egress. A remote, guest or container sender with no
privilege on the host could send a jumbo length of 0xFFFFFFCA. That would
trigger the UDP-Lite read, or the TCP/ICMP over-read and header writes,
and the folded checksum would be transmitted.

The new bound uses skb->len - skb_network_offset(skb), so the fix covers
these paths too. Since this affects stable and security triage, could the
changelog and the conditions note describe this broader exposure rather
than only locally generated packets?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116182108.2581258-2-piyus%40iiitd.ac.in
