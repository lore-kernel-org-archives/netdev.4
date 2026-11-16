Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855738;
	b=tS/io6+cToKdEDEoHPiEArDebiccTd9gJNHJkdD3ge3ysYkkZckQFnE1sos82gUJdm6/
	 /a2vCHEkA+Gga7ozD0+3GoAzA1MCbkaIeFshokH5VfL8MZzNN27uzg5AiffZxPOodKXDK
	 evy+j767Vti6K3ev35GCsR6u5aeFdL86sl5xB6qvxtf9JvQkVKKAIq7w+rSF7M2feA46r
	 X0llTKiKbKUmjixdPePEHwE6hvdFmUxX7hN5bn4+2HJsG0CnCGeZNrSCx6LxXs1PsqGHK
	 5TfZsaXjmp5gFx3FVTKz7KK3b8lg/qJ5fxx4Ep2UC1/NCoFvBJu55OJhyd1EOx21dTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=76cSr5ASB4p2FBI2t721H4rduiQm/5IlEam8wJnUY/8=;
	b=Dg/3tnkty0DI/0zWf7Th1VS4hwSiR/etpvtg8yn2uc7h+q719tbbOPDbV8wtUWnP1vBJ
	 XV2OVqiC106Pix7qvyvuKi6o+YT6OPOWdOiVpdinSM/t2P9WK0VkO6PANVs2HlzQl38ra
	 bawYngeZvtlaveVjeB2NkSLUloqZluSqJwb+8laCiOrhY4S8mCqBfsvrd4T121584ZxGA
	 g26k2D01D4nsR6a7CtT04pkpF4VMD58LXFj71FU1R9Xbst+AbvB+10Bpt3XG7UYOeil7C
	 TPNZU4Di34PRMQe+ECVc2yFBDIa0Q0UGGyAuTNJLPdNVeq3vdwJ8QrYoF3LTKVgWxig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=yvW0cFf8;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AA606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786AA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=yvW0cFf8
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-980c4258105so3187377241.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794855737; x=1795460537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76cSr5ASB4p2FBI2t721H4rduiQm/5IlEam8wJnUY/8=;
        b=yvW0cFf8cuNdhz9kqF2PcteuTYW8ZFFG/4LdcWaAYItkZ+O/fDycSM8y/bleFL7evL
         a9eDMn6kSws9I3phaxrbMG6XAYzFzJyTEyI0D5957vThmnRrBHqsWCXbi0cOLIH/saBv
         ckuJL+yB7Wl+bDWDw7Y3BkPSsFm6+Id6pl0WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855737; x=1795460537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=76cSr5ASB4p2FBI2t721H4rduiQm/5IlEam8wJnUY/8=;
        b=X+fGhq+88MZSkHBG+4Uzbm3rkNzHUYHyttG3LIaRByktT2sqaA2CoKFzJrVDHI3ohv
         0cjNyx+CTJnlEQkuYZ5Wqyu2ZMYcnleEAasgKZYdiV7TkqLKk09yubT1Qb/IgBXSTRBJ
         Ot6/KU7+79SEXzZKwrRrzhU2XLiBlL57U4ICPgr9TmhFQJQHAaaTfVVGqZREDHnvnXVk
         3Gy60h9oe33mV/+Mxkol08C02BAGxTXMAUIPp13hF8k9nJAx2L0k/PzGweHSFAIJuOZp
         /+nJKITK3pCUV+qgv+fujSL26SjiPYlxjVDW5B5JbfMBAvbhqmdgbAgIUFtL5hfhlci9
         SbuA==
X-Gm-Message-State: APuU4Z+6c5CRBNeSyKptY9upwCkSk/0wfAHEQ+U+M6LVnAgapP6QXxdJ
	VnaDv9v38zYErSKvBnYdbV8pN2WfUHWQK5akeJZNrraEdn/vE8urK4/OfI9CGBgH120598H7b2z
	+lrs=
X-Gm-Gg: AYBFou2poAXODuvYeS+fUbQAF5HXL0+G79prC+DcvRfjKinspsyjvT9z+IO+QE+Vaw5
	jd7nPRuiED9/aVH9sxiNEtIAyVLcFiPbij/kc6j0MccbucYT8y9U0y+vrgU15xQ1oDjWuuP9sqJ
	UANMFQqfx5o6UBPKZahZy6WrLuHafsvRZq/Kj4VBcF0H/9RoCW+VqodI2s+RrNC6PbtftHxq2eL
	H0YlRRiUm3Iu2RFUbynCSl4UwKeD3ivJZXTm6aKPCelVoHfKg7kjCy/akEM3ggjSEpElVq7Eep9
	3EVXs2zwnigszQB7kSs50YsQ/FOr4KOKQI3vuhGVzCxyTK82JZszaTMK/cX3q1AY6bWMTyiP6po
	yKdwGK2ztPt0qr6zG3bZndY/syMjWJGKOOvRrsK4NlIHN8bKYc70healeHZYcLY59PJWKUFJnwu
	qxEQp+gB+6y2acc+w4WYOn5nUyaBYSV4xTXRbd1WNKGcrZG/LdMw743IWzqf361MSHq93LGRW/S
	B7QZFQCwzyS44ygpnqr5geCT0Q97x6WH0V2vr4GDMiIwNL3aBOKL5oAtHKqxfmAtp9VfKVaLdxe
	U9oCOaEYShuflTmffGGxsZNkjM9Kcrmbar8netFYaZSvAzFnO59LRb4DT0YUaWaDAfYePw2H6Hg
	=
X-Received: by 2002:a05:6102:2c8d:b0:7cc:cb56:bf83 with SMTP id ada2fe7eead31-7d64d6cb8d8mr4202827137.12.1794855716942;
        Mon, 16 Nov 2026 11:01:56 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm91997386d6.10.2026.11.16.11.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:01:54 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bpf@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v4 4/4] bpf: drop the stale dst when redirecting to an explicit nexthop
Date: Mon, 16 Nov 2026 14:01:41 -0500
Message-Id: <CORE-9NOG.v4.r0.20261116135311-4@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CORE-9NOG.v4.r0.20261116135311@mojatatu.com>
References: <CORE-9NOG.v4.r0.20261116135311@mojatatu.com>
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
__bpf_redirect_neigh_v4() and __bpf_redirect_neigh_v6() install a dst for
the redirect target only when the program lets the helper do the FIB
lookup. With BPF_F_NEXTHOP the program supplies the nexthop, the lookup is
skipped, and whatever dst the packet arrived with stays attached while
bpf_out_neigh_v{4,6}() switch skb->dev to the target device. If that
device's neighbour is incomplete the packet is parked on its arp_queue with
the original route's dst; draining the queue re-looks the neighbour up from
that dst and builds the frame with the original device's link-layer header,
then transmits it on the target device.

The Fix:
Release the dst when the nexthop is supplied, so the queue drain keeps the
target device's parking neighbour and the frame carries that device's
addresses.

The release goes through skb_dst_drop_keep_metadata(), so encapsulation
parameters a route carries are handed over to a metadata dst instead of
being lost, and a metadata dst already on the packet is left in place. Both
wrappers take their existing drop path when that copy cannot be allocated,
so a packet is never sent with the stale route.

What the target device's transmit path still sees:
The released dst is the route of the device the packet arrived on, and the
packet leaves through the redirect target, so consumers of that route on
the way out lose it:

  - a tunnel with no configured remote takes its outer endpoint from the
    route, as it does for the netfilter producer: ip_tunnel_xmit() reads
    the route's next hop, and ip6_tnl_xmit() and sit derive it from the
    route as well. A redirected packet whose route carried no encapsulation
    parameters is left with no dst, so it is counted as a transmit error
    and dropped instead of being encapsulated towards an endpoint that
    belongs to another device's path.
  - the route realm goes with it, so nft meta rtclassid, nft rt classid
    and bpf_get_route_realm() stop matching on that packet.
  - encapsulation parameters are not lost: they moved onto the metadata
    dst, so a tunnel or an xfrm interface downstream still builds its outer
    header.

Taking the outer endpoint or the realm from another device's route is the
same cross-device reuse this patch removes at the neighbour lookup.

One consumer is older than this series. When a tunnel cannot take an
endpoint from the skb, ip_tunnel_xmit() and ip6_tnl_xmit() fall back to
skb_rtable(), a container_of() over whatever dst the skb carries, and a
metadata dst is not an rtable. That fallback is reachable without this
series: a tc-bpf program that calls bpf_skb_set_tunnel_key() with no
remote already hands an NBMA tunnel such a dst. The release here can leave
one behind as well, when the parameters a route carries are not usable for
the payload. The cast is repaired separately.

Conditions to recreate the bug:
Two network namespaces, A (10.10.0.1/24) and B (10.1.0.1/24) in one, their
veth peers in the other with only A's peer addressed (10.10.0.2/24) so B's
nexthop cannot be resolved by ARP. Resolve A's neighbour for 10.10.0.2 as
permanent and attach a cls_bpf egress program to A, with vb the index of B:

    struct bpf_redir_neigh nh = { .nh_family = AF_INET,
                                  .ipv4_nh = htonl(0x0a010002) };

    return bpf_redirect_neigh(vb, &nh, sizeof(nh), 0);

Send one packet to 10.10.0.2. It is parked on B's incomplete neighbour
for 10.1.0.2; once that neighbour becomes valid the frame leaves B
carrying A's source address and A's neighbour as the destination.

Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-6HS9.v3.r0.20261103062649-2@mojatatu.com
Link: https://lore.kernel.org/netdev/QDISC-6HS9.v3.r0.20261103062649-2@mojatatu.com/
Link: https://lore.kernel.org/netdev/avTfQjFQYR2NNdRg@chamomile/
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v3 -> v4 (commit-log change only; the diff is unchanged from v3):
- Add the section on what the target device's transmit path still sees
  once the route is released: the NBMA tunnel drop with its
  transmit-error count, the realm readers that stop matching, and the
  encapsulation parameters that are preserved.
- Note that the skb_rtable() cast in ip_tunnel_xmit() and ip6_tnl_xmit()
  is older than this series and is repaired separately. Considered
  comments from Sashiko (nipa).

 net/core/filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/filter.c b/net/core/filter.c
index bd98d29ed7f8..ae5346d6abd2 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -2318,6 +2318,8 @@ static int __bpf_redirect_neigh_v6(struct sk_buff *skb, struct net_device *dev,
 		skb_dst_set(skb, dst);
 	} else if (nh->nh_family != AF_INET6) {
 		goto out_drop;
+	} else if (!skb_dst_drop_keep_metadata(skb)) {
+		goto out_drop;
 	}
 
 	err = bpf_out_neigh_v6(net, skb, dev, nh);
@@ -2433,6 +2435,8 @@ static int __bpf_redirect_neigh_v4(struct sk_buff *skb, struct net_device *dev,
 
 		skb_dst_drop(skb);
 		skb_dst_set(skb, &rt->dst);
+	} else if (!skb_dst_drop_keep_metadata(skb)) {
+		goto out_drop;
 	}
 
 	err = bpf_out_neigh_v4(net, skb, dev, nh);
-- 
2.43.0

