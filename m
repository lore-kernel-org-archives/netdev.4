Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637172;
	b=1e/Zc6ZSAHcUnn0edvydvPuB4vxw+khSb1Qdt16NHFvxL4H+47fxymRfVCMC1TlBq19z
	 DKfTuQgMIdMVQ4rIg+W90kARHuVBZ+/qBWXljWYzxfiqMTB9fasbQGvKgRDS2nmL4AahN
	 LX/xtGU33ZLYCsTSak8ooGQHcVSfB6yTKUl2GMjhS8N8VXFOXbA1tBW3mA+k64uJwV7gc
	 Qu0OQsdEMi77vc3PfHn2lc9Pe70Tpt3t4doAOifg4uw/Zi/bTnlY+PhA7GSvKgrjYW72G
	 tsSY9mMcuLSbCS3FvZimGPUk44BKpwyjPCZ0ZKU6/wvaq7If5htQueGLknyU4LisekQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637172;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=paAhnZ1B00/VYOGiEJQJittNIUN4WOaYQBUyWbu46us=;
	b=N8BlPUDJfDYgWyiZ870pU1WEUHvcSWcDQIFt4m7cuLUBz5H6wcvv7g9qcstMJ0veqJxY
	 U4uAwQBTiQyL/FWXTtwLdeaz7VWMWbcHYx8bvBq/Lps8Clr0XtPoJ+bVO40ZhtVc7iaKb
	 0yJeulP3vdnJ5NrvzOnN6me1SgsHciagC8ommsFtVtgVrFtOaVJYVEnkZq5V0yv/iTFhI
	 Tnk+SAQsHCJxuJsw77Qs1fxBBgG6YA++6H9Vnl1XCN/8XzYcfODU22Gpp6hBe9prng2tO
	 qeaui/sRUZYnAl971eKGIbWcPm+3ELKJGZ3JC8Di8jzzAnWdIQQiHHfS3DKD5rQU1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hgy6ip4g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799A606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hgy6ip4g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48201F000C6;
	Wed, 25 Nov 2026 20:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795637172;
	bh=paAhnZ1B00/VYOGiEJQJittNIUN4WOaYQBUyWbu46us=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hgy6ip4gtaD/u7rSg6A9itabA8uCxHujIrJxViXM6LLSZLAcMSgCZxqz+ZuQknUrG
	 vw+0EyVC/IybSvgtSeMPq1rrI+INgJHj5FH7jtuNZxOhCP+WNN6pkq+HYH2qOz4URN
	 RkH95v8IBt5ZAJyej7pksJ+93MYcpJup+8qUYD90yeeScR3Q2eYZdjU6jx/aIWRJic
	 b8rIglp+1OmH/fPGJdeMGlc0PvHRw+C1aUaiOsbzIY69HRwAWcKvD5P7ttgCNmik6F
	 33bXZFNPVQN34nlZzI3sKNrBl+ThHtd/WwvcfQaPNMN7bawFvtgQLpEmYjayqtn9Pm
	 Q918PPyBa1ang==
Subject: Re: [PATCH net-next 2/6] net: remove header_ops->validate and
 dev_validate_header()
From: netdev-bot+sashiko@kernel.org
To: willemdebruijn.kernel@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 elder@kernel.org, willemb@google.com
Date: Wed, 25 Nov 2026 20:06:11 +0000
Message-ID: <179563717146.3135.13828888789756005056@kernel.org>
In-Reply-To: <20261124170551.1874487-3-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-3-willemdebruijn.kernel@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In packet_sendmsg_spkt() (net/packet/af_packet.c), the
  SOCK_PACKET send path now checks the packet length against the wrong…

Pre-existing issues:
- [Low] Baseline decision: false (kept only because
  requires_validation=true).

--

net: remove header_ops->validate and dev_validate_header()

This patch removes header_ops->validate and dev_validate_header(). Their
only user, AX.25, has been removed, and so has the CAP_SYS_RAWIO bypass.
The three af_packet callers now compare directly against the snapshotted
hard_header_len.

> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 96c5216a9d6b4..230b16742346c 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -2060,7 +2060,7 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
>  		goto retry;
>  	}
>  
> -	if (!dev_validate_header(dev, skb->data, len) || !skb->len) {
> +	if (len < hard_header_len || !skb->len) {

[Severity: Medium]
Is this check still the same as the old one when the lookup after the retry
returns a different net_device?

packet_sendmsg_spkt() looks up the device by name twice: once before the
skb is allocated, and again after goto retry. hard_header_len is only
read on the first pass:

	/* Keep the allocation-time header length across retry. */
	if (!skb)
		hard_header_len = READ_ONCE(dev->hard_header_len);

The old dev_validate_header(dev, skb->data, len) read dev->hard_header_len
from the device found on the retry. That is the device passed to
dev_queue_xmit(). The new check uses the value from the first device.

Between the two lookups the RCU lock is dropped, and the code sleeps in
sock_wmalloc() and memcpy_from_msg(). User space can stall that copy with
a userfaultfd or FUSE backed buffer. Meanwhile the name can move to
another device: netif_change_name() allows renames while the device is
IFF_UP, the device can be deleted and recreated, or the name can become an
altname on another device.

Take a name that first resolves to a tun device (hard_header_len 0) and
then to a veth device (hard_header_len 14). A 1 byte frame now passes
len < hard_header_len, where the old code returned -EINVAL. Can that frame
then reach dev_queue_xmit() on the veth? If so, eth_type_trans() on the
peer would read eth->h_proto from skb->data past skb->len.

CAP_NET_RAW in a network namespace the user owns is enough to reach this.

packet_snd() and tpacket_fill_skb() have a weaker version of this. They
no longer see hard_header_len grow on the same device (for example
through a bonding type change) during the sleeping allocation and copy.
tpacket_fill_skb() also uses a single value for the whole tpacket_snd()
batch. In those two paths the old live check could also go stale right
after it ran.

The commit message describes these as "direct checks against the already
snapshotted hard_header_len". For packet_sendmsg_spkt(), though, the
snapshot comes from a device that may not be the one sent on.

Later in the series, "packet: validate TX header length before skb
allocation" moves this check into the first-pass if (!skb) block. If I
read it right, the device found on the retry is still never checked at the
end of the series.

[Severity: Low]
This is a pre-existing issue, but with this check the short-header branch
in the allocation path of packet_sendmsg_spkt() looks like dead code:

		if (hhlen) {
			skb->data -= hhlen;
			skb->tail -= hhlen;
			if (len < hhlen)
				skb_reset_network_header(skb);
		}

hhlen is either 0 or hard_header_len. Any skb that takes the len < hhlen
branch is therefore rejected by the len < hard_header_len check after the
retry. The branch already had no effect on sent packets once AX.25 was
removed.

"packet: validate TX header length before skb allocation" removes it later
in the series.

>  		err = -EINVAL;
>  		goto out_unlock;
>  	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124170551.1874487-1-willemdebruijn.kernel%40gmail.com
