Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637175;
	b=kMe0q3sGbmvjwhsYJFbIfMU6dR4L9OMZElp4DQkRxk4o/NrHyJRjTFmZuMTxB6UwF5aZ
	 3iYUQyH7PG8VBTKLqgNC7uWhYW2G2gzCc1aGCecAVeQRoKnIyMWHBc0mrbalss6tWnblP
	 sQ9irJ0bQrWuJeN4pFN2R9CkG6+/fl+UwsnArhn9bDd6kPfQ0wUSBLKicRT1H1D63sSXY
	 XSrhA0mqzJsafR8lE7ePOSv66eeVhQljn7NJG8sfLRDFbZSj0RI4gTw91a3yS8+A/lrud
	 ADtU8QJQmA4aQN3SgMSRPVtbmXMJJySgtW1DQujjAuPBcoAR0BAffl0zbkUClezyQZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637175;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5jgsmVzSGlHu1BnCeIoZeazZeiEnAcWKh0lUHjflEZs=;
	b=H9BY97D4C2CapiP4eaP5gd9qz4ryn3fcFbXNgasT/TkjnXarsmx/qRS+3pojDeUvUifu
	 c8CC1l5gvNue8E6X3Dlzf3isjd46G+8X53WyQa5HKodMM6A5OCGc1ZcLev5r8sY7i3qCw
	 +1FUI47yOdK2Pi423G83Y1FIRbhi+Z+iBrYNqWQJA5yxidDLCm05+UYOdmFRvOTdnEFl3
	 g9/A0q0oAeIY11vCWbKlyx9BmZI3j5ilsVTuqoMxEeNc+Mr04VeyXOdrI9Qx/DwtfB4Op
	 f/CsJUvPi48Kyv1A6Kb3dqMuLwIi1xHS1ZrWRmBLDKNQ+YCMAORWEi/lsSHSm6LjwtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IL98W+WU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E243606A33F
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IL98W+WU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3D51F000C6;
	Wed, 25 Nov 2026 20:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795637174;
	bh=5jgsmVzSGlHu1BnCeIoZeazZeiEnAcWKh0lUHjflEZs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IL98W+WUnnRuIkVx7rdZGqLX0MA0p1+SYPhYp9xXTMJShKNA14wUbNymVHIGxLcOd
	 ipYOkb3Tts/1CpVo2cfuf9zUeJNIMcMYeaAw8Y09Df764dF/oqr3qB/oPJxM6NvWXi
	 quYnxSv7EoauYT9+69IcB1cgL6mQ79eeRq54NGofh9+Uou9tEvq1do6bRPHn+xt8nx
	 LBElUF5OCRBXVgr+vvTJDkSDLNPmtJT5+tvjDXSqOXsQnGShmG5EOhvYAAdASUatrm
	 vKdIsKEB/yjdTT1Bu/bN4vrf+xaqzpEe8EKDVP0MpIp558W2QxdNuoBHeTxixHpwlL
	 Moi4ElbFLqEEA==
Subject:
 Re: [PATCH net-next 5/6] packet: use Ethernet header length in vlan_get_tci()
From: netdev-bot+sashiko@kernel.org
To: willemdebruijn.kernel@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 elder@kernel.org, willemb@google.com
Date: Wed, 25 Nov 2026 20:06:13 +0000
Message-ID: <179563717371.3135.6098889691813253582@kernel.org>
In-Reply-To: <20261124170551.1874487-6-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-6-willemdebruijn.kernel@gmail.com>
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

- [Medium] packet_recvmsg() (net/packet/af_packet.c:3616-3621) now passes
  PACKET_SKB_CB(skb)->sa.ll.sll_hatype to vlan_get_tci() and sets…

--

packet: use Ethernet header length in vlan_get_tci()

This changes vlan_get_tci() to take a device type instead of a device.
For ARPHRD_ETHER and ARPHRD_LOOPBACK devices it now reads the outer VLAN
header at ETH_HLEN, instead of using dev->min_header_len.
packet_recvmsg() now passes the queued sll_hatype instead of looking up
the device by ifindex under RCU.

> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index bf0ad6d5c1e38..b169d3e11b174 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c

[ ... ]

> @@ -3626,19 +3615,10 @@ static int packet_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
>  			aux.tp_status |= TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
>  		} else if (unlikely(sock->type == SOCK_DGRAM && eth_type_vlan(skb->protocol))) {
>  			struct sockaddr_ll *sll = &PACKET_SKB_CB(skb)->sa.ll;
> -			struct net_device *dev;
>  
> -			rcu_read_lock();
> -			dev = dev_get_by_index_rcu(sock_net(sk), sll->sll_ifindex);
> -			if (dev) {
> -				aux.tp_vlan_tci = vlan_get_tci(skb, dev);
> -				aux.tp_vlan_tpid = ntohs(skb->protocol);
> -				aux.tp_status |= TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
> -			} else {
> -				aux.tp_vlan_tci = 0;
> -				aux.tp_vlan_tpid = 0;
> -			}
> -			rcu_read_unlock();
> +			aux.tp_vlan_tci = vlan_get_tci(skb, sll->sll_hatype);
> +			aux.tp_vlan_tpid = ntohs(skb->protocol);
> +			aux.tp_status |= TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;

[Severity: Medium]
Is sll_hatype always filled in for skbs on sk_receive_queue?

For TPACKET_V1/V2 rings, tpacket_rcv() queues a TP_STATUS_COPY skb. Its
sockaddr_ll is zeroed, and sll_hatype and sll_ifindex are never set
afterwards:

net/packet/af_packet.c:tpacket_rcv() {
    ...
				if (copy_skb) {
					memset(&PACKET_SKB_CB(copy_skb)->sa.ll, 0,
					       sizeof(PACKET_SKB_CB(copy_skb)->sa.ll));
					skb_set_owner_r(copy_skb, sk);
				}
    ...
		__skb_queue_tail(&sk->sk_receive_queue, copy_skb);
    ...
}

As far as I can see, only packet_rcv() sets sll_hatype in the cb.

For such a copy_skb, sll_hatype is 0, so vlan_get_tci() hits the new
check and returns 0:

	if (type != ARPHRD_ETHER && type != ARPHRD_LOOPBACK)
		return 0;

The auxdata cmsg would then report tp_vlan_tci 0 with
TP_STATUS_VLAN_VALID set. That happens even when the frame came from an
Ethernet device and carries a real in-band 802.1Q/AD tag.

Before this patch, dev_get_by_index_rcu() failed for sll_ifindex 0, so
the VLAN fields and flags were left clear.

The TPACKET_V2 ring frame for the same packet still calls
vlan_get_tci(skb, dev->type) in tpacket_rcv() and reports the real TCI.
The ring header and the recvmsg() auxdata would then disagree.

One way to reach this is a SOCK_DGRAM socket with a V1/V2 RX ring and
both PACKET_COPY_THRESH and PACKET_AUXDATA set. It then has to receive an
in-band VLAN frame larger than tp_frame_size.

The commit message says:

    - packet_recvmsg() previously omitted the VLAN fields if the device
      had been unregistered since the packet was queued. It now fills
      them from the queued skb.

This assumes the cb always holds the real hatype.

Would it make sense to set PACKET_SKB_CB(copy_skb)->sa.ll.sll_hatype to
dev->type in tpacket_rcv()? Another option is to leave
TP_STATUS_VLAN_VALID clear when the hatype is not Ethernet or loopback.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124170551.1874487-1-willemdebruijn.kernel%40gmail.com
