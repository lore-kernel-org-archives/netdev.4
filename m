Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855714;
	b=CyS+sbc4WI2V01wox0nqvuvcsKCoiiZmNhmkIfLQFvCGHkiXkZ7+CHeB3bCtzRibmHVv
	 Fydd7bao/clJq4qyu3w5KejQmI42fiTAyi5au9C0iGsS/Kkz6txGc5y5f6FFS+2UzVGlg
	 8UwyP5gjxj9VGpmifuP3dXIyR3InmHWIA1qf6dvfShjmZFjzuhYz0Q8v1O/7cFoafV9sv
	 YcXeoYi9Q2LGr5OBdfkBblvTTGtMoMOuMrsFzQRVqDgS4392iK/Z0TLGMYUGNlHVTItvj
	 X+nRLTNN2w+t3uguMq39ZfJmZCs3Vk2YHVbETl1N7ArkgGFXwhRJ0FBq/yOOEq3jhQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3MI+brHB9Vx0cwhAA41vaukzU7zAu9Xp5tBLjVwHA00=;
	b=TQO260m6BOE/DD4o+yBg4sN0CaFep3VOoKkJno4M39xiZ/YGLL3t8CqCKi1wa5BlAfFC
	 3pddT5GjgGOpCXMpX8ZKL3WMlOshllDjZKpDuMksflNMltxSPvemBCjxoiZho2sTCYAJX
	 6F/R/AdnUyilXg3YpCh+D50svW25Dmru5kn+7LBaCR909atluM6X2KyyVwkkYPN3rHq0M
	 V8tomy7K44TImMHXrVEcWh+RG44rmbcnNpWfipB4XMzKG2td0xt/8DAMeHlTOq7qtMsE9
	 AzYg97pXKyQt2ohft33KDu/b4JuevftTukDqBoel8VW44NLEAxkXMKTSHYM7tGL6u/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="g2JSPq/F";
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2491606A334
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2491606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=g2JSPq/F
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7d2b25786d9so2839669137.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794855713; x=1795460513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MI+brHB9Vx0cwhAA41vaukzU7zAu9Xp5tBLjVwHA00=;
        b=g2JSPq/FFT/Q8VQUqJi/efQ0iSls8qOT4f4gGffNRQT6Js3ARcF2vMBqiShX6hItYH
         ly3NmrMxEXjRK1bJTsbaYG0VH6p1VNzGhe8r8iq0NiXReeDLR3eqxOXERr/NtOeHMG83
         DcsDUzpm8vMb00KKFJhn3sYEg+VVVavhtwMqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855713; x=1795460513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MI+brHB9Vx0cwhAA41vaukzU7zAu9Xp5tBLjVwHA00=;
        b=aj2fg+Z7SqWbOF0l+vJjgQnMOND8i24g+R9gTiuuoMCC914/HgQPGi6rqM0zkm4Gsv
         k7r6CsEDiIyT+9k5jYQDzxOiyyg1LAoriYqFnXbtInEnr29W+Kef4SaciPSmP+Lfd942
         PzjYnFNPppfLtOegiCrCtza8G8j+hmAmnjr6UcgvjkhVUvzyB5fd3sg9THYhgxrWkDos
         3xa81SxER0sjLMZ3ZrLLnbdP+B15eemsn+gnFT0D3TFcNTeLyUd0V584YhCZnHhsYO/f
         QtmeYjc/v1V09RjeXCkO7QKmqnyocOmt9KHdsYluB0o7UCO6brA6zy0DYyxHPyXHhOGa
         pNVw==
X-Gm-Message-State: APuU4Z9m7HOAvvsIOq6doJVSVPd9OS2wKub03QNvD76rWThJV11+ldMW
	KUMf+KmjMNQ2FM3zOqXMCBX68poFlUFnzMc+tiA96G6Odo/nZr/x//2paP5fBLInEJB7vDClPPh
	gPfc=
X-Gm-Gg: AYBFou2DnjRDDxYbO0Phb15H2RIWBg9vd7gQLQdBAhmAtE0zENO+OwIRhUNc6LmL0Nf
	qfE4DAtBqTreN68CEoeMQw9T1BcaGR20CWglDha5X7LP2TYuEIdFyCnz77uB04kKzwxYJ4DHZRi
	VRAT8JO8Eoe0dxPUpnQnFm/JZyD8td/XpUTAGZE45mmTR7HaLYnNwtMujY4SBc5WmHokpdBO290
	VLRfbXmIA8DAUJ7eNSaH/EZh5iSVNhF/N1jZXNCcwnAYRXMEhb2FK51s0/HK9hiO/TNFttqRNcT
	gVmppImarA9VgaBr2ONNy3qEGknD2xClnlTxdEGp/gwcZCjgDO8K8kapzKFPjXT27qrvum/0yzk
	OCcwbV35JKFZ9u5748Rzetpg9A62GLZZ17egylDdXyvAzn22Xtwb8Uak3agQGlkI7sOOosiu4VI
	VpPRgMYoiG+H2A8X7HA575rt03wxOle9BPN3+bd/yFR9K5pLjhbryoFBrDZjGgyB9vyvIdboRBn
	/4bbkq6wtSMXGovzPu8g0qSOWt6nu/DgmzfOoacKqTE0RLK+qOT2Lzlcdk3KAbm1oO4qXYcYQE7
	xvD7U3yaySYeiynTo0a/IAIsr2cdfx8A9PapYfA7/ic87F/kzNIgMY75ad9ASGEu8j3LT6dbwIo
	=
X-Received: by 2002:a05:6102:83d9:b0:7c1:9286:296f with SMTP id ada2fe7eead31-7d64d77b824mr3478495137.25.1794855712829;
        Mon, 16 Nov 2026 11:01:52 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm91997386d6.10.2026.11.16.11.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:01:52 -0800 (PST)
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
	bpf@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v4 3/4] netfilter: nft_fwd_netdev: drop the stale dst when steering to a device
Date: Mon, 16 Nov 2026 14:01:40 -0500
Message-Id: <CORE-9NOG.v4.r0.20261116135311-3@mojatatu.com>
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
The neighbour variant of fwd rewrites skb->dev to the configured output
device and calls neigh_xmit(), but leaves the skb's dst untouched. If that
device's neighbour for the configured nexthop is incomplete, the packet is
parked on the neighbour's arp_queue while the stale dst still describes the
device the packet was routed through. Draining the queue re-looks the
neighbour up from that dst, so the frame is built with the routed device's
link-layer header and then transmitted on the configured device. The packet
leaves with another device's addresses.

The Fix:
Release the dst before the device switch. Both inputs the neighbour
transmission needs, the device and the nexthop, are supplied by the rule,
so the queue drain keeps the parking neighbour and the frame carries the
configured device's addresses.

The release goes through skb_dst_drop_keep_metadata(), so encapsulation
parameters a route carries are handed over to a metadata dst instead of
being lost, and a metadata dst already on the packet is left in place. If
that copy cannot be allocated the packet is dropped, never sent with the
stale route.

What the configured device's transmit path still sees:
The released dst is the route of the device the packet arrived on, and the
packet leaves through another one, so consumers of that route on the way
out lose it:

  - a tunnel with no configured remote takes its outer endpoint from the
    route: ip_tunnel_xmit() reads the route's next hop, and ip6_tnl_xmit()
    and sit derive it from the route as well. A steered packet whose route
    carried no encapsulation parameters is left with no dst, so it is
    dropped and counted as a transmit error instead of being encapsulated
    towards an endpoint that belongs to another device's path.
  - the route realm goes with it: a realm is a property of the route the
    packet took, so nft meta rtclassid and nft rt classid stop matching on
    that packet, and bpf_get_route_realm() returns 0.
  - encapsulation parameters are not lost: they moved onto the metadata
    dst, so a tunnel or an xfrm interface downstream still finds them.

Taking the outer endpoint or the realm from another device's route is the
same cross-device reuse this patch removes at the neighbour lookup: those
values were never the configured device's to use.

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
v3 -> v4 (commit-log change only; the diff is unchanged from v3):
- Add the section on what the configured device's transmit path still
  sees once the route is released: the NBMA tunnel drop with its
  transmit-error count, the realm readers that stop matching, and the
  encapsulation parameters that are preserved.
- Note that the skb_rtable() cast in ip_tunnel_xmit() and ip6_tnl_xmit()
  is older than this series and is repaired separately. Considered
  comments from Sashiko (nipa).

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

