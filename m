Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994218;
	b=4oPgn82NGi06Itq6SPOme6MGco1wU/GfJCiz11UvUFgYEpJ3P0RwvfnjEXZxBexN75AS
	 eye3pUtR+E4TwuQzvz2XZJODdTVtVC/75fwk+cgmO7lk6GUWB3A6sTgdKmK1CfbIGfTqM
	 5vnWSnUxN302OwA97/fw7W6mP2QccsACaphgqx/UnbwpVbtNjkn8wE8SL9uVlheCLeKUT
	 etukF5ESJ7WNDWDpYC0Qv5kyTabj6uuX+j226JItX8hFGJzplT2oDiRe81k10l9FFgYO3
	 qCXc2WOFNuRiDt1r5MjkcPmyf4zqD419QI+KZHIoZClP10L8jiCmLUvMYcH0yyaUl3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=I137t/b2HCf/JgYtsEMky8nuvLyX5jojfAj0ADTMjuU=;
	b=vJo1AWO4wRX+tNEZ8kuXm58Mj2uTzGJoBAL+fIen5q1PifNy/Qu5O97vPq0+gi1ec+JF
	 r6wF8mwO4iYDStoskYIzDm3wI9auHxsZTteyfQg8CGB1Dt7aAx2k5NcEW2nXIohg2NqfE
	 2uIE/ul6xIFcL+pxOZlF1G55bK419IzRIrHr2iEGCf0vpgNY+zZ9wUZJVVm7aC6jSFS/G
	 LLiqT7Ddk4v9lZk3hOBuIBZD5/1KgZhD03f3zlpq7+xQo4zVZuNSMh8k9wsoX2JteA3Xo
	 3cQ8BHAuFjb4W5TJMIddKZo+stuHN00SiBrDzHLUYqqhrKcd8JbAzCb97UNUnnksm8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBREJxG9;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C76606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C76606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBREJxG9
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso395032f8f.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994216; x=1795599016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I137t/b2HCf/JgYtsEMky8nuvLyX5jojfAj0ADTMjuU=;
        b=mBREJxG9FkN4FznRWb5Z1HhMrY/Xv0FwWRZ0H+ctq5p7521GuELpcri+gGNR/be/07
         DUHccy3El/HTEV5xmYRkB14D51VpO4EKG7e41K1s5viehU4LEHdZnICNY6SgKdCV3SEt
         LALAanhpIPNVNB3GkigBWwQ3hmjPTR0N/ECZSV7qiz5D2H+pOcAPGz8HYQPYBzESHPB5
         l0hmpsTp9/fN/tVMK5TTJFn+B4hAyQPTOjxgkWVxRvkPQ1MlcWciDF8FKrt/v49LMlki
         sZ4cmfXNyswBgzwycWuZdkZXxhaALQwMtKGkCbJmbv3iIQ5vg4v0tEud11j/wDgwcwYG
         Z+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994216; x=1795599016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I137t/b2HCf/JgYtsEMky8nuvLyX5jojfAj0ADTMjuU=;
        b=2eBE2jcuiBUQ0Ztx4R5BghNthxNoArBr2+FCmOzvRIAPKrYJya3BFFbGlt/s9krVyP
         o0twL9chtj8e1WqglCg0ExSug5/LJu4lU1CSawFxvl2J37xa38Qk/padr1Vj00Jqbyya
         Z+lXsAA8iJrbeFm/CP5VUg/FCcaQ3/e6gFevQVmejLqblzB2r6cUGWaNxtEKVct7LtUS
         C2BEhpqfgBz2vhI7zBQ6oRSsCVUs+JfzaLfLG+kcwkcY8uxST0gkyiUErWd7T8GCpDzT
         RALdd29sJ1aZKVYy8BSu1avj3AOX7Te5M++S/IWkfEodbZ6hP51FSaNkgJnC6ClCzjUH
         QDzA==
X-Gm-Message-State: APuU4Z99qlXqWPEtY2C4CHUNAQjDUUwBJjqjaz6jUGx+EvFo953ZUhbV
	eYI9shcKS/2k1nWof04esoC2yh5vrI2kCejq0vaibHpQvlDiKPpEbrV1Zw9f8uf8
X-Gm-Gg: AZFdTZdSRha6NtmMY0vjwKrCXAW/DfZBd9iWbKQVvsD9cUuaNx/XRI9Qn1o4lTd2kaP
	45zyv0zFI7JCmdH/0QCk7B54JPz70HYowCi0URC0GukfA5ohEg146aj9Bysqzh+fXKdZ3862e9M
	GogxitYjFuuQ2tOh0LNQ64mrzw3A1f9b2VmY5++10TgpI3PAFrlzE7PtGT2qAgTpOh4sjtN7atN
	ZKPT6XXssPDujp5usiwnkJh3FFtGmirW6+9IePN8QhdwYId7lppe8Lgqne7m8GGRFcCSljGS7pJ
	raWH34hRzO9dz0PxlCH2aw4JkafUlabuqi/CRCEKOJk8FuRY7xgk5ApeINiYtMgANiBuRwU4UVI
	vdZroz2VJZ0tLBni5L9MAswGXS0RKz/lfz6vNrr1ZP2mdIoyKSFD50qEVubW/j2bqNDm4Wn02x0
	pJfKBAgMP3c/HrJWGeyJyeW4pD2rm2wyI3eyODGt0pstNGDVNbMKtB9zsNxAKHKEtDccDgmqe+k
	tbmhViaiggvEpVRX5tH/9J03VF4Q8isi8gREWUQJNSa4MxG26LStfOPCL702LELKJn915uGpPvS
	+2whsAGXdAQCo8e2OXS4ePts3ucjuKJz0IBQ3jcydR1AxwTSQfEalUQBy53qMaw+SqSRpizBVPF
	LCKUDq429L2/s4im6ENzQKZHLjy+a3EKWyZVizwAfWRkF3Oof61U/0iYPmNeG9IYccCNZVWcTV2
	UUuGtfriBdkDSGyfAeAuwbqk+uv/V7toKOABKtwKp2L84Vg9ILJK/s
X-Received: by 2002:a05:6000:40c6:b0:493:4426:96c7 with SMTP id ffacd0b85a97d-4a63ecb5478mr4038646f8f.57.1794994215650;
        Wed, 18 Nov 2026 01:30:15 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:14 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/6] net: mvneta: fix the TX queue arbitration and the mqprio offload
Date: Wed, 18 Nov 2026 10:30:06 +0100
Message-ID: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The NETA TX arbiter is left at its reset default, fixed priority.
Under load a busy TX queue starves the others. OpenWrt has worked
around this since 2017 by sending all TX traffic of its 32-bit boards
through queue 0 [1].

Patch 6 serves the TX queues in weighted round robin, as mvpp2 does.
With an mqprio offload the fixed priority stays, so a class that fills
the link still starves the lower classes. With the default priority
map this includes ARP, which is in class 0.

Patches 1 to 5 fix older bugs in the mqprio offload, found while
working on patch 6. All of them need an admin to set up an mqprio
offload, and the oops fixed by patch 3 also needs mvneta.txq_number
below rxq_number (both default to 8). v4 therefore targets net-next.
If patches 1 to 5 should go to net instead, I can send them as a
separate series.

With patch 2, replacing an offloaded mqprio qdisc under a new handle
loses the traffic classes of the new qdisc. Patch 2 explains why.

Tested on a Turris Omnia (Armada 385) as net f56daaadfeca plus this
series, which applies unchanged to net-next. Without an offload four
TCP streams got 23.5 Mbit/s each on a 100 Mbit/s link and 232 Mbit/s
each on a 1 Gbit/s link. With an offload the higher class got 94 and
926 Mbit/s. Only the Armada 385 was tested, the version 1 registers
for the Armada 370 and XP come from their manuals, and suspend and
resume were not tested.

Changes in v4:
- Retargeted from net to net-next.
- Patch 5 replaces "unwind a failed mqprio setup" and checks the whole
  setup before writing, so a rejected replace keeps the hardware setup
  of the attached qdisc (Sashiko). Reviewed-by dropped.
- Patch 3 is new and checks the TX queue range without a shaper too.
- Patches 3 and 4 come before patch 5, so they apply without it.
- Patch 6 also writes the version 1 arbiter registers and keeps the
  fixed priority when a setup is rejected.
- Patches 1 and 2 keep their code and their Reviewed-by tags.
- v3: https://lore.kernel.org/netdev/20261104224518.66487-1-pepe.schlehofer@gmail.com/
- v2: https://lore.kernel.org/netdev/20261103125021.70845-1-pepe.schlehofer@gmail.com/
- v1: https://lore.kernel.org/netdev/20261102112816.12322-1-pepe.schlehofer@gmail.com/

[1] https://github.com/openwrt/openwrt/blob/a5e96c837ead549820867bb83c1ad471e39f5ace/target/linux/mvebu/patches-6.18/700-mvneta-tx-queue-workaround.patch

Josef Schlehofer (6):
  net: mvneta: lift the per-queue TX rate limits
  net: mvneta: fix the removal of the mqprio offload
  net: mvneta: check the TX queue range of an mqprio offload
  net: mvneta: keep the TX rate limits across open and MTU change
  net: mvneta: validate an mqprio setup before applying it
  net: mvneta: serve the TX queues in weighted round robin

 drivers/net/ethernet/marvell/mvneta.c | 184 +++++++++++++++++++-------
 1 file changed, 137 insertions(+), 47 deletions(-)


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.54.0 (Apple Git-157)

