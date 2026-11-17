Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922236;
	b=5J7hQI5RInz26BNvbSpEmQVYk8PEnn5ypwExEanYmpNwGUaY+DpjXQfm92rorgtK1dnf
	 GjjgQ3ThxHvXb/T2quVr1DMhEvAamO8+nd/njBl8nOtKsowhQlzenoSR0od8R0/17GCJv
	 VNJmz3aBI7VzgT1ZUO5fjBTUSDTY3EwvM+ADDTzA4HC/jUz5x+/YXLj1Krr54VPGgtUc6
	 xQI5GhodbR6Ct2xdfFZJ6A+YQYefs0K9sUqU1HCwn0daK8apOgPP4DfW+Wibe0WrHLWeM
	 iqT7kP30eN2aArjWe8G5jDYgMeAlLvielnL+ypHtG2R6hwNxHs5VrWkhKGY51cp1Ing==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922236;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Mr4RhtpQVXC0FkVsK1HL4NG4Qum+wh08SjtMSrrwgMc=;
	b=FGP+SMc0glxmabwfRPb+DyBr/6QBUx8KnBHGz/bTZ5ctM/46exA0epmw0GlK225SpnN+
	 jGLw2kMXQ2ig3ay1lzjk0rhrwdcpQZKOMTUvQZpXGlwRJiU+KQYCGKMe5EqwNSZnlrG5n
	 Xp5z669wEzI7HFntfzLTuCZQRZjabM8+A6yo3DLVQ7K9Rb6S9s+K8EqM1ONH8w0BfqwFD
	 n8PeiQh6S6+AyfkLcrwKuSzJO2baL+Ac72yzewFPaZs6Nxp1PwHtSvvPK8u3f+JZQ1cPh
	 KBl4tAnL8OEQmk55ydKx/u3wj73SpfhmplB85J0egwQPrtOEa4EuvORLVG/1DZ7PcRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPhLVLIH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92608606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPhLVLIH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798F01F000C4;
	Tue, 17 Nov 2026 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922236;
	bh=Mr4RhtpQVXC0FkVsK1HL4NG4Qum+wh08SjtMSrrwgMc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nPhLVLIH+5xkfZAQ5rDCUz2rkHCMZFNe+utKeCy7tKw1osJItKuRx7iRfKU5CxGOq
	 mqI5ZVgokrXbbsCz0l/3JXpTzftC8t3jF7j6SKTF+IpWvknbs4iPJYC14hNYtapb9Q
	 k4NpS17gfWXkRLuoCb3E4etefePs4xh3aew2vJBIx6tu5iRGc6uoLpZ2Anqz+umbWJ
	 AaPN6HmcUg9vZdWD72OHxi9shvV5EjikPkdeM3/Dgw+HzLetUQt3fxROPORkaRbB48
	 G9ZRoFyK+tk6VHiguahRQPuTJGpSyCWr3Smv+N5qgcdzDO8Gs/guN32qfXG7seC5Iz
	 NPyZORGptRehA==
Subject:
 Re: [PATCH net v2] net: gro: avoid truncating transport header offsets
From: netdev-bot+sashiko@kernel.org
To: imv4bel@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardbgobert@gmail.com, willemb@google.com, kuniyu@google.com,
 netdev@vger.kernel.org
Date: Tue, 17 Nov 2026 13:30:35 +0000
Message-ID: <179492223500.3136.9448543337352524214@kernel.org>
In-Reply-To: <avcJ_0-OqgDlD5GB@v4bel>
References: <avcJ_0-OqgDlD5GB@v4bel>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ipv6: gro: u16 off truncation in ipv6_gro_receive() inflates
  data_offset
- [Low] The commit message says the reproducer is already blocked by a
  GRO extension-header limit.

--

net: gro: avoid truncating transport header offsets

This patch replaces skb_set_transport_header() with
skb_set_transport_header_careful() in ipv6_gro_receive() and
inet_gro_receive(). If the GRO transport offset does not fit in the
16-bit skb->transport_header, the skb is not held as a new GRO head and
goes through the normal receive path instead.

> The IP6_MAX_EXT_HDRS_CNT limit in ipv6_gro_pull_exthdrs() prevents this
> reproducer. However, nested encapsulations can each add an extension
> header chain, so the accumulated offset can still exceed the range of
> skb->transport_header. inet_gro_receive() can also be reached with such
> an offset.

[Severity: Low]
Is this paragraph accurate for the tree this patch applies to? Here,
ipv6_gro_pull_exthdrs() in net/ipv6/ip6_offload.c is still an unbounded
loop with no header counter:

net/ipv6/ip6_offload.c:ipv6_gro_pull_exthdrs() {
	for (;;) {
		int len;

		ops = rcu_dereference(inet6_offloads[proto]);

		if (unlikely(!ops))
			break;

		if (!(ops->flags & INET6_PROTO_GSO_EXTHDR))
			break;
    ...
}

IP6_MAX_EXT_HDRS_CNT is not referenced anywhere in ip6_offload.c.

The limit appears to come from Eric's prerequisite patch. That patch is
only mentioned in the v2 notes below the --- line, and git am drops those
notes. The permanent log would then describe a cap that is not in this
tree, and nothing would point to the patch that adds it. In this tree,
this change is the only thing that stops the KASAN reproducer.

Could the prerequisite be referenced in the changelog itself, for example
with a Link: tag? Or could the sentence be reworded?

The nested encapsulation argument could also be more specific. With a
12-header cap, one GRO pass handles at most two L3 layers through
encap_mark. That comes to about 2 x 12 x 2048 bytes, roughly 49 KB, plus
a small amount of driver headroom. That total is still below 64 KB.

Which path still exceeds the range? One candidate is a second GRO pass
through gro_cells after decapsulation, where the pulled outer headers
become headroom. Could the changelog name the concrete path?

Also, skb_set_transport_header_careful() was added by commit f12c2de4f542
("batman-adv: reject unrepresentable multicast TVLV offsets"). This patch
carries Fixes: 4b0ebbca3e16 and Cc: stable, so stable trees would need
f12c2de4f542 as well. Should that dependency be noted in the changelog?

[ ... ]

> diff --git a/net/ipv6/ip6_offload.c b/net/ipv6/ip6_offload.c
> --- a/net/ipv6/ip6_offload.c
> +++ b/net/ipv6/ip6_offload.c
> @@ -249,7 +249,8 @@ INDIRECT_CALLABLE_SCOPE struct sk_buff *ipv6_gro_receive(struct list_head *head,
>  		skb_gro_pull(skb, sizeof(*iph));
>  	}
>  
> -	skb_set_transport_header(skb, skb_gro_offset(skb));
> +	if (!skb_set_transport_header_careful(skb, skb_gro_offset(skb)))
> +		goto out;
>  
>  	NAPI_GRO_CB(skb)->proto = proto;
>  

[Severity: High]
Can this early exit turn a truncated inner offset into a heap
overflow?

Suppose outer layers advance skb_gro_offset() to just below the
limit, so the outer transport offset still passes the new careful
check. A tunnel and L2 callback such as gre_gro_receive() followed by
eth_gro_receive() can then pull a few more bytes without any U16_MAX
check. The inner ipv6_gro_receive() is entered with off above 65535.
It stores off into the u16 network_offsets[] slot before anything
validates it, so the slot holds off - 65536.

If the inner nexthdr is an extension header, ipv6_gro_pull_exthdrs()
then does:

net/ipv6/ip6_offload.c:ipv6_gro_pull_exthdrs() {
    ...
	skb_gro_pull(skb, off - skb_gro_receive_network_offset(skb));
    ...
}

Subtracting the truncated value advances data_offset by an extra
65536. On a linear skb the extension headers were read through
frag0, so frag0_len is still set.

Before this patch, tcp6_gro_receive() or udp6_gro_receive() called
skb_gro_header() with the inflated offset. That went through
skb_gro_header_slow(), which invalidated frag0. With this change the
careful check fails first. We jump to out with data_offset far past
skb_headlen() and frag0_len still non-zero.

dev_gro_receive() then takes the normal path and calls
gro_try_pull_from_frag0(). grow is roughly 64KB and frag0_len is
non-zero, so gro_pull_from_frag0() copies that many bytes to
skb_tail_pointer(skb), past skb->end. That overwrites
skb_shared_info and the memory after the head buffer.

A single linear skb slightly over 64KB is enough to reach this.
virtio_net, veth, tun/tap and loopback can all deliver one. That
includes devices an unprivileged user sets up in a user and network
namespace.

Could the representability check move to the top of
ipv6_gro_receive(), before off is stored in network_offsets[] and
before ipv6_gro_pull_exthdrs() runs? Making ipv6_gro_pull_exthdrs()
pull relative to skb_gro_offset() would avoid the inflation, but the
truncated network_offsets[] entry would still be wrong for any later
user. inet_gro_receive() stores a truncated network_offsets[] entry
the same way, although it does not inflate data_offset.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/avcJ_0-OqgDlD5GB%40v4bel
