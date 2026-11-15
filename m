Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737957;
	b=CY3qnKlfVyNxoQ1UHo9Uh5j7o11Su23mlHAOGe51p85Xg6ZjMv77wzg0u7wb4KOzpCxs
	 Ndfz5g88mm5791kxm37jIrtu/q9Lpgo/bGU0L2TKIZ/a8vPqtgv2wVA5Rc7pnfRprkdda
	 F9zmm0WSdGP1v6QTkmrvk4L7dqEcmB9KcuGaWl4BAfvyS1o6OJuYGjUCaSsL2KEYWthot
	 nW5TTJtgxA+ZlzBz/FNwDYU1Bk8kBnBqQOaZ1sH/dPDFpwHKreogj05hsEfWho9M2jGo3
	 tmhaB/2xIi6OuhKOKi8d5K4N/wpcdLNJcAMyx8efT+wZKVJTAg7kyEqAxhBOU6m5i3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qhcPhq0Poj4iCa3rvuLGMg5AWfvy/+rEzDOs01y4iq8=;
	b=qPytZHe/vwwUbwrXWOP4cn0MmWPF/OtJFVwPADU7f/gJQB17H/cOpmVQWtSZ3McMariq
	 CqrJpmr48kiLt1ZcOgmLpbxbnXHAvA2hkzlc0QFjoZHu5x2eHpbDIfJkJpabvstL5OaVf
	 A+d967HPiplBS/fkq7SInVe0FzsQxt8uq5C/Ypb7QGcwQZO2o0W1tf8Kg8VB4meg/iB6c
	 dREXvcD3yrSCpfR3RgdgYk9OjvQblJkD5LUb5z8N4uVkSz95rrKM/oy6fxo8rnBpqK3Mr
	 wQ6nhgkuWohdHLw1a0IIDEuwD7NFesdr1OLEMIBK6/BPDUGwwgFR5t8toyXPrTKDheQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=hwoze4w0;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BCA606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41BCA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=hwoze4w0
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9495d543c42so214375985a.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 02:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794737956; x=1795342756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhcPhq0Poj4iCa3rvuLGMg5AWfvy/+rEzDOs01y4iq8=;
        b=hwoze4w0rvuTE/eDhIh+PGCQ2dn2uYdjHJRefHcraIQCVyJq0WbeToxGPxoQpmSfo9
         UYSMcei1lLgnMoV7XTXwA+F/thuBJjrxH1nrjFQVni9PqvNZ/vUQIMUg9Lw7uGZi9hQ4
         EnTUPHG02moNEDY+XB+FnSFmR35ApXAC5iSF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737956; x=1795342756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhcPhq0Poj4iCa3rvuLGMg5AWfvy/+rEzDOs01y4iq8=;
        b=zBh2ngRGCZcfaTEDDmEOONVlKt2t/EHpt5sh0eAko0LZ2uQGmaTzdoMnbvxoHWAYp2
         soYo3FGbq3sXjvMwfKtp8RBgAq1GP7dwehJUMfs/tHw6eA9LcgvpsuYlDUwctrGVjtGa
         VkAOMrQ/nAg1pYwR/VOvwFeRFM60VpyeEfhEvgwA1ZAcDlvBZsLKgSqXl2r6cOtIDq9H
         /JAWaeW8GgMDKPeXsZEDHBK2wcLoxFLkl42MuouE5mHO4VL4PUmJWRnCI996/RDYqT1Z
         YXcn//79917f3EOx2F3lU0r6yXciIRMbOr1u3W7kthENOr07LtsoI65LracloYJEYH/Y
         Xq4A==
X-Gm-Message-State: APuU4Z/+nPYvF3keQrktkF5sBzoakk7AIVlLMBcsC5hVNM2eU7zagdTU
	5b8IcJZJZZs5be6a29XiVOvoCjikrg9t+cq8lrTPwBTndQMuCDnlyrAVkqTRzNT6SSDshviJU7P
	KkeY=
X-Gm-Gg: AYBFou18VR04MfTgR36nPEQhM9oxumIC8leI4RBqak8BhCGRqzaRmgaJdWPEg6MxTnd
	NmKdKloUIyLgQZbiNga7wWrsIFLvCs5vEVTYaaU/dYwXJH7AlJWZ2Z3KZmonDu0IdJ+17qsr1cf
	09fX4m4DvoKjfx2NYXKv+EiHlF3qf1tHtjSgyD+9ZGdVUSBdu1BnSgcRqICUYunpUm26dWhpWQ9
	+2PyC1jXglRCgALRoQAca/c5c6YK7RwnKFngapvj1l/wn4/kAwmrum4pwf/OC73mptrSi6ZoTZx
	+uQvbY/zEGnBZ7eEcqRY5CNmJcgUfVBdJlEvlTgWJCYvf/lplL08dH2VgkIYIDAVrWtnrXj5wFZ
	Pi0i3LLSrSTHIgtkwbkkIiOAc467qW6lk+ak0C4cogpVEEFw1kteX+v4OMv2TmzGKZaSTiUcDgD
	gPgsl0nrqCray0a4NayaccWEMgTmX0twrMgrB03gCcCpDzeGN41eCyB0a4FMFkyCMGKnF6ipWjM
	pvFpjpAqWlg6DuEPLKE7YvnrVPdqilMUg/zJM+mGIJYOCrnSSKhqCeFX//Iclh/wa9c3mkSMK7/
	OSoawPBPaZvh8S2cFnjbjALrwmlkh8jgeKhLgeYeHfK5h7SqNBh/oxeSBEeuQJ6XUH9IFsR+hdZ
	g
X-Received: by 2002:a05:620a:44d4:b0:949:6fd6:d05c with SMTP id af79cd13be357-9496fd6d08dmr443603885a.42.1794737956093;
        Sun, 15 Nov 2026 02:19:16 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm592337085a.5.2026.11.15.02.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:19:15 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	ipsec@lists.linux.dev,
	bpf@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Sashiko <sashiko-bot@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v3 0/4] net: drop the stale dst when steering to another device
Date: Sun, 15 Nov 2026 05:19:07 -0500
Message-Id: <CORE-9NOG.v3.r0.20261115050625@mojatatu.com>
X-Mailer: git-send-email 2.34.1
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

This patchset is created to address constant whining by both sashikos
about this being an issue when fixing a UAF on a teql issue, see:
https://lore.kernel.org/netdev/QDISC-6HS9.v4.r0.20261111094338@mojatatu.com/

Two producers steer a packet to a network device of their choosing and
then hand it to the neighbour layer for link-layer resolution:

  3/4 netfilter: the neighbour variant of nft `fwd`, on the netdev egress
      hook
  4/4 bpf: `bpf_redirect_neigh()` when the program supplies the nexthop

Both rewrite `skb->dev` to the target device and leave the skb's dst
pointing at the route the packet arrived through. When the target
device's neighbour for the nexthop is incomplete the packet is parked on
that neighbour's arp_queue, and draining the queue re-looks the neighbour
up from the stale dst. The frame is therefore built with the original
device's link-layer header and then transmitted on the target device: the
packet leaves with another device's addresses, and the sender never
learns that its nexthop was unreachable.

This is explicit: the steer-to-another-device path never worked in this
respect, so there is nothing here to regress. Both producers shipped with
`skb->dev` swapped to the target device and the route's dst still
attached, and the arp_queue drain has re-derived the neighbour from that
dst for as long as either producer has existed; the invariant "the skb's
dst describes where the skb is going", which the routing path keeps when
it steers, was never established for these two entry points. With no
commit to anchor with a `Fixes:` tag and no crash, UAF or lockup
involved, the series targets net-next and does not nominate `Cc: stable`:
a backport would change long-standing redirect behaviour for no
crash-class benefit.

More context: this came out of the review of the fix for a parked skb
being resolved against the wrong device in sch_teql, posted separately and
not part of this series. The neighbour code's queue drain is doing the
right thing there, it re-derives the neighbour from the skb, so the repair
belongs with the producers rather than with the drain path. Both
producers are fixed in the same series so neither is left behind; each
patch that changes a producer carries its own reproduction recipe.

The reproduction for both arms is a pair of veth devices, one of them
with an unresolved neighbour, plus a capture on the target's peer: the
captured frame's source and destination addresses name the device whose
neighbour was used to build it.

v2 drops the dst only when it describes a route, and keeps what the route
carries (thanks to Pablo for catching this). A `DST_METADATA` dst is the
tunnel template a tunnel helper attached to the packet, not a route, and
dropping it would discard the encapsulation parameters, so it is left in
place. A route carries encapsulation parameters too when it was installed
with an ip, ip6 or xfrm encapsulation; 2/4 adds a helper that moves them
onto a metadata dst before the route is released, so a producer that
steers into an external tunnel device still finds them in
`skb_tunnel_info()`, and one that steers into a `collect_md` xfrm interface
still finds its `if_id` and underlying device. Neither case weakens the fix:
a metadata dst resolves neighbours through `dst_blackhole_ops`, whose lookup
returns NULL, so the queue drain keeps the parking (target-device) neighbour
exactly as it does with no dst at all.

1/4 is a prerequisite on the xfrm path turned up after Pablo's comment.
The interface that consumes that metadata puts the original route back on the
skb before the xfrm lookup, which needs its family, and installing a
reference counted route over a dst slot that is still occupied trips the
slot assertion; the slot is cleared first. The same overwrite is in the
tc-bpf helper that attaches the metadata, so both sites are fixed in that patch.

Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-6HS9.v3.r0.20261103062649-2@mojatatu.com
Link: https://lore.kernel.org/netdev/20261026160747.283702-1-horms@kernel.org/
Link: https://lore.kernel.org/netdev/QDISC-6HS9.v4.r0.20261111094338@mojatatu.com/
Link: https://lore.kernel.org/netdev/avTfQjFQYR2NNdRg@chamomile/

---

v2 -> v3:
- Patch 2/4: Document the return value of skb_dst_drop_keep_metadata() in
  its kernel-doc comment. The missing `Return:` section was caught by
  NIPA CI.

v1 -> v2:
- Do not drop a dst that is not a route: a DST_METADATA dst is the tunnel
  template a tunnel helper attached to the packet, and dropping it discards
  the encapsulation parameters (Pablo Neira Ayuso).
- Keep a route's encapsulation parameters as well: a route installed with an
  ip, ip6 or xfrm encapsulation carries them in dst->lwtstate, which a drop
  would discard before a downstream tunnel or xfrm device could use them.
  The dst release now goes through a helper that moves them onto a metadata
  dst first (new 2/4).
- Fix the dst slot the xfrm consumer restores: a collect_md xfrm interface
  puts the original route back before the xfrm lookup, and installing it
  over a dst that is still there trips the slot assertion.  New 1/4 clears
  the slot first at both that site and in the tc-bpf helper that attaches
  the metadata.

Jamal Hadi Salim (4):
  net: xfrm: interface: restore dst_orig on every xfrm interface
  net: dst: keep the LWT metadata of a dropped route
  netfilter: nft_fwd_netdev: drop the stale dst when steering to a
    device
  bpf: drop the stale dst when redirecting to an explicit nexthop

 include/net/dst_metadata.h     |  1 +
 include/net/xfrm.h             |  2 -
 net/core/dst.c                 | 76 ++++++++++++++++++++++++++++++++++
 net/core/filter.c              | 12 ++----
 net/netfilter/nft_fwd_netdev.c |  6 +++
 net/xfrm/xfrm_interface_bpf.c  | 16 +++----
 net/xfrm/xfrm_interface_core.c | 22 +++++-----
 7 files changed, 104 insertions(+), 31 deletions(-)

-- 
2.43.0

