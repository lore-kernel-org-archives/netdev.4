Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784661;
	b=FvhPmGpvvipNfMXvGUUtQEpD36IkHwzIZdhnI6VvJyjodiY1eAsaVFJUA4hYNDOa84bW
	 D3o5onn7sBwWOxmIc5qF0iQ0MMMB16I0ed2rYTRDjicWBX9nlphTpTiVpHMpZuwDilKeG
	 i+ynpAIJh7nGczPWumEHi5IXjHPtpJDKn8BH5T18GKxTxKGE49tPgTb1hX0NuaBxufuZj
	 Kh92qJA+R/gju5Zfm+tcDR799R/HCQX+sidHT338e/Odo/x1WZlOP4bovnwnoRkE5kdDt
	 +JFSdWPmfdhTAtspzwxhe3E34icCIAyByaIagEEJ67Qc8KD6Gg8NIYuvC2Axsy0D73w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784661;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cZdPerU/sJXdm3EFvnyz7eX4dkYDIHG1iPmitt4/prI=;
	b=Q6kQOTqnmd63Ds15n7SBHCb78/Mh+vK5gVuoRrqtya2IEjtojpoqui5qQIqRaBsiNLRp
	 s/f9MIoDASw/zrDTYtfHBs04FzKttlkOenkIVHLbSIfEgX03LQB+/YowFi8bDLPhGmQzB
	 tYaiSBBeZCll6NeOvA0lDGUobUpoZ9+lk+tSrVPJUxwua24fw3bipkg5ewxkA3CL7pxs+
	 NOc4/9Nesr07v2zZBrQdHH2pzIUkCcMd3RSjYE7KlrOFVOG3368Pj19ODO1B7yUnHtZt/
	 APu0n/7uhs4jkXhwBlvwixZyLz+3zOPtXY3+CjgiQMjqFKqKBnGB0DZhwnb96v4CQbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3gk7muk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B0606A32F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3gk7muk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D341F000C4;
	Sun, 15 Nov 2026 23:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794784661;
	bh=cZdPerU/sJXdm3EFvnyz7eX4dkYDIHG1iPmitt4/prI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k3gk7muk6ZUOh4VY4sO+yk/7aBD3+ra1Cllsh/vTUo/QPlXoeCPC0RXNjtu6+YR0V
	 +HgDufuPn1dQxfk91cqKX1HzlkRA2rU24CrSX8KtUH0WaazwawOyRDY4xQz9QGsU6I
	 kyeE7L9iokOo2p+9dbEPRomYTAEmtJ1AAmIx5fgMm/lIolluHkyrLsvWi39X8TlQ3z
	 1lHh62bOQQEtXHlECoQluWafqXb2eciIrzbdUjRrvrA9OK5jC0BliHFWUqcepj80FE
	 +EQXnQY6DGx8fwcYth3yx5Hdw2uXYIJ2P4qgRXSQKNDefE/2pufneClOfzZGW5cMbO
	 PZJ6P0W6uOrmA==
Subject: Re: [PATCH net-next v10 4/4] net/sched: cake: hash before segmenting
 and reject an overlong split
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 stephen@networkplumber.org, vinicius.gomes@intel.com, victor@mojatatu.com,
 toke@toke.dk, bjorn@kernel.org, sashiko-bot@kernel.org
Date: Sun, 15 Nov 2026 23:17:40 +0000
Message-ID: <179478466045.3136.10213125550610410493@kernel.org>
In-Reply-To: <QDISC-BA27.v10.r0.20261114071135-4@mojatatu.com>
References: <QDISC-BA27.v10.r0.20261114071135-4@mojatatu.com>
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

- [Low] The commit fixes three real bugs in cake_enqueue()
  (net/sched/sch_cake.c) but carries no Fixes: tag, so a stable…
- [Low] The "Conditions to recreate the bug" section does not produce any
  visible failure on the unpatched kernel.

--

net/sched: cake: hash before segmenting and reject an overlong split

This splits cake_hash() into a side-effect-free cake_hash_keys() and a
cake_hash_resolve() that runs only after admission. The split-GSO path
moves ahead of resolution, with a ceiling check on the segment sum and
per-segment drop reason tagging. flow_mode is read once with READ_ONCE()
in cake_enqueue().

Link: https://lore.kernel.org/netdev/179231933068.3135.80340792633077986@kernel.org/
Link: https://lore.kernel.org/netdev/179269577270.3135.16072065138845192450@kernel.org/

> net/sched: cake: hash before segmenting and reject an overlong split
>
> The Fix:
> with CAKE_FLAG_SPLIT_GSO, cake computes the flow/host hash keys, then
> splits a GSO skb into segments it accounts individually. Key extraction

[ ... ]

> Read q->config->flow_mode once with READ_ONCE() in cake_enqueue() and
> pass that value to both cake_hash_keys() and cake_hash_resolve(), and to
> the later flowchain calls (cake_get_flow_quantum(),
> cake_inc_srchost_bulk_flow_count(), cake_inc_dsthost_bulk_flow_count()).
> cake_mq_change() updates the shared cake_config outside the qdisc lock, so
> a reconfiguration could extract and resolve keys in different modes.

[Severity: Low]
The message calls these changes fixes, but there is no Fixes: tag. Could
Fixes: tags be added, so stable backporters can tell which trees need
which part?

The three problems fixed in cake_enqueue() seem to come from different
commits.

First, the set-associative state (q->tags[], host indices, way counters)
was committed before a segmentation failure dropped the packet. That
ordering goes back to the split-GSO path:

  0c850344d388 ("sch_cake: Conditionally split GSO segments")

Second, the segmentation-failure path called plain qdisc_drop():

	segs = skb_gso_segment(skb, features & ~NETIF_F_GSO_MASK);
	if (IS_ERR_OR_NULL(segs))
		return qdisc_drop(skb, sch, to_free);

By then __skb_gso_segment() had overwritten tc_skb_cb.drop_reason. That
only became a misreport once __dev_xmit_skb() started setting
QDISC_DROP_GENERIC and __tcf_kfree_skb_list() started reading the field:

  ff2998f29f39 ("net: sched: introduce qdisc-specific drop reason tracing")

Third, flow_mode could change between key extraction and resolution.
That depends on the shared cake_mq config, where cake_mq_change() calls
cake_config_change() without the child qdisc lock:

  bc0ce2bad36c ("net/sched: sch_cake: Factor out config variables into separate struct")
  ebc65a873eff ("net/sched: sch_cake: Add cake_mq qdisc for using cake on mq devices")
  87826c01837c ("net/sched: sch_cake: Share config across cake_mq sub-qdiscs")

The drop reason fix only matters on kernels that have ff2998f29f39. The
flow_mode fix only matters on kernels that have the shared cake_mq
config.

> Conditions to recreate the bug:
>   ip tuntap add tun0 mode tun
>   ip link set tun0 txqueuelen 32 up
>   ip addr add 10.99.0.1/24 dev tun0
>   # hold the tun fd open without reading so the backlog persists; a stab
>   # overhead of 1048468 accounts each 92-byte packet at 1048560 bytes, so
>   # 4095 queued packets leave 65519 bytes below QDISC_MAX_BACKLOG.  A
>   # 65000-byte UDP_SEGMENT payload with a 1400-byte segment size then has
>   # a segment sum past the remaining headroom, and cake rejects the whole
>   # split.  Setup needs CAP_NET_ADMIN; the payload itself does not.
>   tc qdisc add dev tun0 root handle 1: stab overhead 1048468 \
>       cake split-gso memlimit 512Mb

[Severity: Low]
Does this reproducer show any failure on the unpatched kernel? It seems
to only describe a case that the patched cake_enqueue() now rejects.

Working through the numbers:

  QDISC_MAX_BACKLOG = U32_MAX - (1 << 20) = 4293918719
  4095 * 1048560 = 4293853200, leaving 65519 bytes of headroom

The GSO skb's stab-adjusted length is 66316 + 1048468.
__qdisc_calculate_pkt_len() clamps it:

net/sched/sch_api.c:__qdisc_calculate_pkt_len() {
    ...
	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
    ...
}

So qdisc_backlog_overflow() takes the first branch and admits the
packet:

include/net/sch_generic.h:qdisc_backlog_overflow() {
    ...
	if (likely(len <= QDISC_PKT_LEN_MAX))
		return backlog > QDISC_MAX_BACKLOG;
	return len > U32_MAX - backlog;
}

The 65000-byte payload with a 1400-byte segment size splits into 47
segments, so slen = 65000 + 47 * 28 = 66316.

On the parent commit the backlog then reaches 4293919516. That is 797
bytes over QDISC_MAX_BACKLOG but about 1 MiB below U32_MAX, so nothing
wraps. The next enqueue is rejected by qdisc_backlog_overflow() anyway.

The core helper itself lets the backlog go past QDISC_MAX_BACKLOG when a
packet of up to 1 MiB arrives while the backlog is still at or below the
ceiling. So going past the ceiling is not a failure on its own.

A real wrap in the split path seems to need slen above roughly 1 MiB
while the clamped pkt_len still passes the helper's check, for example a
trusted small-MSS BIG TCP aggregate. Could the message describe that
case, so maintainers can judge the severity and stable relevance?

The subject line also says "hash before segmenting", but the parent code
already called cake_hash(b, skb, ...) before skb_gso_segment(). The real
change is that cake_hash_resolve() now waits until after admission, and
segmentation and the ceiling check now run before it. Could the subject
say that instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-BA27.v10.r0.20261114071135%40mojatatu.com
