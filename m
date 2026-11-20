Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168664;
	b=0Vdds9NeMG1gx1/vW1GZaRVBTEeKxC4+0jkhorgKe8Kcddq+nxW89zFXkjmf7yr/xrGr
	 7Ffxnc/WcZRKvmalplBOMeq+Y1El29gWtw169ZSXnbW7ewVMpwnhILPiOc1CRqKXVsPBl
	 Twk9ODg7nYOCnbj4IQp4fLnHAfdASoZsVIomaBwLRA9baYjatffPsZ+9IZeCc3i87iOcV
	 mLdAcZmalPDuaIZVjd/8zr2hjiiLQ4lVacdJCJUKByxPx271UfcDA/MBtNFHIrA5RiTqA
	 6g1GMg4HL+Zk3bO5XhQf3A5oraKxFuV6uHuu48jAPdu54x6ttvGFHfinrbfCbcZPcqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168664;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=US+BwjsBu2YGs4iPWGc7Xdq/wpYAMCQoXR2jUtQoE6E=;
	b=syCAF3tW8nzoTMkCX1mEpvxu/mYw2eKVGWK+3uRG0fR6mfOVifxED4RriuzmoAkgNtGn
	 PfHu07i5VDzg6bNM4KQ7hJhBsYwByvispzTkSdcrr7KDPbEkRCInY1NgeV7IlAYgKD1MX
	 dU4+ozpt6tnhVlND8zedHIefUW2q7C9Ago6e8kjCmY9WAqmv1lOLqwsFfW7e7Y2KS3Fe9
	 wkLwyGvavIWjz9fXOPxR539YM0YVfBSRmYZftwbOwoGuwagWFGj+vOyZdLwo2w0IinMUH
	 SNigyXdls7AqWSl4oWH1qV0FjX+dVxx127BaDPoeIRCq8pdkn0OPlTHEgmHg8Ne6d2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clpYv4nf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3389E606A320;
	Fri, 20 Nov 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clpYv4nf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B161F000CA;
	Fri, 20 Nov 2026 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168663;
	bh=US+BwjsBu2YGs4iPWGc7Xdq/wpYAMCQoXR2jUtQoE6E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=clpYv4nf7GoRQgSzznc2rvcK1WJk2g6BZeRgeLlN/EqEoj9aMQbtcGbmNUqwvfUhx
	 LbSiYfDczBc6J7XGGTObjzBJPhpvPyEBAOHv69laqE0zi/4u0JV6nWPkrLvrvd6hHP
	 Y6QpmtSIUtqA1EZqlbzlnbzSqZe2iDSZeVpYLcqMpUmOwaEfGmTcYFbokGkmQWi2Lx
	 z/XGdDS16hb36EF9zk6iyRcO15vU+yfqJ1T9rOi4oIqzWRRDucyWDWwYy/rZMPjRVT
	 PD4bkkJMDbjWQrBQVQX0G2rfXYBh2HBPDrM2Zm0IEdAPlzQ2rDOKA/ybnsSefWLOkt
	 0fZOFFPowLENg==
Subject:
 Re: [PATCH net] tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append
From: netdev-bot+sashiko@kernel.org
To: jiayuan.chen@linux.dev
Cc: netdev@vger.kernel.org, edumazet@kernel.org, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, weiwan@google.com, soheil@google.com,
 shakeel.butt@linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 09:57:42 +0000
Message-ID: <179516866272.3136.232647069823092530@kernel.org>
In-Reply-To: <20261119090828.343748-1-jiayuan.chen@linux.dev>
References: <20261119090828.343748-1-jiayuan.chen@linux.dev>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new sk_forced_mem_schedule(sk, 0) only runs on the success
  path of skb_zerocopy_iter_stream().
- [Low] In tcp_sendmsg_locked() (net/ipv4/tcp.c), the MSG_ZEROCOPY branch
  only pre-schedules memory when the skb is not pure: `if…

--

tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append

The MSG_ZEROCOPY path in tcp_sendmsg_locked() can append to a skb that
already holds copied data. In that case only the user length is
scheduled, but the pinned pages are charged by truesize. This commit adds
sk_forced_mem_schedule(sk, 0) after a successful skb_zerocopy_iter_stream()
so that sk_forward_alloc does not go negative.

> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 832b25ddd3c2e..9f8c0954001bb 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1359,6 +1359,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>  			if (err < 0)
>  				goto do_error;
>  			copy = err;
> +			/* Pages were charged by truesize, not by copy. */
> +			sk_forced_mem_schedule(sk, 0);

[Severity: Medium]
Can sk_forward_alloc still go negative on the error path? The new call
only runs when skb_zerocopy_iter_stream() succeeds, because the
"if (err < 0) goto do_error" check comes first.

In skb_zerocopy_iter_stream(), the truesize charge made by
__zerocopy_sg_from_iter() is undone on -EFAULT only if ___pskb_trim()
succeeds:

net/core/skbuff.c:skb_zerocopy_iter_stream() {
    ...
	if (err == -EFAULT || (err == -EMSGSIZE && skb->len == orig_len)) {
		...
		if (!___pskb_trim(skb, orig_len)) {
			skb->truesize -= delta_truesize;
			sk_wmem_queued_add(sk, -delta_truesize);
			if (!skb_zcopy_pure(skb))
				sk_mem_uncharge(sk, delta_truesize);
		}
		skb->sk = save_sk;
		return err;
	}
    ...
}

___pskb_trim() fails when the skb is cloned and
pskb_expand_head(skb, 0, 0, GFP_ATOMIC) fails.

Suppose the write queue tail skb is not pure, so only copy was scheduled,
and it is cloned. If the user iovec faults after some pages are pinned and
the atomic allocation fails, those pages stay charged by truesize. The
caller then jumps to do_error without running the fix-up.

A later non-zerocopy sendmsg() under tcp_mem pressure would then get a
negative copy back from tcp_wmem_schedule(). That is the same case the
commit message describes.

Would it work to call sk_forced_mem_schedule(sk, 0) right after
skb_zerocopy_iter_stream() returns, before the error checks? On the paths
that do undo the charge, the call would do nothing.

[Severity: Low]
This isn't a bug, but does the new comment hold for pure zerocopy skbs?
Earlier in this branch, the pre-schedule is guarded:

	if (!skb_zcopy_pure(skb)) {
		copy = tcp_wmem_schedule(sk, copy);
		if (!copy)
			goto wait_for_space;
	}

__zerocopy_sg_from_iter() also skips the charge for pure skbs:

net/core/datagram.c:__zerocopy_sg_from_iter() {
    ...
		sk_wmem_queued_add(sk, truesize);
		if (!skb_zcopy_pure(skb))
			sk_mem_charge(sk, truesize);
    ...
}

So when SKBFL_PURE_ZEROCOPY is set, no pages were charged to
sk_forward_alloc. sk_forced_mem_schedule(sk, 0) is still called anyway.

In that case it does nothing, unless sk_forward_alloc is already negative
for some unrelated reason. Then it would force-charge without any warning
and hide that imbalance.

Could the call use the same !skb_zcopy_pure(skb) check as the
pre-schedule? Alternatively, the comment could say it covers the non-pure
case.

>  		} else if (zc == MSG_SPLICE_PAGES) {
>  			/* Splice in data if we can; copy if we can't. */
>  			if (tcp_downgrade_zcopy_pure(sk, skb))

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119090828.343748-1-jiayuan.chen%40linux.dev
