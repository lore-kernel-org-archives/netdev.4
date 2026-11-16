Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855953;
	b=Heo14UqvQ7NiM8nDzEv+KSctObYD9A4IRvMOcl7LDFrXCyAeqRE0zUMxwuThw8bc00vA
	 4tdtJ6zvW0TMC83NrhoGMko/ETTaf/n0SODKT9KoOsvhXN8LJuwB52fAGxCh/owbcpuH+
	 3vxA8tbbGCe+uDXsqLtyFo7TRy0/jQ6Ba3DnvNhPelyyXfXTjHOHcbKtN6qOK50VEKVuf
	 bSGSlX8y558ZJYCuwlP8HONOFo49EFNlEp1GtnuMqKbE/VctL9jkdTo5yco/od0VRjw/j
	 aPeAVlOBLq/q4SwXxfP0d7NeVlA4c4oFUzFPiTFUWvQLwI5KmSD7x7Tt3pXy1ncBUeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uxQMYwwz7yNG5xs6CvbpRYX33to4uhawWZVBwJyeiY8=;
	b=0HJjSPSUu5SKgp7DzMLnOWQbOUHR66NpaSnhqKXhCgeYim78pLKXT6TY94sjBnquHAys
	 ivkvNmEVLDpRj0jYCI1va8wW9tcNiV2qWrZMLPTtoBXUnzQpYAEbe3bCeVxerY0rofpkg
	 gxDSrO/7iqJNdYc9mqw996EBI5YYdYJY0b5shDailkqFR2ruUkVCOo98CA3F1IkfeRW/B
	 fubEheP3Wvx+1Xqd2yvc6rRORs8wJRn/q7nKkxiqy39S6xCccd3YXRF03S8ICIeioRpJk
	 ZUIH1LM4ZuN7zUnRcCbiI9pg8AcBQJJ9Lo2gZpu4T9w0v0K4ITIJGNFlDCTNdXJeuag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkCiVxsZ;
	arc=none smtp.remote-ip=74.125.229.134
Received: from mail-dl2-f6.google.com (mail-dl2-f6.google.com [74.125.229.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3353C606A33F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3353C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkCiVxsZ
Received: by mail-dl2-f6.google.com with SMTP id a92af1059eb24-1b3a6a69818so543707c88.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855952; x=1795460752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uxQMYwwz7yNG5xs6CvbpRYX33to4uhawWZVBwJyeiY8=;
        b=wkCiVxsZ6dJT02YF60E5go+iS1uyByIAi7dM39R8hfN2KdWodcwN4LA5PYh5w1Y2RO
         0oEX/oaMFSNIXOhVSgjowRzIXkNrbgvC7zuo913NFM/QN9FiJg9pOzfCTYAj6NdufAzy
         dwOchWL3Qoq2OVVXg3CD0fSWKaCEO+AQW2ZH8OQdrXc5b1TS6i2JaehpQJwD9uJbGIdh
         Ri53AOvxyV0G6wP6ruvFbyhQz8XWO0IPZJfinIU427eGNMq8CZv5XOLaHhIFc6JrGGnS
         wXx9T0oD6FlyJNHMyG1w/aRdL/61IGlr5AQOOQ+Azz0TK+RmM5LgSOr2y1kMNme0x4Y9
         POEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855952; x=1795460752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxQMYwwz7yNG5xs6CvbpRYX33to4uhawWZVBwJyeiY8=;
        b=DKCnUedZ+6417yjDGk44BS//eSlpJWe+DFqvQms+UfsS1Z0WD+nWOZYzFZUtWm0EcO
         87CWe3HWVHtD6VBs3tKhoCA8/YR0hiAPaoXlWMLvGTb4eF+S+3BeEalH2rtHDpKtbtfa
         anGsd9f/sd8jNEtZSGekRVFM6aMMPAux5syi5Nh+h56Dskpd/Un97rfwLXVeccp5osN9
         zPys8Gw2VTmYRKgRiliCeuVa5jkEVShAdh/xISsXmBHQkV9LUlvMLLaBFOiTSF9B1E04
         3+ZDsJL3rzlEuxPHEb7U+++Eq82T7nnxyk6L4Zz0P9zOp/U2k7fqLxvMiIYYd3wO45HK
         WBWg==
X-Gm-Message-State: APuU4Z+v9LktkTuis2v/+vBxx2qKnWnjzHa209kwcOtUnMx7BHTpBMB1
	2qsbNHmQWs/1kB11m6zVTobTo2LXc1gJjm/uwOs0TwFgfd0Lrs19FscH
X-Gm-Gg: AYBFou2Xk2mRq+B5kH78aae/H8keAgkr6QB4YpZJDNNuJk7rAr/8DYDBZaKGxn3Btrx
	mcn3JBb++035bZTRn37rjAYaib3zj8rQtvSb3cHtq3dLDfuKgONznpfYWJbm/95Q7A5FNl0TFcd
	IdlR4oREEZ+XE0X8nVHpAz/dkO8Vv9lCqTI1vX42tTODAxiauWa+3GQR3alj4P9t678XKZ3/BCD
	aTs4DoYNgFXuPEU3zuSHoogfcw94cs2zNx6Zk4iLLv8wvWW2VxFOuwi4Fs+zPo0NDz9PJ2OLOTH
	QGkxsaGnK6PoYF0dCqEkFFGBy85lfmCVvudUHOrVJUCY0zqGyQ4eDJBpnbQG9E9OPoc1S3R7AaC
	dRqCwxZwJg7pHb3byvydl0FLFF1uIu7lsjExafpdHmlcee0OeHmNcvM+lspadCHs/jpAoGi7mOg
	pah70oPVeSkc/Rw6XGgxof7byH+6b4+K9169sDZzX1L7fj3BgPYvEchx7a3Rd4d7PA8lyqZsT8f
	Vv30wlpKlYQuAICbIOWUfupx5kHLxbjE7Qf1wpYhbtjqVMHTvIfmU1LFACum3a/kco8yfB81vAW
	7IhCW6D4vDk/QP5OxeRPUgM=
X-Received: by 2002:a05:7023:a4c:b0:196:bf5f:8bb with SMTP id a92af1059eb24-1b5030f8a56mr10239944c88.45.1794855952028;
        Mon, 16 Nov 2026 11:05:52 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6c::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm38806416c88.8.2026.11.16.11.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:05:51 -0800 (PST)
Date: Mon, 16 Nov 2026 11:05:08 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v5 2/3] net: prevent mixing frags from different
 memory providers or bindings
Message-ID: <avtRYLif2GvfuAmu@devvm16445.scu0.facebook.com>
References: <20261115004003.3695475-1-almasrymina@google.com>
 <20261115004003.3695475-3-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115004003.3695475-3-almasrymina@google.com>

On 11/15, Mina Almasry wrote:
> Prevent coalescing, shifting, or appending skb fragments from
> incompatible memory providers or different devmem bindings.
> 
> Add skb_net_iov_provider(), skb_mem_provider_compat(), and
> skb_frags_can_coalesce() to check readability and fragment provider
> compatibility (net_iov_owner(niov) for devmem, niov->desc.pp for other
> net_iov providers such as io_uring zcrx, and NULL for page-backed skbs)
> across skb_try_coalesce(), skb_shift(), skb_gro_receive(),
> skb_gro_receive_list(), tcp_skb_can_collapse(), and
> tcp_skb_can_collapse_rx().
> 
> Also add net_devmem_skb_binding() and use it in tcp_sendmsg_locked(),
> zerocopy_fill_skb_from_devmem(), and validate_xmit_unreadable_skb() so
> TX skbs cannot mix different devmem bindings or transmit non-devmem
> unreadable frags on DMA TX devices. Reject converting linear head_frag
> payloads into page frags on unreadable skbs in skb_try_coalesce() and
> skb_gro_receive(), and propagate skb->unreadable and compare
> skb_frag_netmem() in tcp_clone_payload().
> 
> Update netmem_ref_test_net_iov and netmem_ref_test_try_coalesce so their
> target skbs carry a compatible unreadable net_iov frag before shifting
> or coalescing.
> 
> This issue was found by manual code inspection and LLM review; it was
> not triggered in production. Verified with the net_core KUnit test
> suite; not tested on real hardware.
> 
> Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  include/linux/skbuff.h | 55 ++++++++++++++++++++++++++++++++++++++++++
>  include/net/tcp.h      |  5 ++--
>  net/core/datagram.c    |  4 +--
>  net/core/dev.c         | 14 ++++-------
>  net/core/devmem.h      | 22 +++++++++++++++++
>  net/core/gro.c         | 16 ++++--------
>  net/core/net_test.c    | 42 +++++++++++++++++++++++++++-----
>  net/core/skbuff.c      | 24 +++++++-----------
>  net/ipv4/tcp.c         |  3 ++-
>  net/ipv4/tcp_output.c  |  4 ++-
>  10 files changed, 142 insertions(+), 47 deletions(-)
> 
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 1d6832878930..867e3ab17c17 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -3770,6 +3770,61 @@ static inline void *skb_frag_address(const skb_frag_t *frag)
>  	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
>  }
>  
> +/* Return an opaque pointer identifying the memory provider instance of @skb's
> + * net_iov fragments:
> + * - For devmem (NET_IOV_DMABUF), net_iov_owner(niov) (&binding->area, 1:1 with
> + *   the binding across RX queues and TX).
> + * - For other net_iov providers (e.g., io_uring zcrx), niov->desc.pp (shared
> + *   across all areas of an io_zcrx_ifq).
> + */
> +static inline void *skb_net_iov_provider(const struct sk_buff *skb)
> +{
> +	struct net_iov *niov;
> +
> +	if (skb_frags_readable(skb) || !skb_shinfo(skb)->nr_frags)
> +		return NULL;
> +
> +	niov = skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
> +	if (!niov)
> +		return NULL;
> +
> +	if (net_is_devmem_iov(niov))
> +		return net_iov_owner(niov);
> +
> +	return niov->desc.pp;
> +}
> +
> +/* Return true if the memory providers of @skb1 and @skb2 are compatible
> + * for coalescing. For any struct page-backed provider (the buddy allocator
> + * or a future provider handing out struct pages), coalescing is assumed
> + * feasible. For net_iov-backed providers, the provider instance pointer
> + * must match.
> + */
> +static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
> +					   const struct sk_buff *skb2)
> +{
> +	/* Check skb_frags_readable() first to reject readable/unreadable
> +	 * mismatches and avoid chasing frags[0] and struct net_iov when
> +	 * only one skb has unreadable frags.
> +	 */
> +	if (skb_frags_readable(skb1) != skb_frags_readable(skb2))
> +		return false;
> +
> +	return skb_net_iov_provider(skb1) == skb_net_iov_provider(skb2);
> +}
> +
> +static inline bool skb_frags_can_coalesce(struct sk_buff *to,
> +					  struct sk_buff *from)
> +{
> +	if (to->pp_recycle != from->pp_recycle)
> +		return false;
> +
> +	if (skb_zcopy(to) || skb_zcopy(from))
> +		return false;
> +
> +	return skb_mem_provider_compat(to, from);
> +}
> +
>  /**
>   * skb_frag_address_safe - gets the address of the data contained in a paged fragment
>   * @frag: the paged fragment buffer
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 25d11fab1b03..bf5f28e52fca 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -1275,14 +1275,15 @@ static inline bool tcp_skb_can_collapse(const struct sk_buff *to,
>  		      mptcp_skb_can_collapse(to, from) &&
>  		      !skb_cmp_decrypted(to, from) &&
>  		      skb_pure_zcopy_same(to, from) &&
> -		      skb_frags_readable(to) == skb_frags_readable(from));
> +		      skb_mem_provider_compat(to, from));
>  }
>  
>  static inline bool tcp_skb_can_collapse_rx(const struct sk_buff *to,
>  					   const struct sk_buff *from)
>  {
>  	return likely(mptcp_skb_can_collapse(to, from) &&
> -		      !skb_cmp_decrypted(to, from));
> +		      !skb_cmp_decrypted(to, from) &&
> +		      skb_mem_provider_compat(to, from));
>  }
>  
>  /* Events passed to congestion control interface */
> diff --git a/net/core/datagram.c b/net/core/datagram.c
> index ecc30a6f8302..88cc0a6c62f6 100644
> --- a/net/core/datagram.c
> +++ b/net/core/datagram.c
> @@ -712,8 +712,8 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
>  	size_t virt_addr, size, off;
>  	struct net_iov *niov;
>  
> -	if (i && skb_frags_readable(skb))
> -		return -EFAULT;
> +	if (i && net_devmem_skb_binding(skb) != binding)
> +		return -EMSGSIZE;
>  
>  	/* Devmem filling works by taking an IOVEC from the user where the
>  	 * iov_addrs are interpreted as an offset in bytes into the dma-buf to
> diff --git a/net/core/dev.c b/net/core/dev.c
> index a230ecce9327..51f5e4800eee 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c

[..]

> @@ -4175,8 +4175,7 @@ static struct sk_buff *sk_validate_xmit_skb(struct sk_buff *skb,
>  static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
>  						    struct net_device *dev)
>  {
> -	struct skb_shared_info *shinfo;
> -	struct net_iov *niov;
> +	struct net_devmem_dmabuf_binding *binding;
>  
>  	if (likely(skb_frags_readable(skb) ||
>  		   dev->netmem_tx == NETMEM_TX_NO_DMA))
> @@ -4185,14 +4184,11 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
>  	if (dev->netmem_tx == NETMEM_TX_NONE)
>  		goto out_free;
>  
> -	shinfo = skb_shinfo(skb);
> -
>  	/* All net_iovs in an unreadable skb share the same binding. */
> -	if (shinfo->nr_frags > 0) {
> -		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
> -		if (net_is_devmem_iov(niov) &&
> -		    (net_devmem_iov_binding(niov)->direction != DMA_TO_DEVICE ||
> -		     READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev))
> +	if (skb_shinfo(skb)->nr_frags > 0) {
> +		binding = net_devmem_skb_binding(skb);
> +		if (!binding || binding->direction != DMA_TO_DEVICE ||
> +		    READ_ONCE(binding->dev) != dev)
>  			goto out_free;
>  	}
>  

Should we limit this patch to the real fixes only? This part does
not look essential. validate_xmit_unreadable_skb already does skb_frags_readable
check above, it already does nr_frags > 0 check here...
so why go through the same stuff again via net_devmem_skb_binding?

If you want, maybe move this to a separate patch at least? And do
something like:

binding = net_devmem_skb_binding(skb);
/* I hope likely() below properly unwraps net_devmem_skb_binding similar
 * to existing likely(skb_frags_readable) case... */
if (likely(!binding)) goto out;
if (dev->netmem_tx == NETMEM_TX_NO_DMA) goto out;
if (dev->netmem_tx == NETMEM_TX_NONE) goto out_free;
if (READ_ONCE(binding->dev) != dev) goto out_free;
return skb;

And call it cleanup with no fixes tags.
