Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021125;
	b=vulYEU9MNP5syxoYBp9lBzN7Jfl/buC/6d0CSoZtvcKcdC9wPSbWeraFB9AJyTXqwRtY
	 kW9QMG86JtEzTMUBpPajnEJQ0NAn41IItLcxoghN4nIdhaNCDFG4q3W1WovCq0h0vgDr4
	 ab8VwqR+jWf1MejjPkffGYbCsjjVIYytXbRyZFHvD/NppfPhYM6JVQxJ7+D5ot+mTKmLh
	 8zHGDu/eQJmNbHeQdegXkxnSTfMSP8i+IhNKX7asojPhbTcz+pfDy1t2Ka76jskRKe5ls
	 O3Q77RzP5Lx/R6qBNDV9DTMyxFGqY/jAo1qOj+nq29QPYCHbyFo2xgs55qyO9xPETgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021125;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V+EJ9RUzxCOAUO4kV71qX/xQMGJep7DBGe17w5CTk4o=;
	b=AdF6cx75EHl2AeDT475Dcf8q9jjFSLfA39FFQRAZcbBEYDKqAixLlPYz74QYII3HRYtr
	 rtw00pjyZqMBt/wbH8OkEXHkozy0QZ2/mw4iNb31+Tzs3v+GCc80LuUAEUfPSJUt1ezy7
	 dkPNFcjdRkXfOr7x8ulp3ymF6UpX9mfs6EVZAuMa2vgirVpEWRtbdp35rxtklY6XWYXl0
	 JnXJlAk8SCNChHjDgFNLu3G848qzTV8ezGBmLTY3dXInz8+wqLKBe4SBiHtisZFKgoXkb
	 crSB+AxjNs3DLw9f/YBuAQWGEiFrgDe4wUBQ7LN/u2N1OO/sLU9O9FydJ+iNHLp9M9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RrpNn6y+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C6A606A31C;
	Wed, 18 Nov 2026 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RrpNn6y+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9F31F000C4;
	Wed, 18 Nov 2026 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795021125;
	bh=V+EJ9RUzxCOAUO4kV71qX/xQMGJep7DBGe17w5CTk4o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RrpNn6y+46QpHOKdkuUZGRwTHBl2RNFAcYLU0yhTf1eIFbFQ5Sjn2IoCVG/QNFDrB
	 c7cLq6Yfbf4MYDoVspr2ozfH6ynwL+0ji76+UISzk6VUdLA+p3wsBPYr4LELz59JhK
	 4+5JfoDsidETaf7xeKUjDOA+/grt5FpJhPbgAJnLWLMQzMvAgduXsQX1adEW8pfnyS
	 qFvaVLxxygBnEm5YD/SmXO3EjGtaGU/qrVzuVDFM8+c1HGvcDN68kt1BifltYnex1P
	 Vs+gHY0VArQUN37M8fGmi42JdCcOeOEwoE9OmOiSQPDUbnNUYgpYQqPT+kuGioOcbE
	 MoFxd8al8Y2TQ==
Subject:
 Re: [PATCH] net: dst: Avoid false sharing between tclassid and __rcuref
From: netdev-bot+sashiko@kernel.org
To: jiebin.sun@intel.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, tim.c.chen@linux.intel.com,
 tianyou.li@intel.com, wangyang.guo@intel.com
Date: Wed, 18 Nov 2026 16:58:44 +0000
Message-ID: <179502112428.3136.7381445616366581807@kernel.org>
In-Reply-To: <20261116015732.2744688-1-jiebin.sun@intel.com>
References: <20261116015732.2744688-1-jiebin.sun@intel.com>
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

- [Medium] The patch moves tclassid after lwtstate in struct dst_entry
  (include/net/dst.h), which makes sizeof(struct dst_entry) on x86-64…

--

net: dst: Avoid false sharing between tclassid and __rcuref

On 64-bit builds, this commit moves dst_entry::tclassid to sit after
lwtstate, so it no longer shares a cache line with __rcuref. On x86-64,
struct dst_entry grows from 136 to 144 bytes. The commit message says the
SLAB_HWCACHE_ALIGN caches used for rtable and rt6_info absorb the growth.

> diff --git a/include/net/dst.h b/include/net/dst.h
> index dbedfe72e1fd1..f01cfb42f97c1 100644
> --- a/include/net/dst.h
> +++ b/include/net/dst.h

[ ... ]

> @@ -94,6 +94,7 @@ struct dst_entry {
>  	struct uncached_list	*rt_uncached_list;
>  #ifdef CONFIG_64BIT
>  	struct lwtunnel_state   *lwtstate;
> +	__u32			tclassid;
>  #endif
>  };

[Severity: Medium]
The commit message says:

  However, both struct rtable and struct rt6_info are allocated from slab
  caches with SLAB_HWCACHE_ALIGN, so the per-object allocation sizes
  remain unchanged at 192 bytes for rtable and 256 bytes for rt6_info.

Does the same hold for struct metadata_dst? It also embeds dst_entry, but
it is allocated with kmalloc and not from an aligned cache:

include/net/dst_metadata.h:
struct metadata_dst {
	struct dst_entry		dst;
	enum metadata_type		type;
	union {
		struct ip_tunnel_info	tun_info;
		...
	} u;
};

The union is 16-byte aligned because ip_tunnel_info::options[] is marked
__aligned_largest. So the 8-byte growth of dst_entry becomes 16 bytes
here. On x86-64 with CONFIG_DST_CACHE=y, sizeof(struct metadata_dst) goes
from 240 to 256.

metadata_dst_alloc() then allocates that size plus the options length:

net/core/dst.c:metadata_dst_alloc() {
	...
	md_dst = kmalloc_flex(*md_dst, u.tun_info.options, optslen, flags);
	...
}

With the new 256-byte base, does any optslen > 0 now land in kmalloc-512
instead of kmalloc-256?

On a collect_md device, vxlan_rcv() does this for every received packet:

	tun_dst = udp_tun_rx_dst(skb, vxlan_get_sk_family(vs), flags,
				 key32_to_tunnel_id(vni), sizeof(*md));

That reaches udp_tun_rx_dst()->__ip_tun_set_dst()->metadata_dst_alloc()
with GFP_ATOMIC and optslen = sizeof(struct vxlan_metadata), which is 4.
Before this patch the allocation is 244 bytes (kmalloc-256). After it,
the allocation is 260 bytes (kmalloc-512).

geneve_rx() passes gnvh->opt_len * 4. Before the patch, options of up to
16 bytes still fit in kmalloc-256. After it, would any Geneve option at
all push the allocation into kmalloc-512?

The growth also applies to 64-bit kernels built with
CONFIG_IP_ROUTE_CLASSID=n, where nothing reads tclassid on the hot path.

Could the commit message cover the metadata_dst case? Alternatively,
could the layout be arranged so that metadata_dst stays within the
256-byte kmalloc bucket?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116015732.2744688-1-jiebin.sun%40intel.com
