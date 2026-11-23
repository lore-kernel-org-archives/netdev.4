Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456820;
	b=0xp7aKnqYd1vLTpMHC0PZAOdQwf/x3AXi6EXGWkYq2opF4SByiqjt25kGGHBkbUtgDYl
	 2SG+KswCjj8iRH7qOt6NBHprKIqdsTrWKFdQYxwdIi3A+89mJGKWHPjXQ2ABcdyh3vZj0
	 A2vMIN2PNA39Khz9h45UWMiWxvYF49TWPRiw05w3SuNHrgSIqsiCedTnNV/qebTVFyjUH
	 cQ5a234WMUW2FfIG5mpLq7RFBXArodZB+W30ekmMGfaqaG347hzexeK2d63OXUhMX+er0
	 HKP6G/RcclXJt9ggsrxKJB2xswZW1memY6tYtP72MNnRVn2L2qxuUSPQiXVlb8bFfAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456820;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VCDgVwIkgLge8GbQvw7KHx7sko0csoUykFdgfMQXgFM=;
	b=APxG5/Qv+h2iXU1tUFCnlpkbPJh5n1PPKvbVNxnMf896YyS02Iqi0vkwcLHqmtww7ksE
	 pGTu+DjbVkBCVTsc4CThmKGA4tK6IB9Pq9J8D8/K0EHnDoNGRZyOMuVyN9idlGm7fsdW1
	 /fwoSb7wJqcOyCuQTfDQgCbua3N9iFgzJrpz9WgRTbMwWc0aPL/06P3HPvq75k39yQou1
	 yxb3DHUMNMQMrxNlgpN60S9gYPAWBUwEAMNwr9NXtq4MkW5Wi6C5TBYi4k5jxg5WWVpkK
	 ImFxzN9FSNe5qcgb1QtlsOJqpfSxTNz7Cy3LJSW9/C6QEzW86SnscelznuWi2Wu5zUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiAZc5ki;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C3F606A321;
	Mon, 23 Nov 2026 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiAZc5ki
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502661F000D1;
	Mon, 23 Nov 2026 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795456820;
	bh=VCDgVwIkgLge8GbQvw7KHx7sko0csoUykFdgfMQXgFM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SiAZc5kiVYEA2z4xL5BwqF+GHuzD7MWu9w6aGI7XCDZPo3LBsrS93UFXFoFXDY0o0
	 lJcVCtQRmWGmd8ImF4sBgYj4e6EkmDM3kCtWrd3I9Eqy4DMVsDzGb8hkWEEYEcHKJ8
	 KQ0Zmpv2Gd3mCSSy12qeK5ErOyqf89+DNZLW4DKUJrr0qmh0fERtNA2KOwP5kTJU7J
	 xQoBH66qED4WJP5lRE2lmxUHDa5o2sckcDt7EGkzGAsCTmaPFdPc0nwYeKrpc34C1x
	 A6KDnAN36sRVjh8XZ8hAu24LD4kLsw1xeqXjmN7hb8926J0YVWki3sI7bCdbeUsCI1
	 jbsY1bqrvmOgg==
Subject: Re: [PATCH net-next] net: dsa: tag_rtl8_4: add support for RTL9607C
 tag variant
From: netdev-bot+sashiko@kernel.org
To: adilov@disroot.org
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 alvin.sipraga@analog.com, linusw@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, zectaiga@gmail.com
Date: Mon, 23 Nov 2026 18:00:18 +0000
Message-ID: <179545681886.3135.12744267158619416896@kernel.org>
In-Reply-To: <20261119165129.26693-1-adilov@disroot.org>
References: <20261119165129.26693-1-adilov@disroot.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch adds a new DSA tag protocol, DSA_TAG_PROTO_RTL8_4AP
  (value 38), and the tagger rtl8_4ap_netdev_ops.
- [Medium] rtl8_4ap_read_tag() (net/dsa/tag_rtl8_4.c, lines 296-306) uses
  a deny-list to decide whether the switch already forwarded a received…
- [Low] The patch makes tag_rtl8_4.c cover a second chip family, but some
  existing documentation was not updated and the new comment contradicts…
- [Low] The comment and the code in net/dsa/tag_rtl8_4.c disagree on what
  REASON means for the rtl8_4ap tagger.

--

net: dsa: tag_rtl8_4: add support for RTL9607C tag variant

This commit adds a new DSA tag protocol, rtl8_4ap (DSA_TAG_PROTO_RTL8_4AP),
for the variant of the 8 byte Realtek protocol 4 tag used by the switch
embedded in RTL9607C SoCs. The tag sits after the source MAC, as with
rtl8_4, but the fields are laid out differently and the TX and RX layouts
differ from each other.

> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index 09f3043d57f06..6f86c76253043 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
> @@ -63,6 +63,7 @@ struct tc_action;
>  #define DSA_TAG_PROTO_MT7628_VALUE		35
>  #define DSA_TAG_PROTO_KS8995_VALUE		36
>  #define DSA_TAG_PROTO_LAN9645X_VALUE		37
> +#define DSA_TAG_PROTO_RTL8_4AP_VALUE		38

[Severity: Medium]
Which switch driver is expected to select DSA_TAG_PROTO_RTL8_4AP?

The only in-tree user of the protocol 4 taggers is rtl8365mb. It only
returns the two existing values:

drivers/net/dsa/realtek/rtl8365mb_main.c:rtl8365mb_get_tag_protocol() {
    ...
	if (cpu->position == RTL8365MB_CPU_POS_BEFORE_CRC)
		return DSA_TAG_PROTO_RTL8_4T;

	return DSA_TAG_PROTO_RTL8_4;
}

Likewise, rtl8365mb_change_tag_protocol() only accepts DSA_TAG_PROTO_RTL8_4
and DSA_TAG_PROTO_RTL8_4T.

So nothing in mainline can reach rtl8_4ap_tag_xmit() or rtl8_4ap_tag_rcv().
The patch still permanently reserves protocol ID 38 and adds the module
aliases "id-38" and "rtl8_4ap".

The commit message says:

    Add basic necessities for this cpu tag variant to function.

However, the RTL9607C switch driver that would use this tagger is not part
of the submission. The only testing mentioned was on an out-of-tree OpenWrt
6.18 kernel.

Could this be resubmitted together with the switch driver that consumes it?

[ ... ]

> diff --git a/net/dsa/tag_rtl8_4.c b/net/dsa/tag_rtl8_4.c
> index 4da3beebef75e..c934c232d330e 100644
> --- a/net/dsa/tag_rtl8_4.c
> +++ b/net/dsa/tag_rtl8_4.c
> @@ -74,6 +74,54 @@

[ ... ]

> + * On CPU->Switch however the byte 3 is also different:
> + *
> + *  |-----------------------------------+-----------------------------------|
> + *  |              (8-bit)              |             (8-bit)               |
> + *  |          Protocol [0x04]          |         TX_PORTMASK_LOW           |
> + *  |-----------------------------------+-----------------------------------|
> + *  |     (3-bit)    |(1)|   (1)  | (3) |(1) |(1)|   (1)   |(1) |(2)| (1) |1|
> + *  |TX_PORTMASK_HIGH| X | PRI_EN | PRI |KEEP| X |LEARN_DIS|PSEL| X |DIRTX|X|

[Severity: Low]
This isn't a bug, but the CPU->switch diagram calls the forwarding port
mask TX_PORTMASK_LOW and TX_PORTMASK_HIGH. The glossary earlier in the file
says "RX (CPU->switch): forwarding port mask", and the code names the same
fields RTL8_4AP_RX_LO and RTL8_4AP_RX_HI. Should the diagram say RX to
match?

The new macros also mix two prefixes: RTL9607C_RX_HI_MSK sits next to
RTL8_4AP_RX_LO and RTL8_4AP_RX_HI.

A few existing descriptions were not updated for the new variant. The file
header still says:

 * NOTE: Currently only supports protocol "4" found in the RTL8365MB, hence
 * named tag_rtl8_4.

The tag placement text only mentions "rtl8_4" and "rtl8_4t". The
NET_DSA_TAG_RTL8_4 help text in net/dsa/Kconfig only mentions the
RTL8365MB-VC:

	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.

Could these be updated to cover RTL9607C and rtl8_4ap?

[ ... ]

> @@ -97,13 +146,63 @@
>  #define RTL8_4_REASON			GENMASK(7, 0)
>  #define   RTL8_4_REASON_FORWARD		0
>  #define   RTL8_4_REASON_TRAP		80
> +#define   RTL8_4AP_REASON_BCAST_TRAP	203
> +#define   RTL8_4AP_REASON_RESV_TRAP	215
> +#define   RTL8_4AP_REASON_IGMP		219
> +#define   RTL8_4AP_REASON_RMA		220
> +#define   RTL8_4AP_REASON_ACL		227

[Severity: Low]
The only REASON documentation in this file is the shared table:

 *    REASON     | reason for forwarding packet to CPU
 *               | 0: packet was forwarded or flooded to CPU
 *               | 80: packet was trapped to CPU

The new RTL9607C section says only bytes 4-7 differ on switch->CPU. That
suggests REASON means the same thing on this SoC.

However, rtl8_4ap_read_tag() treats 203, 215, 219, 220 and 227 as traps,
and none of these codes appear in the comment. It also treats 80 as
forwarded, which is the opposite of the documented meaning.

The new FBI description ("Only relevant when REASON is FB (aka < 64)") also
implies that 0..63 are flow based reasons. That conflicts with "0: packet
was forwarded or flooded to CPU".

Could the RTL9607C REASON codes be documented, and the existing table
marked as RTL8365MB specific?

[ ... ]

> @@ -153,6 +252,84 @@ static struct sk_buff *rtl8_4t_tag_xmit(struct sk_buff *skb,

[ ... ]

> +	/* Parse REASON */
> +	reason = FIELD_GET(RTL8_4_REASON, ntohs(tag16[1]));

[ ... ]

> +	switch (reason) {
> +	case RTL8_4AP_REASON_BCAST_TRAP:
> +	case RTL8_4AP_REASON_RESV_TRAP:
> +	case RTL8_4AP_REASON_IGMP:
> +	case RTL8_4AP_REASON_RMA:
> +	case RTL8_4AP_REASON_ACL:
> +		break;
> +	default:
> +		dsa_default_offload_fwd_mark(skb);
> +		break;
> +	}

[Severity: Medium]
Is a deny-list safe here? Every REASON value except these five ends up in
dsa_default_offload_fwd_mark():

net/dsa/tag.h:dsa_default_offload_fwd_mark() {
	struct dsa_port *dp = dsa_user_to_port(skb->dev);

	skb->offload_fwd_mark = !!(dp->bridge);
}

That covers the flow based reasons (< 64) from the FBI description, code
80, and any other trap reason the RTL9607C can emit.

Suppose the switch traps a frame to the CPU on a bridged port for one of
those unlisted reasons. Wouldn't the bridge then treat the frame as already
forwarded in hardware, and skip software forwarding to the other ports in
the same hardware domain? That frame would be silently lost.

Whether this happens depends on which reason codes the hardware emits and
how the switch driver configures trapping. Neither is visible in the tree.

Would it be safer to set offload_fwd_mark only for reasons that are known
to mean the switch already forwarded or flooded the frame?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119165129.26693-1-adilov%40disroot.org
