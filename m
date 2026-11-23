Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444781;
	b=eAZDg5fbwo2d7upllblU5ku8KwYJwXp/dzucAvCldltUDBy60c7acOa0E+avDKOU7srs
	 09xMjSyKYm4K5q0U34dsyku35C9bC9dqiHoqGbc7WoVYITacrrde2NQ8q9Mc+8kgynmIu
	 LnxHE1NTgzEluMri4L5BjAIZ45ro5jwDtTaFKbGX1WDjbYmOGAyF1eXKprJeePpRG5mS6
	 pHnNFMcA6J+jWwHRHBbg2wd+XYLXx0m/YRKVJyr/sAC+EFY2atNYLHc8t400cHBjbw4fk
	 8ytcCAz3uDzmTc8w5qo2HkDVN5FUNGiv/84ixsMKHFN7G9rZDqZGm7EWKHrJfDPpPQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444781;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6YYGv+e7EE3qgasx7Xd4YiCt+OnplvXdNmCHmlXHHzU=;
	b=CrcGbd0pXH7f8ZbS9F2iIlX5Aqoh0KybR7JRKM1pfotoUuAh+VoyAdDkY7Zxn0eYjv20
	 8UJ2/r4kUC6Oh/H2lkPH4n8+ZV6UoPqGJseznzngIJakbIbg8ZQcCnOGEWLEGu8jamU3L
	 4OSbsyLS8D/vP5CsWz0vLjVYWGhGZEGEvmf48KypJzbnpSD3s6YAy/HZjbENM7cMZN7ia
	 ocJt54k25Z1KS5mxpoqnYIgTji+Y6QmeYChQ5RmeflavIMsgk3WmWxX15wFk00SPqly2x
	 4j0eQA+Ca+2wA90ELtJlYG+FnQ/6uV7npHfI9iR4bBLpf8T6nUVReuL0/qFncMiMYEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WksBRzM/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F1606A32C;
	Mon, 23 Nov 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WksBRzM/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D1B1F000EB;
	Mon, 23 Nov 2026 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444781;
	bh=6YYGv+e7EE3qgasx7Xd4YiCt+OnplvXdNmCHmlXHHzU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WksBRzM/Y3qnmZeDjXkvDSNoCJ8qMAcXUY52UkZ0DQZpezt8ljog3BxW9jQakFXoF
	 2nsqAlCUKsZhM5TUun/x935t8Fyfrs/GT4MNNduQTBy9JRPsmOXME3WM1qTD9+uhxL
	 BNDXCVLvH8pw4pxY85F0lBvzI1Vq8DcZIm9PtPP3gaplSIImjmK2jiwvwmWwU6y+6y
	 urqibuLRQ33951KlSEFdAz9YyzXGTkpmtfagMgOOVSr7ZUM0tQYq5MCRaRCQsdSDOb
	 aGa2fMqckNkkrKIOQHmCdGRNMR6Jl0EvaHSZKwzhgOauD+02BnomdqKkoJoSMcXyzL
	 gBd+nsrCeg+7w==
Subject: Re: [PATCH] xfrm: iptfs: bound the reassembly copy by the buffer it
 copies into
From: netdev-bot+sashiko@kernel.org
To: piyus@iiitd.ac.in
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 chopps@chopps.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 14:39:40 +0000
Message-ID: <179544478062.3135.17059372621569659200@kernel.org>
In-Reply-To: <20261119142308.3272570-1-piyus@iiitd.ac.in>
References: <20261119142308.3272570-1-piyus@iiitd.ac.in>
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

- [High] The patch stops the BUG() by throwing away well-formed inner
  packets instead of reassembling them.
- [Low] The patch fixes a BUG() that a remote IPsec peer can trigger in
  the xfrm receive path (iptfs_reassem_cont() -> skb_put() ->…
- [Low] The commit message and the new code comment are inaccurate in
  ways that keep a maintainer from checking the patch.

--

xfrm: iptfs: bound the reassembly copy by the buffer it copies into

This adds checks in iptfs_reassem_cont() that compare skb_tailroom(newskb)
with copylen before each skb_put() into the reassembly skb. If there is not
enough room, the reassembly is abandoned and LINUX_MIB_XFRMINBUFFERERROR is
counted. The aim is to stop a peer-triggerable skb_over_panic() when the
reassembly skb was built by iptfs_pskb_add_frags() and later linearized.

> Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>

[Severity: Low]
This fixes a BUG() that can be reached from the xfrm receive path. Should it
carry a Fixes: tag and Cc: stable?

The add_frags sharing path and the skb_put() copy come from 5f2b6a9095743a
("xfrm: iptfs: add skb-fragment sharing code").

The skb_linearize() call that turns the earlier SKB_LINEAR_ASSERT crash into
this skb_over_panic() comes from 0b352f83cabfef ("xfrm: iptfs: fix skb_put()
panic on non-linear skb during reassembly"). Its message assumes:

    the initial allocation of newskb originally reserved enough tailroom
    for the entire reassembled packet we do not need to check if we have
    enough tailroom or extend it.

Both commits are in stable kernels, and 0b352f83cabfef itself carries
Fixes: 5f2b6a909574. Without a Fixes: tag, this may not get backported to
the trees that have the bug.

> diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
> index 0313a43aa8a97..8b5cb4a6f69c7 100644
> --- a/net/xfrm/xfrm_iptfs.c
> +++ b/net/xfrm/xfrm_iptfs.c
> @@ -875,6 +875,20 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
>  		}
>  		fraglen = min(blkoff, remaining);
>  		copylen = min(fraglen, iphremain);
> +		/* copylen is bounded only by the length the inner header
> +		 * claims, which says nothing about the size of the buffer being
> +		 * reassembled into: iptfs_input_ordered() prefers
> +		 * iptfs_pskb_add_frags(), whose capacity is the bytes that
> +		 * arrived, over iptfs_pskb_extract_seq(), which allocates the
> +		 * claimed length. Cast because copylen is u32 and skb_tailroom()
> +		 * returns int, so the comparison must not promote a negative
> +		 * tailroom into a large unsigned.
> +		 */
> +		if (skb_tailroom(newskb) < (int)copylen) {
> +			XFRM_INC_STATS(xs_net(xtfs->x),
> +				       LINUX_MIB_XFRMINBUFFERERROR);
> +			goto abandon;
> +		}

[Severity: Low]
Does this comment match this branch? Here copylen is min(fraglen,
iphremain), and iphremain is __iptfs_iphlen() - newskb->len. That is a fixed
20 or 40 byte header size, not the length the inner header claims.

Can an skb built by iptfs_pskb_add_frags() get into this branch at all?
iptfs_input_ordered() only calls it when capturelen > iphlen:

    capturelen <= iphlen ||
    /* Try creating skb and adding frags */
    !(skb = iptfs_pskb_add_frags(first_skb, fragwalk,
                                 data, capturelen,
                                 skbseq, iphlen))) {

So its result always has newskb->len >= __iptfs_iphlen() and skips this
block.

The other producers are already covered:

  - the reuse path guarantees headlen >= iphlen
  - iptfs_pskb_extract_seq(iplen, ...) already has tailroom >= iphremain
  - the runt iptfs_alloc_skb(skb, ipremain, false) does as well

That would make this first check unreachable. The "Bound both copies"
wording in the commit message seems to rest on the same assumption.

Two details in the commit message also look inconsistent. The quoted splat
shows:

    skbuff: skb_over_panic: text:... len:4000 put:3000 head:... data:...
                            tail:0xff0 end:0x6c0 dev:tap0

but the reproducer paragraph says:

    and skb_put(1200) is 104 bytes past the end, which is the
    len:3800 put:1200 tail:0xf28 end:0xec0 above.  The same values appear on
    every run.

Those values don't appear above. Are two different reproductions mixed
together here?

The message also says:

    without panic_on_oops the
    task is killed while xtfs->ra_newskb is left pointing at an skb whose tail
    is past its end

Does that hold on this path? It always runs with BH disabled, either in the
NET_RX softirq or under tun's local_bh_disable() around netif_receive_skb().
oops_end() in arch/x86/kernel/dumpstack.c does:

    if (in_interrupt())
        panic("Fatal exception in interrupt");

So the leftover state used to justify the signed cast doesn't seem reachable
here.

[ ... ]

> @@ -915,6 +929,15 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
>  			goto abandon;
>  		}
>  
> +		/* Re-checked after skb_linearize(), which may reallocate and so
> +		 * change the tailroom this copy has to fit in.
> +		 */
> +		if (skb_tailroom(newskb) < (int)copylen) {
> +			XFRM_INC_STATS(xs_net(xtfs->x),
> +				       LINUX_MIB_XFRMINBUFFERERROR);
> +			goto abandon;
> +		}

[Severity: High]
Does this check drop well-formed inner packets instead of reassembling them?

Take an inner packet with iplen >= IPTFS_PKT_SHARE_MIN and capturelen >
iphlen. iptfs_input_ordered() tries iptfs_pskb_add_frags() before
iptfs_pskb_extract_seq(iplen, ...). That allocates only copy_len (iphlen)
of linear space:

    skb = iptfs_alloc_skb(tpl, copy_len, false);

A later continuation may not be able to share frags. This happens when
nr_frags would go past MAX_SKB_FRAGS, when the outer skb is not head_frag
and has linear data, when pp_recycle differs, or when either skb has a
frag_list. skb_linearize() then goes through __pskb_pull_tail(), which grows
the head by only eat + 128:

    if (pskb_expand_head(skb, 0, eat > 0 ? eat + 128 : 0,
                         GFP_ATOMIC))

So the tailroom left after linearizing has no relation to ipremain.

By this point the stream has already been checked: blkoff < ipremain goes
to abandon, so copylen <= ipremain <= blkoff.

The reproducer in the commit message is a consistent stream. 1000 + 16 * 100
+ 1200 = 3800 bytes, which is exactly the declared iplen. Before this patch
it crashed. With it, the packet is always dropped.

The commit message describes this as:

    abandon the
    reassembly otherwise, which is how the function already handles a stream it
    cannot complete.  This restores at the point of use the invariant the reuse
    path states

But this stream can be completed. The check detects that the invariant is
broken and drops the packet; it does not restore the invariant. The earlier
fix in 0b352f83cabfef assumed the initial newskb allocation reserved
tailroom for the whole reassembled packet.

Would it be better to grow newskb here instead? One option is
pskb_expand_head(newskb, 0, ipremain - skb_tailroom(newskb), GFP_ATOMIC)
after skb_linearize(). Another is to have reassembly skbs built by
iptfs_pskb_add_frags() reserve iplen of capacity. The reassembly would then
only be abandoned if that allocation fails.

Also, the drop is counted as LINUX_MIB_XFRMINBUFFERERROR, which
Documentation/networking/xfrm/xfrm_proc.rst describes as "No buffer is
left". No allocation failed in this case. Is that the right counter?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119142308.3272570-1-piyus%40iiitd.ac.in
