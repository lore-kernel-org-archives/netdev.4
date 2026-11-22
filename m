Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795349452;
	b=YekKSTnpIftAj3O4GZxetA2AetxnDqHzSkTP9AmDThGBbT+BABieX1DCTCn0LsbLUU2j
	 5xGKLJvmYcEWZUJFNleKVi8k5uAi4o34/fJzm9MbMxQowW3iNh9wRzQ1obN7LX9HWKDPe
	 ZeAtv94csqRpE7Dg59U1Y8EH7sG1nP5gRNRvy3XLMf68XYdO2FFIXSJ336oMTdrx8ijxV
	 fY74nKfmK1WKayuI3pN4BGjgJa/N/RtcTDo4Pd5BgPFYzoA7V/6CSYZGaKFFVsUi8R50k
	 x5D9+pw3AZj7z6Xp/stdjd6eFp4eOTNX1qeEtPHKQOPVE983ozXdppacIOf0+qWtkug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795349452;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LWOiQEZX415zH0dHnkJ/TmM4Hrd10FxwQy/FS8wvlWk=;
	b=s8wcP+U0smT6Bxg3pbCOMwlIxvihTo638JzrIhrZhqUlREZvsoVhETKxaxP8yX/CGAe3
	 UQl3gDQ4ZQCb3PL4TCqL/Gtys8t18trXLMYU/Xpc2PqLil27BM9t8z/peTTl0jxzobjZ+
	 8B5OBMLScBXBcH4sDI5jk0Xdqdw24o/CWi5v/lNwYiz+PDMep79KrQWlsIhh3c1cgFh34
	 j4ibH6H1TBJB4KE0uyzPhAqWotSNeuBO245SYtUG5baPpTQlywUo7e5r/6u7Yj1yfyJIw
	 sD0TmfyJWucFZGR1fmwSDFD5y8MK9AL01dgnLkn7l3KqfAPwqyTakFU1k/i5FAxIgjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIQB1ODh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4357606A32A;
	Sun, 22 Nov 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIQB1ODh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20891F000C6;
	Sun, 22 Nov 2026 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795349452;
	bh=LWOiQEZX415zH0dHnkJ/TmM4Hrd10FxwQy/FS8wvlWk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WIQB1ODhD18O8TJIptE3MxXKgdiO9iLC7MPn8Cz0UwPviqgx/OsymDtOulqwccEaE
	 Dy/jhHne5LWPMnCtULBWKq+SOu1tAe2VOaJ/Tbx16VLjCF/A/vlHnR50shdnLkYsHs
	 tK38V8jTO3Z2EuzkncCxXStmoVKGmL7xp/xyViXCY1+z+LBzmMkER0B093/zVUHVfs
	 1GKMcS1/rwzJpBeATYkM1LBMdGLBLGhIYEQG8g+uWu/edsTz3FXJxvAFo/DD/cX0zC
	 n+9I6HWuHqwv+4OU6pqZ7u6amY3+G9m5PA+dwVfMA8XBtWSlEK5sDGHlUvBW7gE7jR
	 sNJxyv+Dju9iQ==
Subject:
 Re: [PATCH net v2] tap: clamp zero-copy copylen to remaining payload length
From: netdev-bot+sashiko@kernel.org
To: graypanda.inzag@gmail.com
Cc: willemdebruijn.kernel@gmail.com, jasowangio@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, gwanhyunlee@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 12:10:51 +0000
Message-ID: <179534945117.3135.10312990191242874707@kernel.org>
In-Reply-To: <20261118120102.3717000-1-graypanda.inzag@gmail.com>
References: <20261118120102.3717000-1-graypanda.inzag@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix: tun.c has the same stale-heap leak and the patch
  leaves it alone.
- [Low] The commit message understates the impact.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the `if
  (!tap)` branch of tap_get_user() (drivers/net/tap.c:646-650) leaks the…

--

tap: clamp zero-copy copylen to remaining payload length

This patch clamps the zero-copy copylen in tap_get_user() to the payload
left after the virtio header. Without the clamp, tap_alloc_skb() sizes the
linear area from hdr_len or GOODCOPY_LEN. zerocopy_sg_from_iter() only
fills the payload bytes that exist, so stale heap contents can be
transmitted.

> For example, a 246-byte padded virtio header and a 14-byte Ethernet
> frame leave only 14 payload bytes, but a zero hdr_len makes copylen 128.
> With a 512-byte virtio header, a guest-supplied hdr_len of 256 also
> passes __tun_vnet_hdr_get(): it checks hdr_len before skipping the
> padding. That makes copylen 256 for the same 14-byte frame.
> Larger padded headers can raise copylen as far as good_linear.

[Severity: Low]
Does this description understate the exposure? Both examples use padded
vnet headers set up by the host. That reads as if an unusual vnet_hdr_sz
is needed.

tap_get_user() calls tun_vnet_hdr_get() with features=0, so parsed_size is
sizeof(struct virtio_net_hdr), which is 10. __tun_vnet_hdr_get() then does:

drivers/net/tun_vnet.h:__tun_vnet_hdr_get() {
    ...
	if (hdr_len > iov_iter_count(from))
		return -EINVAL;

	iov_iter_advance(from, sz - parsed_size);
    ...
}

At that check, the count still includes the sz - 10 padding bytes. With the
common 12-byte header (VERSION_1 / MRG_RXBUF), a guest can set
hdr_len = payload + 2. Before this patch that made copylen = payload + 2,
so 2 uninitialized bytes went out with each packet. With the 20-byte hash
header the overshoot is 10 bytes.

The new min_t() already handles these cases, so the code is fine. Could the
commit message say that the default header sizes are affected too? Stable
and security triage will rely on it.

> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index 2f19fb07bb2d4..f25c58d6e986b 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
>  		struct iov_iter i;
>  
>  		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
> +		/* The remaining payload may be shorter than copylen. */
> +		copylen = min_t(unsigned long, copylen, len);

[Severity: High]
Does tun_get_user() in drivers/net/tun.c need the same clamp? Its
zero-copy branch computes copylen the same way, and nothing bounds it by
len:

drivers/net/tun.c:tun_get_user() {
    ...
	if (msg_control) {
		struct iov_iter i = *from;
        ...
		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
		linear = copylen;
		iov_iter_advance(&i, copylen);
		if (iov_iter_npages(&i, INT_MAX) <= MAX_SKB_FRAGS)
			zerocopy = true;
	}
    ...
}

When zerocopy is set, tun_can_build_skb() returns false and copylen is not
reset to len. From there the path matches tap:

tun_get_user()
  tun_alloc_skb(tfile, align, copylen, linear, noblock)
    skb_put(skb, linear)
  zerocopy_sg_from_iter()
    copy = min_t(int, skb_headlen(skb), iov_iter_count(from))

Nothing writes the tail of the linear head, and it goes out through the
host stack and any bridged link.

tun_get_user() also calls __tun_vnet_hdr_get(), which the commit message
blames for case B. A tun device with IFF_VNET_HDR always has SOCK_ZEROCOPY
set. With experimental_zcopytx=1, vhost_net uses zero-copy for guest TX of
256 bytes or more. Either of these looks like it reaches the leak:

  vnet_hdr_sz >= 242, hdr_len = 0 and a short frame (copylen = 128)
  any vnet_hdr_sz > parsed_size, hdr_len = payload + (sz - parsed_size)

Would it make sense to fix this in __tun_vnet_hdr_get(), or in both
callers? Otherwise the tun path stays exposed after a stable backport of
this patch.

>  		linear = copylen;
>  		i = *from;
>  		iov_iter_advance(&i, copylen);

[Severity: High]
This isn't a bug introduced by this patch, but tap_get_user() returns early
further down when q->tap is NULL:

drivers/net/tap.c:tap_get_user() {
    ...
	rcu_read_lock();
	tap = rcu_dereference(q->tap);
	if (!tap) {
		kfree_skb(skb);
		rcu_read_unlock();
		return total_len;
	}
    ...
}

This return comes before skb_zcopy_init(skb, msg_control) and before
uarg->ops->complete(). Can this leak the vhost zerocopy ubuf_info?

By this point, handle_tx_zerocopy() in drivers/vhost/net.c has already
marked the head as in progress and taken a reference on ubufs:

	vq->heads[nvq->upend_idx].len = VHOST_DMA_IN_PROGRESS;
	...
	atomic_inc(&ubufs->refcount);

Because sendmsg returned success, vhost waits for vhost_zerocopy_complete()
to finish the job, and that callback never runs. The heads[] slot stays
VHOST_DMA_IN_PROGRESS, which blocks vhost_zerocopy_signal_used(). The
ubufs refcount never reaches zero.

Later, vhost_net_flush() (from release, set_backend or reset_owner) waits
with no timeout:

drivers/vhost/net.c:vhost_net_ubuf_put_and_wait() {
	vhost_net_ubuf_put(ubufs);
	wait_event(ubufs->wait, !atomic_read(&ubufs->refcount));
}

q->tap becomes NULL in tap_del_queues() when the macvtap/ipvtap link is
deleted while the queue fd is still attached to vhost-net:

	RCU_INIT_POINTER(q->tap, NULL);

>From then on, every zero-copy guest TX takes this path. The process
releasing /dev/vhost-net can then hang in D state. tun does not have this
problem because tun_sendmsg() returns -EBADFD once the device is gone.

This looks like it dates back to commit 4f61f133f354 ("net: tap: NULL
pointer derefence in dev_parse_header_protocol when skb->dev is null").

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118120102.3717000-1-graypanda.inzag%40gmail.com
