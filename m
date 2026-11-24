Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497189;
	b=WH0rAmClow0i90F+X8TSFi8mXCLZHzQVmxpULCQtRyOWBc37HJqg3R1+gCpc1n5mhbl3
	 RM0CpvVp45WRtHAwbNGBiriqPEDZLiirFW9glks4lK4KeXoD4NHhHABZZDwY+TtvWiv4F
	 9OgPCldhPzx/Be6gmNPy/RC6d+FBtyTPK7OLbdd3AvJeC2zKkm8l5NrIELWfLixvrCEoK
	 Sg4jSAZLS1Vea0K0RnNTosa6s9XHUXhzmZF0M3xzQGINtWV2seiOHbC0GEd5I4tHZ7pxL
	 bGS483SCBorre2/AUlA2K+KclKLttOoEWUPkTBCQKoS0CeDlbSiZ7NJKksRAZ4V2QiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=fbuF9hlpTG6s4GxKA4A2ztm7Dabcy2UDtXz43/cyP3I=;
	b=wM9u9dccB8qW5H3KFzmlL85nUQ8tFUpt5a/cCJOj3iPVKQWOtD6KUu7UQmpcYiR4jFXt
	 MV3ndhO+aFOpssMVJBdrpnnnLcDKbciorrwKkACM2ya5vNJz3vL0FmqtJrAqBBsxna/oL
	 Zs7VaQl+S4iLJL8JuZDb0pPu9JsuDqoK9JdTqlE/ceyIkPWTAIxJST7QEZ8PX36w3r9an
	 FLrhjJVmYFmX2muzcOSwnGJQ6PNR/DDEZAyvl1I0AT7qWem7LWwbghaiu75wJA2w/GGZm
	 y1mfpvyCanDE7UtANKdA4m7B7tK1dnKdhLGS9BV7BNNoj4NrMGQlUxxl65mbN7k0gZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxINg8c1;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D24606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D24606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxINg8c1
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so3479003a12.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795497188; x=1796101988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbuF9hlpTG6s4GxKA4A2ztm7Dabcy2UDtXz43/cyP3I=;
        b=NxINg8c1AgfCXWKbfYOFtB3nsOrEWsWzdTKChb67uX2acyICeLVFgrKZfC5ZgKZlc9
         ALuua28Lx/xqPHr75cmIAvyseAdStvWw2xmWDlxMVkWm4DgpA4Hn/VKZKp9iR+d/Tq6i
         /1MFBMpkcnxfJBLbgnOCGJAD1jjfMeirjxjS00/H6PcZViIgU4d+GUcEB/zI29SDWp/1
         2TOTuCte/pjie357Iv1QRJfbaqsw1oCwEuhle8D56dkOwXVnOP5N9DFUGFtKP9FGclep
         Wo8bSfetxsDWh03unjWp69ff1qhJuyFtthDOnrblcnR/0EYBJko2Sm+8eUecTj3rrUb/
         RoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497188; x=1796101988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbuF9hlpTG6s4GxKA4A2ztm7Dabcy2UDtXz43/cyP3I=;
        b=QG5kqL16G7FHJJiVqq8KFeC231cTabasyp8AsFJEnhDdh08EM5LNZqJMHRTucyEl1o
         WYHzvFJrloSjjp31jZVIlHfBvqtQc7S29pdiwxnFeEyftY/BNOGdSDiisCPnfROPlwuv
         4vTPAIWGVV9LtbRnjYprv2wlJI0mHQhd4hicoJkyEVW6cCoo1a9QSi9aCKzW6npiAR+2
         jbE6kRA5qAgfSSJGS5RLKvEvtUQTg/gsG8Ux5nc6jYdgPoUdME81lM+7XKQ8v8NT94jW
         lvuKdgcGzqU2G++7m3dmdaT/E3+dELECwE85lPVtWiXLpc5fclYeV6e4dlrnQ7vfqYuS
         +g2w==
X-Gm-Message-State: APuU4Z8v0iuLo7vaaFfQNwzbr12HzfSbPfUAIHzbCbZ46uwwngHhZ6Ys
	w1Lt628bdFiGuvMVsMAQIY/dk8W3OF7qga+sgVkDYwA33aQtBECypFkJXev/vxBD
X-Gm-Gg: AZFdTZernC7wFEZ9PwRAy1Bn3siKI8Fp6IPxYlQ0SxN9oAtz19kgM3y1F6nvESdAbA1
	NI4A3/KTeJ0/oBcv0jXibtSocLw8wKWeN4ZnEoYIQCSZDIrzIc7xWcV3FYqotQ3CKQs9+jE/tbP
	88BwKSxrQ0gBypVg8NkSu+z7zh1MOKHciyrn5LIzqBK+/5iRPbKZZT9s+ZX3cnhaZZy8Mn7gwoB
	VkGTUTe0Tv5Zim0B6F7gDD4CTli0Yzp0MX38Ld0j4R896+/KyMBhg3Xed017tqWYYrSTSEC1GTc
	PcwLuit5g3d0tAeDCxkfXBtJFnpDk0plRvu/XhyiNIXFmvstv7yOAgk8HvdVUlTahzG66Y10+dv
	64jGDamgscUBXjrncDbKpaEEIEdwzNHpK+Qy/Gh2DCfr8gOdGdBSpvSjo3Bi84GkfcS5/jz+AwT
	Syqhv7WhcMZAb9WpTwiLRuZUxMcBU3sMO9IYSOkHeoc6pKq0WrNpq0uYsoUExenPKZQpsEnqZ+T
	qWCzdpNvHIy6DEHOvSIaaQIJURRfODiGSQq79AgyEdVuYl2QMRXAVxJBTVInV5mDXjhAcA0PQr+
	g2iQilWz05oFeTpKkZw2T7dCEP/cAwLDM/mP0TN1ycCEapZpydCBKqCH5Ly3hNPgsTw=
X-Received: by 2002:a17:90b:4d10:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b41c8d4860mr12118607a91.21.1795497188321;
        Mon, 23 Nov 2026 21:13:08 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm7500992a91.1.2026.11.23.21.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:13:07 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/1] bonding: keep non-Ethernet slaves out of 802.3ad bonds
Date: Tue, 24 Nov 2026 14:13:02 +0900
Message-ID: <179549697473.218888.8044828119056769556@gmail.com>
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

bond_open() adds the 8-byte lacpdu_mcast_addr to every slave of an
802.3ad bond, so a slave whose addr_len is 16, such as an ip6tnl device,
makes dev_mc_add() read past it. The patch rejects such a slave at
enslave time in every case and stops a slave of an 802.3ad bond from
changing its type afterwards.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v4:
- Target net-next (Nikolay).
- Merge the two patches into one (Hangbin).
- Drop the Reviewed-by tags of Eric and Hangbin, as the patch changed.
- Keep the type change veto to 802.3ad. Refusing type changes after
  enslave in every mode, as Nikolay noted, would only affect nested
  non-Ethernet setups and can be discussed separately.
v3: https://lore.kernel.org/netdev/179535729502.2645501.5219010464870440@gmail.com/
- Add a patch that refuses NETDEV_PRE_TYPE_CHANGE for 802.3ad slaves
  (Sashiko review).
v2: https://lore.kernel.org/netdev/179505868590.3571070.12381528230330714812@gmail.com/
- Move the check above the type handling, as Jay suggested.
v1: https://lore.kernel.org/netdev/179500849159.1877154.14715369660816392826@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, neither the direct nor the nested reproducer triggers the
report. Enslaving Ethernet devices into an 802.3ad bond, a non-Ethernet
device into an active-backup bond, and the type change of a bond
enslaved to a balance-rr bond, as in bond-eth-type-change.sh, work as
before.

Kyuwon Cho (1):
  bonding: keep non-Ethernet slaves out of 802.3ad bonds

 drivers/net/bonding/bond_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.43.0

