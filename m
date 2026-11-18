Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025170;
	b=DI/VzR1anbqjhsx/WxRUsTwH1TkZRJw08c0HFDrMn452fsooTskaK4owyajDXjTTBq7n
	 mLBm2uoyfjYsHq2AWjMb+ZM6cxkSVZpKd6GCqQAAlti54QxBkz15O+dA2VzGk3CvBVHNj
	 0z5zylQBvOwcr0v4MgQ5qKY9oWOCmPplKI10eaTiZto+Q18E1Wl/kfM8CsmwmUqeIjqxv
	 Mxwe/D0h7CM7DmiXFI363Enkpvyl624zIyNSy01atJjKYrmssLXd0LeKl1zOqOlJwYQJY
	 mBpO7E05z9gPmI3z3x3Qm7funF28mcM5eRiDDoa4c/rNmsNFCFi4xlkP6hMJ02tf+8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=eXUvvDMI79T0vGt9VRNdz/EoDy6fjzlLVq4Nma9GGH8=;
	b=eNui0L8V3bIWFxsS5nImCSh5zPn5G/mSxJaHio94NwX2KbpJbGdFcWh7spaxttQTxNyG
	 6TDCnHfY6jn1qrv7Taq1dRBnPFGEdHSAVzecv1ybxdY8SL3fy8rWXPB5PylscKTXg3VX9
	 P/UYL1zY7Oqc4ETjfYnYBPm7GHF2/H3IHn4rQeooacptN7RVmBhKQ4SU07MH+nSl4BUXz
	 AWV7wC7NUQLkUNLpSNsoTsWGozH8QYah98MxLI3pCKv8GUdpUQIp53F8LHBKefwZxBoy9
	 fQrvkX8+J94LK8f6+T92M24wr+NmZdE3I6Y9j3Y5jjIhrtr40FIVU2SdA1wjVjY63Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPVlw3na;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4CC606A33B
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C4CC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPVlw3na
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1027430a12.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795025170; x=1795629970; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eXUvvDMI79T0vGt9VRNdz/EoDy6fjzlLVq4Nma9GGH8=;
        b=IPVlw3na5/CvdnAc1RKdNpm6kzADjS/7Ald6sHb6TWpEoAQNKmVhTNLGw9NVK/WlJz
         ZaeaynDc5ckAMFRdc2Hw7Le/4TZ0jlwLWXNznuG58vOfxigOfkZ01l+0vji8Q8aA6SpQ
         FFKhZiHZZ/NjtRSf2a5SV7+5cL0vJrFrh2rguYwkKJBJLPfm2Bj2zOKt5iGn/ijPsehR
         XPzh0bxVnTDXUfL5GsU1/ThU89yrS6zy99rf75MP8tYahrjAQbGiDhg3ACWuRW/WyviZ
         jGM6AqtpZQoBJTQ5Q3FMSzDuD7GQ9KGTXD5pS8HtNJMxOBT9Pwo0TVgMtks4EcSGnNN/
         ZYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795025170; x=1795629970;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXUvvDMI79T0vGt9VRNdz/EoDy6fjzlLVq4Nma9GGH8=;
        b=EvAz1EQ3vnMxoyky9kQvM9BK7E0oumjI/PjC0aHY4ufxpB034eipZ2t9jX0QGfWAXJ
         tBzCjxMOm4RTnJQa5+dVoF590V2IgMraalc5eQhLOh/YAkYc7crIi/FfrUR3AwSQu1WJ
         6+T/ciB8aTBhWm+6eIe63Ww8fQPaU9jZx33DhjXQv6R6NJPN+UFxmZG4FIKw+7YLN1AP
         AWUUCexurMfBkHA0zm0nRRG8dl0ppbrne9/oCXy2vHUUYzyPy07qEJFlOdOzaK4ovBb6
         T/OIkWWy3saGN+S8XGurJbwZ5WIB6vfAci7Ghc7o23wwXbzqTnIY/1KEGYaaErRf9yMS
         t8cw==
X-Forwarded-Encrypted: i=1; AL+hErHJvDuhUpmwe5mmHHWBNS7+RlkiarUL037YjKd+o9Ic1kHoeAbrQGqjakFR2UVTIHh21v+BcQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vBOjzG5qMk1bLloOKLHfwROTp6b6faM3ZIihEjD8D/EYXSUqI
	p2oopjwX0luvWVmnB8JYY3KeICsedK9EHqdU2Ro3FsDgjaOVCO2FOOBV
X-Gm-Gg: AZFdTZfqiDfklRVR+CebabyK/MFHl90hat0zlVAYqTEY82opeRm9uRM+C0xytC2jMWE
	AkL0nfakdJOVKttucFaVu4SGQ/A8fxjUMk81OYAgD4f1j1UQ9u5T18AoXMcWpquIZAevztClYpA
	NGdxXWRsNo4yLMbYrcKd/zM5RYF+Jr5YOxUZ9RwjAJ9Zwe1DociWolgi1GOux68q58oMm2lemCN
	PvAmpZSWHfpCqVnB6Rq/tBK84/ylBeuBQ+djKuBa4wl275Pt3s1TKzAFYzYsdgmLfnhxryKH5Ux
	NKmzhw6hsmh10SCZXRFdoaSMDNQEU+ka+MFUkXrCTr4xJZqwXVgspen6na8QqSOysrl8zKI0pu9
	c48IrfoiBGsy0bHou5mKghQzE0WdA0H0QKTLfG0bFBh/1ydoX1HfMBp+AnJRDkYrAYS9MOhx7qJ
	SDW4w5whITBg4t1LeT7QUy2RNT64F2yEGjv/GxDeRzdPR38KhvkJl7+m6zOVMEF91shKNWvvpTb
	Vg/mOAa5co08ZpMuFH5ndS5x6CmbcTQIo2F+uAIZmpUCIhae8TfXDUXotjCH6qq5DMMQ84=
X-Received: by 2002:a17:90b:3c83:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b3d074d836mr3433754a91.23.1795025169495;
        Wed, 18 Nov 2026 10:06:09 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f56df516sm368042a91.0.2026.11.18.10.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:06:09 -0800 (PST)
Date: Wed, 18 Nov 2026 10:06:09 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Aaron Conole <aconole@redhat.com>
Cc: Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, dev@openvswitch.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] net: openvswitch: don't WARN on a non-IP packet that
 needs fragmenting
In-Reply-To: <f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
References: <179492834266.3639154.14679778183890331729@gmail.com>
 <f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
Message-ID: <179502509517.2983267.1652158471891914135@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

ovs_fragment() only handles IPv4 and IPv6 and drops any other packet
with a WARN_ONCE(). Since OVS_PACKET_CMD_EXECUTE takes the MRU from
userspace, any ethertype can get there, e.g. an MPLS packet executed by
an unprivileged user in its own user and network namespace:

  Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
  WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
  Call Trace:
   do_execute_actions+0x580e/0x7380
   ovs_execute_actions+0xd3/0x3e0
   ovs_packet_cmd_execute+0xc21/0x13c0

The packet is dropped either way, so use a rate-limited warning instead.

Fixes: 7f8a436eaa2c ("openvswitch: Add conntrack action")
Closes: https://lore.kernel.org/netdev/179492834266.3639154.14679778183890331729@gmail.com/
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
Aaron, here is the patch, with the rate-limited warning you suggested.
It was written with LLM assistance; we reviewed and tested it. With it
applied on net, the reproducer from the report prints the message
instead of warning.

 net/openvswitch/actions.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
index 12e339cbf791..bf3f2b328b53 100644
--- a/net/openvswitch/actions.c
+++ b/net/openvswitch/actions.c
@@ -828,9 +828,9 @@ static void ovs_fragment(struct net *net, struct vport *vport,
 		ip6_fragment(net, skb->sk, skb, ovs_vport_output);
 		refdst_drop(orig_dst);
 	} else {
-		WARN_ONCE(1, "Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.",
-			  ovs_vport_name(vport), ntohs(key->eth.type), mru,
-			  vport->dev->mtu);
+		net_warn_ratelimited("Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.\n",
+				     ovs_vport_name(vport), ntohs(key->eth.type),
+				     mru, vport->dev->mtu);
 		reason = OVS_DROP_FRAG_INVALID_PROTO;
 		goto err;
 	}
