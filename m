Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618383;
	b=qa2JSrGJsr8rLNt9s9Z6C7dMFRHMQLVHO5RXMTpIcjR8oagBWvIKuS3YuKTDcgpEsrg0
	 e8GLYFT11Akz2J01CG69A7FZr2YY0Q6R1xe8rlU8sH75C+pf/wT1a9jYkqvGXw8r7VeVL
	 5DEMjdfz/7W76ECFfuZOCk/PyMWNDAJiho3NC28hAUVc6kFBkQyqkmpt865Pmbcdk953v
	 8VyXDtJ5U6u3usXbz0wJfJT3J9kJZhPzjUwTBL4qaZLOGtloEBUXJFud91bGpa/gnLmiB
	 twJHfsAL9fyHiTmuSh3Xi8BBEd/nVSxGua2ethx1oTMyJEwHeAyjjcu5Zei6N3tEC0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618383;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZfaAbcHFzwnqD8Yx7AwqfeLH9FO2bVWm75QTBtRJXw4=;
	b=0ZFfHXuMG4NTqtzGY2CdGloez+yZ9LaB2/2/ov2IO8HleJL4r0qJusNYtL6S/hiDoiZ0
	 uy/iB0u7mm0K6jvMpScxbqYo446YFnkRRpi5jg7BnHOZg62k2r7Ymi3fdBbjJsx+qhJfe
	 1QlMLV68ivUH/bx7hpTKXspxyqB9vTbdRZmMuswDqYE1lrsKCp5w9OJBiH8TPdL9TYc2N
	 EgVrxftUHaqGFNz5BEJGB9OyxdBzKuS0+ppEyZLKAFZUekx+69W4wWZ1qr9ySjNsYYnao
	 ZZSrMN53siSPOylHTY9Mw4HnhvxnfMv2eZFGkq1p2D7WGalZHNtHpInxa6fxu2CciIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nXGOsk8e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F732606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nXGOsk8e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B041F000C0;
	Wed, 25 Nov 2026 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618382;
	bh=ZfaAbcHFzwnqD8Yx7AwqfeLH9FO2bVWm75QTBtRJXw4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nXGOsk8egYB/V9WxRPfcibyN6k1qVKAEiFrw6/Q2FlrF/9kbLUNRLvF2HoMjQL7YS
	 7N7xRYctgqMplJigeIdPekVtEyg51cSngLgUxzo5PjEdfbk2MgPk0cMlO2N3pL3vkW
	 1jOrxSC6d4iWYdOYNdxMaYFPNDEPz/KdNwAAgxdMuLFlZhOuvYZeAw4LgJtVdYhpDT
	 4cg1Z3XxruXM6es2T0h20g78VZ0+kgNWizvUJBw0d1BnVFxBz5BhBq2WT302r3XpIw
	 XzNCjij3aahlaOqQleJ47wbDzzd5zGx/V4KofEdUP0JrxVdvJ84kKvDz9UwvdmLMaa
	 Uge47ovRKQTMw==
Subject: Re: [PATCH net v6 1/3] net: openvswitch: read the datapath features
 once when sending an upcall
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, dev@openvswitch.org, aconole@redhat.com,
 echaudro@redhat.com, i.maximets@ovn.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 matttbe@kernel.org, shuah@kernel.org, netdev-bot+sashiko@kernel.org
Date: Wed, 25 Nov 2026 14:53:01 +0000
Message-ID: <179561838178.3135.17043215376942642309@kernel.org>
In-Reply-To: <20261124145033.627044-2-houminxi@gmail.com>
References: <20261124145033.627044-2-houminxi@gmail.com>
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

- [Low] In net/openvswitch/datapath.c, the comment added to
  queue_userspace_packet() above `features =…

--

net: openvswitch: read the datapath features once when sending an upcall

queue_userspace_packet() reads dp->user_features once to decide whether
the packet is copied linearly. pad_packet() reads it again after the copy.
A concurrent OVS_DP_CMD_SET can change the bit between the two reads, and
pad_packet() can then call skb_put_zero() on a nonlinear skb. The patch
reads the field once and passes that value to pad_packet().

> diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
> index b2a0b09fd4a56..96baa2488c266 100644
> --- a/net/openvswitch/datapath.c
> +++ b/net/openvswitch/datapath.c

[ ... ]

> @@ -494,11 +495,18 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
>  	    (err = skb_csum_hwoffload_help(skb, 0)))
>  		goto out;
>
> +	/* A concurrent change to the features can land between the head room
> +	 * decision below and the padding after the copy, which would pad a
> +	 * nonlinear skb and trip SKB_LINEAR_ASSERT. Read the field once and use
> +	 * that value for both.
> +	 */

[Severity: Low]
This isn't a bug, but is "head room decision" the right term for this
comment in queue_userspace_packet()?

The code below doesn't decide any headroom. It picks hlen, the number of
bytes skb_zerocopy() copies into the linear part of user_skb:

	if (features & OVS_DP_F_UNALIGNED)
		hlen = min(skb_zerocopy_headlen(skb), cutlen);
	else
		hlen = skb_len;

hlen then sizes the message in upcall_msg_size() and is passed as the
linear copy length to skb_zerocopy(user_skb, skb, skb_len, hlen).

In skb code, headroom usually means skb_headroom(). struct datapath also
has a separate max_headroom field, which isn't involved here.

Could the comment say "linear copy length (hlen)" instead? The later
patches in the series don't change this comment.

> +	features = READ_ONCE(dp->user_features);
> +
>  	/* Older versions of OVS user space enforce alignment of the last
>  	 * Netlink attribute to NLA_ALIGNTO which would require extensive
>  	 * padding logic. Only perform zerocopy if padding is not required.
>  	 */
> -	if (dp->user_features & OVS_DP_F_UNALIGNED)
> +	if (features & OVS_DP_F_UNALIGNED)
>  		hlen = min(skb_zerocopy_headlen(skb), cutlen);
>  	else
>  		hlen = skb_len;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124145033.627044-1-houminxi%40gmail.com
