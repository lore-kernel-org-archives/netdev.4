Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345439;
	b=bxETJRdMNZLXtpyGuLk1q5KeR9AuCrqIxP0FVcyy8QxBPRTCfenbUjKyAim40NBgDL6f
	 t4ZtmmE299ScXeQZRowZMSOhxVAmzQOLURkkd/+pvzNJdMUL+IFpuKGP/p3/a/lIg/Mfx
	 Q3Y+R/rhG3y8EDUnXBlr2zxevlDuvRfioNIvhOkUaEvFrFSlzHdXqrEUVseB1cLIybYXp
	 up7aRtfAUrHrTDil4ih3IQzbKrrdoD9TDP1vRbQxPc7kvxruU6adGFvbNrqXAc2ZE149T
	 4dc2ZNdhW9tw2Munzlhj7RthdJUAS1ysipfMaYGL997uTtfEmo/2aY6U3KF3ooKSY/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345439;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=D8iqOKB7KV2hrQ6oaGrMj5AeFqZ86i9zrCsKQAZT9TY=;
	b=dkxNxkS6YGcAVEfF7oeeEBoWmDCgdDjlsSwo1XVoARJuxEHg5nKt6nlFM/W8s5JzndZK
	 Gr0SUp/k0YziJ1G5vN7wlnu8EU7lTUNJPDVUeLZOmUlZ8JdzJwD0xZbsOYrPaw1C/lC8c
	 jlHN5rFOgFeTese80REm7sk2nXsAnN48Ql5S7u1YuUYOU+LtAh6aL5vxO/kGIS6d6swiB
	 QdEI0/xqdM/an/ennirGCBeNQ2nsrZQDntIM5DvdQv/pij9ui/kRPgdHCKWUjsrf4zEIM
	 cS42R8sBoEGMM05tTgYxbFK++ngIVFPlp4KyezMTqgx2mVrlMn1B13xq8GA0gNWH6AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dtr5Tb//";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C918606A336;
	Sun, 22 Nov 2026 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtr5Tb//
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE361F000C4;
	Sun, 22 Nov 2026 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345438;
	bh=D8iqOKB7KV2hrQ6oaGrMj5AeFqZ86i9zrCsKQAZT9TY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dtr5Tb//e5gBlwc5yaPtZzMf0ZYqxpkcS7d6HrrvRMOnmpWuCvssibkSfRdhh4Whd
	 RzOumKxuugyimV2Jh3TJmCqbvQTiZof4UmQExpz1VvUSjnqrQwPGoiZl+8He6ohKe1
	 u7QXXKNU+mVyTkrlxG3Aps6R/VFH3ZN5VwlLeTHB/Ojmc4vJSsF3mLog8oJcD9Oo4N
	 RxV9QJKa7UXypLwMlCn2deikWyE2y5lCWJsDPbdTR6q0urpmII/H66bfIG2KihCJge
	 GZ4ZgN3A0TR/+h7ih7G2XjknS/UwCcjaezVsUnBhiLtfiY0x1XTTt2H/ojtnWvqzhX
	 nV8SYwHCPaK7Q==
Subject: Re: [PATCH net-next v3 4/4] net: dsa: qca8k: bound the data of a
 management ack frame
From: netdev-bot+sashiko@kernel.org
To: kuncy7@gmail.com
Cc: ansuelsmth@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 yongzhao.derek@gmail.com, luixo-public@luixo.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 11:03:57 +0000
Message-ID: <179534543789.3135.5831008026299550548@kernel.org>
In-Reply-To: <20261118104104.26684-5-kuncy7@gmail.com>
References: <20261118104104.26684-5-kuncy7@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Use-after-free introduced by the new pskb_may_pull() in
  qca8k_rw_reg_ack_handler() (drivers/net/dsa/qca/qca8k-8xxx.c).
- [Low] The commit message says that with the old `u32 data[4]` a frame
  "announcing more than three registers writes past the buffer".
- [Low] The new comment in qca8k_rw_reg_ack_handler(), "The tagger made
  only the tag linear", and the matching commit-message line…

--

net: dsa: qca8k: bound the data of a management ack frame

This patch resizes mgmt_eth_data->data to the largest payload a
management frame can carry. Before qca8k_rw_reg_ack_handler() copies the
announced DATA2 payload, it now pulls that payload into the linear area
with pskb_may_pull(). A frame that is too short for its announced length
is left unacknowledged.

> qca8k_rw_reg_ack_handler() answers a management read by copying the
> data that follows the Ethernet header into mgmt_eth_data->data. It
> trusts the frame for both the length and the layout: the length field
> of the frame allows up to 32 bytes while the buffer holds 16, so a
> frame announcing more than three registers writes past the buffer into
> the fields that follow it in qca8k_priv; and qca_tag_rcv() made only

[Severity: Low]
Is the threshold here off by one? With the old u32 data[4], data[0] is
filled from mdio_data, and the loop then writes data_len / 4 more words:

    for (i = sizeof(u32); i <= data_len; i += sizeof(u32)) {

For len = 16 (four registers), data_len is 12, so three more words are
written and data[0..3] is filled exactly. len = 18 also gives three
words. Only at len = 20 (five registers) does data_len = 16 reach
data[4].

So does the old overflow start at more than four registers, not more
than three?

> diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
> index 76c0f7c97b99d..cd3569902fcdb 100644
> --- a/drivers/net/dsa/qca/qca8k-8xxx.c
> +++ b/drivers/net/dsa/qca/qca8k-8xxx.c

[ ... ]

> @@ -190,6 +191,17 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
>  	/* We can ignore odd value, we always round up them in the alloc function. */
>  	len *= sizeof(u16);
>  
> +	if (cmd == MDIO_READ && len > QCA_HDR_MGMT_DATA1_LEN)
> +		data_len = min_t(int, QCA_HDR_MGMT_DATA2_LEN,
> +				 len - QCA_HDR_MGMT_DATA1_LEN);
> +
> +	/* The tagger made only the tag linear. Leave a frame that is too

[Severity: Low]
Is this comment accurate? qca_tag_rcv() in net/dsa/tag_qca.c does:

    if (unlikely(!pskb_may_pull(skb, QCA_HDR_LEN))) {
    ...
    phdr = dsa_etype_header_pos_rx(skb);

That pull makes QCA_HDR_LEN bytes linear starting at skb->data. For a
management ack those are the first two bytes of the DATA2 payload. The
tag itself is read at skb->data - 2, inside the MAC header, which was
already linear.

The commit message uses the same wording: "qca_tag_rcv() made only the
2 byte tag linear".

DATA2 still needs a pull, so that conclusion holds. Could the comment
and changelog say which bytes the tagger actually guarantees?

> +	 * short for the data it announces unacknowledged: the read fails
> +	 * and the caller falls back to MDIO.
> +	 */
> +	if (data_len && !pskb_may_pull(skb, data_len))
> +		goto complete;
> +
>  	/* Make sure the seq match the requested packet */
>  	if (get_unaligned_le32(&mgmt_ethhdr->seq) == mgmt_eth_data->seq)
>  		mgmt_eth_data->ack = true;

[Severity: High]
Can this new pskb_may_pull() leave mgmt_ethhdr pointing into a freed
skb head? The function caches the pointer before the pull:

    mgmt_ethhdr = (struct qca_mgmt_ethhdr *)skb_mac_header(skb);

data_len can be up to 28 bytes. If it is larger than skb_headlen(skb) and
the head lacks tailroom, the call chain is:

    pskb_may_pull()
      __pskb_pull_tail()
        pskb_expand_head()

pskb_expand_head() allocates a new head and frees the old one.
dsa_switch_rcv() has already run skb_unclone_full(), so no clone keeps
the old head alive.

mgmt_ethhdr is never reloaded after the pull. The read of
mgmt_ethhdr->seq here, and the read of mgmt_ethhdr->mdio_data below,
would then come from the freed buffer.

A garbage seq could set mgmt_eth_data->ack = true. The garbage
mdio_data would land in mgmt_eth_data->data[0], which qca8k_read_eth()
returns as the register value.

The kernel-doc for __pskb_pull_tail() says "All the pointers pointing
into skb header may change and must be reloaded after call to this
function". The sibling handler qca8k_mib_autocast_handler() in this
file reloads its pointer after the pull:

    if (!pskb_may_pull(skb, len))
        goto unlock;

    mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);

Should mgmt_ethhdr be re-read after a successful pull here? The other
option is to read seq and mdio_data into locals before the pull, as is
already done for command.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118104104.26684-1-kuncy7%40gmail.com
