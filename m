Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834500;
	b=D5abnTcpvfS4tC2jbMquEGjBv2amsSv5e1zu9BePzWOJ7QqowUS1rSN0F8mCFCM0nT26
	 AZ6MnT7Wa3VotVHflyUvWiZt432fjIXPJKVyGH5jajWXvpvgnOLv5iDNs3Zu7obJaln/X
	 rUHVJgHrZ3H+HnrUA96bt5stSYHR+zH7+vYZPSntLzvhq9GcraG1tOCxsI6QkLS3f5C1b
	 X7Bq5TWCjDpMAiK2Hp7tlG3azIrJY65I8Vmt74bA3L26o/c8V0r623mM4N9106uU5AKH+
	 E/u/vYH7SziamgQJCxqJsZFn37tfRJiWCb7k2zhbhAqm/g1igX+bH9R1BEpi2CfG6yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:To:Cc:Message-ID;
	bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=;
	b=LhtcrePS8G4Weln1L1ZOrLgvcqmbcUwLimcUJJRriEPiEa5quIzvab6elUzHX1cB7S9X
	 uvgzi+uiKAoafcT87z5T5vaSaSoeBy4OJZ+/ETxzSR0/ZGZZjCrQ1ILyK43DpQoNwKIRu
	 550q7Fq+77oyzwEt8bs6fKzRsPDBtCJY9FCzaNmve7Jnr+RDTsO21ciusaeRq6DsfPJtK
	 7MJ+mP5kDpXGTRcCH8YBaSfk9NVf9Fmfik5lMj4o2AFPtM22ZsGcoSeSnNNl337RUuBBz
	 /m1ZPlmVo1Guw52kn1m+uufoElsm3rMxogtDeG4U5QvNJyZTggy0fpYwuljd6pn4KxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Un7tTl7i;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60FC606A334
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60FC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Un7tTl7i
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2efc5a60bd6so2733135ad.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794834499; x=1795439299; darn=vger.kernel.org;
        h=message-id:cc:to:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=;
        b=Un7tTl7icJ39KMFA/lBIRbrpAX70Zt+VEQWARqvvnZR3k2brwNKYku4YvriCV8S2S3
         vjUccF6TuZuRjdZbfqZE96Jdzk5EnFovkKO9+cgNOjEk2WnUbk58hzrG9MbHQ8GI4+U8
         fFwU9jSrp79CAnX9FbHnTunP2vQN1MaZjQxax5i3bdpX0IJbUemyFq9ykr5xKoTRyYHM
         2U8JFb/GqFo70Fo4lvI8qeCkID9c4WdKQ+LXQRusMNKJTie6slH924/gCsqAV7IMwSf6
         jcw5vNcvSsExNna/k427OUEPVwH1Er5kUts5XaLDy0YIFTQ9VpxDQWXEOOftOntZShZC
         t4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834499; x=1795439299;
        h=message-id:cc:to:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=;
        b=WlqEtPvaxJFCDerS2PMjzmiEimA1dgmMdPjC9kekzG/zPOX0c+1F7d+Mxjx7JN+8S4
         B8SHTecs/0d+9wekG/0/EEmEsneO/rK8iLW8hq8+j5sCXoZljZ+hEeB3UrGruSn3QVhp
         hAkGSSfcIXDelh/JDl1Yjg9e7nCiLd3HOvpC68ZYuFcB1rQ6Zq7ZF/FZRibKVUwWpWtv
         apS5Rwc5gz5J4HECvdidKVVDLshseSCz3q3PAvg15D/cs3VYIsxXEan3/pKB+3dtkB2x
         sIsqJQ6t3dykx+6HyPepsv9quhiepHZ0vjYnPLdXLAHtbSYSZB8wKAvgYv4irFMsgcTe
         4+qQ==
X-Gm-Message-State: APuU4Z+D+Dp8QA3Bxn6nLyxGA8ijoxULRR5m1kc+xao/L1Aqubk5w61/
	uT6nL+ZUXBlEgeJ824DCTK1bFTcV7P4/AWSXIGts+S6D4DAgAFFixRN6
X-Gm-Gg: AYBFou1aFHYfYjroY7CLBAIr3skd3ka2WSx5zeLentqIylRGAq/fbKn+UK1FSgyEe5g
	JPRYqmrhZV5nNWKrZTi7K8OHWRK+S3wTzGuoxoN5zGeNMImVlW1BGea3IHPmgyfwd6qv3aNnV3T
	yI/czR1rRUsvX31lkO+4SEmD3fVQHHHC5zQP0H3B/XcCXlnP4zTsXyjwR+rB34HKXYGEZvQ9zC4
	XExCmeLtm6X4ZtfnrKLErtmIUhFuazRQUEzE9UJ1WweT+aViVrLMmDQ0EEMYduOKpBuM69D+/8+
	QdXuvgwOGhit7ijrfoT6RvpcF3MrE2KfuSYHTBjW2q9zjFm5yg/3Ij9eKiq52CpBCu977UwZ1yg
	h9bmgPkpuZjoe1hP+V0a/LUOQ+M6x5/Q24gJB6TYqE21gD5/1X9J77bszOvjWuWvhqHF1PgHKAY
	TI84Od4NXUf84w7+dkcuQp45RzSoGYRJlrRbEtaRXLwKjLmNeIQPoLMb4ERJSw8b+Ux1YYe7kZ4
	pZVwZobOzx2cMqzPHcpVgcamW+d+HK03/dQPW5ABNrMtebM+TcIow793172Chi7hUK7G9terB3k
	zUjixQFuGJ8TZruMZg==
X-Received: by 2002:a17:902:cec1:b0:2e9:787c:8e68 with SMTP id d9443c01a7336-2ee0d36b42cmr109539545ad.0.1794834498913;
        Mon, 16 Nov 2026 05:08:18 -0800 (PST)
Received: from v2_send.eml ([2a09:bac5:4306:dc::16:229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad50dsm38280985ad.7.2026.11.16.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:08:18 -0800 (PST)
From: Haoran Wang <haoranwangsec@gmail.com>
X-Google-Original-From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Date: Mon, 16 Nov 2026 21:08:02 +0800
Subject: [PATCH net-next v2] net: sparx5: check DT port reg against chip port count
To: Daniel Machon <daniel.machon@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20261116210802.2718-1-haoranwangsec@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
portno, which sparx5_create_port() later uses to index the fixed-size
sparx5->ports[] array:

    sparx5->ports[config->portno] = spx5_port;

The value is never validated, so an out-of-range 'reg' (runtime overlay,
corrupted or attacker-controlled DTB, kexec-supplied or bootloader
fixed-up DT) turns probe into an out-of-bounds write.

Skip port nodes with an out-of-range 'reg', as lan966x does in
lan966x_probe_port(). The bound is the per-chip port count from the
match data (sparx5->data->consts->n_ports), so lan969x, which shares
this probe path and has only 30 ports, is bounded correctly as well.

Found by a scripted scan of of_property_read_u32() call sites used to
index fixed-size arrays, followed by manual review. Verified at runtime
on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
malicious DT overlay, the unmodified in-tree driver performs the store.
reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
with a later NULL oops. With this patch all three are skipped. The PoC
and full logs are posted in the thread. Not tested on real hardware,
QEMU virt (cortex-a57) and compile testing only.

Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
v1 -> v2:

- Check against sparx5->data->consts->n_ports instead of SPX5_PORTS,
  so that lan969x (30 ports), which goes through the same probe, is
  bounded correctly as well (Daniel Machon).
- Document how the issue was found, the runtime verification and the
  test setup, as requested by the patch bot.

 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 08a398a..1647067 100644
--- a/a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 			dev_err(sparx5->dev, "port reg property error\n");
 			continue;
 		}
+		if (portno >= sparx5->data->consts->n_ports) {
+			dev_err(sparx5->dev, "port %u: reg out of range\n",
+				portno);
+			continue;
+		}
 		config = &configs[idx];
 		conf = &config->conf;
 		conf->speed = SPEED_UNKNOWN;
