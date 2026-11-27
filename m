Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770974;
	b=xxee/JgMCb0++hjXq3zu3GagpIv72mNx4dvCTMbvvqsSm3gG8axg+j81dvrblC5WR7Bh
	 6mRitzS02K+oWGYby84RqUPAIlwmTUxeQUjdiXLuLvx0h1g1QTR/YqUwyRhafU51fWYFW
	 27XiRLSvw3LsMyewKHU8cJOzuutJNKghNTNfZU4oNV0WmQJY2JJL2EQTwAV45kNxWaaRt
	 3+oMKu+uH1qMJLa4KbryBV7Ic337YWhRVm32O7ehjBaOwbFRTWrX4CU1jZu61M8YQoz16
	 rf/aIeRfT4C2775upPlX//nG4HDhF6EiaQkHkoASpA9YB4/+gsV7p2DIn9Lvkp5YrYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:In-Reply-To:
	 References:From:Date:Subject:To:Cc;
	bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
	b=X00QLhAlmj5yVYOn5/t4daBMvBZHHyKFOemZMSksR3+b6W9EbNN7hopsFKfDEC4EbLiN
	 S/NqD18tOrr2aRgbz6mQ2sh4hKMaiPN2SVj6LnYzWkcaFKrrBz8aXhXW8tDyWkbmCJmYL
	 tKn54MdOYQ513O3ZpXUh5LyiojcTRdpy2VRYKxC/bllkV7mp/f0WFaliX+CCbyk9FHC4g
	 vE5etj8Q+ycLAFqcQUnvsT6RT9W/qCW4cBgckvZnjgy/ptUeDKCLWdN0lUXrh7KOzEPTZ
	 nLlSgQqtOv75ttrYWc9NlOOjT/sMwH/uEl2O+Du0CyXDtMa5b5B6XAXZmpu/xbsfhaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6qcwxjP;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BD8606A327
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BD8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6qcwxjP
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2f0c72f9a1fso21814815ad.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770973; x=1796375773; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
        b=C6qcwxjPYmrTxRyaoqpkViGq8K/WQ5PkHb+KWVj9FuOrHZO9A7laWWUpEfbyrp+LBQ
         IaAonyhiTsoYpUkLZd0ILYbX5LyN/lqRLgfmzf+Djt7G6FHmepOwozYvaCYQZGAf/Q0f
         Z3Gl9+vPwB12SFY4xOahYc8xXFQvwwiF+KJrerqRvxZuWnVc0jzHu1sDDDDURpMuQKZL
         MwGc/ElgAQSjaam+0U7pYOENUfmyz0jU2FulkpqXQsUzInBGnsgFCOtCzemRwTU+Ewxy
         /mtKB1InjYd43Ikrh05UbsBXsJ+ZA86kpdYJrn3EgbAThH0NxvQ3/NtY6auAvzc+Tq1q
         BJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770973; x=1796375773;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
        b=hGMVmLKtqYWbyvk7lfax2js2ItvMRmjjeDAC7FiYIqh9vk8UKHcQJklzG8DzVN6pnQ
         ftO640yCuXWcxH8ISNHCedI8BC9DNh1trUNMPt/KHE/3NIKP3m9gmeVbKr2HWecQ2dtu
         aIJkDMAKJ3YLtfXzzDgfz5m5RDGJ3fhR0dPoJemF96okGbA5nOU43dt6CQm3gzi2RWDA
         mRUIpmYIfO9ZPgMHkbG3p9sykn1CyAOb/iWup9UpYNFmgnVJa1JmBWqfkqFj+y5DBvT5
         IvdlxER6icjWB8pm6X/Uya/ca8RA5SND5QU9tXt/k9HePZE8aqMfifpajFsBJBxkjlIG
         vNsw==
X-Gm-Message-State: APuU4Z8jz1xP1KC4V8tp+iow+lIjMLJOiR7pliJxnLjjQ6/r01R7RGly
	x0uOgBa9MKzQvmJKfc3WZMBXPeG15jWxcbK+VaIR8N3owFsi2dt4RY78XPhk3YoY9rljrg==
X-Gm-Gg: AZFdTZehsa231fkzVrmeH3S1loqmfQrrALGjpnoWmUNe9+RIkWSh5CTc+s1BB2SlcZu
	FZPdY2d191MrIsTftnXv9jQDq0YnuRm09ikz2KGhJsAelHddwxR3mSUxHWo0TfuMgHYshnvQAtu
	AvETqA3qN/htWnWGU/J+CXowLsAOVDB1QAf5DGAvTJsExRzUvt4fsScivU/zFStGSwz4KLiieyx
	nJH7hsEczTWDJo1ygsZibcwWuJYrOC1I/xnTm5Wap4swWRK8gXNot3sFqZJIvce0KGkNELE0OZv
	qYiMukHWcikPXYTRTgk+wqY+J7L+E3+4Dq2j5J/2Np0upQZvwzDobsvqNs4AQk7EQlsnu6Sanuc
	DRKLNA4CK2JSmDArsyFtQUMSvFsfyF6/Ww7Yecak4fCdXh3BoVobI/9id1VT8YDmgiYwq+9/6cu
	/tQo6qR8YWmB88rFibBACkoeXlAHFZJZl/JM+NydIUFxJBDsriFSi1xisw+r2ZV1JZ2zuT7rz24
	FxpOyZhLWWVUsDtV3SVbdRFPiIodyGyv5O1tMv8GXkEaXgkO1vwmxrzooXQinDxwyzI3yu9Ichb
	KbzB7tWiK882Ua405YFnHVy0tmnmjJOwPNlsV9BN9jjkJkR7OzQMO7HXA/eJklRoyZwTHdc3ze2
	nn5joM/pepmGnDltSllUyQE0=
X-Received: by 2002:a17:903:1acc:b0:2f0:a113:4e46 with SMTP id d9443c01a7336-2f0a1134e76mr155413505ad.48.1795770972894;
        Fri, 27 Nov 2026 01:16:12 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:12 -0800 (PST)
Message-ID: <71e47f31ab9eac91c07bc3b9535c87ef3723b961.1795769101.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795769101.git.n0ps1edzz@gmail.com>
References: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 14:38:01 +0800
Subject: [PATCH net 1/2] ipv4: route: fix use-after-free in
 ip_route_output_flow()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Kuniyuki Iwashima <kuniyu@amazon.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Hangbin Liu <liuhangbin@gmail.com>,
    ipsec@lists.linux.dev,
    linux-kernel@vger.kernel.org
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

ip_route_output_flow() drops the RCU read lock taken during route lookup
before reading rt->dst.dev->ifindex.  The rtable remains referenced, but
route teardown can replace dst->dev with blackhole_netdev and drop its
reference to the old net_device.

A concurrent netdev_run_todo() can therefore free the old device after
the pointer is loaded and before its ifindex is read.  KASAN reported the
resulting use-after-free twice while UDP sends raced with dummy-device
teardown.

Load and dereference the device through dst_dev_rcu() in an RCU read-side
critical section.  This requires netdev_run_todo() to wait for RCU readers
after flushing routes; that fix is a prerequisite of this patch.

OpenAI Codex was used to analyze the supplied KASAN traces and reproducer
and to draft this patch and changelog.

Fixes: 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/ipv4/route.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index cd69242af..b16a9d05f 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2982,7 +2982,9 @@ struct rtable *ip_route_output_flow(struct net *net, struct flowi4 *flp4,
 		return rt;
 
 	if (flp4->flowi4_proto) {
-		flp4->flowi4_oif = rt->dst.dev->ifindex;
+		rcu_read_lock();
+		flp4->flowi4_oif = dst_dev_rcu(&rt->dst)->ifindex;
+		rcu_read_unlock();
 		rt = dst_rtable(xfrm_lookup_route(net, &rt->dst,
 						  flowi4_to_flowi(flp4),
 						  sk, 0));
-- 
2.56.0

