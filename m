Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910880;
	b=UZas+/RU+GvXf3QqPZoJ8/TCJsuaHIuZ6Giv2Ul5oGN4ipZ6a1MRo3la26UH4NW3v+Xb
	 9xITpf2o8Vj4VIWIzan7YoDCXY6NqABiQNNDD7SyNsFOxhf5kBBGWo1mOSK8FPCA5MO4g
	 XgeX1yWemvqc2+9y/8SJLGa921CROeiOWM2dWuS1ml1f9KLMcDvi/BJJSutA4BYaKYWIC
	 qjr3uMPzgjh5hZmtbUcNrCzRFTECuhEUqx5ndYCvNYPSYuPCBbG8holNiJiHr9mGauSfj
	 5ZYAUrXJV8lnyePDJvRGHlIlh5Ehmwz34/3JfJ8jnlTUhWkOa53vtwhRNkbS3Pc6qqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910880;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VXHuXdDXhimLX4EhrOle8NzbbeLRvG3acFho4x/kUyk=;
	b=asGireqM2Hr/85VnE2c20TC/kRRNgbw144WkHkzthrBfl9SIIr9qdq5iCsb4XV/x6rBz
	 zwAbIGlQYc2p1JXeUmzoVmxUnkxTm6XWi4s8+QXMd5XcCi+vskobi5Rggl1cD3fksGQzY
	 EjBnNWMLM1fla2KZsleSpGcKfit/EX0yDcCPpa0hvTk/EgqGB5bRPq512BwULiVnJ0knG
	 5hxlMD2X5FF16EnoJIAXPpaoqOY9+8DY+GzQDV7SqnCFuYYJniJvGjFQkO6+jNCA31iCR
	 Ja3hZVUqfzYKyo3h6OiXYTsCj0TbxURBLv4UX31APjN5TH1VsT10bwGpz0gB0TtiayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PHOKOGm9;
	arc=none smtp.remote-ip=91.218.175.150
Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF0F606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PHOKOGm9
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EANYqrnbRRXxKfS3U0ZNi5RJl50z89Mvm3A6Kbi3qv0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794910876; v=1; x=1795515676;
 b=PHOKOGm981g+pry+nhrFQj+0b947+p8q0bMn74UUGqwusbPCudNdNQ6z4crA4dcEdjdtAdVP
 WnTd3XGGHF4YDZX9wW9JnM3QepYxgDGL3GACwZoNniogqz5++FiNI6abPX9xPjySbO95+APkcKd
 cYetRnsvMm3WLBtOUMLwkIws=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3762f30bf743f942;
	Tue, 17 Nov 2026 10:21:16 +0000
X-Mizu-Trace-ID: 3762f30bf743f942
X-Migadu-Flow: FLOW_OUT
Message-ID: <1273d905-a93d-4d56-a831-cecd1dd948c9@linux.dev>
Date: Tue, 17 Nov 2026 19:21:07 +0900
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Subject: Re: [PATCH net] netfilter: nf_tables: don't unregister hooks that
 were never registered
To: Ma Xinmeng <1564938642@qq.com>
Cc: netfilter-devel@vger.kernel.org, netdev@vger.kernel.org,
 Phil Sutter <phil@nwl.cc>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>
References: <tencent_19A48DA487BBFCFD990AC5A8010C663EA007@qq.com>
In-Reply-To: <tencent_19A48DA487BBFCFD990AC5A8010C663EA007@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/11/17 at 17:54 Ma Xinmeng wrote:
> A basechain created while its table is dormant is accepted without
> registering its hook. Re-owning a PERSIST orphan table with DORMANT set
> then makes nf_tables_table_disable() clear DORMANT before
> nft_table_disable() walks the chains, so __nf_tables_unregister_hook()
> no longer sees the dormant state and calls nf_unregister_net_hook() for a
> hook that was never registered. This triggers WARN_ONCE("hook not found")
> in __nf_unregister_net_hook().
> 
> Track whether a basechain's hook was actually registered and skip the
> unregister for chains whose hook was never registered. This preserves the
> existing "add a basechain to a dormant table" API.
> 
> Signed-off-by: Ma Xinmeng <1564938642@qq.com>
> ---
>   include/net/netfilter/nf_tables.h |  1 +
>   net/netfilter/nf_tables_api.c     | 29 +++++++++++++++++++++++------
>   2 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/include/net/netfilter/nf_tables.h b/include/net/netfilter/nf_tables.h
> index 9d5974823..fcd24502b 100644
> --- a/include/net/netfilter/nf_tables.h
> +++ b/include/net/netfilter/nf_tables.h
> @@ -1243,6 +1243,7 @@ struct nft_base_chain {
>   	const struct nft_chain_type	*type;
>   	u8				policy;
>   	u8				flags;
> +	bool				registered;
>   	struct nft_stats __percpu	*stats;
>   	struct nft_chain		chain;
>   	struct flow_block		flow_block;
> diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> index 8b94b5e7d..25b4075c9 100644
> --- a/net/netfilter/nf_tables_api.c
> +++ b/net/netfilter/nf_tables_api.c
> @@ -428,21 +428,30 @@ static int nf_tables_register_hook(struct net *net,
>   {
>   	struct nft_base_chain *basechain;
>   	const struct nf_hook_ops *ops;
> +	int err;
>   
>   	if (table->flags & NFT_TABLE_F_DORMANT ||
>   	    !nft_is_base_chain(chain))
>   		return 0;
>   
>   	basechain = nft_base_chain(chain);
> +	if (basechain->registered)
> +		return 0;
> +
>   	ops = &basechain->ops;
>   
>   	if (basechain->type->ops_register)
> -		return basechain->type->ops_register(net, ops);
> +		err = basechain->type->ops_register(net, ops);
> +	else if (nft_base_chain_netdev(table->family, basechain->ops.hooknum))
> +		err = nft_netdev_register_hooks(net, &basechain->hook_list);
> +	else
> +		err = nf_register_net_hook(net, &basechain->ops);
>   
> -	if (nft_base_chain_netdev(table->family, basechain->ops.hooknum))
> -		return nft_netdev_register_hooks(net, &basechain->hook_list);
> +	if (err < 0)
> +		return err;
>   
> -	return nf_register_net_hook(net, &basechain->ops);
> +	basechain->registered = true;
> +	return 0;
>   }
>   
>   static void __nf_tables_unregister_hook(struct net *net,
> @@ -456,22 +465,30 @@ static void __nf_tables_unregister_hook(struct net *net,
>   	if (!nft_is_base_chain(chain))
>   		return;
>   	basechain = nft_base_chain(chain);
> +	if (!basechain->registered)
> +		return;
> +
>   	ops = &basechain->ops;
>   
>   	/* must also be called for dormant tables */
>   	if (nft_base_chain_netdev(table->family, basechain->ops.hooknum)) {
>   		nft_netdev_unregister_hooks(net, table, &basechain->hook_list,
>   					    release_netdev);
> +		basechain->registered = false;
>   		return;
>   	}
>   
>   	if (table->flags & NFT_TABLE_F_DORMANT)
>   		return;
>   
> -	if (basechain->type->ops_unregister)
> -		return basechain->type->ops_unregister(net, ops);
> +	if (basechain->type->ops_unregister) {
> +		basechain->type->ops_unregister(net, ops);
> +		basechain->registered = false;
> +		return;
> +	}
>   
>   	nf_unregister_net_hook(net, &basechain->ops);
> +	basechain->registered = false;
>   }
>   
>   static void nf_tables_unregister_hook(struct net *net,

Thanks for the report, the trigger is clear.

I do not think we need a new field for this.

A dormant table never has any basechain hook registered. The real
problem is that nf_tables_commit() calls nf_tables_table_disable() for
a table that was already dormant.

Since table adoption added __NFT_TABLE_F_WAS_ORPHAN, having
__NFT_TABLE_F_UPDATE set no longer implies a dormant state change.

Could we instead check __NFT_TABLE_F_WAS_AWAKEN, which records an
awake-to-dormant transition? This also covers adoption combined with
such a transition.

Untested, but something like:

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ nf_tables_commit()
                         case NFT_MSG_NEWTABLE:
                                 ...
-                               if (table->flags & NFT_TABLE_F_DORMANT)
+                               if (table->flags & __NFT_TABLE_F_WAS_AWAKEN)
                                         nf_tables_table_disable(net, 
table);

Also:
- Please add
   Fixes: 31bf508be656 ("netfilter: nf_tables: Implement table adoption 
support")
- netfilter fixes go through the nf tree: use [PATCH nf].
- A selftest in tools/testing/selftests/net/netfilter/ would be nice.

Thanks,
Xuanqiang
