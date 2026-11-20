Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144989;
	b=UfmUhMED5Y8VQ6GXUxNyMBhPbfrEH4j/4CZTxkex8LWEVSAqQuX35dK/wVWnqkjths/3
	 ul869Q3wC6n0FngCX4zBUodrmkdZgIjZh7mKHw3pkVlps3ys2OtMYM8/3XgS+ttKQxJyn
	 0US+gp+V2ckyL6+BI4ac80ang5mV5zUzhEqLBdvVN+IMHKo9+6mZNBp1dTJVgxHZGKE9W
	 arvz19RQPRWpuHINW+fs0zz6Rb8yZ41qILjet9brYEQWkw3T4J3ntCE69aSkwl2Gtv2CY
	 2gk81Dnbjdvdb6tjrJ74ssYrnvUY14dAwKcboArpn+cfnV426Gi8b4g8uPxVFXXGM0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144989;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UVehckMmd+GLNmdbDTyKFoAw5Ssc+uHbNgaENSRTrCU=;
	b=Q8c40AvDm/ul6JM+xcG3wzaMVFsyRe7dI1SQvXK0qvbY0h308OcQDvj6Cz9p7Eew7Hw4
	 AzqvV8Ui7aFBCpJ7AS34XV7gIbmnxJdoxf4KF7kohChrV1iOQWFSfJ5p5d7owCo8tcQoR
	 5S56re0BB9Sae1Gzco8gOYABNi1mqtcXHV/XEe6Pjeqo69SwuFnGHiqkQLxKzYjHRpThF
	 60ME2W4r/uVvBJcHkf9WhjG4qDApq1g3z/7mmWIuU48Tv1HV7qk3q7qE/Uy59ZtHOYr6W
	 SDEGP3h2NiBM2vla87ph8HgoVLpIhodUIk0u7wQ9vVJmmw5US8lMASi3QT6p0aO2H1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=T8a78auw;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F33606A33F;
	Fri, 20 Nov 2026 03:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F33606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=T8a78auw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=T8a78auwzDS1tHgN3CG0VrMj7JFeKBHVCi+o8cRgq7AgCHIXnzxfAAAfviyv1ZzvNNkBhbk0HHsqu
	 SU8tQKtsJSOrt2fbK2eubzB095Kec552oYoSqBD82wBbzZWWfX7wgkYbFT2iinTvMULJNYKqBUMbVP
	 2WXOZ7yPovVfSKzU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66affbd1afd9-f02fa;
	Fri, 20 Nov 2026 11:23:07 +0800 (CST)
X-RM-TRANSID:2ee66affbd1afd9-f02fa
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.net (unknown[223.64.113.192])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76affbd1950b-1349f;
	Fri, 20 Nov 2026 11:23:06 +0800 (CST)
X-RM-TRANSID:2ee76affbd1950b-1349f
From: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com,
	1342116488@qq.com
Subject: Re: [PATCH net-next v3 2/2] ipv6: preserve ip6mr_get_route() error in rt6_fill_node()
Date: Fri, 20 Nov 2026 11:22:42 +0800
Message-Id: <20261120032242.18180-1-sunwenbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <179509619942.3136.14572519530709310239@kernel.org>
References: <20261116014744.18223-1-sunwenbo@cmss.chinamobile.com> <20261116014744.18223-3-sunwenbo@cmss.chinamobile.com> <179509619942.3136.14572519530709310239@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review on v3 2/2. We analyzed and reproduced each point in
UML (`CONFIG_IP_MROUTE=y`, `CONFIG_IPV6_MROUTE=y`):

1. [Medium] Unreachable -ENOMEM / -ENOBUFS examples and misleading -ENODEV:

   Agreed. Because `inet6_rtm_getroute()` allocates the reply skb without
   assigning `skb->dev` and `ip6mr_get_route()` looks up `rt->rt6i_src/dst`
   (`::, ff00::`) rather than the queried `(S,G)`, `ip6mr_get_route()` always
   hits the `if (!dev || ...)` check and returns `-ENODEV` (or `-ENOENT` if no
   mrt table exists) before ever reaching `alloc_skb()` (`-ENOMEM`) or
   `ip6mr_cache_unresolved()` (`-ENOBUFS`).

   We confirmed in UML that even after registering `d0` via `MRT6_ADD_MIF` and
   installing `(S=2001:db8::3, G=ff0e::1)` via `MRT6_ADD_MFC`, running:
     $ ip -6 route get ff0e::1 from 2001:db8::3 iif d0
     RTNETLINK answers: No such device
   still returns `-ENODEV`, which is indistinguishable from the `-ENODEV`
   returned by `dev_get_by_index_rcu(net, iif)` in `inet6_rtm_getroute()` when
   `RTA_IIF` refers to a nonexistent interface.

2. [Low] IPv4 `rt_fill_info()` having the same `-EMSGSIZE` masking:

   Confirmed in UML as well. When IPv4 multicast routing is enabled via
   `setsockopt(fd4, IPPROTO_IP, MRT_INIT, &one, sizeof(one))` on an `AF_INET`
   `SOCK_RAW` (`IPPROTO_IGMP`) socket and `d0` is not added as a VIF,
   `ipmr_get_route()` returns `-ENODEV` and `rt_fill_info()` maps it to
   `-EMSGSIZE` at `nla_put_failure`:
     $ ip -4 route get 239.1.1.1 from 10.0.0.3 iif d0
     RTNETLINK answers: Message too long

3. [Low] Fixes tag / patch scope:

   Given points 1 and 2 above, changing the error return in `rt6_fill_node()`
   from `-EMSGSIZE` to `-ENODEV` before `ip6mr_get_route()` is taught to
   receive `skb->dev` and the queried `(S,G)` would diverge from IPv4
   `rt_fill_info()` and expose a misleading `-ENODEV` to userspace.

   Therefore, we are dropping patch 2/2 in v4 and submitting v4 as a focused
   single patch ("ipv6: check mc_forwarding before calling ip6mr_get_route()")
   that fixes the `rt6_fill_node()` guard for `mc_forwarding == 0`,
   interface-local/link-local multicast, `RTM_F_FIB_MATCH`, and non-multicast
   matched routes.

Thanks,
Wenbo


