Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375278;
	b=BMWYFJYMIKyu+FtcH04arROUq2XqJSIwOwxPW9gnVix4knjZ8tbnRCCVoJeYhPovSuC4
	 BtR9qdhJ0URDytDGIeTMovIimlHH2tI223R/21kQKPJyreoETmUbAW2wIhLq5jNmKNJop
	 pGx8j9n1syD6+oltgFYgiK68QaYbSsctcnOiJHjgcP5IyO0T7SF5GdlCjfMxJ1gunMwFc
	 OPWYv4qv8q83m/WKhqqacssOAWrHOOfCsKMQURgHspc+Js4kTM9YOHJjL8mfwE6L7mz9v
	 VWqgaDNNdGvzIwsYMx7G94zGZoA1WGphldJdMR1lI3YWGm1hWC4oQCVuS/LP4+UKJ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ssnD6CL/F3PNz4sQoNGHOMcyfKPQ1JKhxPVaQ4iOjeQ=;
	b=Ky+gEKClbYcK2/wis7F4kiY1BuV8Rf42ySKlMyYEJ/XU5e03FDXfHhJMBzEDKb23ubAL
	 WCgPF7LvMKoWSTDfbl+BEyF8/w5KSqOymtoVqPORpkURJdIXjHCu4n3GXpkFuGtAECmCB
	 +weql+jUnqYaFOg2R4FGInOHTuC+0gs61gMG7tJgDgM8GIWGPQfSV9F+ykZHXyZMpOtq1
	 JR8xgNFnvfW+T6J+8gn+oLGZPJL/JtNZmMFA2FQ7bPoZKQZYffBnMfabki/ZcMfPFlEUl
	 1R4TjS8ejOwkBoEMBV7OV2etc3tZKaa4mxX4XsAIhCfpI383UgiDJMkDRGfwpqrlDFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="QBZ/WNkb";
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F09606A327
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F09606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=QBZ/WNkb
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c516a574bffso86824766b.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795375277; x=1795980077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssnD6CL/F3PNz4sQoNGHOMcyfKPQ1JKhxPVaQ4iOjeQ=;
        b=QBZ/WNkbKTQycfpNSrAfvc+jXxfplIY9RMRzJBcL1Kv9FJwNRZwFSqq+erJSTbxPKU
         nVlOgbpXbP/Ry6Osozaf3MPxavPUtlG0+zPS6u0Aq8zH/Swk2g0Y6kcDL6ITM9xQBsdE
         jxWdmYzbUxlcL9Lpyuk++La2wC0Gj8IZWu8+GLsr3qwXqHRAmc01iT/5zIBRVcdgB2ux
         9I4lGp337BAwWsY6+Yfx4feHpms5LZkD+cvklA9ZelLjVOn6+RgzxAiQRdf74OmN0oaz
         axGE6JzLMV4fre5HZUTtkToktzHC+8BgPwSc60T/XwxXBkY1L3Ot1yAqWITvmDzmmoDj
         RdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375277; x=1795980077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssnD6CL/F3PNz4sQoNGHOMcyfKPQ1JKhxPVaQ4iOjeQ=;
        b=s+rg5uDTOVBD8Q/pjgmoaafYGcEKb3ZUiqPiZjRX1L9Nq6OLkJGmKVvyNnGmRszt4a
         Uo8jJMFwCNsSRoCnQe97aNEb5+5qBsP92VCCLqAbpiRUYzI1bSDHuQFqGJpv9adm9w8C
         hyD59orbhAkPpmFguFyHhN+/LOGWoFrlk+IhryLNG2DNZUEvaad3AROm9XhACq0eVOXW
         dQltoBFoxF5XUY8O9aVpshiyXR31avWLYTDymaxluLscr5AzpbsfCXYdmx343x/PRv3x
         dQdfE3Ifqr3krfeD3POeg1+Vu3oAsWXMZIDGaMdiTQlv57tLjGkHfZxOPdUiH0CYFlqN
         PEew==
X-Gm-Message-State: APuU4Z+er6JQcJCXQ1wvlm1F5NjqFqphdyJJ9ALhkh9I/A9B8dNKSewr
	VOPlbUX4eDPP43agi5328SehMqXekzIxUR6buyU3WVZ8E8Z1j8itnfUxeXvjkjlNvg==
X-Gm-Gg: AZFdTZfJh6aD+zYk4DENeJdepi3iHDVchyuif3hA+u6qIrlBxZzn7cCIlOMbc3IuUwj
	4LlIgyfgQLS21nd3XENKe1YbcGPW4GtqpHqJhc2yE8prEsSaQt+xhJtKFSgOq2UZ1/lB4gBDWYl
	hMOXv4iEaAfQPmvdK1nNii7MKPPGxr38NiwTlDYXYmUHZ5pMndcYRLUJcoqcuUHqkp+mWf169Hu
	j7qClXN9JpY8vaJ1iLwwi2jWwcf3XL4wwm2R33yijzwMYVyAxWOAK8QBEVbM7U+zN3VI4k1kZpH
	uQoGq3TgSIUg1+PfcCtKPeAlsido9kKn1g91B8ve4Jb+IO7DOkvN/6547APoSneN+8ZOMsWChFE
	COD8hpvMUrhc4VcUoVtsRAIgqHKWl81c1f4lejeuTQXnCGG56rT/zt41WMjnoemHcB0BpBSFXt3
	FWr6Ctybhj/bA131cXRMoDD+5s3shGXptyol5EiE/KYbeRhYVfZz43VM/XCtMqMagQUSz4LS0Wt
	MXXLLUzKdObS+QkHtE8CCnFwPntAnqz8dPjG7NWKJRXv45xV4sjYsZeEMXM3/ylxD3f9gzWi3GT
	yJX6HvS0zvu++L5/zGiNCzkFpSZtsofUOFKDVtxXH2IJhNZ2XgKfq1jfYh7QyqpJW5K68c+xFpt
	91WFgzlaYWlhSfSk8TiCxfPpRD9sDIyESqRaExGCK6V0OWq1ylUCSgjkz+JSL2v5HhdrfbmfceD
	G5MZn3wsUOkWbl3/o1RCkq6zcKuc+zup6av7L81SOy1YHF2jSAu3IMcnHJ13CROAPyphqE8hsCG
	bZoigznjvP5obKt/elqfEM63UEld1zburHVnD8QsEsdCUwmuPKnN26FCitQya9Bk2FMpeRSphHp
	4uTrN8wOL8YqWEED4GKA8LsYlgsGMZxFbOUm+K09rzkQgmMszER1WsJ0ODIvAFvZw5f3K9hp86s
	t
X-Received: by 2002:a17:906:f5a5:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c513ac7e167mr774036666b.39.1795375276713;
        Sun, 22 Nov 2026 11:21:16 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a7000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4713:a700::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm338808566b.75.2026.11.22.11.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:21:16 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>
Subject: [PATCH net-next v2 0/2] net: bridge: switchdev state of fdb entries made dynamic or roamed
Date: Sun, 22 Nov 2026 20:21:16 +0100
Message-ID: <20261122192118.1204290-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

When the user turns an fdb entry that switchdev was told about into one
added as "master dynamic", the bridge reports neither that change nor
the entry's later deletion, so drivers keep the entry after the bridge
dropped it. When the bridge withdraws an entry from a port's driver and
keeps it, which that change and a learned entry moving to another port
both do, the entry keeps the offloaded flag, so "bridge fdb show" and
"bridge fdb flush ... offloaded" treat it as offloaded while nothing
holds it.

Patch 1 reports the deletion of such an entry to switchdev before the
entry becomes one that is not reported, and clears the offloaded flag
with it. Patch 2 clears the offloaded flag when a learned entry roams,
right after the deletion is reported to the old port.

Both were found by an LLM review: patch 1 in a review of the
series "net: dsa: fix host fdb refcount when an entry roams", patch 2 in
one of __fdb_update() while patch 1 was reworked after its v1 review.

Trigger: patch 1, a local user with CAP_NET_ADMIN runs "bridge fdb
replace <addr> dev <port> master dynamic" (or "... master use") on an
entry that a switchdev driver offloaded; patch 2, an address learned on
one bridge port is seen on another, as when a host moves, and the old
port's driver had offloaded the entry while the new port's does not
(DSA with assisted learning on the CPU port, entries learned by a
switch). Shown in QEMU with dsa_loop. Impact: patch 1, the switch keeps
the entry for the old port after the bridge dropped it; patch 2, a
wrong "offload" flag in the bridge's view. No crash or memory
corruption. CVSS 3.1: patch 1 2.3 (AV:L/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N),
patch 2 0.0. Until the fix: delete the entry and add it again instead
of replacing it; the wrong flag of patch 2 goes when the entry ages out.

In QEMU with KASAN, with dsa_loop given FDB operations and assisted
learning on the CPU port, and a tc mirred redirect that delivers frames
to a dsa_loop user port (test-only setup): a static entry on a user
port replaced by "master dynamic", and an address learned on a veth
port, which is a host address on the CPU port, replaced by "master
dynamic" or "master use", are not deleted from the switch and are still
shown as offloaded without the series, in 3 of 3 boots each. With it,
each is deleted from the switch and no longer shown as offloaded, in 3
of 3 boots each. An address learned on the veth port and then on the
user port is still shown as offloaded with patch 1 alone and not with
both, in 3 of 3 boots each.

I used Claude (Anthropic) to help write these patches.

v2:
- net-next instead of net, so without the Fixes: tag; the commit that
  introduced the filter is named in the first paragraph of patch 1
  (Nikolay).
- Patch 1 clears the offloaded flag with the withdrawal: a "master
  static" entry the driver had offloaded kept it after "replace ...
  master dynamic" deleted the entry from the hardware (Nikolay).
  br_fdb_offloaded_set() assigns the flag instead of toggling it, so the
  clear cannot be inverted by a concurrent report.
- Call br_switchdev_fdb_notify() directly, no helper (Nikolay).
- Drop the comments in __fdb_update() (Nikolay).
- New patch 2.

v1: https://lore.kernel.org/netdev/20261121191638.1724620-1-julius@bairaktaris.de/



Julius Bairaktaris (2):
  net: bridge: withdraw the switchdev entry of an fdb entry made dynamic
  net: bridge: clear the offloaded flag of an fdb entry that roams

 net/bridge/br_fdb.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)


base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
-- 
2.53.0

