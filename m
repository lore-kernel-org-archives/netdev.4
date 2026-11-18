Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991572;
	b=oyY6p2ozpXcXTFldIHvCL2w54NYj6lJE+sU3Jq8oZUg4ZEvQxZgIyduXwBQF+P5X8xNL
	 bVZ5A0pehCVKCXIZJ9eqelLeIiv5pet1tR9A1ho9LD5p0dlAZoqRqlJM6tOSSM0lTL41a
	 elvvtZyBa/vAUQzoJE2JHIDImwwyl5k3g+1IM9tGBNiVP+2prfIHzDUW4tWO/pgTlNjWQ
	 dZR1FCIZ9v8WOqwxfoW/sJnUB6CGOBM1HV28J4pqnJoGMq3RkDmD9CI9Icm/jVdtSlj88
	 mBF3mlRxcjwfypectmPwMkq+oe31mKkg2U/rt3IlVGd5meZQVJ8cQbFTs8i5hqAWchw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
	b=zDdEHLEh/0+shM+AbEh5SkVK68IBOEWOtFmL76pD+2bIxjd9aPUGz2x53rGBby8PJh/j
	 fkf7awzW8x9CmCH5yYR14JlZe7kdnCmTyBAFDZg1JBgn81xhCSx0j8RsfJPrtgqa2OX3U
	 b1w60OJYgMViLVM0kMILptDL0ZKvKXC9mdISwuHnhgD8w2iyPfcJnDwNDc/VkadYq5HCa
	 LuTu7ZEpAmyuk305gLqLBniFxh50983XoiPbLE9NsDnGlHOEjFIcJnI3roM6tbhLrddbt
	 jt1pcMQovDZ0Fzxo0JyCE4LiRY2WDsm0tWrHiC2ddeZB8koWtcV01wZhnBjYGzP5ZSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ylwfilqf;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FC8606A338
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0FC8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ylwfilqf
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3b4944a0eso579725c88.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991571; x=1795596371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
        b=YlwfilqfImrmeUkjlmi31h8/Gtwx5R+YTc3jkhYD55hYY4e+ISCZjjjbTdIiTzhcV7
         cbSD6Mhy0IK4wtt/gqPLb3WBm/5UwX5ZaiG7GxzQQ21Y16HGi71C6/Q32aJHlyQFBTo9
         o43bdcYA4TeNLD/jN8dVcvW6x4KD5Y9xsgFAE/mXaBPcVfAQSxmdd0ZmeS+88bPuJ6/y
         GuEXauXS/+B4MK+eeDHAnsozZwqhXA3K+9RnlLJPuWqj3W0vecclR2WMx3PKOYSu4nm2
         0JE54dk5TPK5j/uixo96McpIYb+68Q936zCzgqvjbOwp/oco8cQjFQZImAqdnXwEA/h7
         eJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991571; x=1795596371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
        b=sq0c6xGQvM1bqPmjkaf6H40xYs7cRNqKYJBLcHvdrB8SJsrCHUMe/KE7gc7Ufxayv/
         ukTaYtnxWJf3p6cAiO9LYt5/JYVj/O0tblcU9ifUvivD/Yg0hN5SuNZt8+TlQbTdNCjP
         bt0XIjHG0r+76kU37gsruYY+jcjJ3IcS3gyeXj00TQ5b8uy1eUckrCgs2n1yNe4HcrWt
         KknKVCo9FmaV1N033fxK0gdFXZC3aifQS6ZKXSZ7L4ELGkRkG/KqogR1kH/8UcBrfhHE
         QKxD3z+MmoKJGncNBpBz6KqnT8zWJfeVnaWTcUUoh5h9OZdkorKLpFe7HXK3F/hbg+u8
         768w==
X-Gm-Message-State: APuU4Z+AIc++CHN0BOWqZanoR0DBTPAQNCYE9zktVUomfsbDybR8lusT
	8HqelaqXx9CMDkNfgF6mtcH9pRBF/r6+cV+9Oo/n9QiWl34jQzIat2JZVfewDCwquqQSS9rs
X-Gm-Gg: AYBFou1elmgLxW0jJalc4Ung9FpX78thQxEIcpfe27JY0MjUSsOp0R4IR/MKvSKJi1H
	Xbf7gFi0bNIToNUwQ2nf3HdREMPNEe1rHSQGWEvN/Iu9flBZeNRhpAQU0WaMV96WbJ2DeshJDEn
	i78zNqV/l3rO/094I17IwPYCXZJc3GLtp1xKxaH4/nHYi8CMgXRCfhBo9Wih14B7eQJ/UjSBPb4
	UjYyUO1thVy7eS+zMbtXuNFOhVRVdBfH9mq2BFeXhrGMd4TV/cTq0mdWM3B1d053as1lQZrlr3H
	JppZmhBfUN3cMPwaQn8y+3LWhN1bN0ONKA1/+9fJvCNtDcAlxEetOr4B4+zehpU3BCH9vAfIhl0
	M3YnhFvN2m0VzyexOBSJ+C/O3XI5Y3639DPXLwqs832H86FqYOiKge71K86yAJed43Rck+Kh7Vc
	xs3HBmkiE8zgvKv9DqnhMbaHZtaBpcTe3F6a914NjwaDeHL78qnXFZ9T6MjYiJWT4+Z2Q8LkDAd
	96lf3BpYGK57aAKT+DlfZn5T0CD2KZy6qQye1lvpTveufyrY7CNJRzqSKJNa23O6LeZmyqCfVYh
	m+Loii6BBtckPk9XLTsdVph1vIkNCdHQnOHWWyrKWFGK0+5fIxrYO+rYIekyMpNlqk80rW3o9Ws
	O8w==
X-Received: by 2002:a05:701b:4584:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b543af0334mr2051555c88.3.1794991570825;
        Wed, 18 Nov 2026 00:46:10 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:10 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 1/2] ipv4: accept nexthop dump attributes in route deletes
Date: Wed, 18 Nov 2026 16:45:09 +0800
Message-ID: <20261118084510.332821-2-zypulsecore@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118084510.332821-1-zypulsecore@gmail.com>
References: <20261118084510.332821-1-zypulsecore@gmail.com>
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

ip route flush reuses route dump messages as RTM_DELROUTE requests.
With nexthop compatibility mode enabled, the dump includes RTA_NH_ID
alongside expanded nexthop attributes. rtm_to_fib_config() rejects the
combination with -EINVAL, leaving the routes installed.

Skip the mutual exclusion check for RTM_DELROUTE. fib_nh_match()
already uses the ID to match the nexthop when an ID is supplied, so
the expanded fields do not constrain that match. Keep the validation
for RTM_NEWROUTE and leave the other delete selectors intact.

The failure was reproduced while investigating the iproute2 flush
report below. An unmodified kernel and iproute2 reproduced it without
fault injection in a fresh network namespace with compatibility mode
enabled.

    ip link add d0 type dummy
    ip link set d0 up
    ip -4 nexthop add id 101 via 192.0.2.1 dev d0 onlink
    ip -4 route add 198.51.100.0/24 table 1111 nhid 101 metric 10
    ip -4 route flush table 1111 metric 10

Verified the flush and the existing new-route validation in QEMU/KVM.
The IPv4 compatibility selftest reproduced the failure on the base
kernel and passed with the fix. The IPv4 group and IPv6 compatibility
selftests also passed with the fix.

Codex assisted with isolating the IPv4 delete change, writing the
regression test and running the QEMU comparisons.

Fixes: 493ced1ac47c ("ipv4: Allow routes to use nexthop objects")
Link: https://lists.openwall.net/netdev/2026/10/26/186
Signed-off-by: Yuen Su <zypulsecore@gmail.com>
---
 net/ipv4/fib_frontend.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index 8c123b1..6b012c8 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -868,7 +868,10 @@ static int rtm_to_fib_config(struct net *net, struct sk_buff *skb,
 		goto errout;
 	}
 
-	if (cfg->fc_nh_id) {
+	/* Dumps can include both a nexthop ID and compatibility attributes.
+	 * On deletion, fib_nh_match() uses the ID to match the nexthop.
+	 */
+	if (cfg->fc_nh_id && nlh->nlmsg_type != RTM_DELROUTE) {
 		if (cfg->fc_oif || cfg->fc_gw_family ||
 		    cfg->fc_encap || cfg->fc_mp) {
 			NL_SET_ERR_MSG(extack,
