Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737963;
	b=25yDAPozFfswSjW7A62/M8IqxPeOesd/nh7rT54C3GUsgy9Gzk1OW9iTeduA/BZOTEnk
	 1phs9livGQIcXk5HuZgNp4uRYQ0HCJXxHP9ESgYVV6XvDT0mjNn6G0oYkYqb6pEUBm6zd
	 9Ao+nUrNQZek+Ib6fVDZKXqqfb//zHeimw+pDGRYlSsiz78HUs5ZkeoqrMVxj6/6yL975
	 TFB1kwz0fhmA4blizl0XKmZX+WX/qTRdR1INPHT7cOrsdYaDoPaCbGhXFMi6UxoxL2Xnk
	 sil7yxPme+XNIoaLdwyZZ1Af52Yko8i3h1tbleaQqg56xMkezzRgtxkvCdVhrA1NA2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8FdZmPYxVJRZwepv2ASwo7Gw6muFW4JO5etLfzKYWPY=;
	b=LwUEwJao+NYJxq7Qi6X7nQfLQUDDpZOM2Ko8G5zfz1GMjBFZbBt6AtL+PND0fureCY5r
	 Yuev7+1I8e7QsTXqzXpCdXwg6zdYIbzdmHOLQ/Fx71aCm1eLepgl10Ceb17pd7pcCmTv/
	 qEhPa5t6GTN8PTZN9fZArl6I+9l8P8L/DC6jMVGGNfBxSADAJopGyxba7l6lsvq1/Sslv
	 AWXhKWnt6tyUyX6hibO6Il2xld9ybDiAzxypwywSTlUKifNcSBvLLlubKMgCUPi15sSTR
	 K9EwFAdHDFve13/FgFLxRJ9nr9Tl78Ig+ESXUt+LAZ6qKYDR1FM/9mshbiHy0L+lPig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=MWGVQG1E;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612FF606A32E
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612FF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=MWGVQG1E
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f20b304c0so324083085a.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 02:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794737962; x=1795342762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FdZmPYxVJRZwepv2ASwo7Gw6muFW4JO5etLfzKYWPY=;
        b=MWGVQG1EmcCvaAbT9BiccGy3hK999wI2mBLTw6m0Jbj4d6yki8WXtF7CKwieJGeiKr
         a4Z9bNV2qZuskUaYPhoXKkQzopPtL2AGzmsoJtv72MFl8HnwHgpxz63X+EQ+zRH6R7aR
         IoLhQ6Hip33egtOCGe5g8lpSnTcFGX20yluAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737962; x=1795342762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FdZmPYxVJRZwepv2ASwo7Gw6muFW4JO5etLfzKYWPY=;
        b=gfqH2NFADVDGUEMbsf3IjSaqToCsWxnhB3Wweckd5E5H9UR+0OLQbElvadif63uZgP
         j2VeZM0VgawQuQTDibVn3hlCQwE7LFdGTndu1lcBiotdgzvbwPPOq70TLCf3C1krrr26
         VPydpPFXr+E+kMNKjC5SiE4s+kiJ0gZvO28VqfK3xcyBFQ7Ec1SBYtJX9O3ZP4i8aU21
         NNC+g9qxqLS7gvE+5xmmrZIAvFXqgw9QI/qglsKshK3HpglJVSrybNj3u6Vj9/9rkPD3
         9Aow9C4scTS2b0g9rJiXM7qpegOxBMvnbNRMmk9c90AFsBrL0FquTZPlgXOdZIKSxNcr
         06qw==
X-Gm-Message-State: APuU4Z+pDM9V20ZKWx3j/0Nuwa/u6fMBK6LRt0EnO8NNeWlHx6Kw0NRr
	7t04GKCICiLtqG3ySf8c3ayQFrTh4/2faChQw+DTK6TGB2teFMltIN4YuBgNlDd+aV+Szh7sMNR
	BGQY=
X-Gm-Gg: AYBFou1F6+DeWfadLFhU/pZEzNDZ3p66dDx9KEf7tcXyy3aE24pL6vpNQT5+9E8baQi
	gL53wccQGzXh+VGVa7yknTMRNN+oObj2LrSoaPIHZ7F0c/UEtICSRAy6/AdclV7hv2hadrePRt3
	XgCajS6k4s+r95kfbazPaAHVUNANvqmti1LrCW/LUJKv9JESGhtQ/bWMkMzxLC0Z5wQQJOTl7t2
	Vi9HDw/9q7XVBIWKLhjNtmHf7jS3XkXRUKnqKVCLnbUaXUkJ7OJJjLF+RUuFsddBslWSy92lx2l
	8n5OcZ9x7e8vCE1frlmpAmYcP77l6L/IwuiTGyz5nE0R3cdJRO/eREFR0E3P/HSx62DdL2zFXoT
	wGmILVhOHEnYnAVbM+8q1ksZJh3X+IH0ifbuNppDx9S54qNPfS/NCHnolErKNMQQIVtYfYjq/Yr
	q+7Sn/429N9a/m58/zi0RGpM/auUtKlHctPBUfTRXSXuh2y+ODtbCiPK7oSE4TahiheOvtsstN9
	EMyCvtaOEnFyxH8+EqlyL4KIh5EphrX6jzCaMJ9n+M9FmsIISlZ0Wh/RSn9nku4XnaOzGLknVJg
	BYkOgQQHR4vefmTPlf3c5zvDPq+13fbUmJH+07hnQIu4P3kDdM0rPwmi3eNXYRrPFkWdcLzu5f9
	W
X-Received: by 2002:a05:620a:4449:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-9494bc9296cmr1274673485a.68.1794737962445;
        Sun, 15 Nov 2026 02:19:22 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm592337085a.5.2026.11.15.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:19:21 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v3 3/4] netfilter: nft_fwd_netdev: drop the stale dst when steering to a device
Date: Sun, 15 Nov 2026 05:19:10 -0500
Message-Id: <CORE-9NOG.v3.r0.20261115050625-3@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CORE-9NOG.v3.r0.20261115050625@mojatatu.com>
References: <CORE-9NOG.v3.r0.20261115050625@mojatatu.com>
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

This is a followup of the review of the teql arp-queue fix as reported
by Sashiko.

The issue:
The neighbour variant of fwd rewrites skb->dev to the configured output
device and calls neigh_xmit(), but leaves the skb's dst untouched. If that
device's neighbour for the configured nexthop is incomplete, the packet is
parked on the neighbour's arp_queue while the stale dst still describes the
device the packet was routed through. Draining the queue re-looks the
neighbour up from that dst, so the frame is built with the routed device's
link-layer header and then transmitted on the configured device. The packet
leaves with another device's addresses.

The Fix:
Release the dst before the device switch. Both lookup inputs the neighbour
transmission needs, the device and the nexthop, are supplied by the rule,
so the route dst is never consulted. Without it the queue drain keeps the
parking neighbour and the frame carries the configured device's addresses.

The release goes through skb_dst_drop_keep_metadata(), so encapsulation
parameters a route carries are handed over to a metadata dst instead of
being lost, and a metadata dst already on the packet is left in place. If
that copy cannot be allocated the packet is dropped, never sent with the
stale route.

Conditions to recreate the bug:
Two network namespaces, A (10.10.0.1/24) and B (10.1.0.1/24) in one, their
veth peers in the other with only A's peer addressed (10.10.0.2/24) so B's
nexthop cannot be resolved by ARP. Resolve A's neighbour for 10.10.0.2 as
permanent, then load this ruleset on A:

    table netdev t {
            chain c {
                    type filter hook egress device va priority 0
                    policy accept
                    fwd ip to 10.1.0.2 device vb
            }
    }

Send one packet to 10.10.0.2. It is parked on B's incomplete neighbour
for 10.1.0.2; once that neighbour becomes valid the frame leaves B
carrying A's source address and A's neighbour as the destination.

Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-6HS9.v3.r0.20261103062649-2@mojatatu.com
Link: https://lore.kernel.org/netdev/QDISC-6HS9.v3.r0.20261103062649-2@mojatatu.com/
Link: https://lore.kernel.org/netdev/avTfQjFQYR2NNdRg@chamomile/
Reviewed-by: Pablo Neira Ayuso <pablo@netfilter.org>
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v2 -> v3:
- Add the Reviewed-by tag from Pablo Neira Ayuso, given on the v2
  posting of this patch.

 net/netfilter/nft_fwd_netdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/netfilter/nft_fwd_netdev.c b/net/netfilter/nft_fwd_netdev.c
index 7447da931a95..f486c7be385c 100644
--- a/net/netfilter/nft_fwd_netdev.c
+++ b/net/netfilter/nft_fwd_netdev.c
@@ -14,6 +14,7 @@
 #include <net/netfilter/nf_tables.h>
 #include <net/netfilter/nf_tables_offload.h>
 #include <net/netfilter/nf_dup_netdev.h>
+#include <net/dst_metadata.h>
 #include <net/netfilter/nf_recursion.h>
 #include <net/neighbour.h>
 #include <net/ip.h>
@@ -160,6 +161,11 @@ static void nft_fwd_neigh_eval(const struct nft_expr *expr,
 		goto out;
 	}
 
+	if (!skb_dst_drop_keep_metadata(skb)) {
+		verdict = NF_DROP;
+		goto out;
+	}
+
 	local_bh_disable();
 	if (nf_dev_xmit_recursion()) {
 		local_bh_enable();
-- 
2.43.0

