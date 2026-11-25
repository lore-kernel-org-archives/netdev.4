Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637173;
	b=P8HbmoTC1RHyA7pBOXeNIEcTZiGwyWISjzMNeKh4xX5wIHvoTTa+/fUCrEKOdDWqq29E
	 QCZYs+mocCxMp8N/D3ZyNhvCiPynQ/lBc/Q09U5Tv1qoTYV5Uc7KOr6L2IP3LuW1biILx
	 8CEKOpu2FYWm5jVXtBfsxJcJ2ZSOw2O5I798sf2gjEvhV4Wbqp9atzTqjcJeg4IMmPAPg
	 CdyFOL2nKHuncjQiN80USOnp1xfiEnTAmoqCAoEY/iYrYf1smLAbNvbfwKNUonbO1BfpI
	 +zfWRq9Q6aeEtq7bUqZscu/u4x+qalnMR/rksp0pCiSli86jdQIR67cMfrTQlFqtXrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637173;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5TK6R24Cb2mY9pz9CbFvv5hJT9lRBIRvHI65CvSOF68=;
	b=XQrFMCxYMJC4h/6lv9WiaqeZqaL+sLy1cZqirHDqOb0pExCFBuRGhd4MpHds61j1IzQm
	 HZIN1k5fawPcyKCmjLgS+S4uz1Cr9zJfED5ZOW87qxkGE/wM0RwmMxnFsHHPvdMml7a7n
	 Phsr0xzqgnqnyH26E4jzewbLsAAAndEKa88ghQHzWVsL9xDB7LAmoQ8EwEIgnJw3YYRhO
	 G/2JEaWeYtm7BwxYWO8U/Z9cb31QPoqGabD0jX+DEt8f12lgu29h2fY1+9TyvYHdZ6JVN
	 j/zP8joJLi23/CKtY0IV9iZOFkJ7kpobXWsjFlg5p8I3BOcn7l+cev/vqSyFIEuOhZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5ySOJMS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AE606A32C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5ySOJMS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3351F000C6;
	Wed, 25 Nov 2026 20:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795637173;
	bh=5TK6R24Cb2mY9pz9CbFvv5hJT9lRBIRvHI65CvSOF68=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l5ySOJMScnSPcYueTHsnz5pLl78/iTzkycEyy3mANznTq+RExHCXWjrxxROBNeti0
	 8LgnJkc/XnWVPw/w57zhDlb9UcLpaIJBLK/n+kRPgrhaAxvSH8NlBAKSE7uPm8U98c
	 dVnC6P/FG0CN3yu8oyqosahg7990/0bbrHyArgA5LH+9/Wlda3qMVTz+E0iqLBcVwe
	 IVlpwvTjpbhjpeNvhmSWh5vGg/T5xqc+evEQx5VxPDxWDLYYja12HjbtMRBU1wDzLq
	 79jqyAHNDo7PXGCqpuuajz+oismF8x67WtNEZcMFLQ96wUxUrNPfkZz9mSXw46wBKP
	 W64CNtBMVpkqQ==
Subject: Re: [PATCH net-next 3/6] packet: validate TX header length before skb
 allocation
From: netdev-bot+sashiko@kernel.org
To: willemdebruijn.kernel@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 elder@kernel.org, willemb@google.com
Date: Wed, 25 Nov 2026 20:06:12 +0000
Message-ID: <179563717264.3135.14653977581584751949@kernel.org>
In-Reply-To: <20261124170551.1874487-4-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-4-willemdebruijn.kernel@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In packet_sendmsg_spkt() (net/packet/af_packet.c), the header-
  length check (`len < hard_header_len || !len`) now runs only on the…

--

packet: validate TX header length before skb allocation

This patch moves the TX header length checks in packet_sendmsg_spkt(),
tpacket_snd() and packet_snd() ahead of skb allocation. The checks now
compare against the snapshotted hard_header_len. It also drops the
network header reset in packet_sendmsg_spkt(), which can no longer be
reached, and the hdrlen clamp in tpacket_fill_skb().

> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 230b16742346c..e8326cade94af 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -2024,8 +2024,13 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
>  	}
>  
>  	/* Keep the allocation-time header length across retry. */
> -	if (!skb)
> +	if (!skb) {
>  		hard_header_len = READ_ONCE(dev->hard_header_len);
> +		if (len < hard_header_len || !len) {
> +			err = -EINVAL;
> +			goto out_unlock;
> +		}
> +	}
>  
>  	err = -EMSGSIZE;
>  	if (len > dev->mtu + hard_header_len + VLAN_HLEN + extra_len)

[ ... ]

> @@ -2060,10 +2063,6 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
>  		goto retry;
>  	}
>  
> -	if (len < hard_header_len || !skb->len) {
> -		err = -EINVAL;
> -		goto out_unlock;
> -	}
>  	if (len > (dev->mtu + hard_header_len + extra_len) &&
>  	    !packet_extra_vlan_len_allowed(dev, skb)) {
>  		err = -EMSGSIZE;

[Severity: Medium]
With this check removed, is len ever validated against the device that
actually transmits the skb?

The new check in the first hunk only runs while skb is NULL. It uses the
device returned by the first dev_get_by_name_rcu() lookup. After that,
packet_sendmsg_spkt() drops the RCU read lock and calls sock_wmalloc()
with GFP_KERNEL and then memcpy_from_msg(). Both can sleep. It then jumps
back and looks the device up again by name:

retry:
	rcu_read_lock();
	dev = dev_get_by_name_rcu(sock_net(sk), saddr->spkt_device);

Suppose spkt_device now names a different netdev (renamed, or deleted and
recreated) with a larger hard_header_len. Only the MTU checks remain
before dev_queue_xmit().

For example, a 1 byte frame sized for a tun device (hard_header_len 0)
could be sent on a veth device (hard_header_len 14). This needs
CAP_NET_RAW and CAP_NET_ADMIN. Both are available inside an unprivileged
user plus network namespace.

On veth the call path is:

veth_xmit()->veth_forward_skb()->__dev_forward_skb()->eth_type_trans()
->eth_skb_pull_mac()

eth_skb_pull_mac() reads the ethhdr at skb->data even when skb->len is
less than ETH_HLEN:

include/linux/etherdevice.h:eth_skb_pull_mac() {
	struct ethhdr *eth = (struct ethhdr *)skb->data;

	skb_pull_inline(skb, ETH_HLEN);
	return eth;
}

Would eth->h_proto and the pkt_type classification then come from
uninitialized bytes past skb->len?

Before the series, dev_validate_header(dev, skb->data, len) ran after the
retry. It checked the live transmit device, inside the same RCU section
as dev_queue_xmit().

The earlier patch "net: remove header_ops->validate and
dev_validate_header()" switched that check to the snapshotted value. This
patch then removes the post-retry check. The gap is still there at the
end of the series ("net: remove unused net_device::min_header_len").

Could len be checked here again against READ_ONCE(dev->hard_header_len)
of the retry device? Another option is to bail out if the device changed
between the two lookups.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124170551.1874487-1-willemdebruijn.kernel%40gmail.com
