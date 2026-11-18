Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967326;
	b=XyTZ/eYmNNPpQSbf26P9AZQXf7kUxJXTBnR1u1wXZh3nvHzq3IwT8btE68nmY1XJlyft
	 GTrsU44qUOhwlNi/y4xPdVL/8mw73qYoPdz3omx1L+xo0In9Dj6jS1PVatCArwsujLVEF
	 8WqHQ4J+XVoyRfod710LyIUQU4L432VsMOfrKP4FuhrQaCdfCuDf1lPEI5PDUIvOauO2U
	 jHxwxXFv+Mq9SEX2JmsqEwlCTnS0aSQfVHje4y9MV/zD+7dHDtVe5T8ZE63T06mb6mhOi
	 Cgmh7QvJcCVPcuVUQ3aNrMrESgTiZci8gqnedCaQ7P5cu9DN2dRnXP5mEiYnRXmax/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967326;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fQj5g/lvk0EAaX6Co41L4LJ2o/AwPZge1e0aV/8cDx0=;
	b=MERdVVQNy7Amk1qroZxIPiGeWNa2DcAUob09Q2t4mbY3H8vHrd06kGHqu2FqU1Lg3IV0
	 xnRZ1n/d3le8py3NE1mg88ABSAqWNkd+8VkzMUrjbVNA+u9aD3NNSpodFy3WQrVzpcQOG
	 wPAtruV8owjs07U4drwdxoJJYdmhyr15L0oMGhwPhVbULw2bt0bgRlABZp1Ft2FQsm3+g
	 BXtB05epDkGu4MpmXA2jPtnl7MQN63BMnDgtvN4LJqzL7Lq0qU8kJ/AGChIx5N9abGQHl
	 ZcMPm9tV5ORLFrvdWQ4CdrUVX+PNXrLB/37z1uzAhXvEtzbNQC+4bnX8kxakAdz+Ceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ohTpTWfv;
	arc=none smtp.remote-ip=95.215.58.165
Received: from mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A8606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ohTpTWfv
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UB1RHYa2kLvTkXPuxKeUXS1UT2WJukR57HA+prhjOZE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794967323; v=1; x=1795572123;
 b=ohTpTWfvKgMMQAMA9nEGh409M/JMovk8/hBIXVa5S1JEijFjZl9mMCWWL0BO7XWdMXM0x9az
 0r8QdtDa0ycudLZ6NuiQrS4llen50fKCp9DqGvYR21IEZSCk+YK80eBaY/c2yv+VP87K9U68n7E
 DAasMJPmt7Up5LoxznoS1e8A=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 897deb0b419e9f34;
	Wed, 18 Nov 2026 02:02:02 +0000
X-Mizu-Trace-ID: 897deb0b419e9f34
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 10:01:52 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/3] rtnetlink: return EMSGSIZE when first
 dump entry does not fit
Message-ID: <av0HEABXXzKVNnoU@fedora>
References: <20261117221538.184948-1-stephen@networkplumber.org>
 <20261117221538.184948-2-stephen@networkplumber.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117221538.184948-2-stephen@networkplumber.org>

Hi Stephen,
On Tue, Nov 17, 2026 at 02:13:42PM -0800, Stephen Hemminger wrote:
> If a route entry is too large for the dump skb, the dump is silently
> truncated and no error is returned.
> 
> For handlers with RTNL_FLAG_DUMP_SPLIT_NLM_DONE, rtnl_dumpit() drops
> -EMSGSIZE and returns skb->len. With an empty skb this is 0, so the
> dump ends with NLMSG_DONE and status 0, and the remaining entries are
> lost.
> 
> The first dump skb is allocated from __netlink_dump_start() while
> max_recvmsg_len is still 0, so it is only NLMSG_GOODSIZE. On a 4K page
> kernel that is under 4000 bytes, and a 500 way multipath route does not
> fit:
> 
>   ip link add dummy0 type dummy
>   ip link set dummy0 up
>   ip route add 198.51.100.0/24 table 100 \
>         $(for i in $(seq 500); do echo -n "nexthop dev dummy0 "; done)
>   ip route show table 100
> 
> The dump prints nothing and exits 0
> 
> Only ignore -EMSGSIZE when the skb has data, so that an entry which
> does not fit in an empty skb reports the error to user space.
> 
> This only covers handlers which report a too large entry with
> -EMSGSIZE, such as the IPv4 FIB dump. inet6_dump_fib() instead returns
> a positive value when the first route does not fit, so the check added
> here never fires for it; that case is fixed by the next patch in this
> series.
> 
> Fixes: 5b4b62a169e1 ("rtnetlink: make the "split" NLM_DONE handling generic")

Should we keep the Fixes tag or not for net-next?

Thanks
Hangbin
