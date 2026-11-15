Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776451;
	b=1QoJCHylMmsFCR1fUcvNRbKGPtz86vTmJl+q1euncT1cHtsVjs3HRYQ+NJZ08uPZA+Bd
	 gsaASJMCRy36KaZYFLfntPDqmMR0eiCNirMiC7/cWP5lVLYyj0mS44kTHecCaudbbD+SC
	 NNEMsnJmvA3sLLq5sbuq5X03gUrQY0F52gSyHDhq6OSyjHvoVqva0YG67sBXi+X6X6GNQ
	 n5ywGe1sonkA7dY7twjyfa6VeaKiR6Y7ZSzrU2OXjxM9E7YXmFzkv++305bTR+qJ6tFct
	 ZTWA+sTjpLguIBrVNSMuF3FqwH6R99NzXikNFD2LOta0gmnL9flv7AvtGpoCDpF8ZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776451;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UqIJmtvRDKRfu1ptiSFwymwMCBk4rsBZ0yFLQO+N54U=;
	b=dT4LKNWBvI87hGrlQUdHRKbeQKYZb4lJ/88qYaBrog9IW00XEO1ODZcReu6hahS23Mv3
	 Y0e3idiQW4ceUhOzlJgPP1DgdwHYb25OdUvB/iulJMDJWIPbI+3IBaa8BeXULnEiEnM0W
	 3u25aXvu1JGwgA5utsywzDfUPBixlIzPTUdNbqOurV2VZWtUxAa5yWxBdzBr7Dyu5QKbO
	 c40b3/LcHwOLt/R6oRkPylfg6Qdx9babo+uPgL4zw+5BYsNkVxXnBTf4K14uyhiwHkg0l
	 CJk/Jb/cAC4jY1FZUo6q+pldAxEfZLRQn2iuK8O8K6UbR1LsaxOwUwzzYnqyxzNpRdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bu5tzbos;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C97606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bu5tzbos
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A4A1F000C4;
	Sun, 15 Nov 2026 21:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794776451;
	bh=UqIJmtvRDKRfu1ptiSFwymwMCBk4rsBZ0yFLQO+N54U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bu5tzbos2QiB2LtjljzAYAhb5tLKIW3BADauqNOj5wcrMxm9E7sPxF6kVmDU91RfJ
	 eWllr3/s5EyuC4DsJYp5z4zsZ58EV/q83N5ScNDPwX/4kpMIUA3vuREy5J4msP4thj
	 pIxsBi5ChMIdo+i2huA17Kno/tRcB3AJFo4VJufLvRY29+i8ky+0LqrKXfAjOJO0qr
	 InSuS/JVBwHWvcNPBxS7sSDxa8ZazoWGYJ610VEEO0J88cLB3nkZ59mx+c1pkMKkh6
	 zvYi34St4LnH8xdFeQu6Zb+Y/HrUku83SfsmOkhAm6NLH1LI2MbCiAEKwK8aJ8W2Fu
	 AN/BAmiYc0tjA==
Subject: Re: [PATCH net] ipv6: gro: avoid truncating transport header offsets
From: netdev-bot+sashiko@kernel.org
To: imv4bel@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardbgobert@gmail.com, willemb@google.com, kuniyu@google.com,
 netdev@vger.kernel.org
Date: Sun, 15 Nov 2026 21:00:50 +0000
Message-ID: <179477645054.3136.6006784384185368116@kernel.org>
In-Reply-To: <avTTQNyvwPP6LtGx@v4bel>
References: <avTTQNyvwPP6LtGx@v4bel>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete because inet_gro_receive() still truncates
  the 16-bit transport header offset.

--

ipv6: gro: avoid truncating transport header offsets

This patch switches ipv6_gro_receive() to skb_set_transport_header_careful().
A long IPv6 extension header chain can no longer silently truncate the
16-bit skb->transport_header offset. If the offset can't be represented,
the skb is not held as a GRO head.

> diff --git a/net/ipv6/ip6_offload.c b/net/ipv6/ip6_offload.c
> index 700f1861d8eb7..de4bab42359ba 100644
> --- a/net/ipv6/ip6_offload.c
> +++ b/net/ipv6/ip6_offload.c
> @@ -241,7 +241,8 @@ INDIRECT_CALLABLE_SCOPE struct sk_buff *ipv6_gro_receive(struct list_head *head,
>  		skb_gro_pull(skb, sizeof(*iph));
>  	}
>  
> -	skb_set_transport_header(skb, skb_gro_offset(skb));
> +	if (!skb_set_transport_header_careful(skb, skb_gro_offset(skb)))
> +		goto out;

[Severity: High]
Is the fix complete? This check only validates the outer IPv6 transport
offset, so any value up to 65534 passes.

ip4ip6_offload is always registered for IPPROTO_IPIP in ipv6_offload_init()
via inet6_add_offload(&ip4ip6_offload, IPPROTO_IPIP). Its handler,
ip4ip6_gro_receive(), passes the skb straight to inet_gro_receive(), which
still does an unchecked assignment:

net/ipv4/af_inet.c:inet_gro_receive() {
    ...
	skb_gro_pull(skb, sizeof(*iph));
	skb_set_transport_header(skb, skb_gro_offset(skb));
    ...
}

ipv6_gro_pull_exthdrs() does not limit the chain length. Take a packet of
the form IPv6 + DSTOPTS chain + IPIP + IPv4 (0x45) + TCP/UDP. Choose
ext_len so that (skb->data - skb->head) + 40 + ext_len falls in
65516..65534. That window is 19 bytes wide, so it always contains a
multiple of 8.

Such a packet passes skb_set_transport_header_careful(). The 20-byte inner
IPv4 header then pushes the offset to 65536 or more. transport_header wraps
to 0..18, which points into the headroom at p->head:

ipv6_gro_receive()
  ipv6_gro_pull_exthdrs()
  skb_set_transport_header_careful()   <- passes, offset <= 65534
  ip4ip6_gro_receive()
    inet_gro_receive()
      skb_set_transport_header()       <- offset + 20 truncated
      tcp4_gro_receive()
        tcp_gro_receive()
          gro_receive_network_flush()

For a held packet p, tcp_gro_lookup() compares ports through tcp_hdr(p).
If they match, gro_receive_network_flush() gets a negative
skb_transport_offset(p). That leads to the same read, about 64KiB before
p's network header, that the commit message describes.

If the packets merge, it gets worse. tcp4_gro_complete() would write
th->check through the truncated tcp_hdr() into the headroom, and
tcp_gro_complete() would set csum_start from the same bad pointer.

GRE over IPv6 looks like it reaches inet_gro_receive() the same way, since
gre_offload is also registered with inet6_add_offload(). So do UDP tunnels
over IPv6 that carry an inner IPv4 header. In those cases the extra
encapsulation bytes make the window wider.

Should inet_gro_receive() also use skb_set_transport_header_careful()? Or
could the check be done in one common place so every L3 GRO handler is
covered?

>  
>  	NAPI_GRO_CB(skb)->proto = proto;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/avTTQNyvwPP6LtGx%40v4bel
