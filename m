Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034189;
	b=J+ZS3tHuOk67XM7so35RvyTFk40nY1RyL0h8rde//66mD21SEi2iUgjdVZY34bXy5RDA
	 JN9dXUoXxisWpWrgDo4lThBpPwRyRxgo+hHj92erk/oRJFv0hXgvHpnTsYwCV6AOM0pP6
	 0BYz45xJTplH7jk8VKIhnVIfxI8ZWU/Uv8dHDrYLokWHzZp5Nfm+oDj8+GrJrfrxKC1X6
	 zVN3ZHQKgQMKyuNAUbl7pCEEQcjvuOaGL0ieAuXpaDqD9sguc0yYYyR8hCmFqJaoNNjdv
	 hSzeEzdd2oDmdCAnc90pTYsWul6EMd0kpYly5Yh68aXRfcAd61E7dU58u3z8e58MbEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034189;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UZXKqByYvU6A+FNb9bAsYgap0pYnH7KHiqZ3vXYUXTw=;
	b=VNJtRIOiVsdRUAGDnxT7snN/ZH9mQqIu0oy3r3xsT6VFqFPspdMB8LnCh4v1KXZ7xtw6
	 1v5btzoYOGYsZKTRw+SneESlDpAzA62UllA9BZVr5ybMOkeLhiiGxqfmwq3cmBN8piQo4
	 g+j6RBZCgq4Ms3duUpwvX5hzYj3HOPZaSe+irY59oWzkJLXKVzcpAxP6RsOO4sB6lzvA4
	 ZYJXfCtfyZSK7PUCyent+uqHwGrfy62JztitVYXsdkTZdsIB2H3f7Dg+fslP204Gm50QJ
	 q8xi+55t3R3xnOty/mHRioEH1u30tgBa0Sq/t4/1L+tjdnTmznT+JAOf5uHZydDlJAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Omnt+d6r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9585C60A380B
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Omnt+d6r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20291F000D4;
	Wed, 18 Nov 2026 20:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034189;
	bh=UZXKqByYvU6A+FNb9bAsYgap0pYnH7KHiqZ3vXYUXTw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Omnt+d6r+r4D4V5ovpDMzxyuvOH0oFAoj3YpRzxYRvxo1qVrW9xVyZrZl5Sn/THeN
	 C43bWoV8XJpGBdv3i8/upOl1+bcK9SNNmIbOtR2DM6w8gwbTb9aoNEOdrgUhdBlsqU
	 luAXtjydtUcfPnw2sDtGnIoXw2pvHnYwD4PQsvOoiHG1dLyn36tZ+n2ShHFSwXr8Bj
	 a1y13zgDA5fMaF7+yq/anOPn5jzJ4q1HU6GR6bdc5Z7HJHwQf1jMQPUBkoVHRmaR6N
	 EwVMmkxxNTGRP0gkW31Q+9tPDVnlP9769AegKNt46cpvik1Arx1/KBPRkeKUz3P8FL
	 8m2MOmWCni8aQ==
Subject: Re: [PATCH v1 net 7/8] tcp: Pass inet_sdif() to
 __inet_lookup_established() in tcp_v4_err().
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 20:36:28 +0000
Message-ID: <179503418850.3136.10740335529901076189@kernel.org>
In-Reply-To: <20261117053543.84032-8-kuniyu@google.com>
References: <20261117053543.84032-8-kuniyu@google.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "tcp: Pass inet_sdif() to
  __inet_lookup_established() in tcp_v4_err()." only describes half of…

--

tcp: Pass inet_sdif() to __inet_lookup_established() in tcp_v4_err().

This commit changes tcp_v4_err() to pass inet_sdif(skb) instead of 0 as
the sdif argument to __inet_lookup_established(). The goal is to stop
ICMP errors that arrive through a VRF from reaching sockets that are not
bound to the device.

> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index bc909fedda3a8..35a1309f8b21c 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -504,7 +504,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
>  	int err;
>  
>  	sk = __inet_lookup_established(net, iph->daddr, th->dest, iph->saddr,
> -				       ntohs(th->source), inet_iif(skb), 0);
> +				       ntohs(th->source), inet_iif(skb),
> +				       inet_sdif(skb));

[Severity: Low]
The code change looks correct to me. It now uses the same dif/sdif pair
that tcp_v4_rcv() already uses. However, the commit message only covers
half of the behavior change:

  So, ICMP error coming from VRF can be leaked to a socket not
  bound to the device.

Should the commit message also say what changes for sockets bound to the
VRF slave device?

For a packet received through a VRF, inet_iif(skb) returns the VRF master
ifindex. inet_sdif(skb) returns IPCB(skb)->iif, which is the slave
ifindex. The match is done here:

include/net/inet_sock.h:inet_bound_dev_eq() {
	if (!bound_dev_if)
		return !sdif || l3mdev_accept;
	return bound_dev_if == dif || bound_dev_if == sdif;
}

With the old sdif of 0, a socket whose sk_bound_dev_if is the slave
ifindex never matched in tcp_v4_err(). Such sockets got no ICMP errors at
all, which could leave them in a PMTU black hole.

After this patch those sockets do match. They will now see:

  ICMP_DEST_UNREACH / ICMP_FRAG_NEEDED -> tcp_v4_mtu_reduced()
  hard errors in TCP_SYN_SENT / TCP_SYN_RECV -> tcp_done_with_error()

Users can see this change. Would it help stable backporters and
maintainers to mention it in the changelog?

>  	if (!sk) {
>  		__ICMP_INC_STATS(net, ICMP_MIB_INERRORS);
>  		return -ENOENT;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117053543.84032-1-kuniyu%40google.com
